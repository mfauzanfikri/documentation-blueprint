# Documentation Blueprint Templates Repository

Welcome to the centralized home of the **Decoupled Specs & Distributed Roadmaps** documentation framework. 

This repository serves as a **master template distributor**. It defines our organization's standards for specification versioning, technical tracking, and development workflows.

> [!NOTE]
> When starting a new service or upgrading an existing one, developers copy templates directly from this repository into their project codebases.

---

## 1. How this Repository Works

This repository contains the official, versioned documentation blueprints and examples. It is organized as follows:

* **[00_Documentation_Blueprint.md](./00_Documentation_Blueprint.md):** The master framework specification. This file defines the rules, folder structures, and developer workflows that all services must follow.
* **[CHANGELOG.md](./CHANGELOG.md):** The historical record of the blueprint framework's evolution (e.g., transitions from V1 to V2).
* **[v1_example_service/](./v1_example_service/):** A fully realized, functional simulation of a service (**Product Catalog Service**) implementing the Version 1.0 guidelines.

### Standard Workflow for New Projects
1. Create a `docs/` folder in your new service's repository.
2. Copy the active master blueprint (`00_Documentation_Blueprint.md`) from the root of this repository and paste it into your service's `docs/` folder as `00_Documentation_Blueprint.md`.
3. Create your service-specific specification skeleton files (e.g., `01_BRD.md`, `02_PRD.md`) using the guidelines defined in the blueprint.

---

## 2. General Blueprint Upgrade Strategy

When the central organization publishes a new major version of the Documentation Blueprint, services are expected to upgrade their local documentation folders to maintain standard compliance. 

Follow this generalized, timeless workflow to upgrade a project:

### Step 1: Identify What Changed
1. Open this repository's central **[CHANGELOG.md](./CHANGELOG.md)**.
2. Locate the difference between your project's current blueprint version and the new target version.
3. Review the **Added**, **Changed**, **Fixed**, and **Removed** sections to note any new mandatory files, renamed documents, or updated section criteria.

### Step 2: Update the Local Blueprint File
1. In your project's documentation directory (e.g., `docs/`), replace your local `00_Documentation_Blueprint.md` with the latest version from this repository.
2. The version header at the top (e.g., `Blueprint Version: X`) acts as the compliance statement for your project.

### Step 3: Refactor Specification Files
* **For Added Files:** Copy any new skeleton templates introduced by the upgrade and populate them with your service's data.
* **For Changed/Renamed Files:** Rename files according to the new directory structure, and adjust the content schema (e.g., adding new required subsections like Stakeholders, Service Boundaries, or Edge Cases).
* **For Removed Files:** Safely delete obsolete documentation files or consolidate them as instructed by the changelog.

### Step 4: Align Local Codebase Tracking
* Adjust local service tracking files (such as `ROADMAP.md` or `CHANGELOG.md`) to comply with the new definition of responsibilities.
* For example, ensure your roadmap is strictly future-oriented and your history is decoupled cleanly if the new blueprint mandates it.

### Step 5: Verify and Commit
1. Verify traceability across all updated and newly introduced documents.
2. Run a local build or validation check to ensure Mermaid diagrams render correctly.
3. Commit all changes atomically with a descriptive commit message:
   ```bash
   git commit -m "docs(blueprint): upgrade documentation schema to Version X"
   ```

---

## 3. Architectural Versioning & Layering Strategy

To prevent version lock and maintain a strict separation of concerns, the documentation framework implements a decoupled, multi-layered versioning hierarchy. Under this design, the blueprint framework intentionally restricts itself to **Major-only version increments** (e.g., `1`, `2`, `3`), completely omitting minor and patch segments.

### 3.1 The Master Blueprint Framework (Structural Standard)
The master blueprint (`00_Documentation_Blueprint.md`) defines the meta-standard—governing directory layouts, file schema boundaries, and operational workflows for all services. Because this document governs structural rules rather than service-specific domain logic, it is versioned using major integers representing paradigm-shifting framework evolutions (e.g., introducing a new mandatory specification artifact). Minor adjustments, formatting refinements, or typographical corrections are applied in-place without version increments to maintain zero administrative overhead.

### 3.2 Central Specifications: High-Level Semantics (Functional Domain)
When copied into a service documentation directory (e.g., `my-service-docs/`), the templates serve as the centralized, high-level source of truth (BRD, PRD, and User Stories). 
* **Scope & Boundaries:** These specifications define *what* is being built and *why*, representing stable functional capabilities.
* **Versioning:** These artifacts align with the **Project Version** (`MAJOR.MINOR`), incrementing on major workflow redesigns or minor feature additions, completely isolated from internal code refactoring or deployable revisions.
* **Abstraction:** The high-level specification layer is intentionally kept abstract and free from low-level implementation details to prevent cognitive noise and maintain analyst-developer alignment.

### 3.3 Service Codebases: Low-Level Implementation (Technical Execution)
Technical execution details reside exclusively within the individual codebase repositories (`my-service-backend/`, `my-service-frontend/`).
* **Technical Constraints:** Detailed configuration, programming languages, database structures, local runtime instructions, validation logic, and local roadmap tables live locally in the codebase.
* **Changelogs & Revisions:** Because software development involves high-frequency commits, optimizations, dependency updates, and bug fixes, codebases use full semantic versioning (**`MAJOR.MINOR.PATCH`**).
* **Isolation:** Isolating low-level execution data to local repositories prevents continuous deployment revisions and minor technical details from polluting the high-level business specifications.

---

## 4. Contributing to the Blueprint Framework

To propose updates or changes to the documentation standards:
1. Create a branch in this repository.
2. Edit `00_Documentation_Blueprint.md` with your suggested structural changes.
3. Update `CHANGELOG.md` in the root folder, documenting your changes under the next major version release draft.
4. Submit a Pull Request for review by the architectural board.
