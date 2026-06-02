# Product Catalog Monorepo

Welcome to the central monorepo for the Product Catalog Service ecosystem (Pattern B layout).

## 📁 Repository Structure

| Path | Boundary | Description |
| :--- | :--- | :--- |
| `docs/` | Specification | Business requirements, product specs, architecture, and decision logs |
| `apps/backend/` | Execution | Node.js/NestJS REST API and Prisma database migrations |
| `apps/frontend/` | Execution | React/Tailwind merchandiser dashboard |
| `CHANGELOG.md` | Execution (Root) | Optional platform-level execution history for cross-cutting changes |
| `ROADMAP.md` | Execution (Root) | Optional platform-level roadmap for workspace/CI/CD concerns |

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
