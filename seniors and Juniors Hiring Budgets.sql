create table candidates (
emp_id int,
experience varchar(20),
salary int
);
delete from candidates;
insert into candidates values
(1,'Junior',10000),(2,'Junior',15000),
(3,'Junior',40000),(4,'Senior',16000),
(5,'Senior',20000),(6,'Senior',50000);

---------------------------------------------------------------------------------------


select * from candidates

GO 
WITH ALL_CTE AS (
	select *, sum(salary) over (partition by experience order by salary asc) as run_salary
	from candidates
), Senior_Cte as (
	select * from ALL_CTE
	where experience = 'Senior' and run_salary <= 70000
), Junior_Cte as (
    select * from ALL_CTE
    where experience = 'Junior' and run_salary <= 70000 - (select sum(salary) from Senior_Cte)
)
select * from Junior_Cte
union all
select * from Senior_Cte




