# Central Documentation Blueprint Repository

**Author:** [@mfauzanfikri](https://github.com/mfauzanfikri)

Welcome to the central repository for distributing documentation templates under the **Decoupled Specs & Distributed Roadmaps** framework.

This repository serves strictly as a **central master distributor** for our organization's documentation standards. The rules, directory structures, and workflows for individual project services are defined inside the blueprint files themselves.

---

## 🧭 Repository Navigation

For all rules and instructions regarding how to structure, write, and version documentation inside individual service codebases, please go directly to the active blueprint:

* **[Active Master Blueprint (Version 3)](./00_Documentation_Blueprint.md):** The authoritative specification detailing directory structures, file boundaries (BRD, PRD, User Stories, Architecture, Decision Logs, Specs Changelogs), Project Context usage, evidence classification, artifact contracts, validation rules, implementation roadmaps, and development workflows.
* **Active Reference Examples:** Fully compliant active reference implementations conforming to the current active Version 3 blueprint:
  * **[Pattern A: Multi-Repository Layout](./example/pattern-a-multi-repo/):** Decoupled specification and codebase repositories.
  * **[Pattern B: Single-Repository Monorepo Layout](./example/pattern-b-monorepo/):** Central `/docs/` specs with apps subpackages.
  * **[Pattern C: Single-Repository Monolith Layout](./example/pattern-c-monolith/):** Central `/docs/` specs and root codebase.
  * *All reference examples are structured to demonstrate the key use cases and file requirements of the blueprint across each supported layout pattern.*
* **[Archived Blueprint Directory](./archive/):** Frozen historical major versions of the blueprint framework and their corresponding example codebases.

---

## 📌 Repository Directory Layout & Naming Conventions

This repository is structured as follows, adhering to explicit naming conventions for active versus archived examples:

* **Active Example Convention:** Conforming to the active blueprint patterns under `./example/pattern-<name>/`.
* **Archived Example Convention:** Frozen at `./archive/v<major>/v<major>_example_service/`.

```text
documentation-blueprint/
├── 00_Documentation_Blueprint.md  # Active master blueprint framework (Version 3)
├── CHANGELOG.md                  # Central history of framework upgrades (Major-only)
├── README.md                     # Repository entrypoint guide (this file)
├── example/                      # Container for active reference implementations
│   ├── pattern-a-multi-repo/     # Pattern A: Multi-Repository reference example
│   ├── pattern-b-monorepo/       # Pattern B: Monorepo reference example
│   └── pattern-c-monolith/       # Pattern C: Monolith reference example
└── archive/                      # Historical archive directory
    ├── v1/                       # Archive of Version 1 standard
    │   ├── 00_Documentation_Blueprint.md
    │   └── v1_example_service/   # Historical Version 1 example service
    └── v2/                       # Archive of Version 2 standard
        ├── 00_Documentation_Blueprint.md
        └── v2_example_service/   # Historical Version 2 example service
```

---

## 🚀 How to Adopt an Example

To bootstrap a new project from one of the reference examples, follow these steps:

| Step | Action |
| :--- | :--- |
| 1 | **Pick your pattern.** Choose the layout that matches your architecture (see table below). |
| 2 | **Copy the example folder** into your new repository root. |
| 3 | **Rename all placeholders.** Replace `product-catalog-*` with your own service name across all file paths, headings, and content. |
| 4 | **Sync the blueprint copy.** Replace the `00_Documentation_Blueprint.md` inside `docs/` (or `v3-docs/` for the Pattern A reference example) with a fresh copy of the current root `00_Documentation_Blueprint.md` from this repository. |
| 5 | **Fill in the specs.** Work through `01_BRD.md` → `02_PRD.md` → `03_User_Stories.md` → `04_Architecture.md` following the development workflow defined in Section 13 of the blueprint. |
| 6 | **Assign Verification Criteria IDs.** Populate your service `ROADMAP.md` files with stable IDs before starting implementation (see Section 9.2 of the blueprint). |
| 7 | **Validate evidence and boundaries.** Use temporary Project Context when needed, then resolve or accept validation findings before treating generated artifacts as reliable. |

### Pattern Selection Guide

| Pattern | Layout | When to Use |
| :--- | :--- | :--- |
| **A — Multi-Repository** | Specs and each service in separate Git repositories | Independent deployment cadences; separate team ownership per service |
| **B — Monorepo** | Single repository with `docs/` specs and `apps/*` packages | Shared CI/CD; tightly coupled services that are still logically separate |
| **C — Monolith** | Single repository with `docs/` specs and `src/` codebase | Single deployable application handling all concerns |

---

## ⚡ Central Blueprint Update & Contribution Workflow

To propose or execute a major paradigm shift to our centralized documentation standards, follow this step-by-step central repository maintenance workflow:

### 1. Draft State & Naming Convention
To prevent upcoming framework versions from appearing officially active before formal approval:
* **Temporary Plan File:** All proposed blueprint revisions under review must be written in a temporary `plan.v<major>.blueprint.md` file (e.g., `plan.v2.blueprint.md`) at the repository root.
* **Root Changelog Draft Tag:** In the root `CHANGELOG.md`, the version entry for the upcoming framework version must be explicitly marked as draft/unreleased (e.g., `## [next-major] - Draft / Under Review` or `## [next-major] - Pending Release`).

### 2. Concrete Archival Process (Copy-then-Update)
Before modifying active repository files for a new major version, freeze the legacy standard:
1. Create the target archive directory `archive/v<previous_major>/` if it does not exist (e.g., `archive/v1/`).
2. Copy the active master blueprint `00_Documentation_Blueprint.md` into `archive/v<previous_major>/00_Documentation_Blueprint.md`.
3. Copy the active root `./example/` pattern directories into `archive/v<previous_major>/v<previous_major>_example_service/` to freeze the reference structure.

### 3. Upgrading Master Specifications & Reference Examples
Apply changes to the root master files after formal approval:
1. Update the active root `00_Documentation_Blueprint.md` with the approved final content of the new blueprint version.
2. Restructure and upgrade all reference example specifications and execution boundaries inside `./example/` (including `pattern-a-multi-repo`, `pattern-b-monorepo`, and `pattern-c-monolith`) to be 100% compliant with the new master specification version.

### 4. Releasing and Final Cleanup
To officially publish the new centralized standard:
1. Update this root `README.md` to reference the new active blueprint version, update the navigation folder structure tree, and update the "Current Release State".
2. Update the root `CHANGELOG.md` entry by removing the draft tag and replacing it with the active release date (e.g., changing `## [next-major] - Pending Release` to `## [next-major] - YYYY-MM-DD`).
3. Delete the temporary `plan.v<major>.blueprint.md` file from the root directory.
4. Commit the finalized assets and publish them through the approved repository workflow.

---

## 📢 Current Release State

* **Active Specification Version:** **Version 3**, as defined by the root master blueprint [00_Documentation_Blueprint.md](./00_Documentation_Blueprint.md).
* **Active Reference Examples:** Fully conform to Version 3 standards across the three layout patterns in [example/](./example/): `pattern-a-multi-repo`, `pattern-b-monorepo`, and `pattern-c-monolith`.
* **Archived Release (Version 2):** Framework Version 2 is frozen and archived inside [archive/v2/](./archive/v2/).
* **Archived Release (Version 1):** Framework Version 1 is frozen and archived inside [archive/v1/](./archive/v1/).

---

## 🏷️ Framework Versioning Rules

The central blueprint framework itself adheres strictly to **Major-only versioning** (e.g. `1`, `2`, `3`).

* **No Minor or Patch Segments:** Minor segments (like `X.Y` or `X.Y.Z`) are never used for the blueprint framework. Formatting adjustments, typographic corrections, or minor clarifications are made directly in-place without version increments.
* **Separation of Concerns:** Any other versioning systems used by individual projects (such as `MAJOR.MINOR` for high-level business capabilities or `MAJOR.MINOR.PATCH` for codebase release tagging) are defined and governed exclusively within the active [00_Documentation_Blueprint.md](./00_Documentation_Blueprint.md). This repository `README.md` does not duplicate or redefine those implementation rules.

---

## 📄 Metadata & Copyright

* **Framework:** Decoupled Specs & Distributed Roadmaps Framework
* **Current Version:** Version 3 (Major-only)
* **Author:** [@mfauzanfikri](https://github.com/mfauzanfikri)
* **License:** MIT
* **Copyright:** © 2026 mfauzanfikri. All rights reserved.
