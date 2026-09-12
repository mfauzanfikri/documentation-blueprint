---
blueprint_version: 5
schema_version: 1.0

product:
  id: PROD-CATALOG-MONOLITH
  name: Product Catalog Monolith
  version: "1.0"
  status: active

topology:
  pattern: pattern-c-monolith
  mvp_mode: collapsed

documents:
  - id: BRD-001
    type: brd
    path: docs/01_BRD.md
    document_version: "1.0"
    scope_kind: product
    scope_id: PROD-CATALOG-MONOLITH
    product_version: "1.0"
    status: approved
  - id: PRD-001
    type: prd
    path: docs/02_PRD.md
    document_version: "1.0"
    scope_kind: product
    scope_id: PROD-CATALOG-MONOLITH
    product_version: "1.0"
    status: approved
  - id: FEATURE-CATALOGUE
    type: feature_catalogue
    path: docs/03_Feature_Catalogue.md
    document_version: "1.0"
    scope_kind: product
    scope_id: PROD-CATALOG-MONOLITH
    product_version: "1.0"
    status: active
  - id: FRD-001
    type: frd
    path: docs/frd/FRD-001.md
    document_version: "1.0"
    scope_kind: product
    scope_id: PROD-CATALOG-MONOLITH
    product_version: "1.0"
    status: approved
  - id: USER-STORIES
    type: user_stories
    path: docs/06_User_Stories.md
    document_version: "1.0"
    scope_kind: product
    scope_id: PROD-CATALOG-MONOLITH
    product_version: "1.0"
    status: active
  - id: ARCHITECTURE
    type: architecture
    path: docs/07_Architecture.md
    document_version: "1.0"
    scope_kind: product
    scope_id: PROD-CATALOG-MONOLITH
    product_version: "1.0"
    status: approved
  - id: TECHNICAL-STANDARDS
    type: technical_standards
    path: docs/08_Technical_Standards.md
    document_version: "1.0"
    scope_kind: product
    scope_id: PROD-CATALOG-MONOLITH
    product_version: "1.0"
    status: active
  - id: DECISION-LOG
    type: decision_log
    path: docs/09_Decision_Log.md
    document_version: "1.0"
    scope_kind: product
    scope_id: PROD-CATALOG-MONOLITH
    product_version: "1.0"
    status: active
  - id: CHANGELOG
    type: changelog
    path: docs/CHANGELOG.md
    document_version: "1.0"
    scope_kind: product
    scope_id: PROD-CATALOG-MONOLITH
    product_version: "1.0"
    status: active

navigation:
  active_frd_id: FRD-001

product_scope:
  features:
    - id: F-001
      major_version: v1
      resolved_minor_version: v1.0
    - id: F-002
      major_version: v1
      resolved_minor_version: v1.0

components:
  product-catalog-monolith:
    type: monolith
    deployable: true
    version: "1.0.0"
    path: .
    compatible_product_versions: ["1.0"]
---

# Documentation Map - Product Catalog Monolith

This project adheres to the **Documentation Blueprint Version 5** standard under **Collapsed MVP Mode**.
Because this monolith is delivered as a single coherent increment, `04_MVP.md` is not applicable and omitted.
The FRD scopes features directly from the Feature Catalogue for Product Version 1.0.
