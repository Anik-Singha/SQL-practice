USE SQL10AM;
-- 01 Write a query to display employees whose commission is null
SELECT *
FROM EMP
WHERE COMM IS NULL;

-- 02 Write a query to display to display who are working as a salesman in department number 30 20
SELECT *
FROM EMP 
WHERE JOB= 'SALESMAN' AND (DEPTNO = 20 OR DEPTNO = 30);

-- 03 Write a query to display all the salesman in department number 30 and having salary greater than 1500
SELECT *
FROM EMP 
WHERE JOB = 'SALESMAN' AND DEPTNO =30 AND SAL > 1500;

-- 04 List all the employees who's are getting salary in the range between 5000 to 8000
SELECT *
FROM EMP
WHERE SAL >=5000 AND SAL <= 8000 ;

-- 05 List all the employees except those who are working in department number 10 and 20
SELECT *
FROM EMP
WHERE DEPTNO = 10 OR DEPTNO =20;

-- 06 Lish all the employees who are having reporting manager in department 10
SELECT *
FROM EMP
WHERE MGR IS NOT NULL AND DEPTNO = 10;

-- 07 List all the employees who commission is null and working as clerk
SELECT *
FROM EMP 
WHERE COMM IS NULL AND JOB = 'CLERK';

-- 08 List all the employees who don't have a reporting manager in department number 10 or 30
SELECT *
FROM EMP
WHERE MGR IS NULL AND (DEPTNO = 10 OR DEPTNO = 30);

-- 09 List all the salesman in department 30 with sal more then 2450
SELECT *
FROM EMP
WHERE JOB = 'SALESMAN' AND DEPTNO = 30 AND SAL > 2450;

-- 10 Write a query to display hiredate and name of employees who are all hired after 2004 to 2010
SELECT HIREDATE, ENAME
FROM EMP
WHERE HIREDATE >= '2005-01-01' OR HIREDATE < '2011-01-01';

-- 11 WAQTD name of the employees who's name start with s and end with t
SELECT ENAME
FROM EMP
WHERE ENAME LIKE 'S%T';

-- 12 Waqtd name of the employees who's name contains last but 3rd letter is m
SELECT ENAME
FROM EMP
WHERE ENAME LIKE '%M__';

-- 13 Waqtd name of the employees who's name contains last but ist letter is e
SELECT ENAME
FROM EMP
WHERE ENAME LIKE '%E';

-- 14 Waqtd name of the employees who's name end with s
SELECT ENAME
FROM EMP
WHERE ENAME LIKE '%S';

-- 15 Waqtd name of the employees who's having only 5 letters
SELECT ENAME
FROM EMP
WHERE ENAME LIKE '_____';

-- 16 Waqtd name of the employees who's 3 letter is s
SELECT ENAME
FROM EMP
WHERE ENAME LIKE '__S%';

-- 17 Waqtd name of the employees who's name having 6 charector
SELECT ENAME
FROM EMP
WHERE LENGTH(ENAME) =6 ;

-- 18 Waqtd job of the employees who's job start with s
SELECT JOB
FROM EMP
WHERE JOB LIKE 'S%';

-- 19 Waqtd name of the employees who's name start with a and 3rd charector is s
SELECT ENAME
FROM EMP
WHERE ENAME LIKE 'A_S%';

-- 20 Waqtd name of the employees who's name having 5 letter and 4th charector is s
SELECT ENAME
FROM EMP
WHERE ENAME LIKE '___S_';