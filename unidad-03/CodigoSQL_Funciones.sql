DELIMITER $$
create function dept_count(
		dept_name varchar(20)
        )
returns int
deterministic
begin
declare d_count int;
	select count(*) into d_count
    from instructor
    where instructor.dept_name = dept_name;
return (d_count);
end$$
DELIMITER ;

select distinct dept_name, dept_count(dept_name) as teachers
from department
order by teachers;

select dept_name, budget
from department
where dept_count(dept_name) > 4;

DELIMITER $$
create function teacher_advisor(
		instructor_id varchar(5)
        )
returns VARCHAR(20)
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
	if s_count >=50 then
		set s_level = "Alto";
	end if;
return (s_level);
end$$
DELIMITER ;

select ID, name, teacher_advisor(ID) as TeacherLevel
from instructor;

DELIMITER $$

CREATE PROCEDURE getDepartments(
    IN  teachers INT
)
BEGIN
    select dept_name, budget
	from department
	where dept_count(dept_name) = teachers;
END$$

DELIMITER ;

call getDepartments(4);