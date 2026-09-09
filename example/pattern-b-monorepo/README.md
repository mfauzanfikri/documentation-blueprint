# Product Catalog Monorepo

Welcome to the central monorepo for the Product Catalog Service ecosystem (Pattern B layout).

## 1. Workspace Boundary Metadata

| Field | Value |
| :--- | :--- |
| Boundary Name | product-catalog-monorepo |
| Boundary Type | workspace |
| Deployable | false |
| Boundary Version | Not required |
| Compatible Product Versions | Not required |
| Blueprint Version | 5 |
| Release Status | Stable Example |
| Owner / Maintainer | Product Catalog Platform Team |
| Compatibility Status | Not applicable |
| Compatibility Notes | Root workspace files coordinate cross-cutting work only; deployable compatibility is declared by deployable execution boundaries. |

## 📁 Repository Structure

| Path | Boundary | Description |
| :--- | :--- | :--- |
| `METADATA.md` | Workspace Registry | Declarative documentation map and component version registry |
| `docs/` | Specification | Business requirements, product specs, feature catalogue, MVP, FRD, architecture, and standards |
| `apps/backend/` | Execution | Node.js/NestJS REST API and Prisma database migrations |
| `apps/frontend/` | Execution | React/Tailwind merchandiser dashboard |
| `CHANGELOG.md` | Execution Boundary (workspace, non-deployable) | Optional platform-level coordination history for cross-cutting changes |
| `ROADMAP.md` | Execution Boundary (workspace, non-deployable) | Optional platform-level roadmap for workspace/CI/CD concerns |

## 🧰 Workspace Technology Overview

| Package | Language | Framework | Database / ORM | Styling |
| :--- | :--- | :--- | :--- | :--- |
| `apps/backend` | TypeScript | NestJS | Prisma / PostgreSQL | — |
| `apps/frontend` | TypeScript | React | — | Tailwind CSS |

## ⚡ Global Dev Setup

```bash
# Install root and workspace dependencies
npm install

# Build all applications
npm run build

# Start global dev environment
npm run dev
```

## 🧭 Central Specs Navigation

| Document | Path |
| :--- | :--- |
| Documentation Map | [METADATA.md](./METADATA.md) |
| Documentation Blueprint | [00_Documentation_Blueprint.md](./docs/00_Documentation_Blueprint.md) |
| Business Requirements (BRD) | [01_BRD.md](./docs/01_BRD.md) |
| Product Requirements (PRD) | [02_PRD.md](./docs/02_PRD.md) |
| Feature Catalogue | [03_Feature_Catalogue.md](./docs/03_Feature_Catalogue.md) |
| MVP Increment Scope | [04_MVP.md](./docs/04_MVP.md) |
| Functional Requirements (FRD) | [05_FRD.md](./docs/05_FRD.md) |
| User Stories | [06_User_Stories.md](./docs/06_User_Stories.md) |
| Technical Architecture | [07_Architecture.md](./docs/07_Architecture.md) |
| Technical Standards | [08_Technical_Standards.md](./docs/08_Technical_Standards.md) |
| Decision Log | [09_Decision_Log.md](./docs/09_Decision_Log.md) |
| Project Context Example | [PROJECT_CONTEXT.example.md](./docs/PROJECT_CONTEXT.example.md) |
