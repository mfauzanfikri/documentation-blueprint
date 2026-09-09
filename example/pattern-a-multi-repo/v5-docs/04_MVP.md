# MVP Increment Scope - MVP-001: Core Catalog Foundation

**MVP ID:** MVP-001
**Product Version:** 1.0
**Target Delivery Date:** 2026-06-01
**Status:** In Progress
**Corresponding FRD:** [05_FRD.md](./05_FRD.md)

---

## 1. Increment Goal
Deliver the baseline category taxonomy and product master data management APIs and merchandiser UI to enable initial catalog configuration before opening sales channels.

## 2. Scoped Features (Feature Major Versions)

| Feature ID | Feature Major Version | Feature Name | Scope Description |
| :--- | :--- | :--- | :--- |
| **F-001** | v1 | Category Hierarchy Management | Self-referencing subcategories up to 3 levels deep, auto-slugging, and soft-deletion. |
| **F-002** | v1 | Product Master Management | Product creation, SKU uppercase pattern assertion, positive pricing, and active category checks. |

## 3. Release Milestones & Dependencies
* **Milestone 1:** Core NestJS REST APIs and Prisma schema with migration validations.
* **Milestone 2:** React Merchandiser UI forms with real-time validation feedback and end-to-end integration.
