# ==============================================================================
# Deterministic Validation Script for Documentation Blueprint V5
# Language: PowerShell 7+
# Mode: Strictly Read-Only
# ==============================================================================

[CmdletBinding()]
param()

$ErrorActionPreference = 'Stop'
$script:errors = 0
$script:warnings = 0

function Report-Pass([string]$msg) {
    Write-Host "[PASS] $msg" -ForegroundColor Green
}

function Report-Fail([string]$msg) {
    Write-Host "[FAIL] $msg" -ForegroundColor Red
    $script:errors++
}

function Report-Warn([string]$msg) {
    Write-Host "[WARN] $msg" -ForegroundColor Yellow
    $script:warnings++
}

$repoRoot = (Resolve-Path "$PSScriptRoot/..").Path
Set-Location $repoRoot

Write-Host "=== Starting Documentation Blueprint V5 Validation ===" -ForegroundColor Cyan
Write-Host "Repository Root: $repoRoot"

$canonicalStatuses = @('draft', 'planned', 'in_progress', 'approved', 'active', 'released', 'superseded', 'deprecated', 'retired', 'archived')
$requiredFrontmatterKeys = @(
    'document_id', 'document_type', 'document_version', 'blueprint_version',
    'product_version', 'status', 'scope', 'authority', 'owner', 'last_updated'
)

# ------------------------------------------------------------------------------
# 1. Archive Safety Check
# ------------------------------------------------------------------------------
Write-Host "`n--- Checking Archive Directory Integrity ---" -ForegroundColor Cyan
$archiveDiff = git status --porcelain archive
if ($archiveDiff) {
    Report-Fail "Files in archive/ have been modified or untracked: $archiveDiff"
} else {
    Report-Pass "archive/ directory is strictly untouched and frozen"
}

# ------------------------------------------------------------------------------
# 2. Blueprint Authority & Hash Validation
# ------------------------------------------------------------------------------
Write-Host "`n--- Checking Blueprint Authority & Hashes ---" -ForegroundColor Cyan
$rootBlueprint = "00_Documentation_Blueprint.md"
if (-not (Test-Path $rootBlueprint)) {
    Report-Fail "Master blueprint $rootBlueprint is missing from repository root"
} else {
    $rootHash = (Get-FileHash -Path $rootBlueprint -Algorithm SHA256).Hash
    $activeCopies = @(
        "example/pattern-a-multi-repo/v5-docs/00_Documentation_Blueprint.md",
        "example/pattern-b-monorepo/docs/00_Documentation_Blueprint.md",
        "example/pattern-c-monolith/docs/00_Documentation_Blueprint.md",
        "example/workspace-domain-distributed/docs/00_Documentation_Blueprint.md"
    )
    foreach ($cp in $activeCopies) {
        if (-not (Test-Path $cp)) {
            Report-Fail "Active blueprint copy missing: $cp"
        } else {
            $cpHash = (Get-FileHash -Path $cp -Algorithm SHA256).Hash
            if ($cpHash -ne $rootHash) {
                Report-Fail "Blueprint SHA-256 hash mismatch in $cp"
            } else {
                Report-Pass "Blueprint copy matches root hash: $cp"
            }
        }
    }
}

$allActiveBps = Get-ChildItem -Path "example" -Filter "00_Documentation_Blueprint.md" -Recurse | Where-Object {
    $_.FullName -notmatch "archive"
}
if ($allActiveBps.Count -ne 4) {
    Report-Fail "Expected exactly 4 active blueprint copies in example/, found $($allActiveBps.Count)"
} else {
    Report-Pass "Exactly one master blueprint copy per represented workspace/repository"
}

# Check Section 13 headings, structure, and canonical statuses in master blueprint and plan
$bpFilesToCheck = @($rootBlueprint)
if (Test-Path "plan.v5.blueprint.md") {
    $bpFilesToCheck += "plan.v5.blueprint.md"
}

