# Changelog - Documentation Blueprint Framework

All notable changes to the Documentation Blueprint framework will be documented in this file. This project adheres to the Blueprint Versioning Strategy (Major versions only).

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

---

## [1] - 2026-05-15
### Added
- Initial release of the Decoupled Specs & Distributed Roadmaps documentation framework.
- Core centralized spec templates: `01_BRD.md`, `02_User_Stories.md`, `03_Diagrams.md`, `04_Requirement_Mapping.md`.
- Core distributed execution templates: `ROADMAP.md` (Frontend/Backend task validation tables).
