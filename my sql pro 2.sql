USE sales_db;
SELECT * FROM employees;

-- Filter data
SELECT * FROM employees WHERE department = 'Sales';
SELECT * FROM employees WHERE sales > 7000;
SELECT * FROM employees WHERE region = 'East';

-- Sort data
SELECT * FROM employees ORDER BY sales DESC;
SELECT * FROM employees ORDER BY salary ASC;
SELECT * FROM employees ORDER BY sales DESC LIMIT 3;

-- Group data
SELECT department, SUM(sales) AS total_sales FROM employees GROUP BY department;
SELECT department, AVG(salary) AS avg_salary FROM employees GROUP BY department;
SELECT department, COUNT(*) AS total_employees FROM employees GROUP BY department;
SELECT region, MAX(sales) AS highest_sales FROM employees GROUP BY region;chat
-- Having
SELECT department, SUM(sales) AS total_sales FROM employees GROUP BY department HAVING SUM(sales) > 20000;
SELECT department, COUNT(*) AS total_employees FROM employees GROUP BY department HAVING COUNT(*) > 2;
SELECT department, AVG(salary) AS avg_salary FROM employees GROUP BY department HAVING AVG(salary) > 45000;

-- Combined WHERE and GROUP BY
SELECT department, SUM(sales) AS total_sales FROM employees WHERE region IN ('East', 'West') GROUP BY department;
SELECT department, AVG(rating) AS avg_rating FROM employees WHERE salary > 45000 GROUP BY department;
SELECT region, COUNT(*) AS total_employees FROM employees WHERE department IN ('Sales', 'Marketing') GROUP BY region;
SELECT * FROM employees;
USE sales_db;

USE sales_db;

CREATE TABLE departments (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(50),
    location VARCHAR(50),
    budget INT
);
INSERT INTO departments VALUES
(1, 'Sales', 'Mumbai', 500000),
(2, 'Marketing', 'Delhi', 750000),
(3, 'HR', 'Bangalore', 300000);
select * from departments;
select e.name, e.department, e.sales, e.salary, e.rating, d.location, d.budget
from employees e join departments d 
on e.department =  d.dept_name;
SELECT e.name, e.department, e.sales, d.location
FROM employees e
INNER JOIN departments d
ON e.department = d.dept_name;
SELECT e.name, e.department, e.sales, d.location
FROM employees e
LEFT JOIN departments d
ON e.department = d.dept_name;
SELECT e.name, e.department, e.sales, d.location
FROM employees e
RIGHT JOIN departments d
ON e.department = d.dept_name;
INSERT INTO employees (name, department, region, sales, salary, rating)
VALUES ('TestUser', 'Finance', 'East', 4000, 42000, 4.0);
select * from employees;
SELECT e.name, e.department, d.location
FROM employees e
INNER JOIN departments d
ON e.department = d.dept_name;
SELECT e.name, e.department, d.location
FROM employees e
LEFT JOIN departments d
ON e.department = d.dept_name;
DELETE FROM employees WHERE name = 'TestUser';
SELECT * FROM employees;
SET SQL_SAFE_UPDATES = 0;
DELETE FROM employees WHERE name = 'TestUser';
SELECT * FROM employees;
set sql_safe_updates = 0;
CREATE DATABASE company_db;
USE company_db;
CREATE TABLE departments (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(50),
    location VARCHAR(50),
    budget INT
);
desc departments;
INSERT INTO departments VALUES
(1, 'Sales', 'Mumbai', 500000),
(2, 'Marketing', 'Delhi', 750000),
(3, 'HR', 'Bangalore', 300000),
(4, 'Finance', 'Chennai', 450000);
select * from departments;
CREATE TABLE employees (
    emp_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50),
    dept_id INT,
    region VARCHAR(50),
    sales INT,
    salary INT,
    rating DECIMAL(3,1),
    FOREIGN KEY (dept_id) REFERENCES departments(dept_id)
);
desc employees;

INSERT INTO employees (name, dept_id, region, sales, salary, rating)
VALUES
('John',  1, 'East',  5000, 45000, 4.2),
('Priya', 2, 'West',  8000, 52000, 4.8),
('Ravi',  1, 'North', 6500, 48000, 4.5),
('Sneha', 3, 'South', 3000, 38000, 3.8),
('Kiran', 2, 'East',  9000, 55000, 4.9),
('Amit',  1, 'West',  7200, 50000, 4.6),
('Sara',  3, 'North', 2800, 36000, 3.7),
('Raj',   2, 'South', 8500, 53000, 4.8),
('Neha',  1, 'East',  6000, 46000, 4.3),
('Vijay', 3, 'West',  3500, 39000, 3.9);
select * from employees;
SELECT e.name, e.region, e.sales, e.salary, e.rating,
       d.dept_name, d.location, d.budget
FROM employees e
INNER JOIN departments d
ON e.dept_id = d.dept_id;
SELECT d.dept_name, SUM(e.sales) AS total_sales
FROM employees e
INNER JOIN departments d
ON e.dept_id = d.dept_id
GROUP BY d.dept_name
ORDER BY total_sales DESC;
SELECT d.dept_name, AVG(e.salary) AS avg_salary
FROM employees e
INNER JOIN departments d
ON e.dept_id = d.dept_id
GROUP BY d.dept_name
ORDER BY avg_salary DESC;
SELECT e.name, d.dept_name, e.sales, e.rating
FROM employees e
INNER JOIN departments d
ON e.dept_id = d.dept_id
ORDER BY e.sales DESC
LIMIT 3;
SELECT d.dept_name, SUM(e.sales) AS total_sales
FROM employees e
INNER JOIN departments d
ON e.dept_id = d.dept_id
GROUP BY d.dept_name
HAVING SUM(e.sales) > 20000;
USE company_db;
SELECT d.dept_name, d.location, e.name, e.sales
FROM departments d
LEFT JOIN employees e
ON d.dept_id = e.dept_id;
USE company_db;
SELECT d.dept_name, d.location, e.name, e.sales
FROM departments d
LEFT JOIN employees e
ON d.dept_id = e.dept_id;