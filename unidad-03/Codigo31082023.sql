select *, name
from instructor;

select distinct dept_name
from instructor;

select distinct id, dept_name
from instructor;

select all dept_name
from instructor;

select name, salary as "salario anual", salary/12 as salario_mensual
from instructor;

select * 
from instructor
where dept_name = "Comp. Sci.";

select dept_name
from department;

select * 
from instructor
where dept_name = "Accounting" and salary > 70000;

select * 
from instructor
where dept_name = "comp. sci.";

select name, upper(dept_name), lower(dept_name)
from instructor
where dept_name = "comp. sci.";

select name 
from instructor
where name like "B%i";

select name 
from instructor
where name like "%o";

select name 
from instructor
where name like "____";

select name, salary 
from instructor
where dept_name = "Accounting"
order by salary, name;

select dept_name, name
from instructor
order by dept_name, salary;

select *
from instructor
where salary between 90000 and 100000;

select *
from instructor
where salary >= 90000 and salary <= 100000;

select count(distinct id)
from teaches
where semester = "Spring" and year = 2008;

select avg(salary)
from instructor
where dept_name = "Accounting";

select max(salary),avg(salary), dept_name
from instructor
group by dept_name;

select name, dept_name
from instructor
order by dept_name;

select count(id), dept_name
from instructor
group by dept_name;