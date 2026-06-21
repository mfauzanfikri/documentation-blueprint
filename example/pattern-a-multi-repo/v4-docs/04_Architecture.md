# Technical Architecture - Product Catalog Service
**Version:** 1.0 (Stable Milestone)
**Product Version:** 1.0

## 1. System Context & Boundaries
The Product Catalog Service is a central microservice (Pattern A) interacting with merchandiser frontends and e-commerce clients. It owns category and product schemas and publishes core catalogue data.

## 2. Component Diagram
```mermaid
graph TD
    A[Merchandiser UI] -->|REST API| B[Product Catalog Service]
    B -->|Prisma ORM| C[(PostgreSQL Database)]
    D[Downstream API Clients] -->|Read-only Queries| B
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

## 4. Sequence Diagrams & Integration Flows
This diagram traces the flow for creating a new product, enforcing category checks and SKU uniqueness constraints:

```mermaid
sequenceDiagram
    participant UI as Client UI
    participant Service as Product Catalog Service
    participant DB as PostgreSQL Database

    UI->>Service: POST /api/products (name, sku, price, category_id)
    Service->>DB: Query Category by category_id
    DB-->>Service: Category found (deleted_at is null)

    Service->>DB: Query Product by SKU
    DB-->>Service: No matching product found (SKU unique)

    Service->>DB: Insert Product
    DB-->>Service: Product inserted (id, created_at)

    Service-->>UI: 201 Created (Product Details JSON)
```

## 5. Technical Constraints & Design Choices
* **Database & ORM:** PostgreSQL is used with Prisma ORM. Prisma models enforce relational integrity.
* **Input Validation:** Enforced at the route-layer using NestJS DTO class-validators.
* **Deletion Policy:** Deleting a category sets the `deleted_at` timestamp. Historical associations are preserved; new creations are blocked.
