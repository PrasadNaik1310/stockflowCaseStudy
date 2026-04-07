# Part 1: Code Review & Debugging

## Issues Identified

### 1. No Transaction Handling
The product and inventory are committed separately.

**Impact:**  
If inventory creation fails after product creation, the database will be left in an inconsistent state.

---

### 2. SKU Not Unique
There is no validation or constraint to ensure SKU uniqueness.

**Impact:**  
Duplicate SKUs can break product identification and inventory tracking.

---

### 3. Incorrect Warehouse Design
The product is directly linked to a warehouse.

**Impact:**  
This violates the requirement that products can exist in multiple warehouses.

---

### 4. No Input Validation
The API directly accesses request data without validation.

**Impact:**  
Missing fields will cause runtime errors.

---

### 5. Price Handling
Price is not enforced as a decimal.

**Impact:**  
This can lead to precision issues in financial calculations.

---

### 6. No Error Handling
There is no rollback mechanism.

**Impact:**  
Failures can leave partial data in the system.

---

## Fixed Implementation


@app.route('/api/products', methods=['POST'])
def create_product():
    data = request.json

    try:
        required_fields = ['name', 'sku', 'price', 'warehouse_id', 'initial_quantity']
        for field in required_fields:
            if field not in data:
                return {"error": f"{field} is required"}, 400

        existing = Product.query.filter_by(sku=data['sku']).first()
        if existing:
            return {"error": "SKU already exists"}, 400

        product = Product(
            name=data['name'],
            sku=data['sku'],
            price=float(data['price'])
        )
        db.session.add(product)
        db.session.flush()

        inventory = Inventory(
            product_id=product.id,
            warehouse_id=data['warehouse_id'],
            quantity=data['initial_quantity']
        )
        db.session.add(inventory)

        db.session.commit()

        return {"message": "Product created", "product_id": product.id}, 201

    except Exception as e:
        db.session.rollback()
        return {"error": str(e)}, 500