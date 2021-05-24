Create database experiment11
GO
USE experiment11
go
CREATE TABLE EMPLOYEE
( 
EMPID INTEGER PRIMARY KEY, 
ENAME VARCHAR(30),
JOB VARCHAR(20),
MGR INTEGER,
HIREDATE  DATE, 
SALARY INTEGER,
COMM INTEGER,
DEPTNO INTEGER
)

insert into EMPLOYEE values(7499, 'ALLEN','SALESMAN', 7698,'20-FEB-81',1600,300,30)
insert into EMPLOYEE values(7521, 'WARD',  'SALESMAN',7698, '22-FEB-81', 1250,500,30)
insert into EMPLOYEE values(7566, 'JONES','MANAGER', 7839,'02-APR-81',2975,0,20)
insert into EMPLOYEE values(7654, 'MARTIN', 'SALESMAN',7698, '28-SEP-81',1250,1400,30)
insert into EMPLOYEE values(7698, 'BLAKE', 'MANAGER',7839,'01-MAY-81',2850,0,30)
insert into EMPLOYEE values(7782, 'CLARK', 'MANAGER',7839,'09-JUN-81',2450,0,10)
insert into EMPLOYEE values(7788, 'SCOTT', 'ANALYST',7566,'09-DEC-82',3000,0,20)
insert into EMPLOYEE values(7839, 'KING', 'PRESIDENT',7599,'17-NOV-81',5000,0,10)
insert into EMPLOYEE values(7844,'TURNER', 'SALESMAN', 7698,'08-SEP-81',1500,0,30)

GO
CREATE TABLE EMPLOYEE_AUDIT_SAL
( 
EMPID INTEGER, 
ENAME VARCHAR(30),
JOB VARCHAR(20),
HIREDATE  DATE, 
SALARY INTEGER,
DEPTNO INTEGER
)
GO
DECLARE @emp_id integer, @emp_name VARCHAR(50), @emp_job varchar(20),@emp_date date,  @emp_salary integer,@emp_dept integer, @row integer;
DECLARE UPDATE_EM22 CURSOR FOR
SELECT EMPID, ENAME, JOB, HIREDATE, SALARY, DEPTNO FROM EMPLOYEE
OPEN UPDATE_EM22
FETCH NEXT FROM UPDATE_EM22 INTO @emp_id, @emp_name, @emp_job, @emp_date, @emp_salary,@emp_dept 
--set @emp_salary=@emp_salary+@emp_salary*0.1
WHILE @@FETCH_STATUS = 0
BEGIN
--SELECT @emp_id AS EMPID, @emp_name AS ENAME, @emp_job AS JOB, @emp_date AS JOINING_DATE, @emp_salary AS SALARY,@emp_dept AS DEPT
SET @emp_salary=@emp_salary+@emp_salary*0.1
insert into EMPLOYEE_AUDIT_SAL(EMPID,ENAME,JOB,HIREDATE,SALARY,DEPTNO) VALUES (@emp_id, @emp_name, @emp_job, @emp_date, @emp_salary,@emp_dept)
FETCH NEXT FROM UPDATE_EM22 INTO @emp_id, @emp_name, @emp_job, @emp_date, @emp_salary,@emp_dept 
--SET @emp_salary=@emp_salary+@emp_salary*0.1
--insert into EMPLOYEE_AUDIT(EMPID,ENAME,JOB,HIREDATE,SALARY,DEPTNO) VALUES (@emp_id, @emp_name, @emp_job, @emp_date, @emp_salary,@emp_dept)
END
SET @row = (SELECT COUNT(*) FROM EMPLOYEE_AUDIT_SAL)
if @row=0 
print 'No Change' 
else
select * from EMPLOYEE_AUDIT_SAL
order by EMPID
CLOSE UPDATE_EM22
DEALLOCATE UPDATE_EM22
GO
SELECT * FROM EMPLOYEE
ORDER BY EMPID

DECLARE @employee_id integer, @emp_name VARCHAR(50), @emp_salary integer;
DECLARE FETCH_CURSOR CURSOR FOR
SELECT EMPID, ENAME, SALARY FROM EMPLOYEE
OPEN FETCH_CURSOR
FETCH NEXT FROM FETCH_CURSOR INTO @employee_id, @emp_name, @emp_salary 

WHILE @@FETCH_STATUS = 0
BEGIN
select @employee_id, @emp_name, @emp_salary
FETCH NEXT FROM FETCH_CURSOR INTO @employee_id, @emp_name, @emp_salary 
END
CLOSE FETCH_CURSOR
DEALLOCATE FETCH_CURSOR
GO

--3.	Using explicit cursor Insert the records from EMPLOYEES table for the columns employee_id, Last_Name 
--      and salary for those records whose salary exceeds 2500 into a new table TEMP_EMP
CREATE TABLE EMPLOYEE_TEMP
( 
EMPID INTEGER, 
ENAME VARCHAR(30),
SALARY INTEGER
)
DECLARE @emp_id integer, @emp_name VARCHAR(50), @emp_salary integer;
DECLARE INSERT_CURSOR CURSOR FOR
SELECT EMPID, ENAME, SALARY FROM EMPLOYEE
OPEN INSERT_CURSOR
FETCH NEXT FROM INSERT_CURSOR INTO @emp_id, @emp_name, @emp_salary 

WHILE @@FETCH_STATUS = 0
BEGIN
--select @emp_id, @emp_name, @emp_salary
IF @emp_salary>2500
insert into EMPLOYEE_TEMP(EMPID,ENAME,SALARY) VALUES (@emp_id, @emp_name,@emp_salary)
FETCH NEXT FROM INSERT_CURSOR INTO @emp_id, @emp_name, @emp_salary 
END
CLOSE INSERT_CURSOR
DEALLOCATE INSERT_CURSOR
GO
SELECT * FROM EMPLOYEE_TEMP
ORDER BY EMPID