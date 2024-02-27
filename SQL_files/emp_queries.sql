--Data Analysis:

-- list employee number, last name, first name, sex, and salary for each employee:
--this is a simple inner join, since the data is contained in only two tables. 
select 
	e.emp_no, 
	e.last_name, 
	e.first_name, 
	e.sex, 
	s.salary
from employees as e
inner join salaries as s
on e.emp_no = s.emp_no;


-- list first name, last name, and hire date for employees hired after 1986:
--this is a bit more complicated, but by extracting the date, we get the result
select
	first_name, last_name, hire_date
	from employees 
	where extract (year from hire_date) = 1986;
	
--list the manager of each department along with their department number, department
--name, employee number, last name, and first name

select 
		d.dept_no,
		d.dept_name,
		m.emp_no,
		e.emp_no,
		e.last_name,
		e.first_name
	from departments as d
	inner join dept_manager as m
	on d.dept_no = m.dept_no
	inner join employees as e
	on m.emp_no = e.emp_no;

--list the department number for each employee along with that employee's 
--employee number, last name, first name, and department name

select 
		d.dept_no,
		e.emp_no, 
		e.last_name,
		e.first_name,
		d.dept_name
	from employees as e
	inner join departments as d
	on e.emp_title_id = d.dept_no;
