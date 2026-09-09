# Architecture Spec - Inventory Domain
**Specification Boundary:** Inventory

---

## 1. Boundary Integrations
The inventory domain interfaces with the physical inventory hardware devices and logs access control events to the audit service.

```mermaid
flowchart LR
    User[Warehouse User] -->|Adjust Stock| API[Inventory Service]
    API -->|Authorize| Auth[Audit Service]
    API -->|Write| DB[(Inventory Database)]
```
