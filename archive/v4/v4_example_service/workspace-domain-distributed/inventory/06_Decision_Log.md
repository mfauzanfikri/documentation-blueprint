# Decision Log (ADR) - Inventory Domain
**Specification Boundary:** Inventory

This log records the architectural and design decisions made within the Inventory domain specification boundary.

---

## ADR-INV-001: Local Stock Adjustments Restrictions
* **Status:** Approved
* **Context:** We need to ensure that physical inventory adjustments are verified locally before transmission to backend networks.
* **Decision:** We will enforce role-based client-side screening using the `warehouse_manager` profile.
* **Consequences:** Reduces invalid stock update attempts on backend boundaries.

## ADR-INV-002: Reorganization of Stock Room Access Control Requirements
* **Status:** Approved
* **Context:** During our domain partitioning, the legacy security requirements for stock access (`Inventory::US-SEC-OLD`) were unified and modernized.
* **Decision:** We will replace the legacy requirements with the single canonical story `Inventory::US-SEC-01` (Secure Stock Room Access Control).
* **Consequences:** The new story supersedes the legacy ID, and the mapping matrix must record this supersession.
