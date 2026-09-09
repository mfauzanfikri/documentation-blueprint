# Functional Requirements Document (FRD) - Finance Domain

**Specification Boundary:** Finance
**Document ID:** FRD-FIN-001
**Scoped Scope:** Product 1.0 (Collapsed MVP Mode)
**Product Version:** 1.0
**Status:** Approved

---

## 1. Overview & Scoped Features

This document specifies the exact functional behavior and security assertions for features scoped within the Finance Domain for **Product Version 1.0**:
* **F-FIN-001 v1:** Multi-Factor Ledger Adjustments

---

## 2. Functional Requirements

### Feature: F-FIN-001 Multi-Factor Ledger Adjustments (v1)

#### FR-FIN-001-01: Secondary MFA Ledger Challenge
* **Description:** When an accountant initiates an adjustment to a posted ledger entry, the system must trigger an MFA challenge and block persistence until valid code verification.
* **Trigger:** POST /api/ledger/adjustments
* **Validation Rules:**
  1. Inspect incoming session for fresh MFA token (< 5 minutes).
  2. If missing, prompt with TOTP / WebAuthn challenge.
  3. Block database mutation until challenge is answered.
* **Output / Response:** HTTP 200 with updated ledger balance, or HTTP 401 with MFA required header.
