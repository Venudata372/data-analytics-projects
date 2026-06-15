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