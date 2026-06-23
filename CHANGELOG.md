# Changelog - Documentation Blueprint Framework

All notable changes to the Documentation Blueprint framework will be documented in this file. This project adheres to the Blueprint Versioning Strategy (Major versions only).

---

## [4] - 2026-06-21
### Added
- **Product-centric terminology** replacing project-release language with Product Versions for business capability evolution.
- **Execution Boundary model** defining boundary types, deployability, boundary roles, and ownership responsibilities across workspaces, applications, services, monoliths, packages, and infrastructure.
- **Independent Boundary Versioning** allowing deployable boundaries to version independently while explicitly declaring Compatible Product Versions.
- **Compatibility metadata governance** keeping current compatibility in deployable Execution Boundary README metadata, historical evidence in Execution Boundary CHANGELOG files, and product-level traceability in Requirement Mapping.
- **Documentation Initialization guidance** for capturing topology, adoption mode, execution boundaries, deployability, and ownership before artifact generation.
- **Distributed Specification Boundary namespace rules** for preserving `Specification Boundary + Requirement/User Story ID` identity during product-level aggregation.
- **Distributed specification example** demonstrating multiple Specification Boundaries, collision-safe story identities, product-level aggregation, and shared execution boundaries.
- **V4 Clarification (Domain-Distributed Specs Patch):**
  - Added optional **Domain-Distributed Specification Structures** for multi-domain monorepos/workspaces, enabling domain spec folders to own complete BRD/PRD/User Story/Architecture/Mapping/Decision/CHANGELOG artifact sets.
  - Established the **Single Blueprint Authority** rule (exactly one `00_Documentation_Blueprint.md` copy per repository workspace; domain folders must not duplicate it).
  - Defined the **Workspace References** (`docs/references/`) contract as non-authoritative long-lived workspace reference material.
  - Added **Pattern B Variant: Domain-Distributed Specifications Workspace** layout representation.
  - Extended validation rules and areas to check for duplicate blueprints, reference overrides, temporary/scratch content in `references/`, and lost domain namespace context in mappings.
  - Added brownfield migration guidance on partitioning a centralized spec set into domain-owned spec folders while preserving links and traceability.
- **V4 Clarification (Open Clarifications & Enhancements Patch):**
  - Extended **Boundary Roles** with **Requirement Ownership Cardinality** rules (exactly one `requirement_owner` per canonical requirement ID within a mapping scope; multiple supporting/evidence sources allowed).
  - Defined explicit **Deterministic Validation Assertions** (`PASS`, `FAIL`, `WARNING`) and fail-fast check rules within the Validation Framework.
  - Added **Domain Identity Preservation** rules to maintain canonical ID stability and lineage tracing (`legacy_ids` / `supersedes` in mappings, ADR records in Decision Log) during domain restructuring.
  - Formalized **Product Release Aggregation Rules** specifying that product-level readiness is derived from all required domain mapping files, blocking releases if any mapping remains unresolved or pending.

### Changed
- Upgraded the blueprint framework version to **Version 4**.
- Upgraded active reference examples to Version 4 and renamed Pattern A reference folders from `v3-*` to `v4-*`.
- Archived the Version 3 master blueprint and active example set under `archive/v3/`.
- Updated repository navigation, adoption steps, active release state, and metadata for Version 4.

---

## [3] - 2026-06-08
### Added
- **Project Context** as a temporary, non-authoritative adoption input for brownfield documentation and AI-assisted context normalization.
- **Evidence and Confidence Classification** to distinguish Explicit Facts, Derived Facts, Assumptions, Unknowns, and confidence levels in Project Context and validation findings.
- **Central Artifact Contracts** defining purpose, allowed content, forbidden content, dependencies, temporal scope, and authority level for each required specification and execution artifact.
- **Traceability Integrity Validation** requiring stable IDs, valid links, correct targets, supporting evidence, and temporal state.
- **Master-Service Hierarchy Rules** clarifying that master documentation owns business intent while service documentation owns implementation context.
- **Temporal Scope Rules** for state-sensitive artifacts including ROADMAP, CHANGELOG, Decision Log, and validation findings.
- **Validation Framework** with finding format and lifecycle states: Open, Resolved, Accepted Risk, and Rejected.
- **Project Context examples** and validation findings across all active reference patterns.
- **BRD business flow diagram guidance** to improve readability of business processes while keeping technical sequence details in Architecture.
- **PRD design-reference anti-fabrication rules** requiring Figma, wireframe, prototype, and external design references to be verified or explicitly provided.
- **Service README metadata standard** requiring identity, boundary, version, compatibility, status, and ownership metadata for execution-boundary READMEs.

### Changed
- Upgraded the blueprint framework version to **Version 3**.
- Upgraded active reference examples to Version 3 and renamed Pattern A reference folders from `v2-*` to `v3-*`.
- Archived the Version 2 master blueprint and active example set under `archive/v2/`.
- Updated repository navigation, adoption steps, active release state, and metadata for Version 3.

---

## [2] - 2026-06-01
### Added
- **Product Requirements Document (PRD)** (`02_PRD.md` template) to specify functional requirements, product capabilities, and wireframe references.
- **Decision Log (ADR)** (`06_Decision_Log.md` template) to document architectural, product, and technical decisions with their trade-offs.
- **Service README.md Standard** requiring service-specific context, tech stacks, setup instructions, and documentation links.
- **Service CHANGELOG.md Standard** to enforce historical, future-decoupled tracking of completed tasks.

### Changed
- Upgraded the blueprint framework version to **Version 2**.
- Replaced `03_Diagrams.md` with **`04_Architecture.md`** to house database ERDs, system flows, integration sequence diagrams, boundaries, and technical constraints.
- Renamed and reordered specification files in the template hierarchy for improved logical mapping.
- Refined `ROADMAP.md` to be strictly **future-oriented** task checklists, decoupling historical records into the new local `CHANGELOG.md`.
- Decoupled portable service documentation rules from central repository maintenance workflows, moving repository-maintenance guidelines and archival checklists to `README.md`.

---

## [1] - 2026-05-15
### Added
- Initial release of the Decoupled Specs & Distributed Roadmaps documentation framework.
- Core centralized spec templates: `01_BRD.md`, `02_User_Stories.md`, `03_Diagrams.md`, `04_Requirement_Mapping.md`.
- Core distributed execution templates: `ROADMAP.md` (Frontend/Backend task validation tables).
