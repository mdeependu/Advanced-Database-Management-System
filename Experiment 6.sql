create database experiment6
go
use experiment6
go

CREATE TABLE EMPLOYEE(
Employee_id    VARCHAR(10) NOT NULL PRIMARY KEY,
First_Name    VARCHAR(30),
Last_Name    VARCHAR(30) NOT NULL, 
DOB    Date,
salary    DECIMAL(25,0) NOT NULL,
Department_id VARCHAR(10)
)
go

--1 Create View of name emp_view and the column would be Employee_id, Last_Name, salary and department_id only.
CREATE VIEW employee_view(Employee_id, Last_Name, salary, Department_id) AS
SELECT Employee_id, Last_Name, salary, Department_id FROM EMPLOYEE
GO

--2)    Insert values into view(remove the NOT NULL constraint and then insert values)
INSERT INTO employee_view VALUES('EMP000111', 'JAIN', 50000, 'INFORMATIC')


SELECT * from employee_view

INSERT INTO employee_view VALUES('EMP000111', 'JAIN', 50000, 'INFORMATIC')
GO
SELECT * from employee_view
GO
INSERT INTO employee_view VALUES ('EMP000112', 'Joyce', 25000, 'ECE')
INSERT INTO employee_view VALUES ('EMP000113', 'Ramesh',38000, 'ME')
INSERT INTO employee_view VALUES ('EMP000114', 'James', 55000, 'CIVIL')
INSERT INTO employee_view VALUES('EMP000115','Jennifer',65555, 'IT')
GO
SELECT * from employee_view

---3
UPDATE employee_view
SET salary=60000
WHERE Employee_id='EMP000112'
GO
SELECT * from employee_view

--DELETE
DELETE FROM employee_view
WHERE Last_Name='Ramesh'
GO
SELECT * from employee_view

INSERT INTO employee_view VALUES('EMP000116','GUPTA',80000, '20')
GO
SELECT * from employee_view
go

CREATE VIEW sal_view(Emp_id, L_Name, Salary) AS
SELECT Employee_id, Last_Name, salary FROM EMPLOYEE
WHERE Department_id='20'
go
SELECT * FROM sal_view