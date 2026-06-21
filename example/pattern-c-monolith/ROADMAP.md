# Monolith Roadmap - Product Catalog Monolith
**Repository:** `product-catalog-monolith`
**Latest Specifications Milestone:** `v4`

This unified monolith roadmap tracks both backend and frontend active technical tasks. Completed tasks are documented in the codebase CHANGELOG.md.

| Verification Criteria ID | User Story ID | Technical Verification Criteria | Status |
| :--- | :--- | :--- | :--- |
| <a id="ML-US-CAT-01-004"></a>`ML-US-CAT-01-004` | **US-CAT-01** | Implement soft-deletion service logic (setting `deleted_at` timestamp) instead of executing raw database `DELETE`. | `[ ]` |
| <a id="ML-US-CAT-01-006"></a>`ML-US-CAT-01-006` | **US-CAT-01** | Create a Category Tree view using recursion to display hierarchical relationships up to 3 levels deep. | `[ ]` |
| <a id="ML-US-PROD-01-003"></a>`ML-US-PROD-01-003` | **US-PROD-01** | Build `POST /api/products` endpoint verifying that the assigned `category_id` exists and is not soft-deleted. | `[ ]` |
| <a id="ML-US-PROD-01-005"></a>`ML-US-PROD-01-005` | **US-PROD-01** | Create a Product Creation Form with a Category selector dropdown that filters out inactive/soft-deleted categories. | `[ ]` |
