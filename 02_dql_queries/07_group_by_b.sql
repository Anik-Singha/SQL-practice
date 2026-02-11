USE SQL10AM;
--  1. Write a query to display number of employees working in each department except president 

SELECT COUNT(*)
FROM EMP
WHERE JOB != 'PRESIDENT'
GROUP BY DEPTNO;

-- 2. Write a query to display total salary needed to pay to all the employees in each job 

SELECT SUM(SAL)
FROM EMP
GROUP BY JOB;

-- 3. Write a quaid to display number of employees working as manager in each department number 

SELECT COUNT(*)
FROM EMP
WHERE JOB = 'MANAGER'
GROUP BY DEPTNO;

-- 4. Write a query to display average salary needed to pay to all the employees in each department number excluding the employees of departmental number 20 

SELECT AVG(SAL)
FROM EMP
WHERE DEPTNO != 20
GROUP BY DEPTNO;

-- 5. Write a query to display number of employees having character a in their names in each job 

SELECT COUNT(*)
FROM EMP
WHERE ENAME LIKE '%A%' 
GROUP BY JOB;

-- 6. Write a query to display number of employees and salary needed to pay to the employees whose salary is greater than 2000 in each department number 

SELECT COUNT(*), SUM(SAL)
FROM EMP
WHERE SAL > 2000
GROUP BY DEPTNO;

-- 7. Write a query to display total salary needed to pay and number of salesman in each department number 

SELECT SUM(SAL), COUNT(*)
FROM EMP
GROUP BY DEPTNO;

-- 8. Write a query to display maximum salaries given to an employees working in each department number 

SELECT MAX(SAL)
FROM EMP
GROUP BY DEPTNO;

-- 9. Write a coil to display number of times the salary present in employee table 

SELECT COUNT(SAL)
FROM EMP;

-- 10. Write a query to display number of employees with their maximum salary in each job
SELECT COUNT(*), MAX(SAL)
FROM EMP
GROUP BY JOB;