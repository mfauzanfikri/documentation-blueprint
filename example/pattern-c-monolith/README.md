# product-catalog-monolith

## 1. Overview & Purpose

This is the monolith codebase boundary for the Product Catalog Service (Pattern C layout). Its responsibility is to manage the full product catalog lifecycle — including category hierarchies, product master records, and the merchandiser-facing UI — within a single deployable application.

## 2. Technology Stack Mapping

| Layer | Technology | Purpose |
| :--- | :--- | :--- |
| Language | TypeScript | Type-safe full-stack development |
| Framework | NestJS | REST API engine and application structure |
| UI Layer | React | Merchandiser dashboard and form components |
| Styling | Tailwind CSS | Utility-first responsive styling |
| Database / ORM | Prisma / PostgreSQL | Object-Relational Mapping and data persistence |
| Validation | class-validator / Zod | DTO and client-side form validation |

## 3. Setup & Development Instructions

### Prerequisites

| Requirement | Minimum Version |
| :--- | :--- |
| Node.js | v18 or higher |
| PostgreSQL | Active local or remote instance |

### Quickstart Commands

```bash
# Install dependencies
npm install

# Apply Prisma database migrations and start local dev server
npm run dev

# Run all monolith test suites
npm test
```

## 4. Documentation References

| Document | Path |
| :--- | :--- |
| Documentation Blueprint | [00_Documentation_Blueprint.md](./docs/00_Documentation_Blueprint.md) |
| Business Requirements (BRD) | [01_BRD.md](./docs/01_BRD.md) |
| Product Requirements (PRD) | [02_PRD.md](./docs/02_PRD.md) |
| User Stories | [03_User_Stories.md](./docs/03_User_Stories.md) |
| Technical Architecture | [04_Architecture.md](./docs/04_Architecture.md) |
| Requirement Mapping | [05_Requirement_Mapping.md](./docs/05_Requirement_Mapping.md) |
| Decision Log | [06_Decision_Log.md](./docs/06_Decision_Log.md) |
| Project Context Example | [PROJECT_CONTEXT.example.md](./docs/PROJECT_CONTEXT.example.md) |
