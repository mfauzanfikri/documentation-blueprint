# Monolith Roadmap - Product Catalog Monolith

**Boundary:** `product-catalog-monolith`
**Status:** active Execution Plan

This unified monolith roadmap tracks future-oriented technical tasks for the monolith. Completed tasks are documented in `CHANGELOG.md`.

---

## Active & Planned Implementation Tasks

| Verification Criteria ID | User Story ID | Boundary Role | Product Version | MVP ID | Task Description | Status |
| :--- | :--- | :--- | :--- | :--- | :--- | :--- |
| <a id="ML-US-CAT-01-004"></a>`ML-US-CAT-01-004` | `US-CAT-01` | requirement_owner | 1.0 | - | Implement soft-deletion service logic (setting `deleted_at` timestamp) instead of executing raw database `DELETE`. | planned |
| <a id="ML-US-CAT-01-006"></a>`ML-US-CAT-01-006` | `US-CAT-01` | requirement_owner | 1.0 | - | Create a Category Tree view using recursion to display hierarchical relationships up to 3 levels deep. | planned |
| <a id="ML-US-PROD-01-003"></a>`ML-US-PROD-01-003` | `US-PROD-01` | requirement_owner | 1.0 | - | Build `POST /api/products` endpoint verifying that the assigned `category_id` exists and is not soft-deleted. | planned |
| <a id="ML-US-PROD-01-005"></a>`ML-US-PROD-01-005` | `US-PROD-01` | requirement_owner | 1.0 | - | Create a Product Creation Form with a Category selector dropdown that filters out inactive/soft-deleted categories. | planned |
