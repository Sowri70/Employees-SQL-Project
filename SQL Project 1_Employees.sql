--1. List of employees by Department 
-- Question  Write a query to list all employees along with their respective
              department name, include employee_number, first name, last name and department no  
              
SELECT e.emp_no, e.first_name, e.last_name, d.dept_no, d.dept_name 
FROM employees AS e
	join dept_emp AS de
	ON e.emp_no = de.emp_no
	join departments AS d
	on de.dept_no = d.dept_no;


-- 2. Current and Past salaries of an employee
-- Question: Write a query to retrieve all the salary records of a given employee
-- (by employee number) including employee number, salary, from_date 

SELECT * from salaries
WHERE emp_no = '10044' order by salary desc
Limit 1; 

-- 3. Employee with specific titles
-- Question: Write a query to find all employees who have held a specific title
-- (e.g.'Engineer') include employee number, first name and last name 

SELECT e.emp_no, first_name, last_name, t.title FROM employees as e
join titles as t
on e.emp_no = t.emp_no
where t.title = 'Engineer';

-- 4. Departments with their Managers
-- Question: Write a query to list all departments along with their current manager, 
-- including dept.no, dept.name, employee no., first name and last name 

SELECT d.dept_no, d.dept_name, e.emp_no, e.first_name, e.last_name FROM departments as d 
join dept_manager as dm 
ON d.dept_no = dm.dept_no 
join employees as e 
on e.emp_no = dm.emp_no  

-- 5. Employee Count by Department 
-- Question: Write a query to count the no. of employees in each department. include
-- number

SELECT d.dept_no, dept_name, count(de.emp_no) as emp_count FROM departments as d
join dept_emp as de 
ON de.dept_no = d.dept_no 
GROUP BY dept_no, dept_name;

-- 6. Employees Birthdates in a gien year 
-- Question: Write a query to find all employees born in a specific year (e.g.1953
-- include year, employee no. first name, last name 

SELECT emp_no, first_name, last_name, birth_date FROM employees
WHERE year(birth_date) = 1953;

- 7. Employees hired in the last five years
-- Question: Write a query to find all employees hired in the last 50 years.
-- include  employee no. first name, last name, first_date 

SELECT emp_no, first_name, last_name, hire_date FROM employees
WHERE hire_date >= date_sub(curdate(), INTERVAL 50 YEAR)

8. Average salary by department 
-- Question: Write a query to calculate the average salary for each department. 
-- include  department employee no. first name, last name, first_date 

SELECT d.dept_no, d.dept_name, avg(s.salary) as avg_salary from departments as d 
join dept_emp as de 
on de.dept_no = d.dept_no 
JOIN salaries as s 
on de.emp_no = s.emp_no
GROUP BY d.dept_no, d.dept_name

9. Gender distribtion in each department 
-- Question: Write a query to find gender distribution (no. of males and females) in each department  
-- include  department employee no. first name, last name, first_date 

SELECT d.dept_no, d.dept_name, 
SUM(CASE when e.gender = 'M' then 1 else 0 END) as male_count,
SUM(CASE when e.gender = 'F' then 1 else 0 END ) as female_count
FROM departments as d 
join dept_emp as de
on de.dept_no = d.dept_no 
join employees as e 
on de.emp_no = e.emp_no 
Group by d.dept_no, d.dept_name 

10. Longest serving employee
-- Question: Write a query to find the employees who have served the longest in the company 
-- include  employee_no , first_name, last_name

SELECT emp_no, first_name, last_name, 
timestampdiff(YEAR,hire_date, Curdate()) as year_served
FROM employees
ORDER BY year_served desc