foreach ($bpf in $bpFilesToCheck) {
    $bpText = Get-Content -LiteralPath $bpf -Raw
    
    # Section 13 uniqueness
    $h13_1 = ([regex]::Matches($bpText, '(?m)^##\s+13\.1\b')).Count
    $h13_2 = ([regex]::Matches($bpText, '(?m)^##\s+13\.2\b')).Count
    $h13_3 = ([regex]::Matches($bpText, '(?m)^##\s+13\.3\b')).Count
    if ($h13_1 -ne 1) { Report-Fail "Expected exactly one '## 13.1' heading in $bpf, found $h13_1" }
    if ($h13_2 -ne 1) { Report-Fail "Expected exactly one '## 13.2' heading in $bpf, found $h13_2" }
    if ($h13_3 -ne 1) { Report-Fail "Expected exactly one '## 13.3' heading in $bpf, found $h13_3" }

    $sec13Headings = [regex]::Matches($bpText, '(?m)^##\s+(13\.[0-9]+)') | ForEach-Object { $_.Groups[1].Value }
    $dup13 = $sec13Headings | Group-Object | Where-Object { $_.Count -gt 1 }
    if ($dup13) {
        Report-Fail "Duplicate Section 13 heading(s) in $($bpf): $($dup13.Name -join ', ')"
    }

    # Assert no obsolete documentation.mvp reference
    if ($bpText -match 'documentation\.mvp') {
        Report-Fail "Obsolete 'documentation.mvp' reference found in $bpf"
    }

    # Assert no noncanonical status terms in blueprint tables/templates
    $bpLines = Get-Content -LiteralPath $bpf
    $bpStatusCol = -1
    foreach ($line in $bpLines) {
        if ($line.Contains('|')) {
            $cells = $line.Split('|') | ForEach-Object { $_.Trim() }
            if ($cells.Count -gt 2) {
                for ($ci = 1; $ci -lt ($cells.Count - 1); $ci++) {
                    if ($cells[$ci] -in @('Status', 'Release Status')) {
                        $bpStatusCol = $ci
                        break
                    }
                }
                if ($line -match ':---' -or $line -match '---:') {
                    continue
                }
                if ($bpStatusCol -ge 1 -and $cells.Count -gt ($bpStatusCol + 1)) {
                    $cellVal = $cells[$bpStatusCol].Trim('`*[] ')
                    if ($cellVal -notin @('Status', 'Release Status') -and -not [string]::IsNullOrWhiteSpace($cellVal) -and $cellVal -notmatch '^-+$') {
                        $tokens = [regex]::Split($cellVal, '[,|]|\bor\b') | ForEach-Object { $_.Trim('`*[] ') } | Where-Object { -not [string]::IsNullOrWhiteSpace($_) -and -not $_.StartsWith('e.g.') }
                        foreach ($tok in $tokens) {
                            if ($tok.ToLower() -in @('done', 'maintenance', 'pending')) {
                                Report-Fail "Noncanonical status '$tok' in template table in $($bpf): $line"
                            }
                        }
                    }
                }
            }
        } else {
            $bpStatusCol = -1
        }
    }
}
Report-Pass "Blueprint Section 13 structure, documentation schema, and canonical template statuses validated"

# ------------------------------------------------------------------------------
# 3. No Stale v4 Milestone Declarations or Requirement Mapping Links
# ------------------------------------------------------------------------------
Write-Host "`n--- Checking Stale v4 References & Requirement Mapping Links ---" -ForegroundColor Cyan
$staleV4Count = 0
$reqMapCount = 0
$activeMds = Get-ChildItem -Path "example" -Filter "*.md" -Recurse | Where-Object {
    $_.FullName -notmatch "archive" -and $_.FullName -notmatch "v4-"
}
foreach ($f in $activeMds) {
    $content = Get-Content -LiteralPath $f.FullName -Raw
    if ($content -match "Latest Specifications Milestone:\s*v4" -or $content -match "demonstrates Blueprint v4") {
        Report-Fail "Stale v4 milestone found in $($f.FullName)"
        $staleV4Count++
    }
    if ($content -match '\]\([^)]*Requirement_Mapping' -or $content -match '\]\([^)]*05_Requirement_Mapping') {
        Report-Fail "Active link to Requirement Mapping in $($f.FullName)"
        $reqMapCount++
    }
}
if ($staleV4Count -eq 0) { Report-Pass "No stale v4 milestone declarations found in active examples" }
if ($reqMapCount -eq 0) { Report-Pass "No active links to retired Requirement Mapping found" }

# ------------------------------------------------------------------------------
# 4. Metadata Integrity, Documents, and Frontmatter Contracts
# ------------------------------------------------------------------------------
Write-Host "`n--- Checking METADATA.md Registries & Frontmatter Contracts ---" -ForegroundColor Cyan

$metadataConfigs = @(
    @{ Path = "example/pattern-a-multi-repo/v5-docs/METADATA.md"; BaseDir = "example/pattern-a-multi-repo/v5-docs"; MvpMode = "enabled" },
    @{ Path = "example/pattern-b-monorepo/METADATA.md"; BaseDir = "example/pattern-b-monorepo"; MvpMode = "enabled" },
    @{ Path = "example/pattern-c-monolith/METADATA.md"; BaseDir = "example/pattern-c-monolith"; MvpMode = "collapsed" },
    @{ Path = "example/workspace-domain-distributed/METADATA.md"; BaseDir = "example/workspace-domain-distributed"; MvpMode = "collapsed" }
)

