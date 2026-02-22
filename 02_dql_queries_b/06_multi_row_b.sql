USE SQL10AM;
-- 01 DISPLAY MAX SAL, MIN SAL, AVG SAL, TOTAL SAL AND NO OF SAL PRESENT IN EMP TABLE
SELECT MAX(SAL), 
	   MIN(SAL),
       AVG(SAL),
       SUM(SAL),
       COUNT(*)
FROM EMP;

-- 02 DISPLAY NO OF EMPS WORKING IN DEPTNO 10
SELECT COUNT(*)
FROM EMP
WHERE DEPTNO = 10;

-- 03 DISPLAY TOTAL SAL FROM EMP TABLE WHERE JOB IS CLERK
SELECT SUM(SAL)
FROM EMP
WHERE JOB = 'CLERK';

-- 04 DISPLAY NO OF EMPS WHERE ENAME HAS A AS FIRST CHARACTER
SELECT COUNT(*)
FROM EMP
WHERE ENAME LIKE 'A%';

-- 05 Write a query to display average salary needed to pay all the employees
SELECT AVG(SAL)
FROM EMP;

-- 06 Write a Quadri to display number of employees working as clerk or manager
SELECT COUNT(*)
FROM EMP
WHERE JOB IN ('CLERK','MANAGER');

-- 7. Write a query to display number of employees reporting to 7819 
SELECT COUNT(*)
FROM EMP
WHERE MGR = 7819;

-- 8. Write a query to display number of employees getting commission in department number of 30 
SELECT COUNT(*)
FROM EMP
WHERE COMM IS NOT NULL AND
	DEPTNO = 30;
    
-- 9. Write a query to display average salary total salary number of employees and maximum salary given to the employees working as president 
SELECT AVG(SAL),
		SUM(SAL),
        COUNT(*),
        MAX(SAL)
FROM EMP
WHERE JOB = 'PRESIDENT';

-- 10. Write a query to display number of employees having a in the ename

SELECT COUNT(*)
FROM EMP
WHERE ENAME LIKE '%A%';

-- 11. Write a queryto display number of employees having s in there names 

SELECT COUNT(*)
FROM EMP
WHERE ENAME LIKE '%S%';

-- 12. Write a query to display total salary given to the employees working as clerk in department number 30

SELECT SUM(SAL)
FROM EMP
WHERE JOB = 'CLERK' AND DEPTNO = 30;

-- 13. Write a query to display maximum salary given to the employees working as analyst 

SELECT MAX(SAL)
FROM EMP
WHERE JOB = 'ANALYST';

-- 14. Write a query to display number of salaries present in the emploitable 

SELECT COUNT(SAL)
FROM EMP;

-- 15. Write a query to display minimum salary given to the employees who are working in department number 10 as manager or a clerk
	
SELECT MAX(SAL)
FROM EMP
WHERE DEPTNO = 10 AND JOB IN ('MANAGER','CLERK');