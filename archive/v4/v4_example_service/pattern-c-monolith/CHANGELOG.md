# Execution Boundary Changelog - Product Catalog Monolith

All notable technical changes, optimizations, and bug fixes implemented in the **product-catalog-monolith** boundary are recorded here.

This deployable boundary tracks changes via **Boundary Versions**.

---

## [1.0.0] - 2026-06-01
### Added
* **Technical implementation support for Category Management (US-CAT-01):**
  * <a id="ML-US-CAT-01-001"></a>Created Prisma model `Category` with unique index on `slug` and optional `parent_category_id` self-relation (`ML-US-CAT-01-001`).
  * <a id="ML-US-CAT-01-002"></a>Implemented NestJS DTO validation checking that `name` is non-empty and `slug` conforms to slug format rules (`ML-US-CAT-01-002`).
  * <a id="ML-US-CAT-01-003"></a>Built `POST /api/categories` endpoint returning standard `201 Created` and checking for slug uniqueness (`ML-US-CAT-01-003`).
  * <a id="ML-US-CAT-01-005"></a>Defined TypeScript interfaces `Category` and `CreateCategoryInput` representing catalog data structures (`ML-US-CAT-01-005`).
  * <a id="ML-US-CAT-01-007"></a>Built a "New Category" React modal form using React Hook Form and Zod to validate name/slug constraints (`ML-US-CAT-01-007`).
* **Technical implementation support for Product Management (US-PROD-01):**
  * <a id="ML-US-PROD-01-001"></a>Created Prisma model `Product` with unique constraint on uppercase `sku` and foreign key connection to `Category` (`ML-US-PROD-01-001`).
  * <a id="ML-US-PROD-01-002"></a>Implemented custom validator class checking that `base_price` is a valid positive decimal strictly greater than `0` (`ML-US-PROD-01-002`).
  * <a id="ML-US-PROD-01-004"></a>Designed the product list table displaying SKU, Name, Base Price, and Category status badges (`ML-US-PROD-01-004`).
  * <a id="ML-US-PROD-01-006"></a>Added client-side validation logic forcing users to enter a numeric value > 0 for `base_price` before form submission (`ML-US-PROD-01-006`).
