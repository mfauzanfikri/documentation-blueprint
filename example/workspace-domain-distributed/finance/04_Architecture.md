# Architecture Spec - Finance Domain
**Specification Boundary:** Finance

---

## 1. Boundary Integrations
The finance domain interfaces with the multi-factor auth gateway to authorize ledger updates.

```mermaid
flowchart LR
    Acct[Accountant] -->|Adjust Ledger| API[Finance Service]
    API -->|Prompt MFA| MFA[MFA Gateway]
    API -->|Commit| DB[(Ledger Database)]
```
