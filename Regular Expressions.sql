-- ==========================================
-- 1. Database Selection
-- ==========================================
USE employeedb; 

-- ==========================================
-- 2. Basic Character Positional Matching
-- ==========================================
-- Names starting with 'A'
SELECT 
    emp_id, 
    emp_name, 
    department 
FROM Employee 
WHERE emp_name REGEXP '^A'; 

-- Names ending with 'a'
SELECT 
    emp_id, 
    emp_name 
FROM Employee 
WHERE emp_name REGEXP 'a$'; 

-- Names containing the sequence 'an'
SELECT 
    emp_id, 
    emp_name 
FROM Employee 
WHERE emp_name REGEXP 'an'; 

-- ==========================================
-- 3. Character Sets & Range Matching
-- ==========================================
-- Names starting with either 'A' or 'S'
SELECT 
    emp_id, 
    emp_name 
FROM Employee 
WHERE emp_name REGEXP '^[AS]'; 

-- Names starting with any uppercase letter (A-Z)
SELECT 
    emp_id, 
    emp_name 
FROM Employee 
WHERE emp_name REGEXP '^[A-Z]'; 

-- Names consisting exclusively of alphabetic characters and spaces
SELECT 
    emp_id, 
    emp_name 
FROM Employee 
WHERE emp_name REGEXP '^[A-Za-z ]+$'; 

-- ==========================================
-- 4. Pattern Validation & Multi-Value Alternation
-- ==========================================
-- Valid email address format validation
SELECT 
    emp_id, 
    emp_name, 
    email 
FROM Employee 
WHERE email REGEXP '^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}$'; 

-- Cities matching either 'Chennai' or 'Bangalore'
SELECT 
    emp_id, 
    emp_name, 
    city 
FROM Employee 
WHERE city REGEXP '^(Chennai|Bangalore)$';
