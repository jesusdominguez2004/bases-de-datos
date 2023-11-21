-- parcial 03
-- jdomingu19@cuc.edu.co

-- 01. Los docentes y su cantidad de cursos dictada en total.
select ID as "id_profesor", count(*) as num_cursos
from teaches
group by ID
order by num_cursos;