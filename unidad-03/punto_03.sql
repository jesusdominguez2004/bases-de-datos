-- parcial 03
-- jdomingu19@cuc.edu.co

-- 03. Los estudiantes con la menor cantidad de créditos totales.
select ID as "id_estudiante", tot_cred
from student
where tot_cred = (
	select min(tot_cred)
    from student
);

