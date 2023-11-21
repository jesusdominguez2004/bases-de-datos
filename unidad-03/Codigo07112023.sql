select name, instructor.dept_name, department.building, budget
from instructor, department
where department.dept_name = instructor.dept_name;

-- Los profesores que pertenezcan a un departamento 
-- con presupuesto mayor a 800.000
select name, instructor.dept_name, budget
from instructor, department
where department.dept_name = instructor.dept_name and
budget > 800000;

select name, i.dept_name, budget
from instructor as i, department as d
where d.dept_name = i.dept_name and
budget > 800000;

select name, i.dept_name, budget
from instructor i, department d
where d.dept_name = i.dept_name and
budget > 800000;

-- Con Inner Join
select name, instructor.dept_name, department.building, budget
from instructor inner join department 
on department.dept_name = instructor.dept_name;

select name, instructor.dept_name, department.building, budget
from instructor inner join department 
on department.dept_name = instructor.dept_name
where budget > 800000;

select name, course_id, semester
from instructor inner join teaches 
on instructor.ID = teaches.ID
order by name;

select name, course_id, semester
from instructor inner join teaches 
on instructor.ID = teaches.ID
where instructor.dept_name = "Comp. Sci."
order by name;

select distinct dept_name, dept_count(dept_name) as teachers
from department
order by teachers;

select *
from instructor
where dept_name = "Civil Eng.";

select dept_name, budget
from department
where dept_count(dept_name) = 0;

select name
from student
where dept_name = "Civil Eng.";

select name
from student
where dept_name in (select dept_name
from department
where dept_count(dept_name) = 0);

select ID, name, teacher_advisor(ID) as TeacherLevel
from instructor
order by TeacherLevel;

call getDepartments(0);