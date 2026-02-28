/*
Question: Employee Query Histogram (IBM Db2 Analysis)

IBM is analyzing how employees are utilizing the Db2 database by tracking
the SQL queries executed by employees.

The objective is to generate data to populate a histogram showing the number
of unique queries run by employees during the third quarter of 2023
(July 1, 2023 to September 30, 2023).

Additionally, the output must include employees who did NOT run any queries
during this period.

Task:
Display:
- unique_queries (number of distinct queries executed per employee)
- employee_count (number of employees who executed that many unique queries)

The result should represent histogram categories:
For each distinct number of unique queries, return how many employees
fall into that category.

------------------------------------------------------------
Table: queries

Columns:
- employee_id (integer) — ID of the employee who executed the query
- query_id (integer) — Unique identifier for each query (Primary Key)
- query_starttime (datetime) — Timestamp when the query started
- execution_time (integer) — Duration of query execution in seconds

------------------------------------------------------------
Table: employees

Columns:
- employee_id (integer) — ID of the employee
- full_name (string) — Full name of employee
- gender (string) — Gender of employee

------------------------------------------------------------
Example Output:

unique_queries | employee_count
--------------------------------
0              | 191
1              | 46
2              | 12
3              | 1

Explanation:
- 191 employees ran zero queries during Q3 2023.
- 46 employees ran exactly 1 unique query.
- 12 employees ran exactly 2 unique queries.
- 1 employee ran exactly 3 unique queries.

Note:
The dataset you are querying against may have different input and output.
This example is provided for illustration purposes only.
*/
WITH employee_query_count AS (
    SELECT 
        e.employee_id,
        COUNT(DISTINCT q.query_id) AS unique_queries
    FROM employees e
    LEFT JOIN queries q
        ON e.employee_id = q.employee_id
        AND q.query_starttime >= '2023-07-01'
        AND q.query_starttime < '2023-10-01'
    GROUP BY e.employee_id
)

SELECT 
    unique_queries,
    COUNT(*) AS employee_count
FROM employee_query_count
GROUP BY unique_queries
ORDER BY unique_queries