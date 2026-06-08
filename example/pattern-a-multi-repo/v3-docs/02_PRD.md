# Product Requirements Document (PRD) - Product Catalog Service
**Version:** 1.0 (Stable Milestone)
**Project Version:** 1.0

## 1. Introduction & Product Goals
The Product Catalog Service provides hierarchical classification (Categories) and catalog master details (Products) for the modular ERP platform. Its primary goal is to ensure highly structured product classification and valid SKU records for downstream inventory and checkout processes.

## 2. Functional Requirements
* **FR-CAT-01: Hierarchical Categorization** - The system must allow users to organize categories in parent-child hierarchies up to 3 levels deep.
* **FR-CAT-02: Slug Auto-generation** - Slugs must be automatically generated from category names if not provided, sanitized (lowercase, dashes), and unique.
* **FR-CAT-03: Soft-Deletion** - Deleting a category must mark it as soft-deleted (setting a timestamp) to prevent new product assignments without breaking historical orders.
* **FR-PROD-01: Product SKU Validation** - The system must enforce unique SKUs matching the uppercase format `^[A-Z0-9-]{3,20}$`.
* **FR-PROD-02: Pricing Constraints** - The system must validate that the product price is a positive decimal strictly greater than zero.

## 3. Product Capabilities & Scope
* **In-Scope:**
  * Categorization CRUD with recursive subcategory relations.
  * Product CRUD with unique SKU validation and active category checks.
  * Auto-slug generation for clean routing lookups.
* **Out-of-Scope:**
  * Catalog search indexes (e.g. Elasticsearch).
  * Inventory stock tracking, pricing currencies, and sales tax calculations.

## 4. User Journeys & Process Flows
1. **Category Hierarchy Creation:** Merchandiser creates a root category (e.g. `Electronics`), then creates a subcategory (`Computers`) setting `parent_category_id` to the ID of `Electronics`.
2. **Product Onboarding:** Merchandiser registers a product (e.g. name: `ThinkPad X1`, SKU: `LEN-TP-X1`, price: `1200.00`) and selects `Computers` category. If the category is soft-deleted, onboarding is blocked.

## 5. UI/UX Figma & Wireframe References
* **Figma Project Link:** `Not Provided`
* **Wireframe / Prototype References:** `Not Provided`
* **Design Guidelines:** Conforms to enterprise design standard patterns using clear classification dropdowns and active validation status indicators.