foreach ($cfg in $metadataConfigs) {
    $metaPath = $cfg.Path
    $baseDir = $cfg.BaseDir
    $expectedMvpMode = $cfg.MvpMode

    if (-not (Test-Path $metaPath)) {
        Report-Fail "Metadata file not found: $metaPath"
        continue
    }

    $metaText = Get-Content -LiteralPath $metaPath -Raw
    
    # Check mvp_mode
    if ($metaText -notmatch "mvp_mode:\s*$expectedMvpMode") {
        Report-Fail "$metaPath expected mvp_mode: $expectedMvpMode"
    }

    # Extract registered documents
    $docMatches = [regex]::Matches($metaText, '(?ms)-\s+id:\s*([^\r\n]+)\r?\n\s+type:\s*([^\r\n]+)\r?\n\s+path:\s*([^\r\n]+)\r?\n\s+(?:document_version|version):\s*([^\r\n]+)')
    
    $foundMvp = $false
    $foundFrd = $false

    foreach ($dm in $docMatches) {
        $docId = $dm.Groups[1].Value.Trim().Trim('"''')
        $docType = $dm.Groups[2].Value.Trim().Trim('"''')
        $docRelPath = $dm.Groups[3].Value.Trim().Trim('"''')
        $docVersion = $dm.Groups[4].Value.Trim().Trim('"''')

        if ($docType -eq 'mvp' -or $docId -match '^MVP-') {
            $foundMvp = $true
        }
        if ($docType -eq 'frd' -or $docId -match '^FRD-') {
            $foundFrd = $true
        }

        # Check path existence
        $targetFullPath = Join-Path $baseDir $docRelPath
        if (-not (Test-Path $targetFullPath)) {
            Report-Fail "Registered document $docId path not found: $targetFullPath (from $metaPath)"
            continue
        }

        # Check frontmatter
        $docContent = Get-Content -LiteralPath $targetFullPath -Raw
        if ($docContent -notmatch '(?s)^---\r?\n(.*?)\r?\n---') {
            Report-Fail "Document $targetFullPath lacks YAML frontmatter block"
            continue
        }
        $fmBlock = $Matches[1]
        
        # Verify required keys
        foreach ($k in $requiredFrontmatterKeys) {
            if ($fmBlock -notmatch "(?m)^$k\s*:") {
                Report-Fail "Document $targetFullPath frontmatter missing required key: $k"
            }
        }
        if ($fmBlock -notmatch '(?m)^product_id\s*:' -and $fmBlock -notmatch '(?m)^product_ids\s*:') {
            Report-Fail "Document $targetFullPath frontmatter missing product_id or product_ids"
        }

        # Verify blueprint_version is 5 or 5.0
        if ($fmBlock -notmatch '(?m)^blueprint_version\s*:\s*["''\s]*5(?:\.0)?\b') {
            Report-Fail "Document $($targetFullPath) blueprint_version must be 5 or 5.0"
        }

        # Verify document_version matches metadata
        if ($fmBlock -match '(?m)^document_version\s*:\s*["''\s]*([0-9\.]+)') {
            $actualVersion = $Matches[1].Trim()
            if ($actualVersion -ne $docVersion) {
                Report-Fail "Document version mismatch in $($targetFullPath): metadata has $docVersion, frontmatter has $actualVersion"
            }
        }

        # Verify status is canonical
        if ($fmBlock -match '(?m)^status\s*:\s*["''\s]*([a-z_]+)') {
            $docStatus = $Matches[1].Trim()
            if ($canonicalStatuses -notcontains $docStatus) {
                Report-Fail "Document $targetFullPath has noncanonical status: $docStatus"
            }
        }
    }

    if ($expectedMvpMode -eq 'collapsed') {
        if ($foundMvp) {
            Report-Fail "$metaPath is in collapsed MVP mode but has an MVP registered in documents:"
        }
        # Check disk for MVP files
        $strayMvp = Get-ChildItem -Path $baseDir -Filter "*MVP*.md" -Recurse | Where-Object { $_.FullName -notmatch "archive" }
        if ($strayMvp) {
            Report-Fail "Collapsed mode in $baseDir contains stray MVP files: $($strayMvp.FullName)"
        }
        if (-not $foundFrd) {
            Report-Fail "Collapsed mode in $metaPath must have an FRD registered"
        }
    } else {
        if (-not $foundMvp) {
            Report-Fail "$metaPath is in enabled MVP mode but lacks an MVP registration"
        }
        if (-not $foundFrd) {
            Report-Fail "$metaPath is in enabled MVP mode but lacks an FRD registration"
        }
    }

    # Verify resolved_minor_version in product scope features
    $featMatches = [regex]::Matches($metaText, '(?ms)-\s+id:\s*([^\r\n]+)\r?\n\s+major_version:\s*([^\r\n]+)\r?\n\s+resolved_minor_version:\s*([^\r\n]+)')
    if ($featMatches.Count -eq 0) {
        Report-Fail "No features with resolved_minor_version parsed in $metaPath"
    } else {
        foreach ($fm in $featMatches) {
            $fId = $fm.Groups[1].Value.Trim()
            $fMinor = $fm.Groups[3].Value.Trim().Trim('"''')
            if ([string]::IsNullOrWhiteSpace($fMinor)) {
                Report-Fail "Feature $fId in $metaPath lacks resolved_minor_version snapshot"
            }
        }
    }

    Report-Pass "Validated metadata integrity, document paths, and frontmatter for $metaPath"
}

