# Backend Roadmap - Product Catalog Service
**Repository:** `product-catalog-backend`
**Latest Specifications Milestone:** `v3`

This active roadmap tracks backend implementation tasks and verification criteria. ROADMAPs are strictly future-oriented. Completed tasks are documented in the codebase CHANGELOG.md.

| Verification Criteria ID | User Story ID | Technical Verification Criteria | Status |
| :--- | :--- | :--- | :--- |
| <a id="BE-US-CAT-01-004"></a>`BE-US-CAT-01-004` | **US-CAT-01** | Implement soft-deletion service logic (setting `deleted_at` timestamp) instead of executing raw database `DELETE`. | `[ ]` |
| <a id="BE-US-PROD-01-003"></a>`BE-US-PROD-01-003` | **US-PROD-01** | Build `POST /api/products` endpoint verifying that the assigned `category_id` exists and is not soft-deleted. | `[ ]` |
