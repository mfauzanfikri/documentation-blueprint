---
blueprint_version: 5
schema_version: 1.0

product:
  id: PROD-CATALOG
  name: Product Catalog Service
  version: "1.0"
  status: active

topology:
  pattern: pattern-a-multi-repo
  mvp_mode: enabled

documents:
  - id: BRD-001
    type: brd
    path: 01_BRD.md
    document_version: "1.0"
    scope_kind: product
    scope_id: PROD-CATALOG
    product_version: "1.0"
    status: approved
  - id: PRD-001
    type: prd
    path: 02_PRD.md
    document_version: "1.0"
    scope_kind: product
    scope_id: PROD-CATALOG
    product_version: "1.0"
    status: approved
  - id: FEATURE-CATALOGUE
    type: feature_catalogue
    path: 03_Feature_Catalogue.md
    document_version: "1.0"
    scope_kind: product
    scope_id: PROD-CATALOG
    product_version: "1.0"
    status: active
  - id: MVP-001
    type: mvp
    path: mvp/MVP-001.md
    document_version: "1.0"
    scope_kind: mvp
    scope_id: MVP-001
    product_version: "1.0"
    status: in_progress
  - id: FRD-001
    type: frd
    path: frd/FRD-001.md
    document_version: "1.0"
    scope_kind: mvp
    scope_id: MVP-001
    product_version: "1.0"
    status: approved
  - id: USER-STORIES
    type: user_stories
    path: 06_User_Stories.md
    document_version: "1.0"
    scope_kind: product
    scope_id: PROD-CATALOG
    product_version: "1.0"
    status: active
  - id: ARCHITECTURE
    type: architecture
    path: 07_Architecture.md
    document_version: "1.0"
    scope_kind: product
    scope_id: PROD-CATALOG
    product_version: "1.0"
    status: approved
  - id: TECHNICAL-STANDARDS
    type: technical_standards
    path: 08_Technical_Standards.md
    document_version: "1.0"
    scope_kind: product
    scope_id: PROD-CATALOG
    product_version: "1.0"
    status: active
  - id: DECISION-LOG
    type: decision_log
    path: 09_Decision_Log.md
    document_version: "1.0"
    scope_kind: product
    scope_id: PROD-CATALOG
    product_version: "1.0"
    status: active
  - id: CHANGELOG
    type: changelog
    path: CHANGELOG.md
    document_version: "1.0"
    scope_kind: product
    scope_id: PROD-CATALOG
    product_version: "1.0"
    status: active

navigation:
  active_mvp_id: MVP-001
  active_frd_id: FRD-001

mvp_scope:
  MVP-001:
    product_version: "1.0"
    status: in_progress
    frd: frd/FRD-001.md
    features:
      - id: F-001
        major_version: v1
        resolved_minor_version: v1.0
      - id: F-002
        major_version: v1
        resolved_minor_version: v1.0

components:
  product-catalog-backend:
    type: service
    deployable: true
    version: "1.0.0"
    path: ../v5-backend
    compatible_product_versions: ["1.0"]
  product-catalog-frontend:
    type: application
    deployable: true
    version: "1.0.0"
    path: ../v5-frontend
    compatible_product_versions: ["1.0"]
---

# Documentation Map - Product Catalog Specifications (Multi-Repo)

This repository serves as the central Specification Boundary for the Product Catalog Service under Pattern A (Multi-Repository layout).
Consult the declarative YAML block above for machine-validated document paths, version alignments, and execution boundary compatibilities.
