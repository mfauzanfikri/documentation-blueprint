# User Stories - Finance Domain

**Specification Boundary:** Finance
**Product Version:** 1.0
**Scoped FRD:** [05_FRD.md](./05_FRD.md)
**Status:** Active

---

## 1. User Story Index

| User Story ID | Title | Scoped Feature | Scoped FRD Requirement | Status |
| :--- | :--- | :--- | :--- | :--- |
| **US-SEC-01** | Multi-Factor Ledger Adjustments | F-FIN-001 v1 | FR-FIN-001-01 | Active |

---

## 2. User Stories

### US-SEC-01: Multi-Factor Ledger Adjustments
* **Canonical Identity:** `Finance::US-SEC-01`
* **Scoped Feature:** `F-FIN-001 v1`
* **Scoped Functional Requirement:** `FR-FIN-001-01`

**As an** Accountant  
**I want to** be prompted with an MFA challenge when adjusting finalized ledger records  
**So that** high-value transactions cannot be modified without secondary approval.

#### Acceptance Criteria:
* **AC-01:** Trigger MFA challenge on ledger adjustment events.
* **AC-02:** Block adjustment until the MFA verification is successfully completed.
