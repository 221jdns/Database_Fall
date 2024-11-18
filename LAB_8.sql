CREATE DATABASE LAB_8;

CREATE TABLE salesman (
    salesman_id INTEGER PRIMARY KEY,
    name VARCHAR(50),
    city VARCHAR(50),
    commission REAL
);

CREATE TABLE customer (
    customer_id INTEGER PRIMARY KEY,
    customer_name VARCHAR(50),
    city VARCHAR(50),
    grade INTEGER,
    salesman_id INTEGER,
    FOREIGN KEY (salesman_id) REFERENCES salesman(salesman_id)
);

CREATE TABLE orders (
    ord_no INTEGER PRIMARY KEY,
    purchase_amt REAL,
    ord_date DATE,
    customer_id INTEGER,
    salesman_id INTEGER,
    FOREIGN KEY (customer_id) REFERENCES customer(customer_id),
    FOREIGN KEY (salesman_id) REFERENCES salesman(salesman_id)
);

INSERT INTO salesman (salesman_id, name, city, commission) VALUES
(5001, 'James Hoog', 'New York', 0.15),
(5002, 'Nail Knite', 'Paris', 0.13),
(5005, 'Pit Alex', 'London', 0.11),
(5006, 'Mc Lyon', 'Paris', 0.14),
(5003, 'Lauson Hen', 'London', 0.12),
(5007, 'Paul Adam', 'Rome', 0.13);

INSERT INTO customer (customer_id, customer_name, city, grade, salesman_id) VALUES
(3002, 'Nick Rimando', 'New York', 100, 5001),
(3005, 'Graham Zusi', 'California', 200, 5002),
(3001, 'Brad Guzan', 'London', NULL, 5005),
(3004, 'Fabian Johns', 'Paris', 300, 5006),
(3007, 'Brad Davis', 'New York', 200, 5001),
(3009, 'Geoff Camero', 'Berlin', 100, 5003),
(3008, 'Julian Green', 'London', 300, 5002);

INSERT INTO orders (ord_no, purchase_amt, ord_date, customer_id, salesman_id) VALUES
(70001, 150.5, '2012-10-05', 3005, 5002),
(70009, 270.65, '2012-09-10', 3001, 5005),
(70002, 65.26, '2012-10-05', 3002, 5001),
(70004, 110.5, '2012-08-17', 3009, 5003),
(70007, 948.5, '2012-09-10', 3005, 5002),
(70005, 2400.6, '2012-07-27', 3007, 5001),
(70008, 5760.0, '2012-09-10', 3002, 5001);


CREATE ROLE junior_dev WITH LOGIN PASSWORD '1234';

CREATE VIEW salesmen_in_new_york AS SELECT * FROM salesman WHERE city = 'New York';

CREATE VIEW order_details AS
SELECT orders.ord_no, orders.ord_date, orders.purchase_amt, salesman.name, customer.customer_id
FROM orders
JOIN salesman ON orders.salesman_id = salesman.salesman_id
JOIN customer ON orders.customer_id = customer.customer_id;
GRANT ALL PRIVILEGES ON order_details TO junior_dev;

CREATE VIEW high_grade_customers AS SELECT customer_name FROM customer WHERE grade = (SELECT MAX(grade) FROM customer);
GRANT SELECT ON high_grade_customers TO junior_dev;

CREATE VIEW salesmen_count_per_city AS
SELECT city, COUNT(*) AS num_salesmen
FROM salesman
GROUP BY city;

CREATE VIEW salesman_with_multiple_customers AS
SELECT salesman.salesman_id, salesman.name, COUNT(customer.customer_id) AS customer_count
FROM salesman
JOIN customer ON salesman.salesman_id = customer.salesman_id
GROUP BY salesman.salesman_id, salesman.name
HAVING COUNT(customer.customer_id) > 1;

CREATE ROLE intern;
GRANT junior_dev TO intern;









