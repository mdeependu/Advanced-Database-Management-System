create database UPES_CSE;
go
use UPES_CSE;
go
-- Create Employee Table

CREATE TABLE EMPLOYEE
( Fname VARCHAR(15) NOT NULL, -- Adding columns
Minit CHAR,
Lname VARCHAR(15) NOT NULL, -- NOT NULL means the domain must have a value
Ssn CHAR(9) NOT NULL, -- CHAR padded to 9 spaces
Bdate DATE, -- Date, YYYY-MM-DD
Address VARCHAR(30), -- Variable length CHAR array (string)
Sex CHAR, -- Single character
Salary DECIMAL(10,2), -- Decimal up to a precision of two decimal points
Super_ssn CHAR(9),
Dno INT NOT NULL,
PRIMARY KEY (Ssn) -- Primary key constraint
);

CREATE TABLE DEPARTMENT
( Dname VARCHAR(15) NOT NULL,
Dnumber INT NOT NULL,
Mgr_ssn CHAR(9) NOT NULL,
Mgr_start_date DATE,
PRIMARY KEY (Dnumber),
UNIQUE (Dname), -- Unique value constraint - no Departments can have the same name
FOREIGN KEY (Mgr_ssn) REFERENCES EMPLOYEE(Ssn) ); -- Foreign key constraint
go
ALTER TABLE EMPLOYEE
ADD CONSTRAINT FKCONSTR1
FOREIGN KEY (Super_ssn) REFERENCES EMPLOYEE(Ssn);
go
ALTER TABLE EMPLOYEE
ADD CONSTRAINT FKCONSTR3
FOREIGN KEY (Dno) REFERENCES DEPARTMENT(Dnumber);

CREATE TABLE DEPT_LOCATIONS
( Dnumber INT NOT NULL,
Dlocation VARCHAR(15) NOT NULL,
PRIMARY KEY (Dnumber, Dlocation), -- Primary key is combined between 2 columns
FOREIGN KEY (Dnumber) REFERENCES DEPARTMENT(Dnumber) );

CREATE TABLE PROJECT
( Pname VARCHAR(15) NOT NULL,
Pnumber INT NOT NULL,
Plocation VARCHAR(15),
Dnum INT NOT NULL,
PRIMARY KEY (Pnumber), -- Primary key constraint
UNIQUE (Pname), -- Uniqye value constraint
FOREIGN KEY (Dnum) REFERENCES DEPARTMENT(Dnumber) );

CREATE TABLE WORKS_ON
( Essn CHAR(9) NOT NULL,
Pno INT NOT NULL,
Hours DECIMAL(3,1) NOT NULL,
PRIMARY KEY (Essn, Pno),
FOREIGN KEY (Essn) REFERENCES EMPLOYEE(Ssn), -- Foreign key constraint
FOREIGN KEY (Pno) REFERENCES PROJECT(Pnumber) );

ALTER TABLE UPES_CSE.dbo.EMPLOYEE
NOCHECK CONSTRAINT FKCONSTR3;

ALTER TABLE UPES_CSE.dbo.EMPLOYEE
NOCHECK CONSTRAINT FKCONSTR1;

INSERT INTO UPES_CSE.dbo.EMPLOYEE values ('Franklin', 'T', 'Wong', '333445555', '1945-12-08', '638 Voss, Houston, TX', 'M', 40000,
'888665555', 5);

select * from EMPLOYEE

INSERT INTO UPES_CSE.dbo.EMPLOYEE (Fname, Minit, Lname, Ssn, Bdate, Address, Sex, Salary, Super_ssn, Dno)values
('Joyce', 'A', 'English', '453453453', '1962-12-31', '5631 Rice, Houston, TX', 'F',
25000, '333445551', 5);
INSERT INTO UPES_CSE.dbo.EMPLOYEE values
('Ramesh', 'K', 'Narayan', '666884444', '1952-09-15', 'Fire Oak, Humble, TX', 'M', 38000,
'33344555', 5);

INSERT INTO UPES_CSE.dbo.EMPLOYEE values
('James', 'E', 'Borg', '888665555', '1927-11-10', 'Stone, Houston, TX', 'M', 55000, NULL,
1),
('Jennifer', 'S', 'Wallace', '987654321', '1931-06-20', 'Berry, Bellaire, TX', 'F',
43000, '888665555', 4);
INSERT INTO UPES_CSE.dbo.EMPLOYEE values
('Alicia', 'J', 'Zelaya', '999887777', '1958-06-19', 'Castle, SPring, TX', 'F', 25000,
'987654321', 4);

INSERT INTO UPES_CSE.dbo.DEPARTMENT values
('Headquarters', 1, '888665555', '1971-06-19'),
('Administration', 4, '987654321', '1985-01-01'),
('Research', 5, '333445555', '1978-05-22'),
('Automation', 7, '123456789', '2006-10-05');

INSERT INTO UPES_CSE.dbo.DEPARTMENT values
('Headquarters', 1, '888665555', '1971-06-19'),
('Administration', 4, '987654321', '1985-01-01'),

INSERT INTO UPES_CSE.dbo.DEPARTMENT values
('Administration', 4, '987654321', '1985-01-01')

INSERT INTO UPES_CSE.dbo.DEPARTMENT values ('Headquarters', 1, '888665555', '1971-06-19')

INSERT INTO UPES_CSE.dbo.DEPT_LOCATIONS VALUES
(1, 'Houston')