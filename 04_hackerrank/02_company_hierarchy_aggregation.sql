/*
===============================================================================
Problem: Company Hierarchy Aggregation
===============================================================================

Amber's conglomerate corporation just acquired some new companies. Each of the
companies follows the hierarchy below:

Company
  → Lead_Manager
      → Senior_Manager
          → Manager
              → Employee

Write a query to print:
- company_code
- founder name
- total number of distinct lead managers
- total number of distinct senior managers
- total number of distinct managers
- total number of distinct employees

Order the output by ascending company_code.

Note:
- The tables may contain duplicate records, so use DISTINCT where necessary.
- company_code is a STRING. Sorting must be lexicographical (not numeric).
  Example: C1, C10, C2 (NOT C1, C2, C10)

===============================================================================
Table Schemas
===============================================================================

Company
- company_code (string)
- founder (string)

Lead_Manager
- lead_manager_code (string)
- company_code (string)

Senior_Manager
- senior_manager_code (string)
- lead_manager_code (string)
- company_code (string)

Manager
- manager_code (string)
- senior_manager_code (string)
- lead_manager_code (string)
- company_code (string)

Employee
- employee_code (string)
- manager_code (string)
- senior_manager_code (string)
- lead_manager_code (string)
- company_code (string)

===============================================================================
Sample Output
===============================================================================

C1 Monika 1 2 1 2
C2 Samantha 1 1 2 2

===============================================================================
Explanation
===============================================================================

Company C1:
- 1 Lead Manager (LM1)
- 2 Senior Managers (SM1, SM2)
- 1 Manager (M1)
- 2 Employees (E1, E2)

Company C2:
- 1 Lead Manager (LM2)
- 1 Senior Manager (SM3)
- 2 Managers (M2, M3)
- 2 Employees (E3, E4)
===============================================================================
*/
SELECT e.company_code, 
       c.founder, 
       count(distinct e.lead_manager_code) total_lead_mgr, 
       count(distinct e.senior_manager_code) total_senior_mgr,
       count(distinct e.manager_code) total_mgr,
       count(distinct e.employee_code) total_emp
FROM Employee e
LEFT JOIN Company c
ON e.company_code = c.company_code
GROUP BY e.company_code, c.founder
ORDER BY e.company_code;

/*
===============================================================================
Scenario 1: Employee Table Contains All Hierarchy Codes
===============================================================================

If the Employee table already contains:
- lead_manager_code
- senior_manager_code
- manager_code
- employee_code
- company_code

Then we DO NOT need to join hierarchy tables separately.
All hierarchy levels can be counted directly from Employee.

Reason:
The hierarchy is already flattened inside the Employee table.
Using additional joins may cause row multiplication and complexity.

===============================================================================
Query (Minimal & Efficient Approach)
===============================================================================
*/

SELECT 
    e.company_code,
    c.founder,
    COUNT(DISTINCT e.lead_manager_code)    AS total_lead_mgr,
    COUNT(DISTINCT e.senior_manager_code)  AS total_senior_mgr,
    COUNT(DISTINCT e.manager_code)         AS total_mgr,
    COUNT(DISTINCT e.employee_code)        AS total_emp
FROM Employee e
JOIN Company c 
    ON e.company_code = c.company_code
GROUP BY e.company_code, c.founder
ORDER BY e.company_code;



/*
===============================================================================
Scenario 2: Employee Table Contains ONLY Employee Details
===============================================================================

If the Employee table only contains:
- employee_code
- manager_code
- company_code

And hierarchy is normalized across tables:

Company
  → Lead_Manager
      → Senior_Manager
          → Manager
              → Employee

Then we MUST join all hierarchy tables.

Important:
Joins will create row multiplication due to one-to-many relationships.
Therefore, COUNT(DISTINCT ...) is mandatory to avoid overcounting.

===============================================================================
Query (Normalized Hierarchy Approach)
===============================================================================
*/

SELECT 
    c.company_code,
    c.founder,
    COUNT(DISTINCT lm.lead_manager_code)     AS total_lead_mgr,
    COUNT(DISTINCT sm.senior_manager_code)   AS total_senior_mgr,
    COUNT(DISTINCT m.manager_code)           AS total_mgr,
    COUNT(DISTINCT e.employee_code)          AS total_emp
FROM Company c
LEFT JOIN Lead_Manager lm 
       ON c.company_code = lm.company_code
LEFT JOIN Senior_Manager sm 
       ON lm.lead_manager_code = sm.lead_manager_code
LEFT JOIN Manager m 
       ON sm.senior_manager_code = m.senior_manager_code
LEFT JOIN Employee e 
       ON m.manager_code = e.manager_code
GROUP BY c.company_code, c.founder
ORDER BY c.company_code;

/*
===============================================================================
Key Interview Insight
===============================================================================

• If hierarchy keys are denormalized (flattened) → Use only Employee table.
• If hierarchy is normalized → Join hierarchically.
• Always use COUNT(DISTINCT ...) to prevent overcounting caused by joins.
• Sorting is lexicographical because company_code is a string.

===============================================================================
*/
