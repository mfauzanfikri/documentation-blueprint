# Diagrams - Product Catalog Service
**Version:** 1.0 (Stable Milestone)

This document visualizes the database models and logical control flows for the Product Catalog Service.

---

## 1. Database Entity-Relationship Diagram (ERD)

The following diagram defines the relational data schema. A category can have a self-referencing relationship (subcategories) and a one-to-many relationship with products.

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

---

## 2. Product Creation Workflow

This flowchart maps the logical steps required during product creation, including boundary condition and category state checks.

```mermaid
flowchart TD
    Start([Client Request: Create Product]) --> ValidateInputs{Validate inputs:<br/>SKU, Name, Price}
    
    ValidateInputs -- Invalid --> ErrInputs[Return 400 Bad Request]
    ValidateInputs -- Valid --> CheckCategory{Does Category Exist<br/>and Active?}
    
    CheckCategory -- No/Soft-deleted --> ErrCategory[Return 422 Unprocessable Entity]
    CheckCategory -- Yes --> CheckSKU{Is SKU Unique?}
    
    CheckSKU -- Duplicate --> ErrSKU[Return 409 Conflict]
    CheckSKU -- Unique --> CreateDB[Insert Product into Database]
    
    CreateDB --> Success([Return 201 Created])
```
