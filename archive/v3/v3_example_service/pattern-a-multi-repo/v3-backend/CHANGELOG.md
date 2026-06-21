# Service Changelog - product-catalog-backend Codebase

All notable technical changes, optimizations, and bug fixes implemented in the **product-catalog-backend** codebase are recorded here.

This repository tracks codebase changes via **Service Versions (`MAJOR.MINOR.PATCH`)**.

---

## [1.0.0] - 2026-06-01
### Added
* **Technical implementation support for Category Management (US-CAT-01):**
  * <a id="BE-US-CAT-01-001"></a>Created Prisma model `Category` with unique index on `slug` and optional `parent_category_id` self-relation (`BE-US-CAT-01-001`).
  * <a id="BE-US-CAT-01-002"></a>Implemented NestJS DTO validation checking that `name` is non-empty and `slug` conforms to slug format rules (`BE-US-CAT-01-002`).
  * <a id="BE-US-CAT-01-003"></a>Built `POST /api/categories` endpoint returning standard `201 Created` and checking for slug uniqueness (`BE-US-CAT-01-003`).
* **Technical implementation support for Product Management (US-PROD-01):**
  * <a id="BE-US-PROD-01-001"></a>Created Prisma model `Product` with unique constraint on uppercase `sku` and foreign key connection to `Category` (`BE-US-PROD-01-001`).
  * <a id="BE-US-PROD-01-002"></a>Implemented custom validator class checking that `base_price` is a valid positive decimal strictly greater than `0` (`BE-US-PROD-01-002`).
