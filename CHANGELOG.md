# Changelog - Documentation Blueprint Framework

All notable changes to the Documentation Blueprint framework will be documented in this file. This project adheres to the Blueprint Versioning Strategy (Major versions only).

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
