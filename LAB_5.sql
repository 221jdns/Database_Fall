CREATE DATABASE LAB5;

CREATE TABLE customers(
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(50),
    city VARCHAR(50),
    grade INT,
    salesman_id INT
);
INSERT INTO customers (customer_id, customer_name, city, grade, salesman_id) VALUES
(3002, 'Nick Rimando', 'New York', 100, 5001),
(3005, 'Graham Zusi', 'California', 200, 5002),
(3001, 'Brad Guzan', 'London', 100, 5005),
(3004, 'Fabian Johns', 'Paris', 300, 5006),
(3007, 'Brad Davis', 'New York', 200, 5001),
(3009, 'Geoff Camero', 'Berlin', 100, 5003),
(3008, 'Julian Green', 'London', 300, 5002);


CREATE TABLE orders (
    ord_no INT PRIMARY KEY,
    purchase_amt DECIMAL(10, 2),
    ord_date DATE,
    customer_id INT,
    salesman_id INT
);

INSERT INTO orders (ord_no, purchase_amt, ord_date, customer_id, salesman_id) VALUES
(70001, 150.5, '2012-10-05', 3005, 5002),
(70009, 270.65, '2012-09-15', 3001, 5005),
(70002, 65.26, '2012-10-10', 3005, 5001),
(70004, 110.5, '2012-08-17', 3009, 5003),
(70007, 948.5, '2012-09-27', 3007, 5001),
(70005, 2400.6, '2012-07-27', 3007, 5001),
(70008, 5760, '2012-09-10', 3002, 5001);


CREATE TABLE salesman (
    salesman_id INT PRIMARY KEY,
    name VARCHAR(50),
    city VARCHAR(50),
    commission DECIMAL(3, 2)
);

INSERT INTO salesman (salesman_id, name, city, commission) VALUES
(5001, 'James Hoog', 'New York', 0.15),
(5002, 'Nail Knite', 'Paris', 0.13),
(5005, 'Pit Alex', 'London', 0.11),
(5006, 'Mc Lyon', 'Paris', 0.14),
(5003, 'Lauson Hen', 'Berlin', 0.12),
(5007, 'Paul Adam', 'Rome', 0.13);


SELECT SUM(purchase_amt) AS total_purchase_amount FROM orders;

SELECT AVG(purchase_amt) AS avg_purchase_amount FROM orders;

SELECT COUNT(customer_name) AS customer_count FROM customers WHERE customer_name IS NOT NULL;

SELECT MIN(purchase_amt) AS minimum_purchase_amt FROM orders;

SELECT * FROM customers WHERE customer_name LIKE '%b';

SELECT * FROM orders WHERE customer_id IN (SELECT customer_id FROM customers WHERE city = 'New York');

SELECT * FROM customers WHERE customer_id IN( SELECT customer_id FROM orders WHERE purchase_amt > 10);

SELECT SUM(grade) AS total_grade FROM customers;

SELECT customer_name FROM customers WHERE customer_name IS NOT NULL;

SELECT MAX(grade) AS max_grade FROM customers;






