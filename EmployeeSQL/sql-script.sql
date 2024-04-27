CREATE TABLE department(
	department_number VARCHAR PRIMARY KEY NOT NULL,
	department_name VARCHAR NOT NULL
);
SELECT * FROM department


CREATE TABLE titles(
	employee_title_id VARCHAR PRIMARY KEY NOT NULL,
	title VARCHAR NOT NULL
);
SELECT * FROM titles


CREATE TABLE employees (
	employee_number INT PRIMARY KEY NOT NULL, 
	employee_title_id VARCHAR NOT NULL, 
	birth_date VARCHAR NOT NULL,
	first_name VARCHAR NOT NULL,
	last_name VARCHAR NOT NULL,
	sex VARCHAR,
	hire_date VARCHAR NOT NULL
);
SELECT * FROM employees


CREATE TABLE department_manager (
	department_number VARCHAR NOT NULL,
	manager_employee_number INT NOT NULL,
	PRIMARY KEY (department_number, manager_employee_number),
	FOREIGN KEY (manager_employee_number) REFERENCES employees(employee_number),
	FOREIGN KEY (department_number) REFERENCES department(department_number)
);
SELECT * FROM department_manager


CREATE TABLE department_employee(
	employee_number INT NOT NULL,
	department_number VARCHAR,
	PRIMARY KEY (employee_number,department_number),
	FOREIGN KEY (employee_number) REFERENCES employees(employee_number),
	FOREIGN KEY (department_number) REFERENCES department(department_number)
);
SELECT * FROM department_employee


CREATE TABLE salaries(
	employee_number INT NOT NULL PRIMARY KEY,
	salary INT NOT NULL,
	FOREIGN KEY (employee_number) REFERENCES employees(employee_number)
);
SELECT * FROM salaries

-- _______________________________________________________________________________________________________________

-- Data Analysis

-- 1. List the employee number, last name, first name, sex, and salary of each employee.

SELECT e.employee_number, e.last_name, e.first_name, e.sex, s.salary
FROM employees AS e
INNER JOIN salaries AS s 
ON e.employee_number = s.employee_number


-- 2. List the first name, last name, and hire date for the employees who were hired in 1986.

SELECT first_name, last_name, hire_date
FROM employees
WHERE hire_date LIKE '%1986'


-- 3. List the manager of each department along with their department number, department name, 
--		employee number, last name, and first name.

SELECT d.department_number, d.department_name, dm.manager_employee_number, e.last_name, e.first_name
FROM department as d
INNER JOIN department_manager as dm
ON d.department_number = dm.department_number
INNER JOIN employees AS e
ON dm.manager_employee_number = e.employee_number


-- 4. List the department number for each employee along with that employee’s employee number, 
--		last name, first name, and department name.

SELECT e.employee_number, e.last_name, e.first_name, d.department_name, de.department_number
FROM employees AS e
INNER JOIN department_employee AS de
ON e.employee_number = de.employee_number
INNER JOIN department AS d
ON de.department_number = d.department_number


-- 5. List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.

-- 6. List each employee in the Sales department, including their employee number, last name, and first name.

-- 7. List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.

List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).