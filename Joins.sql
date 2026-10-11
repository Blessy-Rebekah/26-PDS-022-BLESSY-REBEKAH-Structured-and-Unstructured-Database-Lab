USE ahnaf; 
 
CREATE TABLE Department ( 
    dept_id INT PRIMARY KEY AUTO_INCREMENT, 
    department VARCHAR(50), 
    manager_name VARCHAR(100), 
    location VARCHAR(50) 
); 
 
INSERT INTO Department 
(department, manager_name, location) 
VALUES 
('IT', 'Rajesh Kumar', 'Chennai'), 
('HR', 'Meena Devi', 'Bangalore'), 
('Finance', 'Suresh Kumar', 'Chennai'), 
('Marketing', 'Anitha Raj', 'Vellore'), 
('Sales', 'Vijay Anand', 'Chennai'), 
('Data Science', 'Fathima Khan', 'Bangalore'); 
 
 
SELECT 
    e.emp_id, 
    e.emp_name, 
    e.department, 
    e.salary, 
    d.manager_name, 
    d.location 
FROM Employee e 
INNER JOIN Department d 
    ON e.department = d.department; 
 
 
 
SELECT 
    e.emp_id, 
    e.emp_name, 
    e.department, 
    d.manager_name, 
    d.location 
FROM Employee e 
LEFT JOIN Department d 
    ON e.department = d.department; 
 
 
 
SELECT 
    e.emp_id, 
    e.emp_name, 
    d.department, 
    d.manager_name, 
    d.location 
FROM Employee e 
RIGHT JOIN Department d 
    ON e.department = d.department; 
 
 
 
SELECT 
    e.emp_id, 
    e.emp_name, 
    e.department, 
    d.manager_name 
FROM Employee e 
LEFT JOIN Department d 
    ON e.department = d.department 
 
UNION 
 
SELECT 
    e.emp_id, 
    e.emp_name, 
    e.department, 
    d.manager_name 
FROM Employee e 
RIGHT JOIN Department d 
    ON e.department = d.department; 
 
  
 SELECT 
    e.emp_name, 
    d.department 
FROM Employee e 
CROSS JOIN Department d; 
 
 
SELECT 
    e.emp_name, 
    e.salary, 
    e.department, 
    d.manager_name 
FROM Employee e 
INNER JOIN Department d 
    ON e.department = d.department 
WHERE e.department = 'IT'; 
