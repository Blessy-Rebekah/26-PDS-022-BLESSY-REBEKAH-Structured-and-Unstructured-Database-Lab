-- ==========================================
-- 1. Function: Get Annual Salary Calculation
-- ==========================================
DELIMITER // 

CREATE FUNCTION GetAnnualSalary(monthly_salary DECIMAL(10,2)) 
RETURNS DECIMAL(12,2) 
DETERMINISTIC 
BEGIN 
    RETURN monthly_salary * 12; 
END // 

DELIMITER ; 

-- Query annual salary for employees
SELECT 
    emp_name, 
    salary AS monthly_salary, 
    GetAnnualSalary(salary) AS annual_salary 
FROM Employee; 

-- ==========================================
-- 2. Function: Calculate Employee Bonus (10%)
-- ==========================================
DELIMITER // 

CREATE FUNCTION CalculateBonus(salary DECIMAL(10,2)) 
RETURNS DECIMAL(10,2) 
DETERMINISTIC 
BEGIN 
    RETURN salary * 0.10; 
END // 

DELIMITER ; 

-- Query calculated bonus for employees
SELECT 
    emp_name, 
    salary, 
    CalculateBonus(salary) AS bonus 
FROM Employee; 

-- ==========================================
-- 3. Function: Generate Standardized Employee Code
-- ==========================================
DELIMITER // 

CREATE FUNCTION GenerateEmployeeCode(emp_id INT) 
RETURNS VARCHAR(20) 
DETERMINISTIC 
BEGIN 
    RETURN CONCAT('EMP-', LPAD(emp_id, 4, '0')); 
END // 

DELIMITER ; 

-- Query padded employee codes
SELECT 
    emp_id, 
    emp_name, 
    GenerateEmployeeCode(emp_id) AS employee_code 
FROM Employee;