# ------------------------------------------------------------------------------
# 5. User Story Traceability to FRDs
# ------------------------------------------------------------------------------
Write-Host "`n--- Checking User Story Traceability to FRDs ---" -ForegroundColor Cyan
$storySpecs = @(
    @{ Story = "example/pattern-a-multi-repo/v5-docs/06_User_Stories.md"; Frd = "example/pattern-a-multi-repo/v5-docs/frd/FRD-001.md" },
    @{ Story = "example/pattern-b-monorepo/docs/06_User_Stories.md"; Frd = "example/pattern-b-monorepo/docs/frd/FRD-001.md" },
    @{ Story = "example/pattern-c-monolith/docs/06_User_Stories.md"; Frd = "example/pattern-c-monolith/docs/frd/FRD-001.md" },
    @{ Story = "example/workspace-domain-distributed/inventory/06_User_Stories.md"; Frd = "example/workspace-domain-distributed/inventory/frd/FRD-001.md" },
    @{ Story = "example/workspace-domain-distributed/finance/06_User_Stories.md"; Frd = "example/workspace-domain-distributed/finance/frd/FRD-001.md" }
)

foreach ($sp in $storySpecs) {
    $sText = Get-Content -LiteralPath $sp.Story -Raw
    $fText = Get-Content -LiteralPath $sp.Frd -Raw
    $frMatches = [regex]::Matches($sText, 'FR-[A-Z0-9_-]+')
    $uniqueFrs = $frMatches | ForEach-Object { $_.Value } | Select-Object -Unique
    foreach ($fr in $uniqueFrs) {
        if ($fText -notmatch [regex]::Escape($fr)) {
            Report-Fail "User Story in $($sp.Story) references $fr which is missing in $($sp.Frd)"
        }
    }
    Report-Pass "All FR references in $($sp.Story) resolve in $($sp.Frd)"
}

