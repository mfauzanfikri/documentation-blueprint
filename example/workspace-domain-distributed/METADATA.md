---
blueprint_version: 5
schema_version: 1.0

workspace:
  id: WS-ENTERPRISE
  name: Enterprise Multi-Domain Workspace

topology:
  pattern: domain-distributed
  mvp_mode: collapsed

products:
  - id: PROD-INVENTORY
    name: Inventory Domain Product
    version: "1.0"
    status: active
    mvp_mode: collapsed
  - id: PROD-FINANCE
    name: Finance Domain Product
    version: "1.0"
    status: active
    mvp_mode: collapsed

documents:
  # Inventory Product Specifications
  - id: BRD-INV-001
    type: brd
    path: inventory/01_BRD.md
    document_version: "1.0"
    scope_kind: product
    scope_id: PROD-INVENTORY
    product_version: "1.0"
    status: approved
  - id: PRD-INV-001
    type: prd
    path: inventory/02_PRD.md
    document_version: "1.0"
    scope_kind: product
    scope_id: PROD-INVENTORY
    product_version: "1.0"
    status: approved
  - id: FEATURE-CATALOGUE-INV
    type: feature_catalogue
    path: inventory/03_Feature_Catalogue.md
    document_version: "1.0"
    scope_kind: product
    scope_id: PROD-INVENTORY
    product_version: "1.0"
    status: active
  - id: FRD-INV-001
    type: frd
    path: inventory/frd/FRD-001.md
    document_version: "1.0"
    scope_kind: product
    scope_id: PROD-INVENTORY
    product_version: "1.0"
    status: approved
  - id: USER-STORIES-INV
    type: user_stories
    path: inventory/06_User_Stories.md
    document_version: "1.0"
    scope_kind: product
    scope_id: PROD-INVENTORY
    product_version: "1.0"
    status: active
  - id: CHANGELOG-INV
    type: changelog
    path: inventory/CHANGELOG.md
    document_version: "1.0"
    scope_kind: product
    scope_id: PROD-INVENTORY
    product_version: "1.0"
    status: active

  # Finance Product Specifications
  - id: BRD-FIN-001
    type: brd
    path: finance/01_BRD.md
    document_version: "1.0"
    scope_kind: product
    scope_id: PROD-FINANCE
    product_version: "1.0"
    status: approved
  - id: PRD-FIN-001
    type: prd
    path: finance/02_PRD.md
    document_version: "1.0"
    scope_kind: product
    scope_id: PROD-FINANCE
    product_version: "1.0"
    status: approved
  - id: FEATURE-CATALOGUE-FIN
    type: feature_catalogue
    path: finance/03_Feature_Catalogue.md
    document_version: "1.0"
    scope_kind: product
    scope_id: PROD-FINANCE
    product_version: "1.0"
    status: active
  - id: FRD-FIN-001
    type: frd
    path: finance/frd/FRD-001.md
    document_version: "1.0"
    scope_kind: product
    scope_id: PROD-FINANCE
    product_version: "1.0"
    status: approved
  - id: USER-STORIES-FIN
    type: user_stories
    path: finance/06_User_Stories.md
    document_version: "1.0"
    scope_kind: product
    scope_id: PROD-FINANCE
    product_version: "1.0"
    status: active
  # Workspace Shared Technical Foundations
  - id: ARCHITECTURE-ENTERPRISE
    type: architecture
    path: docs/07_Architecture.md
    document_version: "1.0"
    scope_kind: workspace
    scope_id: WS-ENTERPRISE
    product_version: "1.0"
    status: approved
  - id: TECHNICAL-STANDARDS-ENTERPRISE
    type: technical_standards
    path: docs/08_Technical_Standards.md
    document_version: "1.0"
    scope_kind: workspace
    scope_id: WS-ENTERPRISE
    product_version: "1.0"
    status: active
  - id: DECISION-LOG-ENTERPRISE
    type: decision_log
    path: docs/09_Decision_Log.md
    document_version: "1.0"
    scope_kind: workspace
    scope_id: WS-ENTERPRISE
    product_version: "1.0"
    status: active
  - id: CHANGELOG-FIN
    type: changelog
    path: finance/CHANGELOG.md
    document_version: "1.0"
    scope_kind: product
    scope_id: PROD-FINANCE
    product_version: "1.0"
    status: active

product_scope:
  PROD-INVENTORY:
    features:
      - id: F-INV-001
        major_version: v1
        resolved_minor_version: v1.0
  PROD-FINANCE:
    features:
      - id: F-FIN-001
        major_version: v1
        resolved_minor_version: v1.0

components:
  backend:
    type: service
    deployable: true
    version: "1.0.0"
    path: apps/backend
    compatible_product_versions:
      - product_id: PROD-INVENTORY
        version: "1.0"
      - product_id: PROD-FINANCE
        version: "1.0"
  frontend:
    type: application
    deployable: true
    version: "1.0.0"
    path: apps/frontend
    compatible_product_versions:
      - product_id: PROD-INVENTORY
        version: "1.0"
      - product_id: PROD-FINANCE
        version: "1.0"
---

# Documentation Map - Enterprise Multi-Domain Workspace

This workspace demonstrates the **Pattern B Variant: Domain-Distributed Specifications Workspace** conforming to the **Documentation Blueprint Version 5** standard.
Consult the declarative YAML block above for machine-validated multi-domain documentation paths, versions, and execution boundary compatibilities.
