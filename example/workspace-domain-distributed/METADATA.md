---
blueprint_version: 5
schema_version: 1.0

product:
  id: PROD-ENTERPRISE-WORKSPACE
  name: Enterprise Multi-Domain Workspace
  version: "1.0"
  status: active

topology:
  pattern: domain-distributed
  mvp_mode: collapsed

documentation:
  blueprint:
    version: "5.0"
    path: docs/00_Documentation_Blueprint.md
    status: approved
  domains:
    inventory:
      brd: inventory/01_BRD.md
      prd: inventory/02_PRD.md
      feature_catalogue: inventory/03_Feature_Catalogue.md
      frd: inventory/05_FRD.md
      user_stories: inventory/06_User_Stories.md
      architecture: inventory/07_Architecture.md
      technical_standards: inventory/08_Technical_Standards.md
      decision_log: inventory/09_Decision_Log.md
      changelog: inventory/CHANGELOG.md
    finance:
      brd: finance/01_BRD.md
      prd: finance/02_PRD.md
      feature_catalogue: finance/03_Feature_Catalogue.md
      frd: finance/05_FRD.md
      user_stories: finance/06_User_Stories.md
      architecture: finance/07_Architecture.md
      technical_standards: finance/08_Technical_Standards.md
      decision_log: finance/09_Decision_Log.md
      changelog: finance/CHANGELOG.md

components:
  backend:
    type: service
    deployable: true
    version: "1.0.0"
    path: apps/backend
    compatible_product_versions: ["1.0"]
  frontend:
    type: application
    deployable: true
    version: "1.0.0"
    path: apps/frontend
    compatible_product_versions: ["1.0"]
---

# Documentation Map - Enterprise Multi-Domain Workspace

This workspace demonstrates the **Pattern B Variant: Domain-Distributed Specifications Workspace** conforming to the **Documentation Blueprint Version 5** standard.
Consult the declarative YAML block above for machine-validated multi-domain documentation paths, versions, and execution boundary compatibilities.
