---
document_id: PRD-001
document_type: prd
document_version: "1.0"
blueprint_version: 5
product_id: PROD-CATALOG-MONOLITH
product_version: "1.0"
status: approved
scope:
  kind: product
  id: PROD-CATALOG-MONOLITH
authority: product
owner: Product Management
last_updated: "2026-09-09"
---
# Product Requirements Document (PRD) - Product Catalog Service
**Version:** 1.0 (Stable Milestone)
**Product Version:** 1.0

## 1. Introduction & Product Goals
The Product Catalog Service provides hierarchical classification (Categories) and catalog master details (Products) for the modular ERP platform. Its primary goal is to ensure highly structured product classification and valid SKU records for downstream inventory and checkout processes.

## 2. Product Capabilities Overview

| Capability ID | Capability Name | Description | Related BRD Objective |
| :--- | :--- | :--- | :--- |
| **PC-01** | Hierarchical Categorization | Enable nested category organization and taxonomy management up to 3 levels deep with clean URI slugging. | BO-02 |
| **PC-02** | Product Master Lifecycle | Ensure authoritative SKU registration, positive decimal pricing, and active category assignment. | BO-01 |

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
