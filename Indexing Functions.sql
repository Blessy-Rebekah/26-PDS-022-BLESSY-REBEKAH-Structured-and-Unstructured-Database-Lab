-- ==========================================
-- 1. Database Selection & Existing Index Inspection
-- ==========================================
USE employeedb; 

-- View existing indexes on the Employee table
SHOW INDEX FROM Employee; 

-- ==========================================
-- 2. Single-Column Index: Department
-- ==========================================
-- Create single-column B-Tree index on department
CREATE INDEX idx_employee_department 
ON Employee(department); 

-- Query utilizing department index
SELECT * 
FROM Employee 
WHERE department = 'IT'; 

-- ==========================================
-- 3. Single-Column Index: Salary
-- ==========================================
-- Create single-column index on salary
CREATE INDEX idx_employee_salary 
ON Employee(salary); 

-- Query utilizing salary index for range filtering
SELECT * 
FROM Employee 
WHERE salary > 50000; 

-- ==========================================
-- 4. Composite (Multi-Column) Index
-- ==========================================
-- Create composite index on department and salary
CREATE INDEX idx_department_salary 
ON Employee(department, salary); 

-- Query utilizing composite index for multi-condition filtering
SELECT * 
FROM Employee 
WHERE department = 'IT' 
  AND salary > 50000;
