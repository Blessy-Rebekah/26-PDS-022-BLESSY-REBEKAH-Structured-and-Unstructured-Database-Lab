-- ==========================================
-- 1. Database Selection
-- ==========================================
USE employeedb; 

-- ==========================================
-- 2. Subqueries with Aggregate Comparisons
-- ==========================================
-- Employees earning above the overall average salary
SELECT * 
FROM Employee 
WHERE salary > (SELECT AVG(salary) FROM Employee); 

-- Employee(s) receiving the absolute maximum salary
SELECT * 
FROM Employee 
WHERE salary = (SELECT MAX(salary) FROM Employee); 

-- Employee(s) receiving the absolute minimum salary
SELECT 
    emp_id, 
    emp_name, 
    department, 
    salary 
FROM Employee 
WHERE salary = ( 
    SELECT MIN(salary) 
    FROM Employee 
); 

-- ==========================================
-- 3. Subquery Matching Dynamic Attributes
-- ==========================================
-- Employees belonging to the same department as 'Arun Kumar'
SELECT * 
FROM Employee 
WHERE department = ( 
    SELECT department 
    FROM Employee 
    WHERE emp_name = 'Arun Kumar' 
);
