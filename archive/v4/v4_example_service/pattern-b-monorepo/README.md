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
| Blueprint Version | 4 |
| Release Status | Stable Example |
| Owner / Maintainer | Product Catalog Platform Team |
| Compatibility Status | Not applicable |
| Compatibility Notes | Root workspace files coordinate cross-cutting work only; deployable compatibility is declared by deployable execution boundaries. |

## 📁 Repository Structure

| Path | Boundary | Description |
| :--- | :--- | :--- |
| `docs/` | Specification | Business requirements, product specs, architecture, and decision logs |
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
| Documentation Blueprint | [00_Documentation_Blueprint.md](./docs/00_Documentation_Blueprint.md) |
| Business Requirements (BRD) | [01_BRD.md](./docs/01_BRD.md) |
| Product Requirements (PRD) | [02_PRD.md](./docs/02_PRD.md) |
| User Stories | [03_User_Stories.md](./docs/03_User_Stories.md) |
| Technical Architecture | [04_Architecture.md](./docs/04_Architecture.md) |
| Requirement Mapping | [05_Requirement_Mapping.md](./docs/05_Requirement_Mapping.md) |
| Decision Log | [06_Decision_Log.md](./docs/06_Decision_Log.md) |
| Project Context Example | [PROJECT_CONTEXT.example.md](./docs/PROJECT_CONTEXT.example.md) |
