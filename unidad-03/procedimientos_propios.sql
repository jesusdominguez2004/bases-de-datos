-- procedimientos_propios

-- 01. obtener departamentos por número profesores
DELIMITER $$
create procedure getDepartments(in teachers int)
begin
	select dept_name, budget
    from department
    where dept_count(dept_name) = teachers;
end $$
DELIMITER ;

-- prueba "01. obtener departamentos por número profesores"
call getDepartments(0); -- 0 profesores
call getDepartments(1); -- 1 profesores
call getDepartments(2); -- 2 profesores
call getDepartments(3); -- 3 profesores
call getDepartments(4); -- 4 profesores
