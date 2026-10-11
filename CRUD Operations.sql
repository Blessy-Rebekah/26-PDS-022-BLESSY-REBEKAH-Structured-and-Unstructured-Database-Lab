-- ==========================================
-- 1. Database Selection & Table Creation
-- ==========================================
USE employeedb; 

CREATE TABLE Employee ( 
    emp_id INT PRIMARY KEY AUTO_INCREMENT, 
    emp_name VARCHAR(100) NOT NULL, 
    gender VARCHAR(10), 
    department VARCHAR(50), 
    designation VARCHAR(50), 
    salary DECIMAL(10,2), 
    hire_date DATE, 
    city VARCHAR(50), 
    email VARCHAR(100) UNIQUE 
); 

SHOW TABLES; 

-- ==========================================
-- 2. Data Insertion
-- ==========================================
INSERT INTO Employee 
(emp_name, gender, department, designation, salary, hire_date, city, email) 
VALUES 
('Arun Kumar', 'Male', 'IT', 'Software Developer', 55000, '2022-06-15', 'Chennai', 'arun@company.com'), 
('Priya Sharma', 'Female', 'HR', 'HR Executive', 45000, '2021-08-20', 'Bangalore', 'priya@company.com'), 
('Rahul ', 'Male', 'Finance', 'Accountant', 50000, '2023-01-10', 'Chennai', 'rahul@company.com'), 
('Sneha Raj', 'Female', 'IT', 'Data Analyst', 60000, '2022-11-05', 'Vellore', 'sneha@company.com'), 
('Karthik M', 'Male', 'Marketing', 'Marketing Executive', 42000, '2023-03-18', 'Chennai', 'karthik@company.com'), 
('Aisha ', 'Female', 'IT', 'ML Engineer', 75000, '2021-05-12', 'Bangalore', 'aisha@company.com'), 
('Vijay Kumar', 'Male', 'Sales', 'Sales Executive', 40000, '2024-01-25', 'Chennai', 'vijay@company.com'), 
('Divya S', 'Female', 'Finance', 'Financial Analyst', 58000, '2022-09-14', 'Coimbatore', 'divya@company.com'), 
('Jonathan', 'Male', 'IT', 'Backend Developer', 68000, '2023-07-21', 'Vellore', 'irfan@company.com'), 
('Meena Devi', 'Female', 'HR', 'HR Manager', 70000, '2020-04-10', 'Chennai', 'meena@company.com'); 

-- Display full table
SELECT * FROM Employee; 

-- ==========================================
-- 3. Data Querying & Filtering
-- ==========================================
-- Filter employees in IT department
SELECT * 
FROM Employee 
WHERE department = 'IT'; 

-- Filter employees with salary above 50,000
SELECT emp_name, department, salary 
FROM Employee 
WHERE salary > 50000; 

-- ==========================================
-- 4. Data Manipulation (UPDATE & DELETE)
-- ==========================================
-- Update salary for emp_id 4
UPDATE Employee 
SET salary = 65000 
WHERE emp_id = 4; 

-- Update department & designation for emp_id 4
UPDATE Employee 
SET department = 'Data Science', 
    designation = 'Data Scientist' 
WHERE emp_id = 4; 

-- Delete record for emp_id 10
DELETE FROM Employee 
WHERE emp_id = 10; 

-- ==========================================
-- 5. CTAS (Create Table As Select) Operations
-- ==========================================
-- Create subset table for IT employees
CREATE TABLE IT_Employees AS 
SELECT * 
FROM Employee 
WHERE department = 'IT'; 

SELECT * FROM IT_Employees; 

-- Create subset table for High Salary employees
CREATE TABLE High_Salary_Employees AS 
SELECT emp_id, emp_name, department, salary 
FROM Employee 
WHERE salary >= 60000; 

SELECT * FROM High_Salary_Employees; 

-- ==========================================
-- 6. Common Table Expression (CTE) Query
-- ==========================================
WITH AverageSalary AS ( 
    SELECT AVG(salary) AS avg_salary 
    FROM Employee 
) 
SELECT 
    emp_id, 
    emp_name, 
    department, 
    salary 
FROM Employee; 

-- ==========================================
-- 7. Temporary Tables & Database Backup
-- ==========================================
-- Create temporary working table
CREATE TEMPORARY TABLE Temp_Employee AS 
SELECT * 
FROM Employee 
WHERE salary > 50000; 

-- Create full structural clone & backup dataset
CREATE TABLE Employee_Backup LIKE Employee; 

INSERT INTO Employee_Backup 
SELECT * 
FROM Employee; 

-- Final inspection of primary dataset
SELECT * FROM Employee;
