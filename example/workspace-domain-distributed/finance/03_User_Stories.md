# User Stories - Finance Domain
**Specification Boundary:** Finance
**Product Version:** 1.0

---

## US-SEC-01: Multi-Factor Ledger Adjustments
**As an** Accountant  
**I want to** be prompted with an MFA challenge when adjusting finalized ledger records  
**So that** high-value transactions cannot be modified without secondary approval.

### Acceptance Criteria:
* **AC-01:** Trigger MFA challenge on ledger adjustment events.
* **AC-02:** Block adjustment until the MFA verification is successfully completed.
