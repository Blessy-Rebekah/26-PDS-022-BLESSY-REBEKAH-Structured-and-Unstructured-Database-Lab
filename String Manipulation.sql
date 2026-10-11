-- ==========================================
-- 1. Database Selection & Full Table Query
-- ==========================================
USE ahnaf; 

SELECT * FROM Employee; 

-- ==========================================
-- 2. Case Conversion Functions
-- ==========================================
-- Convert employee names to upper case
SELECT 
    emp_name, 
    UPPER(emp_name) AS uppercase_name 
FROM Employee; 

-- Convert employee names to lower case
SELECT 
    emp_name, 
    LOWER(emp_name) AS lowercase_name 
FROM Employee; 

-- ==========================================
-- 3. String Length Functions
-- ==========================================
-- Measure byte length of employee names
SELECT 
    emp_name, 
    LENGTH(emp_name) AS name_length 
FROM Employee; 

-- Measure character length of employee names
SELECT 
    emp_name, 
    CHAR_LENGTH(emp_name) AS character_count 
FROM Employee; 

-- ==========================================
-- 4. String Concatenation & Substring Extraction
-- ==========================================
-- Concatenate employee name and department
SELECT 
    emp_name, 
    department, 
    CONCAT(emp_name, ' - ', department) AS employee_details 
FROM Employee; 

-- Extract first 5 characters using LEFT()
SELECT 
    emp_name, 
    LEFT(emp_name, 5) AS first_five_characters 
FROM Employee; 

-- Extract last 5 characters using RIGHT()
SELECT 
    emp_name, 
    RIGHT(emp_name, 5) AS last_five_characters 
FROM Employee; 

-- Extract 5 characters starting at index 1 using SUBSTRING()
SELECT 
    emp_name, 
    SUBSTRING(emp_name, 1, 5) AS extracted_name 
FROM Employee; 

-- ==========================================
-- 5. Pattern Location & Search Functions
-- ==========================================
-- Locate position of letter 'a' using INSTR()
SELECT 
    emp_name, 
    INSTR(emp_name, 'a') AS position 
FROM Employee; 

-- Locate position of letter 'a' using LOCATE()
SELECT 
    emp_name, 
    LOCATE('a', emp_name) AS position 
FROM Employee; 

-- ==========================================
-- 6. String Manipulation & Padding
-- ==========================================
-- Replace specific sub-string ('Kumar' -> 'K.')
SELECT 
    emp_name, 
    REPLACE(emp_name, 'Kumar', 'K.') AS modified_name 
FROM Employee; 

-- Reverse characters in employee names
SELECT 
    emp_name, 
    REVERSE(emp_name) AS reversed_name 
FROM Employee; 

-- Left-pad employee ID with leading zeros (width: 5)
SELECT 
    emp_id, 
    LPAD(emp_id, 5, '0') AS formatted_id 
FROM Employee; 

-- Right-pad employee names with trailing dots (width: 20)
SELECT 
    emp_name, 
    RPAD(emp_name, 20, '.') AS formatted
