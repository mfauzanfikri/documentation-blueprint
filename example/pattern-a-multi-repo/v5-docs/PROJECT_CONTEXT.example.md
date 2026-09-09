# Project Context Example - Product Catalog Service

> [!NOTE]
> This file demonstrates Blueprint v4 Project Context and documentation initialization usage. It is temporary, non-authoritative, and not a mandatory retained artifact. After BRD, PRD, User Stories, Architecture, Requirement Mapping, and validation findings are accepted, a real project may delete this working file.

## 1. Source Materials Reviewed

| Source | Boundary | Evidence Classification | Confidence |
| :--- | :--- | :--- | :--- |
| Existing BRD, PRD, User Stories, Architecture, and Requirement Mapping | Specification | Explicit Fact | High |
| Backend ROADMAP and CHANGELOG | Execution | Explicit Fact | High |
| Frontend ROADMAP and CHANGELOG | Execution | Explicit Fact | High |
| Product Catalog example workflow reconstruction | Adoption Input | Derived Fact | Medium |

## 2. Explicit Facts

| Fact | Evidence | Confidence |
| :--- | :--- | :--- |
| Product Catalog has separate docs, backend, and frontend execution boundaries. | Pattern A folder structure | High |
| Category and Product are the two modeled business entities in the example. | BRD and PRD entity sections | High |
| Some implementation criteria are released and some remain pending. | Requirement Mapping links to CHANGELOG and ROADMAP | High |

## 3. Derived Facts

| Derived Fact | Basis | Confidence |
| :--- | :--- | :--- |
| Merchandiser catalog setup is the primary business workflow demonstrated by the example. | BRD stakeholders, PRD journeys, and User Stories | Medium |
| Backend and frontend execution boundaries jointly implement the same master Product Catalog requirements. | Requirement Mapping references both boundaries for shared User Story IDs | High |

## 4. Assumptions and Unknowns

| Item | Classification | Confidence | Resolution Path |
| :--- | :--- | :--- | :--- |
| Downstream checkout behavior is not modeled in this example. | Unknown | Low | Keep out of Product Catalog requirements unless source material is added. |
| Search indexing is future or external scope. | Assumption | Medium | Confirm through product planning before documenting as a requirement. |

## 5. Business Flow Discovery

The example demonstrates two business flows:

1. Merchandiser creates and maintains category hierarchy.
2. Merchandiser creates product records with unique SKUs and valid category assignment.

Routes, DTOs, and UI forms are treated as execution evidence only. They do not redefine the master business requirements.
