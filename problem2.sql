--QAP 2: SQL & PostgreSQL Mastery
--Problem 2: Online Store Inventory & Order System
--Author: Chelsea Slade (Mayne)
--Due: October 14, 2024

--Create Tables
--Products
CREATE TABLE products (
    id serial NOT NULL PRIMARY KEY,
    product_name varchar(100),
    price bigint, --price in cents
    stock_quantity int,
    UNIQUE (id)
);

--Customers
CREATE TABLE customers (
    id serial NOT NULL PRIMARY KEY,
    first_name varchar(100),
    last_name varchar(100),
    email varchar(200),
    UNIQUE (id)
);

--Orders
CREATE TABLE orders (
    id serial NOT NULL PRIMARY KEY,
    customer_id int,
    order_date DATE,
    FOREIGN KEY (customer_id) REFERENCES customers(id)
);

--Order Items
CREATE TABLE order_items (
    order_id int,
    product_id int,
    quantity int,
    FOREIGN KEY (order_id) REFERENCES orders(id),
    FOREIGN KEY (product_id) REFERENCES products(id),
    PRIMARY KEY (order_id, product_id)
);

--Insert Data
INSERT INTO products (product_name, price, stock_quantity)
VALUES
('Spooky Candle', 899, 5),
('Candy Floss Candle', 699, 10),
('Mini Apple Berry Candle', 399, 15),
('Vanilla Bean Wax Melts', 899, 3),
('Frosted Large Candle Holder', 1299, 5);

INSERT INTO customers (first_name, last_name, email)
VALUES
('Martha', 'Lewis', 'marthalewis@example.com'),
('Cindi', 'Jackson', 'cindijackson@example.com'),
('Ron', 'Jackson', 'ronjackson@example.com'),
('Genevieve', 'Dubois', 'gendubois@example.com');

INSERT INTO orders (customer_id, order_date)
VALUES
(1, '2024-04-20'),
(1, '2024-06-26'),
(2, '2024-01-12'),
(3, '2022-11-03'),
(4, '2024-05-04');

INSERT INTO order_items (order_id, product_id, quantity)
VALUES
(1, 1, 1),
(1, 5, 1),
(2, 3, 3),
(2, 2, 1),
(3, 4, 1),
(4, 2, 1),
(5, 5, 1),
(5, 2, 1);

--Retrieve names/stock quantities of all prod.
SELECT product_name, stock_quantity
FROM products;

--Retrieve product names/quantities of one placed order
SELECT product_name, quantity
FROM order_items
JOIN products ON products.id = product_id
WHERE order_id = 1;

--Retrieve all orders placed by one customer (ID's & quantities)
SELECT order_id, product_id, quantity
FROM orders
JOIN order_items ON order_items.order_id = orders.id
WHERE customer_id = 1;

--Update to reduce stock quantity after customer order
UPDATE products
SET stock_quantity = stock_quantity - order_items.quantity
FROM order_items
WHERE products.id = order_items.product_id
AND order_id = 4;

--Remove an order and associated order items from system
--Delete order items values first
DELETE FROM order_items
WHERE order_id = 4;

--Delete from orders second
DELETE FROM orders 
WHERE id = 4;
