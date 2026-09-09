---
blueprint_version: 5
schema_version: 1.0

product:
  id: PROD-CATALOG
  name: Product Catalog Service
  version: "1.0"
  status: active

topology:
  pattern: pattern-b-monorepo
  mvp_mode: enabled

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
  mvp:
    active_id: MVP-001
    version: "1.0"
    path: docs/04_MVP.md
    status: in_progress
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

mvp_scope:
  MVP-001:
    product_version: "1.0"
    status: in_progress
    frd: docs/05_FRD.md
    features:
      - id: F-001
        major_version: v1
      - id: F-002
        major_version: v1

components:
  product-catalog-backend:
    type: service
    deployable: true
    version: "1.0.0"
    path: apps/backend
    compatible_product_versions: ["1.0"]
  product-catalog-frontend:
    type: application
    deployable: true
    version: "1.0.0"
    path: apps/frontend
    compatible_product_versions: ["1.0"]
---

# Documentation Map - Product Catalog Service

This monorepo adheres to the **Documentation Blueprint Version 5** standard.
Consult the declarative YAML block above for machine-validated documentation paths, version alignments, and execution boundary compatibilities.
