/*
SQL Interview Question:

Assume you're given two tables containing information about Snapchat users,
including their ages and the time they spent performing different activities
on the platform.

Table 1: activities
-----------------------------------------
Column Name     | Type
-----------------------------------------
activity_id     | integer
user_id         | integer
activity_type   | string ('send', 'open', 'chat')
time_spent      | float
activity_date   | datetime
-----------------------------------------

Table 2: age_breakdown
-----------------------------------------
Column Name     | Type
-----------------------------------------
user_id         | integer
age_bucket      | string (e.g., '21-25', '26-30', '31-35')
-----------------------------------------

Write a query to obtain a breakdown of the time spent sending vs. opening
snaps as a percentage of the total time spent on these two activities,
grouped by age_bucket.

Calculate the following:

1. send_perc =
   (time spent sending) / (time spent sending + time spent opening) * 100

2. open_perc =
   (time spent opening) / (time spent sending + time spent opening) * 100

Requirements:
- Only consider activity types 'send' and 'open'
- Multiply by 100.0 (not 100) to avoid integer division
- Round both percentages to 2 decimal places
- Return results grouped by age_bucket

Expected Output Format:
-----------------------------------------
| age_bucket | send_perc | open_perc |
-----------------------------------------

Note:
The dataset you are querying against may have different input and output.
*/
with time_spent AS (
select 
      ag.age_bucket,
      sum(case when a.activity_type = 'open' then a.time_spent END) spent_opening,
      sum(case when a.activity_type = 'send' then a.time_spent END) spent_send
from activities a
join age_breakdown ag
on a.user_id = ag.user_id
WHERE a.activity_type IN ('open', 'send')                                   -- very important for optimisation, as it filter the data before aggregation
group by age_bucket
)
select 
      age_bucket,
      round((spent_send/(spent_send+spent_opening))*100.0,2) send_perc,
      round((spent_opening/(spent_send+spent_opening))*100.0,2) open_perc
from time_spent

-- OR
SELECT age_bucket,
  ROUND((SUM(IF(activity_type = 'send',time_spent,0))/SUM(time_spent))*100,2) AS send_perc,
  ROUND((SUM(IF(activity_type = 'open',time_spent,0))/SUM(time_spent))*100,2) open_perc
FROM activities 
LEFT JOIN age_breakdown 
  ON age_breakdown.user_id = activities.user_id
WHERE activity_type IN ('open','send')
GROUP BY age_bucket
ORDER BY age_bucket DESC