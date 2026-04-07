CREATE TABLE product (
    id SERIAL PRIMARY KEY,
    name TEXT,
    sku TEXT UNIQUE,
    price DECIMAL
);

CREATE TABLE warehouse (
    id SERIAL PRIMARY KEY,
    company_id INT,
    name TEXT
);

CREATE TABLE inventory (
    id SERIAL PRIMARY KEY,
    product_id INT REFERENCES product(id),
    warehouse_id INT REFERENCES warehouse(id),
    quantity INT
);