-- 1. Write a query to display name of the employees earning salary more than Adams
SELECT ENAME
FROM EMP
WHERE SAL > (SELECT SAL FROM EMP
			 WHERE ENAME = 'ADAMS');

-- 2. Write a query to display name and salary of the employees earning salary less than King 
SELECT ENAME, SAL
FROM EMP
WHERE SAL < (SELECT SAL FROM EMP
			 WHERE ENAME = 'KING');

-- 3. Write a query to display name and department number of the employees if they are working in same department number us jones
SELECT ENAME, DEPTNO
FROM EMP
WHERE DEPTNO IN (SELECT DEPTNO FROM EMP
				 WHERE ENAME = 'JONES');

-- 4. Write a query to display name and job of all the employees working in same designation as James 
SELECT ENAME, JOB
FROM EMP
WHERE JOB IN (SELECT JOB FROM EMP
				 WHERE ENAME = 'JAMES');

-- 5. Write a quite to display employee number and employee name along with ANNUAL salary of all the employees if the salary is greater than miller
SELECT EMPNO, ENAME, SAL * 12 AS ANNUAL_SAL
FROM EMP
WHERE SAL > (SELECT SAL FROM EMP
				 WHERE ENAME = 'MILLER');

-- 6. Write a query to display name and higher rate of employees if they are hired before Scott 
SELECT ENAME, HIREDATE
FROM EMP
WHERE HIREDATE > (SELECT HIREDATE FROM EMP
				 WHERE ENAME = 'SCOTT');

-- 7. Write a Quadri to display name and higher date of the employees if they are hired after the president 
SELECT ENAME, HIREDATE
FROM EMP
WHERE HIREDATE > (SELECT HIREDATE FROM EMP
				 WHERE JOB = 'PRESIDENT');

-- 8. Write a quite to display name and salary of the employees if their earning salary less than the employees whose employee number is 7839
SELECT ENAME, SAL
FROM EMP
WHERE SAL < (SELECT SAL FROM EMP
			 WHERE EMPNO = 7839);
 
-- 9. Write a quite to display all the details of the employees if the employees are hired before Miller 
SELECT *
FROM EMP
WHERE HIREDATE > (SELECT HIREDATE FROM EMP
				 WHERE ENAME = 'MILLER');

-- 10. Write a quite to display employee name and employee number of the employees if employees are earning more than Allen 
SELECT ENAME, EMPNO
FROM EMP
WHERE SAL > (SELECT SAL FROM EMP
				 WHERE ENAME = 'ALLEN');

-- 11. Write a query to display employee name and salary of all the employees who are earning salary more than Miller but less than Allen 
SELECT ENAME, SAL
FROM EMP
WHERE SAL > (SELECT SAL FROM EMP
				 WHERE ENAME = 'MILLER') AND 
	  SAL < (SELECT SAL FROM EMP
				 WHERE ENAME = 'ALLEN');

-- 12. Write a quite display all the details of employees working in department number 20 and working in the same designation as Smith 
SELECT *
FROM EMP
WHERE DEPTNO = 20 
	AND JOB IN (SELECT JOB FROM EMP WHERE ENAME = 'SMITH');

-- 13. Write a quite to display all the details of the employees working as manager in the same department as turner 
SELECT *
FROM EMP
WHERE JOB = 'MANAGER'
	AND DEPTNO IN (SELECT DEPTNO FROM EMP WHERE ENAME = 'TURNER');

-- 14. Write a query to display name and high rate of the employees hired after 1980 and before king 
SELECT ENAME, HIREDATE
FROM EMP
WHERE HIREDATE >= '1981-01-01' AND
	  HIREDATE < (SELECT HIREDATE FROM EMP WHERE ENAME = 'KING');

-- 15. Write a query to display name and salary along with annual salary for all the employees whose salary is less than black and more than 3500
SELECT ENAME, SAL, SAL * 12 AS ANNUAL_SAL
FROM EMP
WHERE SAL < (SELECT SAL FROM EMP WHERE ENAME = 'BLAKE') AND
	  SAL > 3500;

-- 16. Write a quaid to display all the details of employees whose earning more than Scott but less than King 
SELECT *
FROM EMP
WHERE SAL > (SELECT SAL FROM EMP WHERE ENAME = 'SCOTT') AND
	SAL < (SELECT SAL FROM EMP WHERE NEMAE = 'KING');

-- 17. Write a quite to display name of the employees whose name starts with a and work in the same department as Blake 
SELECT ENAME
FROM EMP
WHERE ENAME LIKE 'A%' AND
	DEPTNO IN (SELECT DEPTNO FROM EMP WHERE NEAME = 'BLAKE');

-- 18. Write a quaid to display name and commission if employees earning commission and work in the same department as Smith 
SELECT ENAME, COMM
FROM EMP
WHERE COMM IS NOT NULL AND
	  DEPTNO IN (SELECT DEPTNO FROM EMP WHERE ENAME = 'SMITH');

-- 19. Write a quite to display details of all the employees working as clerk in the same department as turner 
SELECT *
FROM EMP
WHERE JOB = 'CLERK' AND
	DEPTNO IN (SELECT DEPTNO FROM EMP WHERE ENAME = 'TURNER');

-- 20. Write a quite to display name, salary and resignation of the employees whose salaries more than Smith but less than King
SELECT ENAME, SAL, JOB
FROM EMP
WHERE SAL > (SELECT SAL FROM EMP WHERE ENAME = 'SMITH') AND
	SAL < (SELECT SAL FROM EMP WHERE ENAME = 'KING');