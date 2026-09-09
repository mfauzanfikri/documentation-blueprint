# Technical Standards - Product Catalog Service

**Version:** 1.0
**Status:** Active

This document defines authoritative, workspace-wide technical standards that all execution boundary implementations must follow.

---

## 1. API Conventions
* **URI Formatting:** Lowercase, plural nouns for resources (e.g., `/api/categories`, `/api/products`).
* **HTTP Status Codes:**
  - `200 OK`: Successful retrieval or modification.
  - `201 Created`: Resource successfully persisted.
  - `400 Bad Request`: Malformed JSON or syntax errors.
  - `409 Conflict`: Unique constraint violation (e.g., duplicate slug or SKU).
  - `422 Unprocessable Entity`: Semantic validation failure (e.g., negative price, category depth > 3).
  - `500 Internal Server Error`: Unhandled server exception.
* **Standard Error Payload:**
  ```json
  {
    "error": {
      "code": "VALIDATION_FAILED",
      "message": "The submitted payload failed validation",
      "details": [
        { "field": "base_price", "issue": "Price must be greater than zero" }
      ],
      "correlation_id": "req-987654"
    }
  }
  ```

## 2. Input Validation Rules
* Route parameters and request bodies must be validated at the transport boundary using NestJS DTO class-validators.
* Raw un-sanitized strings must never reach database query builders.

## 3. Reliability & Idempotency Rules
* Any POST endpoint creating catalog master records accepts an optional `Idempotency-Key` header.
* Duplicate submissions within 60 seconds with identical idempotency keys return the cached 201 response.
