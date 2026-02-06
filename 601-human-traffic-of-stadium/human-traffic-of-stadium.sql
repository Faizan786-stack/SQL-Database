# Write your MySQL query statement below
select id, visit_date, people
from (
    select *,
    LAG(id, 1) over (order by id) as prev_id,
    LAG(id, 2) over (order by id) as prev2_id,
    LEAD(id, 1) over (order by id) as next_id,
    LEAD(id, 2) over (order by id) as next2_id
    from Stadium
    where people >= 100
) t
where
(id = prev_id + 1 and id = prev2_id + 2)
or
(id = prev_id + 1 and next_id = id + 1)
or
(id = next_id - 1 and next2_id = id + 2)
order by visit_date