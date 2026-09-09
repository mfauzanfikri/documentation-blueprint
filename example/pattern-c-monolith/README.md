# product-catalog-monolith

## 1. Boundary Metadata

| Field | Value |
| :--- | :--- |
| Boundary Name | product-catalog-monolith |
| Boundary Type | monolith |
| Deployable | true |
| Boundary Version | 1.0.0 |
| Compatible Product Versions | 1.0 |
| Blueprint Version | 5 |
| Release Status | Stable Example |
| Owner / Maintainer | Product Catalog Platform Team |
| Compatibility Status | compatible |
| Compatibility Notes | Example boundary compatible with Product Version 1.0 under Collapsed MVP Mode. |

## 2. Overview & Purpose

This is the monolith execution boundary for the Product Catalog Service (Pattern C layout). Its responsibility is to manage the full product catalog lifecycle — including category hierarchies, product master records, and the merchandiser-facing UI — within a single deployable application.

Under **Collapsed MVP Mode**, the project does not maintain an intermediate `04_MVP.md` file; the Functional Requirements Document (`05_FRD.md`) directly scopes features from the Feature Catalogue for Product Version 1.0.

## 3. Technology Stack Mapping

| Layer | Technology | Purpose |
| :--- | :--- | :--- |
| Language | TypeScript | Type-safe full-stack development |
| Framework | NestJS | REST API engine and application structure |
| UI Layer | React | Merchandiser dashboard and form components |
| Styling | Tailwind CSS | Utility-first responsive styling |
| Database / ORM | Prisma / PostgreSQL | Object-Relational Mapping and data persistence |
| Validation | class-validator / Zod | DTO and client-side form validation |

## 4. Setup & Development Instructions

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

## 5. Documentation References

| Document | Path |
| :--- | :--- |
| Documentation Map | [METADATA.md](./METADATA.md) |
| Documentation Blueprint | [00_Documentation_Blueprint.md](./docs/00_Documentation_Blueprint.md) |
| Business Requirements (BRD) | [01_BRD.md](./docs/01_BRD.md) |
| Product Requirements (PRD) | [02_PRD.md](./docs/02_PRD.md) |
| Feature Catalogue | [03_Feature_Catalogue.md](./docs/03_Feature_Catalogue.md) |
| Functional Requirements (FRD) | [05_FRD.md](./docs/05_FRD.md) |
| User Stories | [06_User_Stories.md](./docs/06_User_Stories.md) |
| Technical Architecture | [07_Architecture.md](./docs/07_Architecture.md) |
| Technical Standards | [08_Technical_Standards.md](./docs/08_Technical_Standards.md) |
| Decision Log | [09_Decision_Log.md](./docs/09_Decision_Log.md) |
| Project Context Example | [PROJECT_CONTEXT.example.md](./docs/PROJECT_CONTEXT.example.md) |
