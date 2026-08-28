CREATE DATABASE ecommerce_analytics;

USE ecommerce_analytics;

-- customers-- 
CREATE TABLE Customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100),
    city VARCHAR(50),
    signup_date DATE
);

-- products--  
CREATE TABLE Products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    category VARCHAR(50),
    price DECIMAL(10,2)
);

-- Orders-- 
CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    status VARCHAR(20),

    FOREIGN KEY (customer_id)
    REFERENCES Customers(customer_id)
);



-- Order_Items-- 
CREATE TABLE Order_Items (
    order_id INT,
    product_id INT,
    quantity INT,
    discount DECIMAL(5,2),

    PRIMARY KEY (order_id, product_id),

    FOREIGN KEY (order_id)
    REFERENCES Orders(order_id),

    FOREIGN KEY (product_id)
    REFERENCES Products(product_id)
);