/*
Write a query to determine how many direct reports each Manager has.

Note: Managers will have "Manager" in their title.

Report the Manager ID, Manager Title, and the number of direct reports in your output.
*/
SELECT d2.employee_id,
       d2.position,
       count(*) as employee_no
FROM direct_reports d1
join direct_reports d2
ON d1.managers_id = d2.employee_id
WHERE d2.position LIKE '%Manager%'
GROUP BY d2.employee_id