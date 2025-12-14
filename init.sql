CREATE TABLE sales (
    id SERIAL PRIMARY KEY,
    product_name VARCHAR(100),
    amount INTEGER,
    currency VARCHAR(10),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO sales (product_name, amount, currency) VALUES
('Laptop', 50000, 'INR'),
('Headphones', 3000, 'INR'),
('Keyboard', 1500, 'INR');
INSERT INTO sales (product_name, amount, currency) VALUES ('Mouse', 700, 'INR');
INSERT INTO sales (product_name, amount, currency) VALUES ('Monitor', 12000, 'INR');


