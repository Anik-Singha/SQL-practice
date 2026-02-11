USE SQL10AM;

/*
	01 Details of emps along with annual sal and 5000 increment in annual sal and 40% cut in monthly sal , where all emps are working as Salesman,
    in dept no 10,20,30 and emp no in 7801,7802,7803 and hired after 2010 but getting sal less than 20000.
*/
SELECT EMP.*,
		SAL* 12,
        SAL*12 +5000,
        SAL - SAL*40/100
FROM EMP
WHERE JOB = 'SALESMAN'
	AND DEPTNO IN (10,20,30)
    AND EMPNO IN (7801,7802,7803)
    AND HIREDATE >= '2011-01-01'
    AND SAL < 20000;

/*
	02 name and deptno of emps where job in Salesman or Manager and sal not in 1000,2000,3000
*/
SELECT ENAME,DEPTNO
FROM EMP
WHERE JOB IN ('SALESMAN','MANAGER') AND
	SAL NOT IN (1000,2000,3000);
    
/*
	03 display ename and sal from emp where sal  more than 1000 and less than 5000.
*/
SELECT ENAME,SAL
FROM EMP
WHERE SAL BETWEEN 1001 AND 4999;

/*
	04 name and sal of emps where sal in range 1000 and 5000
*/
SELECT ENAME,SAL
FROM EMP
WHERE SAL BETWEEN 1000 AND 5000;

/*
	05 name and sal of emps where emps are getting sal in range between 1000 and 5000
*/
SELECT ENAME, SAL
FROM EMP
WHERE SAL BETWEEN 1001 AND 4999;

/*
	06 dname and deptno of emps where emps are working in location of India,Srilanka,NewYork and 
    not working in deptname of Accounting, Sales and  working in range of 10 to 40 deptno and
    not working in deptno 10 to 50
*/
SELECT DNAME,DEPTNO
FROM DEPT
WHERE LOC IN ('INDIA','SIRLANKA','NEWyORK')
	AND DNAME NOT IN ('ACCOUNTIN','SALES')
    AND DEPTNO BETWEEN 10 AND 40
    AND DEPTNO NOT BETWEEN 21 AND 49;

/*
	07 name, sal and hiredate of emps where emps are getting sal in range of 1000 to 10000
    and not getting sal in range between 5000 to 10000 and hired in range of 1990 to 2000 and not 
    hired in rnage between 1995 to 2000
*/
SELECT ENAME,SAL, HIREDATE
FROM EMP
WHERE SAL BETWEEN 1000 AND 10000
	AND SAL NOT BETWEEN 5001 AND 9999
    AND HIREDATE BETWEEN '1990-01-01' AND '2012-12-31'
    AND HIREDATE NOT BETWEEN '1990-01-01' AND '1991-12-31';
    
/*
	08 Display name and commision of emps not getting commision
*/
SELECT ENAME,COMM
FROM EMP
WHERE COMM IS NULL;

/*
	09 Name and sal of emps where the emps are not getting sal
*/
SELECT ENAME, SAL
FROM EMP
WHERE SAL IS NULL;

/*
	10 Name, sal and comm of emps where emps are getting sal but not getting comms.
*/
SELECT ENAME,SAL,COMM
FROM EMP
WHERE SAL IS NOT NULL AND COMM IS NULL;

/*
	11 Name and sal of emps where the emps are having A as first char and 5th char should be S and end with T.
    and they are getting 5 digits of sal.
*/
SELECT ENAME, SAL
FROM EMP
WHERE ENAME LIKE 'A___S%T' AND
	SAL LIKE '_____';
    
/*
	12 Name, deptno and joblist of emps where emps are having S as first char and 6th char should be T and
    last but 3rd char should be A and 7th char should be S in the joblist.
*/
SELECT ENAME, DEPTNO, JOB
FROM EMP
WHERE JOB LIKE 'S____TS%A__';


/*
	13 Details of emps where emps are working as Salesman or Manager and not working in deptno 10,20,30
    and getting sal in the range of 1000 to 5000 and they are not hired in range of 2000 to 2010 and they
    are not having comm but dont have empno and name starts with S and end with I and should not have S 
    as 5th char and not getting 5 digit salary.
*/
SELECT *
FROM EMP
WHERE JOB IN ('SALESMAN','MANAGER')
	AND DEPTNO NOT IN (10,20,30)
    AND SAL BETWEEN 1000 AND 5000
    AND HIREDATE NOT BETWEEN '2000-01-01' AND '2010-12-31'
    AND COMM IS NOT NULL
    AND EMPNO IS NULL
    AND ENAME LIKE 'S%I'
    AND ENAME NOT LIKE '____S%'
    AND SAL NOT LIKE '_____';