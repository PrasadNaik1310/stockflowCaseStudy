class Product:
    id: int
    name: str
    sku: str
    price: float

class Inventory:
    product_id: int
    warehouse_id: int
    quantity: int