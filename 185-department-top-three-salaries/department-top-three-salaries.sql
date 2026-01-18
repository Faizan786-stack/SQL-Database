# Write your MySQL query statement below
select
d.name as Department,
e.name as Employee,
e.salary as Salary
from (
    select *,
    DENSE_RANK() OVER(
        PARTITION BY departmentId
        ORDER BY salary desc
    ) as salary_rank
    from Employee
) e
join department d
on e.departmentId = d.id
where e.salary_rank <= 3