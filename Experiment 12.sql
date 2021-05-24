---1)Create a row level trigger for the customers table that would fire for INSERT or UPDATE or DELETE operations performed on the CUSTOMERS table
CREATE DATABASE TRI_TEST
GO
USE TRI_TEST
GO
CREATE TABLE CUSTOMER(ID INTEGER PRIMARY KEY,NAME	VARCHAR(20), AGE INTEGER, ADDRESS VARCHAR(30),
SALARY DECIMAL(20,0))
GO
INSERT INTO CUSTOMER VALUES(1,	'Ramesh',	32,	'Ahmedabad', 2000.00)
INSERT INTO CUSTOMER VALUES(2,	'Khilan',	25,	'Delhi',1500.00)
INSERT INTO CUSTOMER VALUES(3,	'Kaushik',	23,	'Kota',	2000.00)
INSERT INTO CUSTOMER VALUES(4,	'Chaitali',	25,	'Mumbai',6500.00)
INSERT INTO CUSTOMER VALUES(5,	'Hardik',	27,	'Bhopal',8500.00)
INSERT INTO CUSTOMER VALUES(6,	'Komal',	22,	'MP',4500.00)
GO
CREATE TABLE CUSTOMER_AUDIT(ID INTEGER, 
NAME	VARCHAR(20),
AGE INTEGER, 
ADDRESS VARCHAR(30),
SALARY DECIMAL(20,0),
Audit_Action varchar(100),
Audit_Timestamp datetime
)
GO
CREATE TRIGGER After_Insert ON [dbo].[CUSTOMER] 
FOR INSERT
AS
declare @EMPID INTEGER; 
declare @EMPNAME VARCHAR(20);
declare @EMPAGE INTEGER; 
declare @EMPADDRESS VARCHAR(30);
declare @EMPSALARY DECIMAL(20,0);
declare @audit_Action varchar(100);

	select @EMPID=i.ID from inserted i;	
	select @EMPNAME=i.NAME from inserted i;	
	select @EMPAGE=i.AGE from inserted i;	
	select @EMPADDRESS=i.ADDRESS from inserted i;
	select @EMPSALARY=i.SALARY from inserted i;	
	set @audit_action='Inserted Record -- After Insert Trigger.';

	insert into CUSTOMER_AUDIT
           (ID,NAME,AGE,ADDRESS,SALARY, Audit_Action,Audit_Timestamp) 
	values(@EMPID,@EMPNAME,@EMPAGE,@EMPADDRESS, @EMPSALARY,@audit_action,getdate());
		PRINT 'AFTER INSERT trigger fired.'
GO
INSERT INTO CUSTOMER VALUES(101,'Chetan',	25,	'jaipur',6500.00)
GO
SELECT * FROM CUSTOMER_AUDIT
SELECT * FROM CUSTOMER
GO
CREATE TRIGGER After_UPDATE ON [dbo].[CUSTOMER] 
FOR UPDATE
AS
declare @EMPID INTEGER; 
declare @EMPNAME VARCHAR(20);
declare @EMPAGE INTEGER; 
declare @EMPADDRESS VARCHAR(30);
declare @EMPSALARY DECIMAL(20,0);
declare @audit_Action varchar(100);

	select @EMPID=i.ID from inserted i;	
	select @EMPNAME=i.NAME from inserted i;	
	select @EMPAGE=i.AGE from inserted i;	
	select @EMPADDRESS=i.ADDRESS from inserted i;
	select @EMPSALARY=i.SALARY from inserted i;	
	set @audit_action='UPDATED Record -- After UPDATE Trigger.';

	insert into CUSTOMER_AUDIT
           (ID,NAME,AGE,ADDRESS,SALARY, Audit_Action,Audit_Timestamp) 
	values(@EMPID,@EMPNAME,@EMPAGE,@EMPADDRESS, @EMPSALARY,@audit_action,getdate());
		PRINT 'AFTER UPDATE trigger fired.'
GO
SELECT * FROM CUSTOMER
GO
UPDATE CUSTOMER SET SALARY=100000
WHERE NAME ='Hardik'
GO
CREATE TRIGGER After_Delete ON [dbo].[CUSTOMER] 
AFTER DELETE
AS
declare @EMPID INTEGER; 
declare @EMPNAME VARCHAR(20);
declare @EMPAGE INTEGER; 
declare @EMPADDRESS VARCHAR(30);
declare @EMPSALARY DECIMAL(20,0);
declare @audit_Action varchar(100);

	select @EMPID=d.ID from deleted d;
	select @EMPNAME=d.NAME from deleted d;
	select @EMPAGE=d.AGE from deleted d;	
	select @EMPADDRESS=d.ADDRESS from deleted d;
	select @EMPSALARY=d.SA