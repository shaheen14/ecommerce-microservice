CREATE TABLE sales (
    id SERIAL PRIMARY KEY,
    product_name VARCHAR(100),
    amount INTEGER,
    currency VARCHAR(10)
);

INSERT INTO sales (product_name, amount, currency) VALUES
('Laptop', 50000, 'INR'),
('Headphones', 3000, 'INR'),
('Keyboard', 1500, 'INR');

