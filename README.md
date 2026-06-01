# Central Documentation Blueprint Repository

Welcome to the central repository for distributing documentation templates under the **Decoupled Specs & Distributed Roadmaps** framework. 

This repository serves strictly as a **central master distributor** for our organization's documentation standards. The rules, directory structures, and workflows for individual project services are defined inside the blueprint files themselves.

---

## 🧭 Repository Navigation

For all rules and instructions regarding how to structure, write, and version documentation inside individual service codebases, please go directly to the active blueprint:

* **[Active Master Blueprint (Version 1)](./00_Documentation_Blueprint.md):** The authoritative specification detailing directory structures, file boundaries (BRD, User Stories, etc.), implementation roadmaps, and development workflows.
* **[Active Example Service](./example/example_service/):** The fully compliant, active reference implementation conforming perfectly to the current active blueprint.
* **[Archived Blueprint Directory](./archive/):** Frozen historical major versions of the blueprint framework and their corresponding example codebases.

---

## 📌 Repository Directory Layout & Naming Conventions

This repository is structured as follows, adhering to explicit naming conventions for active versus archived examples:

* **Active Example Convention:** Conforming to the active blueprint at `./example/example_service/`.
* **Archived Example Convention:** Frozen at `./archive/v<major>/v<major>_example_service/`.

```text
documentation-blueprint/
├── 00_Documentation_Blueprint.md  # Active master blueprint framework (Version 1)
├── CHANGELOG.md                  # Central history of framework upgrades (Major-only)
├── README.md                     # Repository entrypoint guide (this file)
├── plan.v2.blueprint.md          # Temporary design file for upcoming Version 2 (pending draft)
├── example/                      # Container for active reference implementation
│   └── example_service/          # Active Version 1 example codebase structure
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
   Before modifying the active root blueprint or active example folders for a new major version, copy the active `00_Documentation_Blueprint.md` into `archive/v<previous_major>/00_Documentation_Blueprint.md` and copy the active root `./example/example_service/` folder into `archive/v<previous_major>/v<previous_major>_example_service/`. This copy-before-overwrite process preserves legacy history before any root updates begin.
3. **Step 3: Update the root blueprint & examples**  
   Apply the finalized design changes to the root `00_Documentation_Blueprint.md`. Always update or regenerate the corresponding example implementations inside the root `./example/example_service/` folder to be fully compliant with the new standard.
4. **Step 4: Update central CHANGELOG**  
   Document all additions, changes, fixes, and removals in the root `CHANGELOG.md` under the newly released version block.
5. **Step 5: Cleanup and Release**  
   Delete the temporary `plan.v<major>.blueprint.md` file from the repository *before* making the final release commit.

---

## 📢 Current Release State

* **Active Specification Version:** The current active blueprint version is strictly **Version 1**, as defined by the root [00_Documentation_Blueprint.md](./00_Documentation_Blueprint.md).
* **Active Reference Example:** The reference implementation at [example/example_service/](./example/example_service/) conforms 100% to this active standard.
* **Upcoming Release (Version 2):** Framework Version 2 is currently in a **pending draft target** state. All proposed changes reside in the temporary [plan.v2.blueprint.md](./plan.v2.blueprint.md) file.

> [!NOTE]  
> The root [CHANGELOG.md](./CHANGELOG.md) contains a draft entry block for `[2] - 2026-06-01`. This is a **pending draft target** and is only considered officially released and active when the upgrade plan is fully merged into the root `00_Documentation_Blueprint.md` and the temporary planning file is deleted.

---

## 🏷️ Framework Versioning Rules

The central blueprint framework itself adheres strictly to **Major-only versioning** (e.g. `1`, `2`, `3`).

* **No Minor or Patch Segments:** Minor segments (like `X.Y` or `X.Y.Z`) are never used for the blueprint framework. Formatting adjustments, typographic corrections, or minor clarifications are made directly in-place without version increments.
* **Separation of Concerns:** Any other versioning systems used by individual projects (such as `MAJOR.MINOR` for high-level business capabilities or `MAJOR.MINOR.PATCH` for codebase release tagging) are defined and governed exclusively within the active [00_Documentation_Blueprint.md](./00_Documentation_Blueprint.md). This repository `README.md` does not duplicate or redefine those implementation rules.
