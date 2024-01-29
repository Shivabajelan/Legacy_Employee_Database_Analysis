-- Drop all 6 tables before creating them
DROP TABLE IF EXISTS  title CASCADE;
DROP TABLE IF EXISTS departments CASCADE;
DROP TABLE IF EXISTS employees CASCADE;
DROP TABLE IF EXISTS dep_manager CASCADE;
DROP TABLE IF EXISTS dep_emp CASCADE;
DROP TABLE IF EXISTS salaries CASCADE;

-- Change the datestyle for "employee" database to "ISO MDY"
ALTER DATABASE employees SET datestyle TO "ISO, MDY";


-- Create all 6 tables
CREATE TABLE title (
    title_id VARCHAR(10) NOT NULL PRIMARY KEY,
    title VARCHAR(30) NOT NULL
);

CREATE TABLE departments (
    dept_no VARCHAR(10) NOT NULL PRIMARY KEY,
    dept_name VARCHAR(30)
);

CREATE TABLE employees (
    emp_no INT NOT NULL PRIMARY KEY,
    emp_title_id VARCHAR(10) NOT NULL,
    birth_date DATE NOT NULL,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    sex VARCHAR(10) NOT NULL,
    hire_date DATE NOT NULL,
	FOREIGN KEY (emp_title_id)REFERENCES title(title_id)
);

CREATE TABLE dep_manager(
	dept_no VARCHAR(10) NOT NULL,
	emp_no INT NOT NULL,
	PRIMARY KEY (dept_no, emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

CREATE TABLE dep_emp(
	emp_no INT NOT NULL,
	dept_no VARCHAR(10) NOT NULL,
	PRIMARY KEY (emp_no,dept_no),
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no)
);

CREATE TABLE salaries(
	emp_no INT NOT NULL PRIMARY KEY,
	salary INT NOT NULL 
);
