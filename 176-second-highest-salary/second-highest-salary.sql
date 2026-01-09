# Write your MySQL query statement below
-- Second Highest Salary
select max(salary) as SecondHighestSalary 
from Employee
where salary < (select max(salary) from Employee)