# Part 3: API Design

## Endpoint

GET /api/companies/{company_id}/alerts/low-stock

---

## Approach

1. Fetch all warehouses for the company  
2. Aggregate stock across warehouses  
3. Filter products where stock < threshold  
4. Filter products with recent sales  
5. Join supplier data  

---

## Pseudo Implementation


def get_low_stock_alerts(company_id):
    # Fetch warehouses
    # Join inventory and products
    # Aggregate stock per product
    # Apply threshold filter
    # Filter based on recent sales
    # Attach supplier info
    pass