-- script 01

-- 01. los profesores con todos sus campos
-- nuevamente el campo nombre
select *, name
from instructor;

-- 02. todos los departamentos SIN DUPLICADOS
-- con "distinct"
-- de la tabla profesores
select distinct dept_name
from instructor;

-- 03. todos los id SIN DUPLICADOS junto con el departamento
-- con "distinct"
-- de la tabla profesores
select distinct id, dept_name
from instructor;

-- 04. todos los departamentos CON DUPLICADOS
-- con "all"
-- de la tabla profesores
select all dept_name
from instructor;

-- 05. mostrar nombre, salario anual, salario mensual
-- usando referenciador "as" ("abc abc", abc_abc, "abc", abc)
-- usando un operador matemático
-- de la tabla profesores
select name, salary as "salario anual", salary / 12 as salario_mensual
from instructor;

-- 06. todos los profesores del departamento "Comp. Sci"
select * 
from instructor
where dept_name = "Comp. Sci.";

-- 07. todos los nombres de los departamentos
select dept_name
from department;

-- 08. todos los profesores del departamento "Accounting"
-- y con salario mayor a 70.000
select * 
from instructor
where dept_name = "Accounting" and salary > 70000;

-- 09. todos los profesores del departamento "Comp. Sci"
-- SQL no es sensible a mayúsculas o minúscuclas
select * 
from instructor
where dept_name = "comp. sci.";

-- 10. nombre y departamento
-- de todos los profesores del departamento "Comp. Sci"
-- usando funciones nativas SQL para mayúsculas o minúscuclas
select name, upper(dept_name), lower(dept_name)
from instructor
where dept_name = "cOmP. sCi.";

-- 11. nombre de todos los profesores
-- que empiezen con "B" y terminen con "i"
-- con "like" y patrones
select name 
from instructor
where name like "B%i";

-- 12. nombre de todos los profesores
-- que terminen con "o"
-- con "like" y patrones
select name
from instructor
where name like "%o";

-- 13. nombre de todos los profesores
-- que tengan cuatro caracteres
-- con "like" y patrones
select name 
from instructor
where name like "____";

-- 14. nombre y salario
-- de los profesores con departamento "Accounting"
-- "order by" por salario, luego nombre
select name, salary 
from instructor
where dept_name = "Accounting"
order by salary, name;

-- 15. departamento y nombre
-- de todos los profesores
-- "order by" por departamento, luego salario
select dept_name, name
from instructor
order by dept_name, salary;

-- 16. todos los profesores
-- con salarios entre 90.000 y 100.000
-- con "between" y "and"
select *
from instructor
where salary between 90000 and 100000;

-- 17. todos los profesores
-- con salarios mayores o iguales 90.000 y menores o iguales 100.000
-- con "between", "and" y operadores matemáticos
select *
from instructor
where salary >= 90000 and salary <= 100000;

-- 18. contar los id SIN DUPLICAR
-- del rol maestros en primavera
-- y año en 2008
-- función nativa count(...) y "distinct"
select count(distinct id)
from teaches
where semester = "Spring" and year = 2008;

-- 19. promedio de los salarios
-- de todos los profesores
-- del departamento "Accounting"
-- función nativa avg(...)
select avg(salary)
from instructor
where dept_name = "Accounting";

-- 20. salario máximo, promedio salario, departamento
-- de todos los profesores 
-- "group by" por nombre departamento
select max(salary), avg(salary), dept_name
from instructor
group by dept_name;

-- 21. nombre y departamento asignado
-- de todos los profesores
-- "order by" por nombre departamento
select name, dept_name
from instructor
order by dept_name;

-- 22. contar ids por departamento
-- de todos los profesores
-- "group by" por nombre departamento
select count(id), dept_name
from instructor
group by dept_name;
