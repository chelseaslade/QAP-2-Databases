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
    UNIQUE id
);

--Customers
CREATE TABLE customers (
    id serial NOT NULL PRIMARY KEY,
    first_name varchar(100),
    last_name varchar(100),
    email varchar(200),
    UNIQUE id
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
    FOREIGN KEY order_id REFERENCES orders(id),
    FOREIGN KEY product_id REFERENCES products(id),
    PRIMARY KEY (order_id, product_id)
);

--Insert Data

--Retrieve names/stock quantities of all prod.

--Retrieve product names/quantities of one placed order

--Retrieve all orders placed by one customer (ID's & quantities)

--Update to reduce stock quantity after customer order

--Remove an order and associated order items from system

