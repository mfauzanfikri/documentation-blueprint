# Frontend Roadmap - Product Catalog Service
**Repository:** `product-catalog-frontend`
**Latest Specifications Milestone:** `v1.0`

This active roadmap maps high-level user stories to frontend UI and client-side implementation criteria.

| User Story ID | Technical Verification Criteria | Status |
| :--- | :--- | :--- |
| **US-CAT-01** | Define TypeScript interfaces `Category` and `CreateCategoryInput` representing catalog types. | `[x]` |
| **US-CAT-01** | Create a Category Tree view using recursion to display hierarchical relationships up to 3 levels deep. | `[ ]` |
| **US-CAT-01** | Create a "New Category" React modal form using React Hook Form and Zod to validate name/slug constraints. | `[x]` |
| **US-PROD-01** | Design the product list table showing SKU, Name, Base Price, and Category badge. | `[x]` |
| **US-PROD-01** | Create a Product Creation Form with a Category selector dropdown that filters out inactive/soft-deleted categories. | `[ ]` |
| **US-PROD-01** | Add client-side validation logic forcing the user to enter a numeric value > 0 for `base_price` before form submission. | `[x]` |
