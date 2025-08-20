-- Assignment # 3
-- Name: Muhammad Saud Siddiqui
-- Seat number: B23110106043



CREATE TABLE departments (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(50),
    location VARCHAR(50)
);

CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    salary DECIMAL(10,2),
    dept_id INT,
    hire_date DATE
);

CREATE TABLE projects (
    project_id INT PRIMARY KEY,
    project_name VARCHAR(50),
    budget DECIMAL(12,2),
    start_date DATE,
    end_date DATE
);

CREATE TABLE employee_projects (
    emp_id INT,
    project_id INT,
    hours_worked INT
);


INSERT INTO departments VALUES
(1, 'HR', 'Karachi'),
(2, 'IT', 'Lahore'),
(3, 'Finance', 'Islamabad'),
(4, 'Marketing', 'Karachi'); 

INSERT INTO employees VALUES
(101, 'Ali', 50000, 1, '2022-01-10'),
(102, 'Sara', 60000, 2, '2021-03-15'),
(103, 'Ahmed', 45000, NULL, '2023-07-01'),
(104, 'Hina', 70000, 2, '2020-06-20'),
(105, 'Usman', 55000, 3, '2022-11-05');

INSERT INTO projects VALUES
(201, 'Website Development', 200000, '2023-01-01', '2023-12-31'),
(202, 'Recruitment Drive', 50000, '2023-03-01', '2023-06-30'),
(203, 'Budget Analysis', 100000, '2023-02-01', '2023-08-31'),
(204, 'Marketing Campaign', 150000, '2023-05-01', '2023-09-30'); 

INSERT INTO employee_projects VALUES
(101, 202, 20),
(102, 201, 35),
(104, 201, 40),
(105, 203, 25);




SELECT employees.emp_id, employees.emp_name, departments.dept_name
FROM employees
LEFT JOIN departments ON employees.dept_id = departments.dept_id;

SELECT departments.dept_id, departments.dept_name, employees.emp_name
FROM departments
LEFT JOIN employees ON departments.dept_id = employees.dept_id;

SELECT emp_id, emp_name
FROM employees
WHERE dept_id IS NULL;



SELECT projects.project_id, projects.project_name, employees.emp_name
FROM projects
LEFT JOIN employee_projects ON projects.project_id = employee_projects.project_id
LEFT JOIN employees ON employee_projects.emp_id = employees.emp_id;


SELECT departments.dept_id, departments.dept_name, SUM(employee_projects.hours_worked) AS total_hours
FROM departments
LEFT JOIN employees ON departments.dept_id = employees.dept_id
LEFT JOIN employee_projects ON employees.emp_id = employee_projects.emp_id
GROUP BY departments.dept_id, departments.dept_name;

SELECT employees.emp_id, employees.emp_name
FROM employees
LEFT JOIN employee_projects ON employees.emp_id = employee_projects.emp_id
WHERE employee_projects.project_id IS NULL;



-- Q1: Difference between INNER JOIN and LEFT JOIN?
-- INNER JOIN only shows matching rows from both tables.
-- LEFT JOIN shows all rows from the left table even if no match exists.

-- Q2: Why RIGHT JOIN is less common?
-- Because LEFT JOIN is easier to understand and we usually start from the left table.
