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

documentation:
  brd:
    version: "1.0"
    path: docs/01_BRD.md
    status: approved
  prd:
    version: "1.0"
    path: docs/02_PRD.md
    status: approved
  feature_catalogue:
    version: "1.0"
    path: docs/03_Feature_Catalogue.md
    status: active
  frd:
    active_id: FRD-001
    version: "1.0"
    path: docs/05_FRD.md
    status: approved
  user_stories:
    version: "1.0"
    path: docs/06_User_Stories.md
    status: active
  technical:
    architecture:
      version: "1.0"
      path: docs/07_Architecture.md
      status: approved
    standards:
      version: "1.0"
      path: docs/08_Technical_Standards.md
      status: active
  decision_log:
    path: docs/09_Decision_Log.md
    status: active

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
