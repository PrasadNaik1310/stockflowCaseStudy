





# Part 2: Database Design



## Schema Overview

### Company
- id (PK)
- name

### Warehouse
- id (PK)
- company_id (FK)
- name
- location

### Product
- id (PK)
- name
- sku (UNIQUE)
- price (DECIMAL)

### Inventory
- id (PK)
- product_id (FK)
- warehouse_id (FK)
- quantity
- last_updated

### Supplier
- id (PK)
- name
- contact_email

### ProductSupplier
- product_id (FK)
- supplier_id (FK)

### Bundle
- id (PK)
- name

### BundleItems
- bundle_id (FK)
- product_id (FK)
- quantity

---

## Design Decisions

- Used a relational database to ensure strong consistency
- Inventory is separated to support multiple warehouses
- SKU is globally unique to prevent duplication
- Many-to-many relationships handled using join tables
- Indexed foreign keys for faster queries

---

## Why Not NoSQL?

I considered using a document database, but inventory systems require strong consistency and frequent joins (products, warehouses, suppliers), making relational design more suitable.

---

## Missing Requirements

- Definition of "recent sales"
- Threshold configuration per product
- Supplier-product cardinality
- Bundle stock calculation rules