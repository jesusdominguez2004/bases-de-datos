-- más ejercicios
-- jdomingu19@cuc.edu.co

-- 01. departamento con menor números de estudiantes
select dept_name, count(*) as num_students
from student
group by dept_name	
order by num_students asc
limit 1;

-- 02. docentes y sus cursos dictados
select ID as "id_profesor", count(*) as "num_cursos_dados"
from teaches
group by ID
order by ID;

-- 03. promedio créditos por estudiantes
select ID as "id_estudiante", avg(tot_cred) as "avg_cred"
from student
group by ID
order by ID;

-- 04. profesores sin estudiantes asignados
select ID as "id_profesor"
from instructor
where ID not in (
	select distinct i_ID
	from advisor
);

-- 05. Los estudiantes que han recibido clases del docente con mayor salario
select  s_ID as "id_estudiante", i_ID as "id_docente_mayor_salario"
from advisor
where i_ID = (
	select ID
	from instructor
	order by salary desc
	limit 1
);

-- 06 Los estudiantes con la menor cantidad de créditos totales.
select ID as "id_estudiante", tot_cred
from student
where tot_cred = (
	select min(tot_cred)
    from student
);