# Execution Boundary Changelog - product-catalog-backend

All notable technical changes, optimizations, and bug fixes implemented in the **product-catalog-backend** boundary are recorded here.
This deployable boundary tracks changes via **Boundary Versions (SemVer)**.

---

## [1.0.0] - 2026-06-01

### Compatibility Declaration
* **Compatible Product Versions:** `1.0`

### Released Verification Criteria
* **Technical implementation support for Category Management (US-CAT-01):**
  * <a id="BE-US-CAT-01-001"></a>**[BE-US-CAT-01-001]** (Story: US-CAT-01, role: requirement_owner) Illustrates a released criterion for Prisma model Category with unique index on slug and optional parent_category_id self-relation (evidence: documentation-example; commit: eb00ef5).
  * <a id="BE-US-CAT-01-002"></a>**[BE-US-CAT-01-002]** (Story: US-CAT-01, role: requirement_owner) Illustrates a released criterion for NestJS DTO validation checking that name is non-empty and slug conforms to slug format rules (evidence: documentation-example; commit: eb00ef5).
  * <a id="BE-US-CAT-01-003"></a>**[BE-US-CAT-01-003]** (Story: US-CAT-01, role: requirement_owner) Illustrates a released criterion for POST /api/categories endpoint returning standard 201 Created and checking for slug uniqueness (evidence: documentation-example; commit: eb00ef5).
* **Technical implementation support for Product Management (US-PROD-01):**
  * <a id="BE-US-PROD-01-001"></a>**[BE-US-PROD-01-001]** (Story: US-PROD-01, role: requirement_owner) Illustrates a released criterion for Prisma model Product with unique constraint on uppercase sku and foreign key connection to Category (evidence: documentation-example; commit: eb00ef5).
  * <a id="BE-US-PROD-01-002"></a>**[BE-US-PROD-01-002]** (Story: US-PROD-01, role: requirement_owner) Illustrates a released criterion for custom validator class checking that base_price is a valid positive decimal strictly greater than 0 (evidence: documentation-example; commit: eb00ef5).

### Added
* Initial backend service release.
