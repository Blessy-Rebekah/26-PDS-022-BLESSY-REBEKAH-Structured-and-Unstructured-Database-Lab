-- ==========================================
-- 1. Global Ranking Window Functions
-- ==========================================
-- Sequential row numbering across all employees ordered by salary descending
SELECT 
    emp_id, 
    emp_name, 
    department, 
    salary, 
    ROW_NUMBER() OVER ( 
        ORDER BY salary DESC 
    ) AS row_num 
FROM Employee; 

-- Standard rank with gaps for tied salaries
SELECT 
    emp_id, 
    emp_name, 
    department, 
    salary, 
    RANK() OVER ( 
        ORDER BY salary DESC 
    ) AS salary_rank 
FROM Employee; 

-- Dense rank without gaps for tied salaries
SELECT 
    emp_id, 
    emp_name, 
    department, 
    salary, 
    DENSE_RANK() OVER ( 
        ORDER BY salary DESC 
    ) AS salary_rank 
FROM Employee; 

-- ==========================================
-- 2. Partitioned Ranking Window Functions
-- ==========================================
-- Salary rank within each department
SELECT 
    emp_id, 
    emp_name, 
    department, 
    salary, 
    RANK() OVER ( 
        PARTITION BY department 
        ORDER BY salary DESC 
    ) AS department_rank 
FROM Employee; 

-- Sequential row number within each department
SELECT 
    emp_id, 
    emp_name, 
    department, 
    salary, 
    ROW_NUMBER() OVER ( 
        PARTITION BY department 
        ORDER BY salary DESC 
    ) AS department_row_number 
FROM Employee; 

-- ==========================================
-- 3. Cumulative & Partitioned Aggregations
-- ==========================================
-- Cumulative (running) total of salaries ordered by emp_id
SELECT 
    emp_id, 
    emp_name, 
    salary, 
    SUM(salary) OVER ( 
        ORDER BY emp_id 
    ) AS running_total 
FROM Employee; 

-- Total departmental salary output alongside each individual record
SELECT 
    emp_id, 
    emp_name, 
    department, 
    salary, 
    SUM(salary) OVER ( 
        PARTITION BY department 
    ) AS department_total_salary 
FROM Employee;
