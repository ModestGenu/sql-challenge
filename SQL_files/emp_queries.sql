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
		em.emp_no,
		e.emp_no,
		e.last_name,
		e.first_name,
		d.dept_name
	from departments as d
	inner join dept_emp as em
	on d.dept_no = em.dept_no
	inner join employees as e
	on em.emp_no = e.emp_no;
	

--List first name, last name, and sex of each employee whose first 
--name is Hercules and whose last name begins with the letter B

select
		first_name,
		last_name,
		sex
	from employees
	where first_name = 'Hercules'
	and last_name like 'B%';
		
		
--List each employee in the Sales department, 
--including their employee number, last name, and first name 

select 
	emp_no, last_name, first_name
from 
	employees 
where 
	emp_no 
		in (
			select 
				emp_no
			from 
				dept_emp
			where
				dept_no = (
					select
						dept_no
					from 
						departments
					where 
						dept_name = 'Sales'
			));
	

--List each employee in the Sales and Development departments, 
--including their employee number, last name, first name, and department name

select 
	e.emp_no, 
	e.last_name, 
	e.first_name,
	d.dept_name
from employees as e
 	join dept_emp as de
		on e.emp_no = de.emp_no
 	join departments as d 
		on de.dept_no = d.dept_no
			where dept_name in ('Sales', 'Development');
			
			
--List the frequency counts, in descending order, of all the employee last names 
--(that is, how many employees share each last name)

select count 
	(last_name), last_name 
from 
	employees
group by 
	last_name
order by  count desc;