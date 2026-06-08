# Service Changelog - product-catalog-frontend Codebase

All notable technical changes, optimizations, and bug fixes implemented in the **product-catalog-frontend** codebase are recorded here.

This repository tracks codebase changes via **Service Versions (`MAJOR.MINOR.PATCH`)**.

---

## [1.0.0] - 2026-06-01
### Added
* **Technical implementation support for Category UI Components (US-CAT-01):**
  * <a id="FE-US-CAT-01-001"></a>Defined TypeScript interfaces `Category` and `CreateCategoryInput` representing catalog data structures (`FE-US-CAT-01-001`).
  * <a id="FE-US-CAT-01-003"></a>Built a "New Category" React modal form using React Hook Form and Zod to validate name/slug constraints (`FE-US-CAT-01-003`).
* **Technical implementation support for Product UI Components (US-PROD-01):**
  * <a id="FE-US-PROD-01-001"></a>Designed the product list table displaying SKU, Name, Base Price, and Category status badges (`FE-US-PROD-01-001`).
  * <a id="FE-US-PROD-01-003"></a>Added client-side validation logic forcing users to enter a numeric value > 0 for `base_price` before form submission (`FE-US-PROD-01-003`).
