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