---
document_id: USER-STORIES
document_type: user_stories
document_version: "1.0"
blueprint_version: 5
product_id: PROD-CATALOG
product_version: "1.0"
status: active
scope:
  kind: product
  id: PROD-CATALOG
authority: implementation_requirement
owner: Engineering Team
last_updated: "2026-09-09"
---
# User Stories - Product Catalog Service

**Product Version:** 1.0
**Scoped FRD:** [FRD-001.md](./frd/FRD-001.md)
**Status:** active

---

## 1. User Story Index

| User Story ID | Title | Scoped Feature | Scoped FRD Requirement | Status |
| :--- | :--- | :--- | :--- | :--- |
| **US-CAT-01** | Create and Manage Categories | F-001 v1 | FR-001-01, FR-001-02, FR-001-03 | active |
| **US-PROD-01** | Create Products with SKUs | F-002 v1 | FR-002-01, FR-002-02, FR-002-03 | active |

---

## 2. User Stories

### US-CAT-01: Create and Manage Categories
* **Scoped Feature:** `F-001 v1` (Category Hierarchy Management)
* **Scoped Functional Requirements:** `FR-001-01`, `FR-001-02`, `FR-001-03`

**As a** Merchandiser,
**I want to** create, update, and organize product categories,
**So that** I can structure our catalog hierarchy logically for customer navigation.

#### Acceptance Criteria:
1. A category must have a non-empty `name` (2-100 chars).
2. A category must have a unique `slug` (alphanumeric, dashes, lowercase). If not provided, it must be auto-generated from the name.
3. Slugs must be unique across the platform. An attempt to create a duplicate slug must return a validation error or numeric suffix.
4. A category may optionally have a `parent_category_id` to establish parent-child hierarchies up to 3 levels deep.
5. Soft-deletion is required; deleting a category must set `deleted_at` to prevent new assignments without breaking historical orders.

---

### US-PROD-01: Create Products with SKUs
* **Scoped Feature:** `F-002 v1` (Product Master Management)
* **Scoped Functional Requirements:** `FR-002-01`, `FR-002-02`, `FR-002-03`

**As a** Merchandiser,
**I want to** create a new product and assign it to an existing category with a unique SKU,
**So that** inventory systems can uniquely identify it.

#### Acceptance Criteria:
1. A product must have a `name`, `SKU`, and `base_price`.
2. The `SKU` must be a unique, uppercase alphanumeric string matching the pattern `^[A-Z0-9-]{3,20}$`.
3. The `base_price` must be a positive decimal number strictly greater than zero (e.g., `29.99`).
4. A product must be assigned to exactly one valid, existing `category_id`.
5. If the assigned category is soft-deleted or non-existent, product creation or update must fail with a standard business validation message.
