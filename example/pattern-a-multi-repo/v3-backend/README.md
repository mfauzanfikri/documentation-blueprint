# product-catalog-backend

## 1. Overview & Purpose
This is the backend service codebase boundary for the Product Catalog Service. Its primary responsibility is managing categories and standard products master database records.

## 2. Technology Stack Mapping
| Layer | Technology | Purpose |
| :--- | :--- | :--- |
| Language | TypeScript | Type-safe backend application development |
| Framework | NestJS | Node.js enterprise microservice engine |
| Database / ORM | Prisma / PostgreSQL | Object-Relational Mapping and persistence |

## 3. Setup & Development Instructions
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

## 4. Documentation References
* **Documentation Blueprint:** [00_Documentation_Blueprint.md](../v3-docs/00_Documentation_Blueprint.md)
* **Product Requirements (PRD):** [02_PRD.md](../v3-docs/02_PRD.md)
* **Technical Architecture:** [04_Architecture.md](../v3-docs/04_Architecture.md)
* **Requirement Mapping:** [05_Requirement_Mapping.md](../v3-docs/05_Requirement_Mapping.md)
* **Project Context Example:** [PROJECT_CONTEXT.example.md](../v3-docs/PROJECT_CONTEXT.example.md)
