# Backend Roadmap - Product Catalog Service

**Boundary:** `product-catalog-backend`
**Status:** active Execution Plan

This active roadmap tracks future-oriented backend implementation tasks and verification criteria. Completed tasks are documented in the codebase `CHANGELOG.md`.

---

## Active & Planned Implementation Tasks

| Verification Criteria ID | User Story ID | Boundary Role | Product Version | MVP ID | Task Description | Status |
| :--- | :--- | :--- | :--- | :--- | :--- | :--- |
| <a id="BE-US-CAT-01-004"></a>`BE-US-CAT-01-004` | `US-CAT-01` | requirement_owner | 1.0 | MVP-001 | Implement soft-deletion service logic (setting `deleted_at` timestamp) instead of executing raw database `DELETE`. | planned |
| <a id="BE-US-PROD-01-003"></a>`BE-US-PROD-01-003` | `US-PROD-01` | requirement_owner | 1.0 | MVP-001 | Build `POST /api/products` endpoint verifying that the assigned `category_id` exists and is not soft-deleted. | planned |
