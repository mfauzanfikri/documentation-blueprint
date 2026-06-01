# Blueprint: Decoupled Specs & Distributed Roadmaps Documentation Approach
**Version:** 1.0

This document outlines the standard architecture and workflow for documentation, specification versioning, and feature tracking in this modular ERP project. Replicate this exact blueprint for all future services.

---

## 1. The Core Philosophy

* **The Blueprint (Centralized & Fixed)**: Business rules, user stories, mappings, and system architecture diagrams represent the stable specifications of *what* needs to be built. These live centrally in a dedicated documentation space.
* **The Execution (Distributed & Local)**: Practical technical roadmaps and status checklists live directly inside the repositories that *own the code* (Frontend vs. Backend), tracking *how* it gets built.

---

## 2. Directory & Repository Structure

When creating a new service (e.g., `my-service`), organize the workspace directory as follows:

```text
my-service/
├── my-service-docs/       # 📄 Repository A: Centralized High-Level Specs
│   ├── 00_Documentation_Blueprint.md # This blueprint guide
│   ├── 01_BRD.md          # Business goals, objectives, and scope boundaries
│   ├── 02_User_Stories.md # Functional requirements mapped to Story IDs (e.g., US-CAT-01)
│   ├── 03_Diagrams.md     # Mermaid.js ERD (data models) & System Flowcharts
│   └── 04_Requirement_Mapping.md # Traceability matrix linking BRD and Stories
│
├── my-service-backend/    # 💻 Repository B: Backend Codebase
│   └── ROADMAP.md         # Active backend-specific technical tracking table
│
└── my-service-frontend/   # 🎨 Repository C: Frontend Codebase
    └── ROADMAP.md         # Active frontend-specific technical tracking table
```

---

## 3. Reimplementation Guide (Step-by-Step)

### Step 1: Write the Specifications (in `docs` repo)
1. **Business Requirements Document (BRD)**: Outline the system context, define what is explicitly *in-scope* versus *out-of-scope*, and list core business entities.
2. **User Stories**: Group them by feature module (e.g., `US-CAT-01` for Categories, `US-PROD-01` for Products). Write them using standard *As a... I want to... So that...* structures with explicit **Acceptance Criteria**.
3. **Mermaid.js Diagrams**: Model your database in a Mermaid `erDiagram`, and your business process flows in a Mermaid `flowchart TD`. 
4. **Requirement Mapping**: Create a matrix connecting BRD requirements to User Stories and entities to ensure 100% coverage.
5. **Tag Specs**: Tag this documentation state as a stable milestone release (e.g., `v1.0`).

### Step 2: Generate the Local Roadmaps (as Tables)
Extract backend-specific and frontend-specific technical criteria from the user stories and place them in structured markdown tables inside each respective code repo:

* **Backend `ROADMAP.md` Focus**: Prisma/Database schemas, unique key constraints, backend DTO validations, service-layer checks, repository pattern logic, and API endpoints.
* **Frontend `ROADMAP.md` Focus**: Page views, TypeScript interfaces/types, React hooks/state, UI modals, forms, client-side input validations, visual status badges, and dashboard components.

*Table Syntax Example:*
```markdown
| User Story ID | Technical Verification Criteria | Status |
| :--- | :--- | :--- |
| **US-XXX-01** | Technical criterion description here | [ ] |
```

### Step 3: Develop & Sync (The AI/Developer Loop)
When you or an AI agent builds a feature:
1. **Implement the Code**: Write the code and tests within the service directory (e.g., `my-service-backend`).
2. **Update the Roadmap**: Change the status of completed items from `[ ]` to `[x]` in that service's local `ROADMAP.md`.
3. **Commit Atomic-ly**: Commit the code changes *and* the updated `ROADMAP.md` together in a single commit:
   ```bash
   git add .
   git commit -m "feat(category): add schema & update local roadmap"
   ```

---

## 4. Why this is Optimized for AI-Driven Development
1. **Context Efficiency**: The agent doesn't get overwhelmed with a giant monorepo-wide tracking checklist. When tasked with a backend ticket, it only reads the backend `ROADMAP.md`, focusing 100% on API and database requirements.
2. **Frictionless Sync**: Because the roadmap is located inside the same folder as the code, the agent can write the feature and check off the item in one single step without committing across multiple repositories.
3. **Self-Documenting Progress**: The AI agent naturally updates the documentation as it implements the code, eliminating human documentation neglect.
