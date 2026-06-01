# Central Documentation Blueprint Repository

Welcome to the central repository for distributing documentation templates under the **Decoupled Specs & Distributed Roadmaps** framework. 

This repository serves strictly as a **central master distributor** for our organization's documentation standards. The rules, directory structures, and workflows for individual project services are defined inside the blueprint files themselves.

---

## 🧭 Repository Navigation

For all rules and instructions regarding how to structure, write, and version documentation inside individual service codebases, please go directly to the active blueprint:

* **[Active Master Blueprint (Version 2)](./00_Documentation_Blueprint.md):** The authoritative specification detailing directory structures, file boundaries (BRD, PRD, User Stories, Architecture, Decision Logs, Specs Changelogs), implementation roadmaps, and development workflows.
* **Active Reference Examples:** Fully compliant active reference implementations conforming perfectly to the current active Version 2 blueprint:
  * **[Pattern A: Multi-Repository Layout](./example/pattern-a-multi-repo/):** Decoupled specification and codebase repositories.
  * **[Pattern B: Single-Repository Monorepo Layout](./example/pattern-b-monorepo/):** Central `/docs/` specs with apps subpackages.
  * **[Pattern C: Single-Repository Monolith Layout](./example/pattern-c-monolith/):** Central `/docs/` specs and root codebase.
  * *All reference examples comprehensively cover all target use cases and structural requirements of the blueprint.*
* **[Archived Blueprint Directory](./archive/):** Frozen historical major versions of the blueprint framework and their corresponding example codebases.

---

## 📌 Repository Directory Layout & Naming Conventions

This repository is structured as follows, adhering to explicit naming conventions for active versus archived examples:

* **Active Example Convention:** Conforming to the active blueprint patterns under `./example/pattern-<name>/`.
* **Archived Example Convention:** Frozen at `./archive/v<major>/v<major>_example_service/`.

```text
documentation-blueprint/
├── 00_Documentation_Blueprint.md  # Active master blueprint framework (Version 2)
├── CHANGELOG.md                  # Central history of framework upgrades (Major-only)
├── README.md                     # Repository entrypoint guide (this file)
├── example/                      # Container for active reference implementations
│   ├── pattern-a-multi-repo/     # Pattern A: Multi-Repository reference example
│   ├── pattern-b-monorepo/       # Pattern B: Monorepo reference example
│   └── pattern-c-monolith/       # Pattern C: Monolith reference example
└── archive/                      # Historical archive directory
    └── v1/                       # Archive of Version 1 standard
        ├── 00_Documentation_Blueprint.md
        └── v1_example_service/   # Historical Version 1 example service
```

---

## ⚡ Blueprint Update & Contribution Workflow

To propose or execute a major paradigm shift to our centralized documentation standards, follow this step-by-step workflow:

1. **Step 1: Create a temporary plan file**  
   Create a new design file in the root of the repository named `plan.v<major>.blueprint.md` (e.g., `plan.v2.blueprint.md`). Use this file to outline, draft, and refine proposed requirements and guidelines for the next major version.
2. **Step 2: Archive the active blueprint & active examples (Copy-then-Update)**  
   Before modifying the active root blueprint or active example folders for a new major version, copy the active `00_Documentation_Blueprint.md` into `archive/v<previous_major>/00_Documentation_Blueprint.md` and copy the active root `./example/` pattern directories into `archive/v<previous_major>/v<previous_major>_example_service/`. This copy-before-overwrite process preserves legacy history before any root updates begin.
3. **Step 3: Update the root blueprint & examples**  
   Apply the finalized design changes to the root `00_Documentation_Blueprint.md`. Always update or regenerate the corresponding example implementations inside the root `./example/` directory (`pattern-a-multi-repo`, `pattern-b-monorepo`, and `pattern-c-monolith`) to be fully compliant with the new standard.
4. **Step 4: Update central CHANGELOG**  
   Document all additions, changes, fixes, and removals in the root `CHANGELOG.md` under the newly released version block.
5. **Step 5: Cleanup and Release**  
   Delete the temporary `plan.v<major>.blueprint.md` file from the repository *before* making the final release commit.

---

## 📢 Current Release State

* **Active Specification Version:** **Version 2**, as defined by the root master blueprint [00_Documentation_Blueprint.md](./00_Documentation_Blueprint.md).
* **Active Reference Examples:** Fully conform to Version 2 standards across the three layout patterns in [example/](./example/): `pattern-a-multi-repo`, `pattern-b-monorepo`, and `pattern-c-monolith`.
* **Archived Release (Version 1):** Framework Version 1 is frozen and archived inside [archive/v1/](./archive/v1/).

---

## 🏷️ Framework Versioning Rules

The central blueprint framework itself adheres strictly to **Major-only versioning** (e.g. `1`, `2`, `3`).

* **No Minor or Patch Segments:** Minor segments (like `X.Y` or `X.Y.Z`) are never used for the blueprint framework. Formatting adjustments, typographic corrections, or minor clarifications are made directly in-place without version increments.
* **Separation of Concerns:** Any other versioning systems used by individual projects (such as `MAJOR.MINOR` for high-level business capabilities or `MAJOR.MINOR.PATCH` for codebase release tagging) are defined and governed exclusively within the active [00_Documentation_Blueprint.md](./00_Documentation_Blueprint.md). This repository `README.md` does not duplicate or redefine those implementation rules.
