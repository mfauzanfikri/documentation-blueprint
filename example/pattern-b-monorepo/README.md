# Product Catalog Monorepo

Welcome to the central monorepo for the Product Catalog Service ecosystem (Pattern B layout).

## 📁 Repository Structure
* **`docs/`**: Specification Boundary housing business goals, functional requirements, and architecture schemas.
* **`apps/backend/`**: Node.js/NestJS service codebase and database migrations.
* **`apps/frontend/`**: React/Tailwind merchandiser dashboard codebase.

## ⚡ Global Dev Setup
To set up all applications in this workspace:
```bash
# Install root and workspace dependencies
npm install

# Build all applications
npm run build

# Start global dev environment
npm run dev
```

## 🧭 Central Specs Navigation
* **Master Documentation Blueprint:** [00_Documentation_Blueprint.md](./docs/00_Documentation_Blueprint.md)
* **Business Requirements (BRD):** [01_BRD.md](./docs/01_BRD.md)
* **Product Requirements (PRD):** [02_PRD.md](./docs/02_PRD.md)
* **Technical Architecture:** [04_Architecture.md](./docs/04_Architecture.md)
