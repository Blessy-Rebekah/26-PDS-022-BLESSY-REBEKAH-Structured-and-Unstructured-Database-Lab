-- ==========================================
-- 1. Database Selection & Full Table Inspection
-- ==========================================
USE employeedb; 

SELECT * FROM Employee; 

-- ==========================================
-- 2. Global Aggregate Functions
-- ==========================================
-- Total count of employees
SELECT COUNT(*) AS total_employees 
FROM Employee; 

-- Total salary expenditure
SELECT SUM(salary) AS total_salary 
FROM Employee; 

-- Overall average salary
SELECT AVG(salary) AS average_salary 
FROM Employee; 

-- Highest salary in company
SELECT MAX(salary) AS highest_salary 
FROM Employee; 

-- Lowest salary in company
SELECT MIN(salary) AS lowest_salary 
FROM Employee; 

-- Consolidated summary of overall metrics
SELECT 
    COUNT(*) AS total_employees, 
    SUM(salary) AS total_salary, 
    AVG(salary) AS average_salary, 
    MAX(salary) AS highest_salary, 
    MIN(salary) AS lowest_salary 
FROM Employee; 

-- ==========================================
-- 3. Single-Level Group Aggregations (GROUP BY)
-- ==========================================
-- Employee count by department
SELECT 
    department, 
    COUNT(*) AS employee_count 
FROM Employee 
GROUP BY department; 

-- Total salary payout by department
SELECT 
    department, 
    SUM(salary) AS total_salary 
FROM Employee 
GROUP BY department; 

-- Average salary by department
SELECT 
    department, 
    AVG(salary) AS average_salary 
FROM Employee 
GROUP BY department; 

-- Maximum salary by department
SELECT 
    department, 
    MAX(salary) AS highest_salary 
FROM Employee 
GROUP BY department; 

-- ==========================================
-- 4. Multi-Level Group Aggregations
-- ==========================================
-- Employee count by department and gender
SELECT 
    department, 
    gender, 
    COUNT(*) AS employee_count 
FROM Employee 
GROUP BY department, gender; 

-- Average salary by department and gender
SELECT 
    department, 
    gender, 
    AVG(salary) AS average_salary 
FROM Employee 
GROUP BY department, gender; 

-- ==========================================
-- 5. Filtered Group Aggregations (HAVING & WHERE)
-- ==========================================
-- Departments with more than 2 employees
SELECT 
    department, 
    COUNT(*) AS employee_count 
FROM Employee 
GROUP BY department 
HAVING COUNT(*) > 2; 

-- Departments with total salary exceeding 100,000
SELECT 
    department, 
    SUM(salary) AS total_salary 
FROM Employee 
GROUP BY department 
HAVING SUM(salary) > 100000; 

-- Departments with average salary exceeding 50,000
SELECT 
    department, 
    AVG(salary) AS average_salary 
FROM Employee 
GROUP BY department 
HAVING AVG(salary) > 50000; 

-- IT & Finance departments with average salary exceeding 50,000
SELECT 
    department, 
    COUNT(*) AS employee_count, 
    AVG(salary) AS average_salary 
FROM Employee 
WHERE department IN ('IT', 'Finance') 
GROUP BY department 
HAVING AVG(salary) > 50000;
