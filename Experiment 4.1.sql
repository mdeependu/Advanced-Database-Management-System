use Experiment4
go
select * from EMPLOYEE
GO
select * from DEPARTMENT
GO
--1
select * from EMPLOYEE where sal>(select sal from EMPLOYEE where ename = 'BLAKE')

--2
select * from EMPLOYEE where job=(select job from EMPLOYEE where ename = 'ALLEN')

--3
Select * from EMPLOYEE where sal in (select sal from EMPLOYEE where ename = 'SMITH' or ename = 'FORD')
order by ENAME desc;

--4
select * from EMPLOYEE where job =(select job from EMPLOYEE where ename = 'MILLER') OR sal>(select sal from EMPLOYEE where ename = 'ALLEN')

--5
select * from EMPLOYEE where sal =(select max(sal) from EMPLOYEE where deptno=(select d.DEPTNO from
DEPARTMENT d where d.dname = 'SALES'))

--6
select * from EMPLOYEE where hiredate < (select max(hiredate) from EMPLOYEE where mgr
in (select empno from EMPLOYEE where ename = 'KING'))

--7
select e.ename,e.deptno from EMPLOYEE e where e.sal in (select max(sal) from EMPLOYEE group by deptno)

--8
select * from EMPLOYEE where sal =(select (max(sal)+min(sal))/2 from EMPLOYEE)

--9
select * from EMPLOYEE e where hiredate in (select hiredate from EMPLOYEE where e.empno <> empno)

--10
select * from EMPLOYEE e where hiredate<(select hiredate from EMPLOYEE where empno = e.mgr)


---Experiment 5
--1
select deptno, count(*) from employee
group by deptno
having count(*)=0

--2
select count(*),avg(sal),deptno,job from employee
group by deptno,job;

--3
select avg(SAL),job from EMPLOYEE 
where JOB!= 'PRESIDENT' 
group by JOB

--4
select deptno ,count(*) from EMPLOYEE group by deptno
having count(*)>=2

--5
select deptno,count(*) from EMPLOYEE group by deptno having count(*)>3

--6
select E.ename,E.deptno, E.SAL from EMPLOYEE E where E.sal in (select max(sal)from EMPLOYEE group by deptno)

--7
select deptno,avg(sal) from EMPLOYEE group by deptno 
having avg(sal)<(select avg(Sal) from EMPLOYEE)