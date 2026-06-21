# Central Documentation Blueprint Repository

**Author:** [@mfauzanfikri](https://github.com/mfauzanfikri)

Welcome to the central repository for distributing documentation templates under the **Product-Centric Specs & Execution Boundary Documentation** framework.

This repository serves strictly as a **central master distributor** for documentation standards. The rules, boundaries, and workflows for individual products and execution boundaries are defined inside the blueprint files themselves.

---

## Repository Navigation

For all rules and instructions regarding how to structure, write, and version documentation inside individual projects, go directly to the active blueprint:

* **[Active Master Blueprint (Version 4)](./00_Documentation_Blueprint.md):** The authoritative specification detailing specification boundaries, execution boundaries, Product Versions, Boundary Versions, Project Context usage, documentation initialization, evidence classification, artifact contracts, compatibility metadata, validation rules, implementation roadmaps, and development workflows.
* **Active Reference Examples:** Fully compliant active reference implementations conforming to the current active Version 4 blueprint:
  * **[Pattern A: Multi-Repository Layout](./example/pattern-a-multi-repo/):** Decoupled specification and execution-boundary repositories.
  * **[Pattern B: Single-Repository Monorepo Layout](./example/pattern-b-monorepo/):** Central `/docs/` specs with multiple execution boundaries under one workspace.
  * **[Pattern C: Single-Repository Monolith Layout](./example/pattern-c-monolith/):** Central `/docs/` specs and one deployable monolith execution boundary.
  * **[Distributed Specification Boundaries](./example/distributed-specification-boundaries/):** Focused V4 example showing multiple Specification Boundaries, collision-safe story identities, product-level aggregation, and shared execution boundaries.
* **[Archived Blueprint Directory](./archive/):** Frozen historical major versions of the blueprint framework and their corresponding example codebases.

---

## Repository Directory Layout & Naming Conventions

This repository is structured as follows, adhering to explicit naming conventions for active versus archived examples:

* **Active Example Convention:** Conforming to the active blueprint patterns under `./example/pattern-<name>/`.
* **Archived Example Convention:** Frozen at `./archive/v<major>/v<major>_example_service/`.

```text
documentation-blueprint/
├── 00_Documentation_Blueprint.md  # Active master blueprint framework (Version 4)
├── CHANGELOG.md                  # Central history of framework upgrades (Major-only)
├── README.md                     # Repository entrypoint guide (this file)
├── example/                      # Container for active reference implementations
│   ├── distributed-specification-boundaries/
│   ├── pattern-a-multi-repo/     # Pattern A: Multi-Repository reference example
│   ├── pattern-b-monorepo/       # Pattern B: Monorepo reference example
│   └── pattern-c-monolith/       # Pattern C: Monolith reference example
└── archive/                      # Historical archive directory
    ├── v1/                       # Archive of Version 1 standard
    ├── v2/                       # Archive of Version 2 standard
    └── v3/                       # Archive of Version 3 standard
```

---

## How to Adopt an Example

To bootstrap a new project from one of the reference examples, follow these steps:

| Step | Action |
| :--- | :--- |
| 1 | **Pick your pattern.** Choose the layout that matches your product and execution topology. |
| 2 | **Copy the example folder** into your new repository or workspace root. |
| 3 | **Rename all placeholders.** Replace `product-catalog-*` and placeholder product names with your own product and boundary names across paths, headings, and content. |
| 4 | **Sync the blueprint copy.** Replace the `00_Documentation_Blueprint.md` inside `docs/` or `v4-docs/` with a fresh copy of the current root `00_Documentation_Blueprint.md` from this repository. |
| 5 | **Initialize documentation topology.** Capture the specification topology, adoption mode, execution boundaries, deployability, and ownership model before generating artifacts. |
| 6 | **Fill in the specs.** Work through `01_BRD.md` -> `02_PRD.md` -> `03_User_Stories.md` -> `04_Architecture.md` following the development workflow defined in the blueprint. |
| 7 | **Assign Verification Criteria IDs.** Populate execution-boundary `ROADMAP.md` files with stable IDs scoped by boundary before starting implementation. |
| 8 | **Validate evidence, compatibility, and boundaries.** Use temporary Project Context when needed, then resolve or accept validation findings before treating generated artifacts as reliable. |

### Pattern Selection Guide

| Pattern | Layout | When to Use |
| :--- | :--- | :--- |
| **A — Multi-Repository** | Specs and each execution boundary in separate Git repositories | Independent deployment cadences; separate ownership per boundary |
| **B — Monorepo** | Single repository with `docs/` specs and multiple execution boundaries | Shared workspace; multiple applications, services, packages, or infrastructure boundaries |
| **C — Monolith** | Single repository with `docs/` specs and one deployable application boundary | Single deployable product implementation handling all concerns |

---

## Central Blueprint Update & Contribution Workflow

To propose or execute a major paradigm shift to the centralized documentation standards, follow this step-by-step central repository maintenance workflow:

### 1. Draft State & Naming Convention

To prevent upcoming framework versions from appearing officially active before formal approval:

* **Temporary Plan File:** Proposed blueprint revisions under review must be written in a temporary `plan.v<major>.blueprint.md` file at the repository root.
* **Root Changelog Draft Tag:** In the root `CHANGELOG.md`, the version entry for an upcoming framework version should be explicitly marked as draft/unreleased until release.

### 2. Concrete Archival Process

Before modifying active repository files for a new major version, freeze the legacy standard:

1. Create the target archive directory `archive/v<previous_major>/` if it does not exist.
2. Copy the active master blueprint `00_Documentation_Blueprint.md` into `archive/v<previous_major>/00_Documentation_Blueprint.md`.
3. Copy the active root `./example/` pattern directories into `archive/v<previous_major>/v<previous_major>_example_service/` to freeze the reference structure.

### 3. Upgrading Master Specifications & Reference Examples

Apply changes to the root master files after approval:

1. Update the active root `00_Documentation_Blueprint.md` with the approved final content of the new blueprint version.
2. Restructure and upgrade all reference example specifications and execution boundaries inside `./example/` to be compliant with the new master specification version.

### 4. Releasing and Final Cleanup

To officially publish the new centralized standard:

1. Update this root `README.md` to reference the new active blueprint version, update the navigation folder structure tree, and update the Current Release State.
2. Update the root `CHANGELOG.md` entry by removing the draft tag and replacing it with the active release date.
3. Remove temporary `plan.v<major>.blueprint.md` files from tracked release assets before publishing unless there is explicit approval to publish the plan.
4. Commit the finalized assets and publish them through the approved repository workflow.

---

## Current Release State

* **Active Specification Version:** **Version 4**, as defined by the root master blueprint [00_Documentation_Blueprint.md](./00_Documentation_Blueprint.md).
* **Active Reference Examples:** Fully conform to Version 4 standards across the three layout patterns and the distributed-specification focused example in [example/](./example/).
* **Archived Release (Version 3):** Framework Version 3 is frozen and archived inside [archive/v3/](./archive/v3/).
* **Archived Release (Version 2):** Framework Version 2 is frozen and archived inside [archive/v2/](./archive/v2/).
* **Archived Release (Version 1):** Framework Version 1 is frozen and archived inside [archive/v1/](./archive/v1/).

---

## Framework Versioning Rules

The central blueprint framework itself adheres strictly to **Major-only versioning** (e.g. `1`, `2`, `3`, `4`).

* **No Minor or Patch Segments:** Minor segments such as `X.Y` or `X.Y.Z` are never used for the blueprint framework. Formatting adjustments, typographic corrections, or minor clarifications are made directly in-place without version increments.
* **Separation of Concerns:** Any other versioning systems used by individual projects, Product Versions, or Boundary Versions are defined and governed exclusively within the active [00_Documentation_Blueprint.md](./00_Documentation_Blueprint.md). This repository `README.md` does not duplicate or redefine those implementation rules.

---

## Metadata & Copyright

* **Framework:** Product-Centric Specs & Execution Boundary Documentation Framework
* **Current Version:** Version 4 (Major-only)
* **Author:** [@mfauzanfikri](https://github.com/mfauzanfikri)
* **License:** MIT
* **Copyright:** (c) 2026 mfauzanfikri. All rights reserved.