# ------------------------------------------------------------------------------
# 6. Execution Ownership, Criteria Uniqueness, & Changelog Evidence
# ------------------------------------------------------------------------------
Write-Host "`n--- Checking Boundary Execution, Ownership, & Changelogs ---" -ForegroundColor Cyan
$exampleGroups = @(
    @{
        Name = "Pattern A Multi-Repo"
        StoryDocs = @("example/pattern-a-multi-repo/v5-docs/06_User_Stories.md")
        SpecsChangelogs = @("example/pattern-a-multi-repo/v5-docs/CHANGELOG.md")
        Roadmaps = @("example/pattern-a-multi-repo/v5-backend/ROADMAP.md", "example/pattern-a-multi-repo/v5-frontend/ROADMAP.md")
        Changelogs = @("example/pattern-a-multi-repo/v5-backend/CHANGELOG.md", "example/pattern-a-multi-repo/v5-frontend/CHANGELOG.md")
    },
    @{
        Name = "Pattern B Monorepo"
        StoryDocs = @("example/pattern-b-monorepo/docs/06_User_Stories.md")
        SpecsChangelogs = @("example/pattern-b-monorepo/docs/CHANGELOG.md")
        Roadmaps = @("example/pattern-b-monorepo/apps/backend/ROADMAP.md", "example/pattern-b-monorepo/apps/frontend/ROADMAP.md")
        Changelogs = @("example/pattern-b-monorepo/apps/backend/CHANGELOG.md", "example/pattern-b-monorepo/apps/frontend/CHANGELOG.md")
    },
    @{
        Name = "Pattern C Monolith"
        StoryDocs = @("example/pattern-c-monolith/docs/06_User_Stories.md")
        SpecsChangelogs = @("example/pattern-c-monolith/docs/CHANGELOG.md")
        Roadmaps = @("example/pattern-c-monolith/ROADMAP.md")
        Changelogs = @("example/pattern-c-monolith/CHANGELOG.md")
    },
    @{
        Name = "Workspace Domain Distributed"
        StoryDocs = @(
            "example/workspace-domain-distributed/inventory/06_User_Stories.md",
            "example/workspace-domain-distributed/finance/06_User_Stories.md"
        )
        SpecsChangelogs = @(
            "example/workspace-domain-distributed/inventory/CHANGELOG.md",
            "example/workspace-domain-distributed/finance/CHANGELOG.md"
        )
        Roadmaps = @("example/workspace-domain-distributed/apps/frontend/ROADMAP.md")
        Changelogs = @("example/workspace-domain-distributed/apps/backend/CHANGELOG.md")
    },
    @{
        Name = "Distributed Boundaries"
        StoryDocs = @("example/distributed-specification-boundaries/README.md")
        SpecsChangelogs = @()
        Roadmaps = @(
            "example/distributed-specification-boundaries/execution/api/ROADMAP.md",
            "example/distributed-specification-boundaries/execution/web/ROADMAP.md"
        )
        Changelogs = @(
            "example/distributed-specification-boundaries/execution/api/CHANGELOG.md",
            "example/distributed-specification-boundaries/execution/web/CHANGELOG.md"
        )
    }
)

