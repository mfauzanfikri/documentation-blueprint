# Functional Requirements Document (FRD) - Inventory Domain

**Specification Boundary:** Inventory
**Document ID:** FRD-INV-001
**Scoped Scope:** Product 1.0 (Collapsed MVP Mode)
**Product Version:** 1.0
**Status:** Approved

---

## 1. Overview & Scoped Features

This document specifies the exact functional behavior and security assertions for features scoped within the Inventory Domain for **Product Version 1.0**:
* **F-INV-001 v1:** Warehouse Role-Based Access Control

---

## 2. Functional Requirements

### Feature: F-INV-001 Warehouse Role-Based Access Control (v1)

#### FR-INV-001-01: Stock Room Adjustment Authorization
* **Description:** The system must reject stock adjustments from users without the `warehouse_manager` role and emit an immutable audit record.
* **Trigger:** Stock level adjustment attempt via backend API or warehouse terminal.
* **Validation Rules:**
  1. Inspect caller claims for role `warehouse_manager`.
  2. If missing or invalid, reject immediately with HTTP 403 Forbidden.
  3. Publish security audit event to the internal audit stream.
* **Output / Response:** Standard HTTP 200 on success, or HTTP 403 Forbidden with security error payload.
