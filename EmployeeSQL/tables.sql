
   
 -- Starting with titles since other tables need it  
 CREATE TABLE titles (  
     title_id VARCHAR(5) PRIMARY KEY,  
     title VARCHAR(30) NOT NULL  
 );  
   
 -- Next up is departments  
 CREATE TABLE departments (  
     dept_no VARCHAR(4) PRIMARY KEY,  
     dept_name VARCHAR(30) NOT NULL  
 );  
   
 -- Now the main employees table  
 CREATE TABLE employees (  
     emp_no INT PRIMARY KEY,  
     emp_title_id VARCHAR(5) NOT NULL,  
     birth_date DATE NOT NULL,  
     first_name VARCHAR(30) NOT NULL,  
     last_name VARCHAR(30) NOT NULL,  
     gender VARCHAR(1) NOT NULL,  
     hire_date DATE NOT NULL,  
     FOREIGN KEY (emp_title_id) REFERENCES titles(title_id)  
 );  
   
 -- Table for employee salaries  
 CREATE TABLE salaries (  
     emp_no INT PRIMARY KEY,  
     salary INT NOT NULL,  
     FOREIGN KEY (emp_no) REFERENCES employees(emp_no)  
 );  
   
 -- This connects employees to departments  
 CREATE TABLE dept_emp (  
     emp_no INT NOT NULL,  
     dept_no VARCHAR(4) NOT NULL,  
     PRIMARY KEY (emp_no, dept_no),  
     FOREIGN KEY (emp_no) REFERENCES employees(emp_no),  
     FOREIGN KEY (dept_no) REFERENCES departments(dept_no)  
 );  
   
 -- Table for department managers  
 CREATE TABLE dept_manager (  
     dept_no VARCHAR(4) NOT NULL,  
     emp_no INT NOT NULL,  
     PRIMARY KEY (dept_no, emp_no),  
     FOREIGN KEY (dept_no) REFERENCES departments(dept_no),  
     FOREIGN KEY (emp_no) REFERENCES employees(emp_no)  
 );  
