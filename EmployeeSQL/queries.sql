
   
 -- 1) Getting employee info with their salaries  
 -- Joining employees and salaries tables to get everything  
 SELECT   
     e.emp_no,  
     e.last_name,  
     e.first_name,  
     e.gender,  
     s.salary  
 FROM employees e  
 JOIN salaries s ON e.emp_no = s.emp_no;  
   
 -- 2) Finding everyone hired in 1986  
 -- Using EXTRACT to get just the year from hire_date  
 SELECT   
     first_name,  
     last_name,  
     hire_date  
 FROM employees  
 WHERE EXTRACT(YEAR FROM hire_date) = 1986;  
   
 -- 3) Getting info about department managers  
 -- Had to join 3 tables to get all the details  
 SELECT   
     d.dept_no,  
     d.dept_name,  
     dm.emp_no,  
     e.last_name,  
     e.first_name  
 FROM departments d  
 JOIN dept_manager dm ON d.dept_no = dm.dept_no  
 JOIN employees e ON dm.emp_no = e.emp_no;  
   
 -- 4) Getting department info for all employees  
 SELECT   
     e.emp_no,  
     e.last_name,  
     e.first_name,  
     d.dept_name  
 FROM employees e  
 JOIN dept_emp de ON e.emp_no = de.emp_no  
 JOIN departments d ON de.dept_no = d.dept_no;  
   
 -- 5) Finding everyone named Hercules B.  
 -- Using LIKE to find last names that start with B  
 SELECT   
     first_name,  
     last_name,  
     gender  
 FROM employees  
 WHERE first_name = 'Hercules'   
 AND last_name LIKE 'B%';  
   
 -- 6) Everyone in the Sales department  
 SELECT   
     e.emp_no,  
     e.last_name,  
     e.first_name  
 FROM employees e  
 JOIN dept_emp de ON e.emp_no = de.emp_no  
 JOIN departments d ON de.dept_no = d.dept_no  
 WHERE d.dept_name = 'Sales';  
   
 -- 7) Everyone in Sales and Development departments  
 SELECT   
     e.emp_no,  
     e.last_name,  
     e.first_name,  
     d.dept_name  
 FROM employees e  
 JOIN dept_emp de ON e.emp_no = de.emp_no  
 JOIN departments d ON de.dept_no = d.dept_no  
 WHERE d.dept_name IN ('Sales', 'Development');  
   
 -- 8) Counting how many people have each last name  
 -- Ordered by count to see most common ones first  
 SELECT   
     last_name,  
     COUNT(*) as name_count  
 FROM employees  
 GROUP BY last_name  
 ORDER BY name_count DESC;  
