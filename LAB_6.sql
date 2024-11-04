CREATE DATABASE LAB6;

CREATE TABLE locations
(
    location_id    SERIAL PRIMARY KEY,
    street_address VARCHAR(25),
    postal_code    VARCHAR(12),
    city           VARCHAR(30),
    state_province VARCHAR(12)
);

CREATE TABLE departments
(
    department_id    SERIAL PRIMARY KEY,
    department_name VARCHAR(50) UNIQUE,
    budget           INTEGER,
    location_id      INTEGER REFERENCES locations
);

CREATE TABLE employees
(
    employee_id   SERIAL PRIMARY KEY,
    first_name    VARCHAR(50),
    last_name     VARCHAR(50),
    email         VARCHAR(50),
    phone_number  VARCHAR(20),
    salary        INTEGER,
    department_id INTEGER REFERENCES departments
);

SELECT first_name, last_name, department_name, departments.department_id
FROM employees
LEFT JOIN departments
ON employees.department_id = departments.department_id;

SELECT e.first_name, e.last_name, e.department_id, d.department_name
FROM employees e
LEFT JOIN departments d
ON e.department_id = d.department_id BETWEEN 40 AND 80;

SELECT first_name, last_name, d.department_name, l.city, l.state_province
FROM employees e
LEFT JOIN departments d
    ON e.department_id = d.department_id
LEFT JOIN locations l
ON d.location_id = l.location_id;

SELECT department_name
FROM departments d
LEFT JOIN employees e
ON d.department_id = e.department_id;

SELECT e.first_name, e.last_name, e.department_id, d.department_name
FROM employees e
LEFT JOIN departments d
ON e.department_id = d.department_id;