foreach ($g in $exampleGroups) {
    $groupName = $g.Name
    $groupCriteria = [System.Collections.Generic.HashSet[string]]::new()
    $ownersByStory = @{}
    $groupErrorsBefore = $script:errors

    # Discover active user stories from specification docs and map each to its product_id
    $expectedStories = [System.Collections.Generic.HashSet[string]]::new()
    $productByStory = @{}
    foreach ($sd in $g.StoryDocs) {
        $sdText = Get-Content -LiteralPath $sd -Raw
        $sdPid = if ($sdText -match '(?m)^product_id:\s*([^\r\n]+)') { $Matches[1].Trim() } else { "DEFAULT" }
        $lines = Get-Content -LiteralPath $sd
        foreach ($line in $lines) {
            if ($line -match '\|\s*\*\*([A-Z0-9_-]+)\*\*\s*\|') {
                $stId = $Matches[1]
                [void]$expectedStories.Add($stId)
                $productByStory[$stId] = $sdPid
            }
            # Also support canonical story format in distributed boundaries README table
            if ($line -match '\|\s*([A-Za-z0-9_-]+::[A-Za-z0-9_-]+)\s*\|') {
                $canId = $Matches[1]
                [void]$expectedStories.Add($canId)
                $productByStory[$canId] = $sdPid
            }
        }
    }

    # Check specs changelogs for Product Version release status by product
    $releasedByProduct = @{}
    foreach ($sc in $g.SpecsChangelogs) {
        $scText = Get-Content -LiteralPath $sc -Raw
        $scPid = if ($scText -match '(?m)^product_id:\s*([^\r\n]+)') { $Matches[1].Trim() } else { "DEFAULT" }
        if (-not $releasedByProduct.ContainsKey($scPid)) {
            $releasedByProduct[$scPid] = [System.Collections.Generic.HashSet[string]]::new()
        }
        $relMatches = [regex]::Matches($scText, '(?m)^##\s+\[([0-9\.]+)\]\s+-\s+(?![Uu]nreleased|[Tt]arget)')
        foreach ($rm in $relMatches) {
            [void]$releasedByProduct[$scPid].Add($rm.Groups[1].Value)
        }
    }

    # Check ROADMAPs
    foreach ($rm in $g.Roadmaps) {
        $boundaryName = (Split-Path -Parent $rm).Replace('\', '/')
        $lines = Get-Content -LiteralPath $rm
        foreach ($line in $lines) {
            if (-not $line.StartsWith('|') -or $line -match 'Verification Criteria ID' -or $line -match ':---') {
                continue
            }
            $cols = $line.Split('|') | ForEach-Object { $_.Trim() }
            if ($cols.Count -ge 8) {
                $rawVc = $cols[1]
                $vcId = if ($rawVc -match '`([^`]+)`') { $Matches[1] } else { $rawVc }
                $rawStory = $cols[2]
                $storyId = if ($rawStory -match '`([^`]+)`') { $Matches[1] } else { $rawStory }
                $role = $cols[3]
                $prodVer = $cols[4]
                $status = $cols[7]

                if ($canonicalStatuses -notcontains $status) {
                    Report-Fail "Noncanonical status '$status' in $rm for criterion $vcId"
                }

                $storyProd = if ($productByStory.ContainsKey($storyId)) { $productByStory[$storyId] } else { "DEFAULT" }
                $isProdReleased = if ($releasedByProduct.ContainsKey($storyProd)) { $releasedByProduct[$storyProd].Contains($prodVer) } else { $false }
                if ($isProdReleased -and ($status -eq 'planned' -or $status -eq 'in_progress')) {
                    Report-Fail "Released Product Version $prodVer for $storyProd has active/planned criterion $vcId in $rm (violates No Orphan Requirements)"
                }
                if ($groupCriteria.Contains($vcId)) {
                    Report-Fail "Duplicate criterion ID $vcId in $groupName ($rm)"
                }
                [void]$groupCriteria.Add($vcId)

                if ($role -eq 'requirement_owner') {
                    if (-not $ownersByStory.ContainsKey($storyId)) {
                        $ownersByStory[$storyId] = [System.Collections.Generic.HashSet[string]]::new()
                    }
                    [void]$ownersByStory[$storyId].Add($boundaryName)
                }
            }
        }
    }

    # Check CHANGELOGs
    foreach ($cl in $g.Changelogs) {
        $boundaryName = (Split-Path -Parent $cl).Replace('\', '/')
        $clText = Get-Content -LiteralPath $cl -Raw
        if ($clText -notmatch 'Compatible Product Versions' -and $clText -notmatch 'Compatibility Declaration') {
            Report-Fail "Deployable release changelog $cl lacks compatibility declaration"
        }

        # Check criterion entries
        $lines = Get-Content -LiteralPath $cl
        foreach ($line in $lines) {
            $m = [regex]::Match($line, '<a (?:id|name)="([^"]+)"></a>\s*\*\*\[([^\]]+)\]\*\*\s*(?:\(Story:\s*([^,\)]+),\s*role:\s*([^\)]+)\))?')
            if ($m.Success) {
                $ancId = $m.Groups[1].Value
                $storyId = $m.Groups[3].Value.Trim()
                $role = $m.Groups[4].Value.Trim()

                if ($groupCriteria.Contains($ancId)) {
                    Report-Fail "Criterion $ancId exists in both ROADMAP and CHANGELOG or is duplicate in $cl"
                }
                [void]$groupCriteria.Add($ancId)

                if ($role -eq 'requirement_owner' -and -not [string]::IsNullOrWhiteSpace($storyId)) {
                    if (-not $ownersByStory.ContainsKey($storyId)) {
                        $ownersByStory[$storyId] = [System.Collections.Generic.HashSet[string]]::new()
                    }
                    [void]$ownersByStory[$storyId].Add($boundaryName)
                }

                # Verifiable evidence check
                $cm = [regex]::Match($line, 'commit:\s*([a-f0-9]+)')
                $sm = [regex]::Match($line, 'source:\s*([^\s\)]+)')
                if ($cm.Success) {
                    $commitHash = $cm.Groups[1].Value
                    $gitCheck = git cat-file -e "$($commitHash)^{commit}" 2>&1
                    if ($LASTEXITCODE -ne 0) {
                        Report-Fail "Criterion $ancId in $cl references invalid commit hash: $commitHash"
                    }
                } elseif ($sm.Success) {
                    $srcRel = $sm.Groups[1].Value
                    $clDir = Split-Path -Parent $cl
                    $srcFull = Join-Path $clDir $srcRel
                    if (-not (Test-Path $srcRel) -and -not (Test-Path $srcFull)) {
                        Report-Fail "Criterion $ancId in $cl references non-existent source file: $srcRel"
                    }
                } else {
                    Report-Fail "Criterion $ancId in $cl lacks verifiable commit or source evidence"
                }
            }
        }
    }

    # Check all changelogs for unreleased section lifecycle contradiction
    $allGroupChangelogs = @($g.SpecsChangelogs) + @($g.Changelogs)
    foreach ($cl in $allGroupChangelogs) {
        $clRaw = Get-Content -LiteralPath $cl -Raw
        $sections = [regex]::Split($clRaw, '(?m)^(?=##\s+\[)')
        foreach ($sec in $sections) {
            $hm = [regex]::Match($sec, '##\s+\[([^\]]+)\](?:\s*-\s*([^\r\n]+))?')
            if ($hm.Success) {
                $ver = $hm.Groups[1].Value
                $suffix = $hm.Groups[2].Value
                $isUnreleased = ($ver -match '(?i)unreleased|target') -or ($suffix -match '(?i)target')
                if ($isUnreleased) {
                    if ($sec -match '(?m)^\s*###\s+Released\s+(?:MVP|Features?)' -or $sec -match '(?m)^\s*[\*\-]?\s*Released\s+(?:MVP|Features?|Feature\s+Versions)\s*:') {
                        Report-Fail "Unreleased block in $cl contradicts lifecycle state by claiming released MVP or features"
                    }
                }
            }
        }
    }

    # Validate Distributed Specification Boundaries Story-to-Roadmap Version Aggregation
    if ($groupName -eq "Distributed Boundaries") {
        $distReadmePath = "example/distributed-specification-boundaries/README.md"
        $readmeLines = Get-Content -LiteralPath $distReadmePath
        $inSec3 = $false
        $distStoryToProdVer = @{}
        foreach ($rLine in $readmeLines) {
            if ($rLine -match '^##\s+3\.\s+Product-Level Requirement Aggregation') {
                $inSec3 = $true
                continue
            }
            if ($inSec3 -and $rLine -match '^##\s+') {
                $inSec3 = $false
                break
            }
            if ($inSec3 -and $rLine.StartsWith('|') -and $rLine -notmatch ':---') {
                $rCells = $rLine.Split('|') | ForEach-Object { $_.Trim() }
                if ($rCells.Count -ge 4 -and $rCells[1] -ne 'Product Version') {
                    $pv = $rCells[1]
                    $cs = $rCells[3]
                    if ($cs -match '^[A-Za-z0-9_-]+::[A-Za-z0-9_-]+$') {
                        $distStoryToProdVer[$cs] = $pv
                    }
                }
            }
        }

        foreach ($rm in $g.Roadmaps) {
            $rmLines = Get-Content -LiteralPath $rm
            foreach ($line in $rmLines) {
                if (-not $line.StartsWith('|') -or $line -match 'Verification Criteria ID' -or $line -match ':---') {
                    continue
                }
                $cols = $line.Split('|') | ForEach-Object { $_.Trim() }
                if ($cols.Count -ge 8) {
                    $rawVc = $cols[1]
                    $vcId = if ($rawVc -match '`([^`]+)`') { $Matches[1] } else { $rawVc }
                    $rawStory = $cols[2]
                    $storyId = if ($rawStory -match '`([^`]+)`') { $Matches[1] } else { $rawStory }
                    $prodVer = $cols[4]

                    if ($distStoryToProdVer.ContainsKey($storyId)) {
                        $expectedPv = $distStoryToProdVer[$storyId]
                        if ($prodVer -ne $expectedPv) {
                            Report-Fail "Distributed criterion $vcId in $rm specifies Product Version '$prodVer', but Canonical Story '$storyId' is aggregated under Product Version '$expectedPv' in $distReadmePath"
                        }
                    }
                }
            }
        }
    }

    # Verify Story Owner Cardinality across the UNION of ROADMAP & CHANGELOG
    # 1. Check all discovered expected stories have an owner
    foreach ($expStory in $expectedStories) {
        if (-not $ownersByStory.ContainsKey($expStory) -or $ownersByStory[$expStory].Count -eq 0) {
            Report-Fail "Active User Story $expStory in $groupName has ZERO owning boundaries across ROADMAP and CHANGELOG"
        }
    }

    # 2. Check no story has more than one owning boundary
    foreach ($storyKey in $ownersByStory.Keys) {
        $claimants = $ownersByStory[$storyKey]
        if ($claimants.Count -gt 1) {
            Report-Fail "Story $storyKey in $groupName claimed by multiple owning boundaries: $($claimants -join ', ')"
        }
    }

    if ($script:errors -eq $groupErrorsBefore) {
        Report-Pass "Validated ownership cardinality, criteria uniqueness, and verifiable changelog evidence for $groupName"
    }
}

# ------------------------------------------------------------------------------
# 7. Table Status Cell Casing Validation
# ------------------------------------------------------------------------------
Write-Host "`n--- Checking Table Status Cell Casing ---" -ForegroundColor Cyan
$statusCellIssues = 0
foreach ($f in $activeMds) {
    if ($f.Name -match '^00_Doc') { continue }
    $lines = Get-Content -LiteralPath $f.FullName
    $statusColIdx = -1
    foreach ($line in $lines) {
        if ($line.Contains('|')) {
            $cells = $line.Split('|') | ForEach-Object { $_.Trim() }
            if ($cells.Count -gt 2) {
                # Look for Status column header
                for ($ci = 1; $ci -lt ($cells.Count - 1); $ci++) {
                    if ($cells[$ci] -eq 'Status') {
                        $statusColIdx = $ci
                        break
                    }
                }
                if ($line -match ':---' -or $line -match '---:') {
                    continue
                }
                if ($statusColIdx -ge 1 -and $cells.Count -gt ($statusColIdx + 1)) {
                    $cellVal = $cells[$statusColIdx].Trim('`*[] ')
                    if ($cellVal -ne 'Status' -and -not [string]::IsNullOrWhiteSpace($cellVal) -and $cellVal -notmatch '^-+$') {
                        if ($canonicalStatuses -notcontains $cellVal) {
                            Report-Fail "Noncanonical status cell '$cellVal' in $($f.FullName): $line"
                            $statusCellIssues++
                        }
                    }
                }
            }
        } else {
            $statusColIdx = -1
        }
    }
}
if ($statusCellIssues -eq 0) {
    Report-Pass "All markdown table status cells use canonical lowercase values"
}

# ------------------------------------------------------------------------------
# 8. Workspace-Level Shared Technical Foundations Validation
# ------------------------------------------------------------------------------
Write-Host "`n--- Checking Workspace Shared Technical Foundations ---" -ForegroundColor Cyan
$wsDocs = @(
    "example/workspace-domain-distributed/docs/07_Architecture.md",
    "example/workspace-domain-distributed/docs/08_Technical_Standards.md",
    "example/workspace-domain-distributed/docs/09_Decision_Log.md"
)
foreach ($wd in $wsDocs) {
    if (-not (Test-Path $wd)) {
        Report-Fail "Required workspace technical foundation document missing: $wd"
    } else {
        $content = Get-Content -LiteralPath $wd -Raw
        if ($content -notmatch 'kind:\s*workspace' -or $content -notmatch 'id:\s*WS-ENTERPRISE') {
            Report-Fail "$wd must declare scope kind workspace and id WS-ENTERPRISE"
        }
    }
}
# Ensure domain subdirectories do not contain redundant 07, 08, 09
$strayDomainDocs = Get-ChildItem -Path "example/workspace-domain-distributed" -Include "07_Architecture.md", "08_Technical_Standards.md", "09_Decision_Log.md" -Recurse | Where-Object {
    $_.FullName -notmatch "docs"
}
if ($strayDomainDocs) {
    Report-Fail "Found redundant domain technical docs: $($strayDomainDocs.FullName)"
} else {
    Report-Pass "Workspace technical foundations properly consolidated under docs/ with no redundant domain copies"
}

# ------------------------------------------------------------------------------
# 9. Relative Markdown Links Resolution
# ------------------------------------------------------------------------------
Write-Host "`n--- Checking Relative Markdown Links Resolution ---" -ForegroundColor Cyan
$brokenLinkCount = 0
foreach ($f in $activeMds) {
    if ($f.Name -match '^00_Doc') { continue }
    $dir = $f.DirectoryName
    $content = Get-Content -LiteralPath $f.FullName -Raw
    $linkMatches = [regex]::Matches($content, '\[([^\]]*)\]\(([^)#\s]+)(?:#[^\)]*)?\)')
    foreach ($lm in $linkMatches) {
        $target = $lm.Groups[2].Value
        if ($target.StartsWith('http') -or $target.StartsWith('mailto:') -or $target.StartsWith('#')) {
            continue
        }
        $resolved = Join-Path $dir $target
        if (-not (Test-Path $resolved)) {
            Report-Fail "Broken relative link in $($f.FullName): '$target' -> '$resolved'"
            $brokenLinkCount++
        }
    }
}
if ($brokenLinkCount -eq 0) {
    Report-Pass "All relative markdown links resolve to existing files"
}

# ------------------------------------------------------------------------------
# Final Summary
# ------------------------------------------------------------------------------
Write-Host "`n==================================================" -ForegroundColor Cyan
if ($script:errors -gt 0) {
    Write-Host "VALIDATION FAILED with $($script:errors) error(s) and $($script:warnings) warning(s)!" -ForegroundColor Red
    Write-Host "==================================================`n" -ForegroundColor Cyan
    exit 1
} else {
    Write-Host "ALL DETERMINISTIC VALIDATION CHECKS PASSED (ZERO FAILURES)!" -ForegroundColor Green
    Write-Host "Total warnings: $($script:warnings)" -ForegroundColor Yellow
    Write-Host "==================================================`n" -ForegroundColor Cyan
    exit 0
}
