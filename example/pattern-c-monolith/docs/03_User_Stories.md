# User Stories - Product Catalog Service
**Version:** 1.0 (Stable Milestone)

This document maps target user outcomes to specific functional requirements and acceptance criteria.

---

## Feature Module: Category Management

### US-CAT-01: Create and Manage Categories
**As a** Merchandiser,  
**I want to** create, update, and organize product categories,  
**So that** I can structure our catalog hierarchy logically for customer navigation.

#### Acceptance Criteria:
1. A category must have a non-empty `name`.
2. A category must have a unique `slug` (alphanumeric, dashes, lowercase). If not provided, it must be auto-generated from the name.
3. Slugs must be unique across the platform. An attempt to create a duplicate slug must return a validation error.
4. A category may optionally have a `parent_category_id` to establish parent-child hierarchies.
5. Soft-deletion is required; deleting a category must not cascade-delete products immediately but should prevent new assignments.

---

## Feature Module: Product Management

### US-PROD-01: Create Products with SKUs
**As a** Merchandiser,  
**I want to** create a new product and assign it to an existing category with a unique SKU,  
**So that** inventory systems can uniquely identify it.

#### Acceptance Criteria:
1. A product must have a `name`, `SKU`, and `base_price`.
2. The `SKU` must be a unique, uppercase alphanumeric string matching the pattern `/^[A-Z0-9-]{3,20}$/`.
3. The `base_price` must be a positive decimal number representing currency (e.g. `29.99`). It cannot be zero or negative.
4. A product must be assigned to exactly one valid, existing `category_id`.
5. If the assigned category is soft-deleted, product creation or update must fail with a standard business validation message.
