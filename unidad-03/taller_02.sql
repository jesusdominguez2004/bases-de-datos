-- taller 02

-- 01. El curso con mayor cantidad de estudiantes por año.
-- forma 01
select year, max(students) as max_students, course_id
from (
	select distinct year, course_id, course_count_takes_year(course_id, year) as students
	from takes
	order by students desc
) as subquery
group by year, course_id
order by year;

-- forma 02
select year, max(num_students) as max_num_students, course_id
from (
	select course_id, year, count(*) as num_students
	from takes
	group by course_id, year
) as subquery
group by year, course_id
order by year;

-- 02. El número de estudiantes por departamento.
-- froma 01
select distinct dept_name, dept_count_students(dept_name) as students
from department
order by students;

-- forma 02
select dept_name, count(*) as num_students
from student
group by dept_name
order by num_students;

-- 03. El número de estudiantes asesorados por cada docente.
-- forma 01
select distinct i_ID as "id_docente", teacher_count_advisor(i_ID) as students
from advisor
order by students;

-- forma 02
select i_ID as "id_docente", count(*) as estudiantes_asesorados
from advisor
group by i_ID;

-- 04. Los salones de cada curso dictado hasta la fecha.
-- forma 01
select course_id as "cursos dictados", building, room_number, year
from section
order by course_id, year;

-- 05. El número de cursos dictados por año.
-- forma 01
select distinct year, course_count_teaches(year) as courses
from teaches
order by courses;

-- forma 02
select year, count(*) as num_courses
from section
group by year;