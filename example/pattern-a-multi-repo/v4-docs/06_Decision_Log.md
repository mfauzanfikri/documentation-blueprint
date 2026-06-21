# Architectural & Product Decisions - Product Catalog Service

## [ADR-001] Soft-delete Strategy for Category Entities
* **Status:** Approved
* **Date:** 2026-06-01
* **Author:** Lead Product Architect

### Context & Problem Statement
When a merchandiser deletes a category (e.g. `Electronics`), immediate database hard-deletion (`DELETE`) cascades and breaks downstream product relations, historical financial transactions, and invoice records referring to that category. We need a delete strategy that prevents downstream reference breaks while blocking new product assignments.

### Options Considered
* **Option 1: Cascading Hard-Delete**
  * Immediate cascade deletion of categories and related products.
* **Option 2: Restrict Deletion**
  * Prevent deletion if products are assigned. Merchandiser must manually remove all products first.
* **Option 3: Soft-Deletion**
  * Set a `deleted_at` timestamp. Keep the record in the database but filter out from active queries and form options.

### Pros and Cons of Options
* **Option 1 (Cascading Hard-Delete):**
  * (+) Keeps database size small.
  * (-) Breaks historical order items and statistics. Severe data integrity loss.
* **Option 2 (Restrict Deletion):**
  * (+) Safe database state.
  * (-) Bad user experience for merchandisers who have large inventories to clean up manually.
* **Option 3 (Soft-Deletion):**
  * (+) Absolute historical data safety. No downstream breaks.
  * (-) Database table size grows. Queries must explicitly filter out soft-deleted records.

### Decision Outcome
* **Chosen Option:** Option 3 (Soft-Deletion)
* **Justification:** Preserves perfect audit logs and historical order links. We will implement database filter hooks in Prisma/NestJS to automatically exclude categories where `deleted_at` is set, and block new product assignments to these categories.
* **Trade-offs:** We accept slightly increased storage requirements and must ensure index lookups are performant on active records.
