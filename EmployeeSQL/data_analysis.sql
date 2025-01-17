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


-- 5. List first name, last name, and sex of each employee whose first name is Hercules 
-- 		and whose last name begins with the letter B.

SELECT first_name, last_name, sex
FROM employees
WHERE first_name = 'Hercules' AND  last_name LIKE 'B%'


-- 6. List each employee in the Sales department, including their employee number, last name, and first name.

SELECT e.employee_number, e.last_name, e.first_name
FROM employees as e
INNER JOIN department_employee AS de
ON e.employee_number = de.employee_number
	INNER JOIN department as d
	ON de.department_number = d.department_number
	WHERE d.department_name = 'Sales'
	
-- I noticed the question did not specifically ask for the department name like in the next question so I left it out.


-- 7. List each employee in the Sales and Development departments, including their 
-- 		employee number, last name, first name, and department name.

SELECT e.employee_number, e.last_name, e.first_name, d.department_name
FROM employees as e
INNER JOIN department_employee AS de
ON e.employee_number = de.employee_number
	INNER JOIN department as d
	ON de.department_number = d.department_number
	WHERE d.department_name = 'Sales' OR d.department_name = 'Development'
	
	

-- 8. List the frequency counts, in descending order, of all the employee last names 
--		(that is, how many employees share each last name).

SELECT last_name, COUNT(last_name) AS "Frequencies of last names"
FROM employees
GROUP BY last_name
ORDER BY "Frequencies of last names" Desc
