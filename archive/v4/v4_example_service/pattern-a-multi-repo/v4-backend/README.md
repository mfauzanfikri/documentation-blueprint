# product-catalog-backend

## 1. Boundary Metadata
| Field | Value |
| :--- | :--- |
| Boundary Name | product-catalog-backend |
| Boundary Type | service |
| Deployable | true |
| Boundary Version | 1.0.0 |
| Compatible Product Versions | 1.0 |
| Blueprint Version | 4 |
| Release Status | Stable Example |
| Owner / Maintainer | Product Catalog Platform Team |
| Compatibility Status | compatible |
| Compatibility Notes | Example boundary compatible with Product Version 1.0. |

## 2. Overview & Purpose
This is the backend execution boundary for the Product Catalog Service. Its primary responsibility is managing categories and standard products master database records.

## 3. Technology Stack Mapping
| Layer | Technology | Purpose |
| :--- | :--- | :--- |
| Language | TypeScript | Type-safe backend application development |
| Framework | NestJS | Node.js enterprise microservice engine |
| Database / ORM | Prisma / PostgreSQL | Object-Relational Mapping and persistence |

## 4. Setup & Development Instructions
### Prerequisites
* Node.js v18 or higher
* Running instance of PostgreSQL database

### Quickstart Commands
```bash
# Install dependencies
npm install

# Apply Prisma database migrations
npx prisma migrate dev

# Start local server
npm run dev

# Run unit tests
npm test
```

## 5. Documentation References
* **Documentation Blueprint:** [00_Documentation_Blueprint.md](../v4-docs/00_Documentation_Blueprint.md)
* **Product Requirements (PRD):** [02_PRD.md](../v4-docs/02_PRD.md)
* **Technical Architecture:** [04_Architecture.md](../v4-docs/04_Architecture.md)
* **Requirement Mapping:** [05_Requirement_Mapping.md](../v4-docs/05_Requirement_Mapping.md)
* **Project Context Example:** [PROJECT_CONTEXT.example.md](../v4-docs/PROJECT_CONTEXT.example.md)
