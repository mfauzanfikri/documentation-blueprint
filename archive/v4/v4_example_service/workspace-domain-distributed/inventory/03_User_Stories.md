# User Stories - Inventory Domain
**Specification Boundary:** Inventory
**Product Version:** 1.0

---

## US-SEC-01: Secure Stock Room Access Control
**As a** Warehouse Manager  
**I want to** restrict access to the stock level adjustment screens  
**So that** only authorized personnel can change inventory counts.

### Acceptance Criteria:
* **AC-01:** Reject adjustments if user lacks `warehouse_manager` role.
* **AC-02:** Log unauthorized attempts to the security audit stream.
