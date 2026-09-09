# Decision Log (ADR) - Finance Domain
**Specification Boundary:** Finance

This log records the architectural and design decisions made within the Finance domain specification boundary.

---

## ADR-FIN-001: Ledger Modification MFA Verification
* **Status:** Approved
* **Context:** Financial audits require strict confirmation of identity for any changes to finalized entries.
* **Decision:** We will require multi-factor authentication (MFA) prompts on all ledger modification actions.
* **Consequences:** Increases verification latency slightly but provides strong compliance audits.
