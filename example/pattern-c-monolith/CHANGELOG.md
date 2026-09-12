# Execution Boundary Changelog - Product Catalog Monolith

All notable technical changes, optimizations, and bug fixes implemented in the **product-catalog-monolith** boundary are recorded here.
This deployable boundary tracks changes via **Boundary Versions (SemVer)**.

---

## [1.0.0] - 2026-06-01

### Compatibility Declaration
* **Compatible Product Versions:** `1.0`

### Released Verification Criteria
* **Technical implementation support for Category Management (US-CAT-01):**
  * <a id="ML-US-CAT-01-001"></a>**[ML-US-CAT-01-001]** (Story: US-CAT-01, role: requirement_owner) Illustrates a released criterion for Prisma model Category with unique index on slug and optional parent_category_id self-relation (evidence: documentation-example; commit: eb00ef5).
  * <a id="ML-US-CAT-01-002"></a>**[ML-US-CAT-01-002]** (Story: US-CAT-01, role: requirement_owner) Illustrates a released criterion for NestJS DTO validation checking that name is non-empty and slug conforms to slug format rules (evidence: documentation-example; commit: eb00ef5).
  * <a id="ML-US-CAT-01-003"></a>**[ML-US-CAT-01-003]** (Story: US-CAT-01, role: requirement_owner) Illustrates a released criterion for POST /api/categories endpoint returning standard 201 Created and checking for slug uniqueness (evidence: documentation-example; commit: eb00ef5).
  * <a id="ML-US-CAT-01-005"></a>**[ML-US-CAT-01-005]** (Story: US-CAT-01, role: requirement_owner) Illustrates a released criterion for TypeScript interfaces Category and CreateCategoryInput representing catalog data structures (evidence: documentation-example; commit: eb00ef5).
  * <a id="ML-US-CAT-01-007"></a>**[ML-US-CAT-01-007]** (Story: US-CAT-01, role: requirement_owner) Illustrates a released criterion for New Category React modal form using React Hook Form and Zod to validate name/slug constraints (evidence: documentation-example; commit: eb00ef5).
* **Technical implementation support for Product Management (US-PROD-01):**
  * <a id="ML-US-PROD-01-001"></a>**[ML-US-PROD-01-001]** (Story: US-PROD-01, role: requirement_owner) Illustrates a released criterion for Prisma model Product with unique constraint on uppercase sku and foreign key connection to Category (evidence: documentation-example; commit: eb00ef5).
  * <a id="ML-US-PROD-01-002"></a>**[ML-US-PROD-01-002]** (Story: US-PROD-01, role: requirement_owner) Illustrates a released criterion for custom validator class checking that base_price is a valid positive decimal strictly greater than 0 (evidence: documentation-example; commit: eb00ef5).
  * <a id="ML-US-PROD-01-004"></a>**[ML-US-PROD-01-004]** (Story: US-PROD-01, role: requirement_owner) Illustrates a released criterion for product list table displaying SKU, Name, Base Price, and Category status badges (evidence: documentation-example; commit: eb00ef5).
  * <a id="ML-US-PROD-01-006"></a>**[ML-US-PROD-01-006]** (Story: US-PROD-01, role: requirement_owner) Illustrates a released criterion for client-side validation logic forcing users to enter a numeric value > 0 for base_price before form submission (evidence: documentation-example; commit: eb00ef5).

### Added
* Initial deployable monolith release.
