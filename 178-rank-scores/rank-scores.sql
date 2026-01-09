# Write your MySQL query statement below
-- Ranking Score
select score,
DENSE_RANK() over (order by score desc) as 'rank'
from Scores
ORDER BY score desc