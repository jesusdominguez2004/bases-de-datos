-- funciones_propias

-- 01. contar profesores de un departamento ingresado
DELIMITER $$
create function dept_count(dept_name varchar(20))
returns int
deterministic
begin
declare d_count int;
	select count(*) into d_count
    from instructor
    where instructor.dept_name = dept_name;
return (d_count);
end $$
DELIMITER ;

-- 02. obtener nivel del profesor ingresado
-- nota: "s_ID" e "i_ID" son campos de la tabla "advisor"
DELIMITER $$
create function teacher_advisor(instructor_id varchar(5))
returns varchar(20)
deterministic
begin
declare s_count int;
declare s_level varchar(20);
    select count(s_ID) into s_count
    from advisor
    where i_ID = instructor_id
    group by i_ID;
    if s_count < 30 then
		set s_level = "Bajo";
	end if;
    if s_count >= 30 and s_count < 50 then
		set s_level = "Medio";
	end if;
    if s_count >= 50 then
		set s_level = "Alto";
	end if;
return (s_level);
end $$
DELIMITER ;

-- prueba "01. contar profesores de un departamento ingresado"
-- mostrar departamentos y número profesores
-- "order by" teachers ascendente
select distinct dept_name, dept_count(dept_name) as teachers
from department
order by teachers;

-- prueba "01. contar profesores de un departamento ingresado"
-- mostrar nombre departamento y presupuesto
-- con más de cuatro profesores
select dept_name, budget
from department
where dept_count(dept_name) > 4;

-- prueba "02. obtener nivel del profesor ingresado"
-- mostrar id, nombre y nivel de todos los profesores
select ID, name, teacher_advisor(ID) as TeacherLevel
from instructor;

-- 03. contar estudiantes de un curso ingresado
DELIMITER $$
create function course_count_takes(course_id varchar(8))
returns int
deterministic
begin
declare c_count int;
	select count(*) into c_count
    from takes
    where takes.course_id = course_id;
return (c_count);
end $$
DELIMITER ;

-- 04. contar docentes de un curso ingresado
DELIMITER $$
create function course_count_teaches(course_id varchar(8))
returns int
deterministic
begin
declare c_count int;
	select count(*) into c_count
    from teaches
    where teaches.course_id = course_id;
return (c_count);
end $$
DELIMITER ;

-- 05. contar cursos de un docente ingresado
DELIMITER $$
create function teacher_count(teacher_id varchar(8))
returns int
deterministic
begin
declare t_count int;
	select count(*) into t_count
    from teaches
    where teaches.ID = teacher_id;
return (t_count);
end $$
DELIMITER ;

-- 06. contar estudiantes de un departamento ingresado
DELIMITER $$
create function dept_count_students(dept_name varchar(20))
returns int
deterministic
begin
declare d_count int;
	select count(*) into d_count
    from student
    where student.dept_name = dept_name;
return (d_count);
end $$
DELIMITER ;

-- 07. contar estudiantes por un profesor ingresado
DELIMITER $$
create function teacher_count_advisor(teacher_id varchar(5))
returns int
deterministic
begin
declare t_count int;
	select count(*) into t_count
    from advisor
    where advisor.i_ID = teacher_id;
return (t_count);
end $$
DELIMITER ;

-- 08. contar cursos por año ingresado
DELIMITER $$
create function course_count_teaches(year decimal(4, 0))
returns int
deterministic
begin
declare c_count int;
	select count(*) into c_count
    from teaches
    where teaches.year = year;
return (c_count);
end $$
DELIMITER ;

-- 09. ...
DELIMITER $$
create function course_count_takes_year(course_id varchar(8), year decimal(4, 0))
returns int
deterministic
begin
declare c_count int;
	select count(*) into c_count
    from takes
    where takes.course_id = course_id
    and takes.year = year;
return (c_count);
end $$
DELIMITER ;

-- 10. contar albumes, contar canciones del album
DELIMITER $$
create function count_songs_track(album_id int)
returns int
deterministic
begin
declare a_count int;
	select count(*) into a_count
    from track
    where track.AlbumId = album_id;
return (a_count);
end $$
DELIMITER ;