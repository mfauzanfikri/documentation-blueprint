# Distributed Specification Boundaries Example

This focused V4 example demonstrates product-level aggregation across multiple Specification Boundaries. It is intentionally small: it shows namespace ownership, collision-safe User Story IDs, shared execution boundaries, and product-level release visibility without prescribing a repository layout.

## 1. Topology

```text
product-docs/
├── catalog-specs/          # Specification Boundary: Catalog
│   ├── 03_User_Stories.md
│   └── CHANGELOG.md        # Catalog Product Version history
│
├── identity-specs/         # Specification Boundary: Identity
│   ├── 03_User_Stories.md
│   └── CHANGELOG.md        # Identity Product Version history
│
└── product-traceability/
    └── 05_Requirement_Mapping.md

execution/
├── api/                    # Execution Boundary: api, deployable service
│   ├── README.md
│   ├── ROADMAP.md
│   └── CHANGELOG.md
│
└── web/                    # Execution Boundary: web, deployable application
    ├── README.md
    ├── ROADMAP.md
    └── CHANGELOG.md
```

Topology notes:

* `Catalog` and `Identity` are separate Specification Boundaries.
* Each Specification Boundary owns its local User Story IDs.
* Local User Story IDs may collide when namespace ownership is explicit.
* Product-level aggregation must preserve the originating Specification Boundary.
* `api` and `web` are shared deployable Execution Boundaries that implement requirements from both Specification Boundaries.

## 2. Local Specification Identity

| Specification Boundary | Local User Story ID | Canonical Product Identity | Story Title |
| :--- | :--- | :--- | :--- |
| Catalog | US-AUTH-01 | Catalog::US-AUTH-01 | Assign catalog permissions to merchandisers |
| Identity | US-AUTH-01 | Identity::US-AUTH-01 | Authenticate staff users with role-aware sessions |
| Catalog | US-CAT-01 | Catalog::US-CAT-01 | Manage product category hierarchy |

The repeated `US-AUTH-01` value is valid because each User Story ID is owned by its Specification Boundary. Product-level reports must use the canonical identity to avoid collisions.

## 3. Product-Level Requirement Aggregation

| Product Version | Specification Boundary | Canonical Story | Product Capability | Release Visibility |
| :--- | :--- | :--- | :--- | :--- |
| 1.0 | Identity | Identity::US-AUTH-01 | Staff authentication and role-aware sessions | Required for Product Version 1.0 |
| 1.0 | Catalog | Catalog::US-CAT-01 | Category hierarchy management | Required for Product Version 1.0 |
| 1.1 | Catalog | Catalog::US-AUTH-01 | Catalog-specific merchandiser permissions | Planned for Product Version 1.1 |

Product release visibility is aggregated at the product level, but ownership remains with the originating Specification Boundary.

## 4. Aggregated Requirement Mapping

| Specification Boundary | User Story ID | Verification Criteria ID | Execution Boundary | Boundary Role | Execution Reference | Release Evidence |
| :--- | :--- | :--- | :--- | :--- | :--- | :--- |
| Identity | Identity::US-AUTH-01 | API-US-AUTH-01-001 | api | requirement_owner | [api/CHANGELOG.md](./execution/api/CHANGELOG.md#API-US-AUTH-01-001) | Boundary v1.0.0 |
| Identity | Identity::US-AUTH-01 | WEB-US-AUTH-01-001 | web | supporting_boundary | [web/CHANGELOG.md](./execution/web/CHANGELOG.md#WEB-US-AUTH-01-001) | Boundary v1.0.0 |
| Catalog | Catalog::US-CAT-01 | API-US-CAT-01-001 | api | requirement_owner | [api/CHANGELOG.md](./execution/api/CHANGELOG.md#API-US-CAT-01-001) | Boundary v1.0.0 |
| Catalog | Catalog::US-CAT-01 | WEB-US-CAT-01-001 | web | supporting_boundary | [web/ROADMAP.md](./execution/web/ROADMAP.md#WEB-US-CAT-01-001) | Pending |
| Catalog | Catalog::US-AUTH-01 | API-US-AUTH-01-002 | api | requirement_owner | [api/ROADMAP.md](./execution/api/ROADMAP.md#API-US-AUTH-01-002) | Pending |

Validation expectations:

* Every product-level row preserves `Specification Boundary + User Story ID`.
* Verification Criteria IDs remain scoped by Execution Boundary.
* Deployable boundaries own Boundary Version release evidence.
* Pending work links to the owning boundary `ROADMAP.md`.
* Released work links to the owning boundary `CHANGELOG.md`.

## 5. Compatibility Visibility

| Execution Boundary | Boundary Type | Deployable | Boundary Version | Compatible Product Versions |
| :--- | :--- | :--- | :--- | :--- |
| api | service | true | 1.0.0 | 1.0 |
| web | application | true | 1.0.0 | 1.0 |

Compatibility remains declared by deployable Execution Boundaries. The distributed Specification Boundaries do not own Boundary Versions.
