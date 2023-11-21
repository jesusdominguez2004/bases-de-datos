-- script 02

-- 01. los profesores con un departamento
select name, instructor.dept_name, department.building, budget
from instructor, department
where department.dept_name = instructor.dept_name;

-- 02. los profesores con un departamento
-- con presupuesto mayor a 800.000
select name, instructor.dept_name, budget
from instructor, department
where department.dept_name = instructor.dept_name
and budget > 800000;

-- 03. los profesores con un departamento
-- con presupuesto mayor a 800.000
-- usando referenciadores con "as"
select name, i.dept_name, budget
from instructor as i, department as d
where d.dept_name = i.dept_name
and budget > 800000;

-- 04. los profesores con un departamento
-- con presupuesto mayor a 800.000
-- usando referenciadores sin "as"
select name, i.dept_name, budget
from instructor i, department d
where d.dept_name = i.dept_name
and budget > 800000;

-- 05. los profesores con un departamento
-- con "inner join" y "on"
select name, instructor.dept_name, department.building, budget
from instructor inner join department
on department.dept_name = instructor.dept_name;

-- 06. los profesores con un departamento
-- con "inner join" y "on"
-- con presupuesto mayor a 800.000
select name, instructor.dept_name, department.building, budget
from instructor inner join department
on department.dept_name = instructor.dept_name
where budget > 800000;

-- 07. los profesores con un rol de maestro
-- con "inner join" y "on"
-- "order by" por nombres
select name, course_id, semester
from instructor inner join teaches
on instructor.ID = teaches.ID
order by name;

-- 08. los profesores con un rol de maestro
-- con "inner join" y "on"
-- con departamento "Comp. Sci."
-- "order by" por nombres
select name, course_id, semester
from instructor inner join teaches
on instructor.ID = teaches.ID
where instructor.dept_name = "Comp. Sci."
order by name;

-- 09. mostrar número de profesores por departamento
-- usando una función propia "dept_count(...)"
-- ver script "funciones_propias.sql"
-- "order by" por referenciador profesores
select distinct dept_name, dept_count(dept_name) as teachers
from department
order by teachers;

-- 10. todos los profesores del departamento "Civil Eng."
select *
from instructor
where dept_name = "Civil Eng.";

-- 11. nombre y presupuesto
-- de todos los departamentos que no tienen profesores
-- usando una función propia "dept_count(...)"
-- ver script "funciones_propias.sql"
select dept_name, budget
from department
where dept_count(dept_name) = 0;

-- 12. nombre de todos los estudiantes del departamento "Civil Eng."
select name
from student
where dept_name = "Civil Eng.";

-- 13. nombre y departamento de todos los estudiantes
-- que no tengan un profesor asignado para dicho departamento
-- usando una función propia "dept_count(...)"
-- ver script "funciones_propias.sql"
-- nota: in (obtener dept_name's que no tengan profesores con un select)
-- es una forma optimizada para obtener nombres de departamentos sin profesores
-- con "in (..., ..., ...)"
select name, dept_name
from student
where dept_name in (
	select dept_name 
    from department 
    where dept_count(dept_name) = 0
);

-- EXTRA. nombre y departamento de todos los estudiantes
-- cuyo departamento sea "Civil Eng." o "Comp. Sci."
-- con "in (..., ..., ...)"
select name, dept_name
from student
where dept_name in ("Civil Eng.", "Comp. Sci.");

-- 14. id, nombre y nivel de tosos los profesores
-- usando referencidor "as"
-- usando función propia "teacher_advisor(...)"
-- ver script "funciones_propias.sql"
-- "order by" por nivel profesor ascendente
-- nota: los "order by" por defecto son asc
-- puedes colcoar desc o asc manualmente
select ID, name, teacher_advisor(ID) as TeacherLevel
from instructor
order by TeacherLevel asc;

-- 15. todos los departamentos con n profesores
-- usando función propia "getDepartments(...)"
-- ver script "funciones_propias.sql"
-- con "call" para llamar una función propia
call getDepartments(0);
