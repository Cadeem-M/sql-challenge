-- Data Engineering

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
	sex VARCHAR NOT NULL,
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
	department_number VARCHAR NOT NULL,
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
