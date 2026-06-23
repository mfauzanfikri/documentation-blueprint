# Decision Log (ADR) - Inventory Domain
**Specification Boundary:** Inventory

This log records the architectural and design decisions made within the Inventory domain specification boundary.

---

## ADR-INV-001: Local Stock Adjustments Restrictions
* **Status:** Approved
* **Context:** We need to ensure that physical inventory adjustments are verified locally before transmission to backend networks.
* **Decision:** We will enforce role-based client-side screening using the `warehouse_manager` profile.
* **Consequences:** Reduces invalid stock update attempts on backend boundaries.
