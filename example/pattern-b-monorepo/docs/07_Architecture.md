---
document_id: ARCHITECTURE
document_type: architecture
document_version: "1.0"
blueprint_version: 5
product_id: PROD-CATALOG
product_version: "1.0"
status: approved
scope:
  kind: product
  id: PROD-CATALOG
authority: technical_design
owner: Systems Architecture
last_updated: "2026-09-09"
---
# Technical Architecture - Product Catalog Service

**Product Version:** 1.0
**Status:** approved

## 1. System Context & Execution Boundaries

The Product Catalog Service is an execution ecosystem (Pattern B Monorepo) comprising a NestJS backend REST service and a React merchandiser frontend, persisting to PostgreSQL.

| Execution Boundary | Boundary Type | Deployable | Primary Responsibility |
| :--- | :--- | :--- | :--- |
| `product-catalog-backend` | service | true | REST APIs, DTO validation, and Prisma database persistence |
| `product-catalog-frontend` | application | true | React merchandiser UI and catalog administration dashboards |

## 2. Component Diagram

```mermaid
graph TD
    Merchandiser([Merchandiser Actor]) --> Frontend[apps/frontend: React SPA]
    DownstreamClient([Downstream Client]) --> Backend[apps/backend: NestJS API]
    Frontend -->|HTTPS REST| Backend
    Backend -->|Prisma ORM| Database[(PostgreSQL Database)]
```

## 3. Entity Relationship Diagram (ERD)

The database schema consists of a self-referencing `Category` table and a `Product` table connected by a one-to-many relationship:

```mermaid
erDiagram
    Category {
        uuid id PK
        string name
        string slug UK
        uuid parent_category_id FK
        datetime created_at
        datetime deleted_at
    }

    Product {
        uuid id PK
        string sku UK
        string name
        decimal base_price
        uuid category_id FK
        datetime created_at
        datetime updated_at
    }

    Category ||--o{ Category : "has subcategories"
    Category ||--o{ Product : "contains"
```

## 4. Integration Sequence Diagrams

Traces the flow for creating a new product, enforcing category checks and SKU uniqueness constraints:

```mermaid
sequenceDiagram
    participant UI as apps/frontend (React)
    participant Service as apps/backend (NestJS)
    participant DB as PostgreSQL Database

    UI->>Service: POST /api/products (name, sku, base_price, category_id)
    Service->>DB: Query Category by category_id
    DB-->>Service: Category found (deleted_at is null)

    Service->>DB: Query Product by SKU
    DB-->>Service: No matching product found (SKU unique)

    Service->>DB: Insert Product
    DB-->>Service: Product inserted (id, created_at)

    Service-->>UI: 201 Created (Product Details JSON)
```

## 5. Technical Constraints & Design Choices
* **Persistence Strategy:** PostgreSQL 16 managed via Prisma ORM schema migrations.
* **Soft-Deletion:** Managed through indexed nullable `deleted_at` timestamps on `Category`.
