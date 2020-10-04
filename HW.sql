drop table departments
drop table dept_emp
drop table dept_manager
drop table employees
drop table salary
drop table titles;

CREATE TABLE departments(
	dept_no VARCHAR NOT NULL,
	dept_name VARCHAR NOT NULL
);

CREATE TABLE dept_emp(
	emp_no INT NOT NULL,
	dept_no VARCHAR NOT NULL
);

CREATE TABLE dept_manager(
	dept_no VARCHAR NOT NULL,
	emp_no INT NOT NULL
);

CREATE TABLE employees (
    emp_no int NOT NULL ,
    emp_title_id VARCHAR NOT NULL,
    birth_date date  NOT NULL,
    first_name VARCHAR NOT NULL,
    last_name VARCHAR NOT NULL,
    sex VARCHAR NOT NULL,
    hire_date date NOT NULL
);

CREATE TABLE salary(
	emp_no int NOT NULL,
	salary int NOT NULL
);

CREATE TABLE titles(
	title_id VARCHAR NOT NULL,
	title VARCHAR NOT NULL
);

SELECT empl.emp_no, empl.last_name, empl.first_name, empl.sex, sal.salary
from employees as empl
inner join salary as sal
ON empl.emp_no=sal.emp_no;

select first_name, last_name, hire_date
from employees
where hire_date >= '1986-01-01' 
and hire_date < '1987-01-01';

select empl.emp_no, empl.last_name, empl.first_name, dept.dept_name, deptman.dept_no, deptman.emp_no
from employees as empl
inner join dept_manager as deptman
ON empl.emp_no= deptman.emp_no 
inner join departments as dept
ON deptman.dept_no = dept.dept_no;

select empl.emp_no, empl.last_name, empl.first_name, dept.dept_name
from employees as empl
inner join dept_emp as demp
ON empl.emp_no = demp.emp_no
inner join departments as dept
ON demp.dept_no = dept.dept_no;

select first_name, last_name, sex
from employees
where first_name='Hercules'
and last_name like 'B%';

select empl.emp_no, empl.last_name, empl.first_name, dept.dept_name
from employees as empl
inner join dept_emp as dempt
ON empl.emp_no= dempt.emp_no
inner join departments as dept 
ON dempt.dept_no = dept.dept_no
where dept_name= 'Sales';

select empl.emp_no, empl.last_name, empl.first_name, dept.dept_name
from employees as empl
inner join dept_emp as dempt
ON empl.emp_no = dempt.emp_no
inner join departments as dept
ON dempt.dept_no = dept.dept_no
where dept_name= 'Sales'
OR dept_name= 'Development';

select last_name, count(last_name) AS 'Count Last Name'
from employees
group by last_name
Order By 'Count Last Name' DESC;




