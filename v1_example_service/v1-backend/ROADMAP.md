# Backend Roadmap - Product Catalog Service
**Repository:** `product-catalog-backend`
**Latest Specifications Milestone:** `v1.0`

This active roadmap maps high-level user stories to backend implementation criteria.

| User Story ID | Technical Verification Criteria | Status |
| :--- | :--- | :--- |
| **US-CAT-01** | Create Prisma model `Category` with unique index on `slug` and optional `parent_category_id` self-relation. | `[x]` |
| **US-CAT-01** | Implement NestJS DTO validation checking that `name` is non-empty and `slug` conforms to slug format rules. | `[x]` |
| **US-CAT-01** | Build `POST /api/categories` endpoint returning standard `201 Created` and checking for slug uniqueness. | `[x]` |
| **US-CAT-01** | Implement soft-deletion service logic (setting `deleted_at` timestamp) instead of executing raw database `DELETE`. | `[ ]` |
| **US-PROD-01** | Create Prisma model `Product` with unique constraint on uppercase `sku` and foreign key connection to `Category`. | `[x]` |
| **US-PROD-01** | Write custom validator class checking that `base_price` is a valid positive decimal strictly greater than `0`. | `[x]` |
| **US-PROD-01** | Build `POST /api/products` endpoint verifying that the assigned `category_id` exists and is not soft-deleted. | `[ ]` |
