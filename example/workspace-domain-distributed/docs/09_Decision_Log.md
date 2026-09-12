---
document_id: DECISION-LOG-ENTERPRISE
document_type: decision_log
document_version: "1.0"
blueprint_version: 5
product_id: MULTI-PRODUCT
product_ids:
  - PROD-INVENTORY
  - PROD-FINANCE
product_version: "1.0"
status: active
scope:
  kind: workspace
  id: WS-ENTERPRISE
authority: decision_governance
owner: Systems Architecture
last_updated: "2026-09-12"
---
# Decision Log (ADR) - Enterprise Workspace

**Workspace:** `WS-ENTERPRISE`

This log records architectural and design decisions made for the enterprise workspace and its constituent domains.

---

## ADR-WS-001: Workspace Technical Foundation Consolidation
* **Status:** approved
* **Context:** Domain specifications own business requirements, but shared backend and frontend boundaries require unified architectural governance.
* **Decision:** Consolidate architecture, technical standards, and global decision records into workspace-level `docs/`.
* **Consequences:** Eliminates duplicated documentation across domain folders and unifies execution standards.

## ADR-INV-001: Local Stock Adjustments Restrictions
* **Status:** approved
* **Context:** We need to ensure that physical inventory adjustments are verified locally before transmission to backend networks.
* **Decision:** We will enforce role-based client-side screening using the `warehouse_manager` profile.
* **Consequences:** Reduces invalid stock update attempts on backend boundaries.

## ADR-INV-002: Reorganization of Stock Room Access Control Requirements
* **Status:** approved
* **Context:** During our domain partitioning, the legacy security requirements for stock access (`Inventory::US-SEC-OLD`) were unified and modernized.
* **Decision:** We will replace the legacy requirements with the single canonical story `Inventory::US-SEC-01` (Secure Stock Room Access Control).
* **Consequences:** The new story supersedes the legacy ID, and the mapping matrix must record this supersession.

## ADR-FIN-001: Ledger Modification MFA Verification
* **Status:** approved
* **Context:** Financial audits require strict confirmation of identity for any changes to finalized entries.
* **Decision:** We will require multi-factor authentication (MFA) prompts on all ledger modification actions.
* **Consequences:** Increases verification latency slightly but provides strong compliance audits.
