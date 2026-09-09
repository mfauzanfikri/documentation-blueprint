# User Stories - Inventory Domain

**Specification Boundary:** Inventory
**Product Version:** 1.0
**Scoped FRD:** [05_FRD.md](./05_FRD.md)
**Status:** Active

---

## 1. User Story Index

| User Story ID | Title | Scoped Feature | Scoped FRD Requirement | Status |
| :--- | :--- | :--- | :--- | :--- |
| **US-SEC-01** | Secure Stock Room Access Control | F-INV-001 v1 | FR-INV-001-01 | Active |

---

## 2. User Stories

### US-SEC-01: Secure Stock Room Access Control
* **Canonical Identity:** `Inventory::US-SEC-01`
* **Scoped Feature:** `F-INV-001 v1`
* **Scoped Functional Requirement:** `FR-INV-001-01`

**As a** Warehouse Manager  
**I want to** restrict access to the stock level adjustment screens  
**So that** only authorized personnel can change inventory counts.

#### Acceptance Criteria:
* **AC-01:** Reject adjustments if user lacks `warehouse_manager` role.
* **AC-02:** Log unauthorized attempts to the security audit stream.
