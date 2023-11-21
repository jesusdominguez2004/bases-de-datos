-- parcial 03
-- jdomingu19@cuc.edu.co

-- 02. Los estudiantes que han recibido clases del docente con mayor salario
select  s_ID as "id_estudiante", i_ID as "id_docente_mayor_salario"
from advisor
where i_ID = (
	select ID
	from instructor
	order by salary desc
	limit 1
);

select i_ID, s_ID
from advisor
where i_ID = (select ID from instructor order by salary desc limit 1);