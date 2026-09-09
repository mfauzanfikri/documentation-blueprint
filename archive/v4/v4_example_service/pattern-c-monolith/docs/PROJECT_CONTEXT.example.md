# Project Context Example - Product Catalog Monolith

> [!NOTE]
> This file demonstrates Blueprint v4 Project Context and documentation initialization usage. It is temporary, non-authoritative, and not a mandatory retained artifact. After BRD, PRD, User Stories, Architecture, Requirement Mapping, and validation findings are accepted, a real project may delete this working file.

## 1. Source Materials Reviewed

| Source | Boundary | Evidence Classification | Confidence |
| :--- | :--- | :--- | :--- |
| `docs/` specification files | Specification | Explicit Fact | High |
| Root ROADMAP and CHANGELOG | Execution | Explicit Fact | High |
| Monolith README | Execution | Explicit Fact | High |
| Full-stack workflow reconstruction | Adoption Input | Derived Fact | Medium |

## 2. Explicit Facts

| Fact | Evidence | Confidence |
| :--- | :--- | :--- |
| The monolith keeps specifications in `docs/` and execution tracking at the repository root. | Pattern C structure | High |
| Monolith Verification Criteria IDs use the `ML` prefix. | Root ROADMAP and Requirement Mapping | High |
| Released implementation evidence is stored in the root codebase CHANGELOG. | Requirement Mapping release links | High |

## 3. Derived Facts

| Derived Fact | Basis | Confidence |
| :--- | :--- | :--- |
| Backend and frontend implementation responsibilities are combined within one execution boundary. | Monolith README and `ML` mapping prefix | High |
| The merchandiser-facing UI and API behavior support the same Product Catalog business capabilities. | PRD journeys and monolith roadmap criteria | Medium |

## 4. Assumptions and Unknowns

| Item | Classification | Confidence | Resolution Path |
| :--- | :--- | :--- | :--- |
| The monolith has a single deployment cadence. | Assumption | Medium | Confirm from deployment documentation before relying on it operationally. |
| External checkout and inventory integrations are out of current scope. | Explicit Fact | High | Preserve as out-of-scope unless project scope changes. |

## 5. Business Flow Discovery

The example demonstrates a single execution boundary implementing category hierarchy management and product onboarding. Implementation evidence is useful for validation, but business intent remains owned by BRD, PRD, and User Stories.
