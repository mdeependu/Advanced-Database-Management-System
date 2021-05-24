create database experiment2_b2
GO
use experiment2_b2
GO
CREATE TABLE client_master_1(
CLIENT_NO CHAR(6) CHECK (CLIENT_NO like 'C%'),
NAME VARCHAR(20) NOT NULL, 
ADDRESS1 VARCHAR(30),
ADDRESS2 VARCHAR(30),
CITY VARCHAR(15),
PINCODE INTEGER,
STATE VARCHAR(15),
BAL_DUE DECIMAL(10,2),
PRIMARY KEY(CLIENT_NO)
)
GO
CREATE TABLE PRODUCT_MASTER_1(
PRODUCT_NO CHAR(6) PRIMARY KEY,
DESCRIPTION VARCHAR(15) NOT NULL,
PROFITPERCENT DECIMAL (4,2) NOT NULL,
UNITMEASURE VARCHAR(10) NOT NULL,
QTYONHAND INTEGER NOT NULL,
REORDERLVL INTEGER NOT NULL,
SELLPRICE DECIMAL(8,2) NOT NULL,
COSTPRICE DECIMAL(8,2) NOT NULL,
CHECK (PRODUCT_NO like 'P%')
)

CREATE TABLE SALESMAN_MASTER_2(
SALESMAN_NO CHAR(6) NOT NULL,
SALESMANNAME VARCHAR(20) NOT NULL,
ADDRESS1 VARCHAR(30) NOT NULL,
ADDRESS2 VARCHAR(30),
CITY VARCHAR(20),
PINCODE INTEGER,
STATE VARCHAR(20),
SALAMT DECIMAL(8,2) NOT NULL,
TGTTOGET DECIMAL(6,2) NOT NULL,
YTDSALES DECIMAL(6,2) NOT NULL,
REMARKS VARCHAR(60),
PRIMARY KEY(SALESMAN_NO),
CONSTRAINT check_SALESMAN1_NO CHECK (SALESMAN_NO like 'S%')
)

insert into client_master_1 values('C00011', 'Ivan bayross','','', 'Mumbai', 400054,'Maharashtra', 15000);
GO
SELECT * FROM client_master_1
insert into client_master_1 values('C0002', 'Mamta muzumdar','','', 'Madras',780001,'Tamilnadu', 0);
GO
insert into client_master_1 values('C0003', 'Chhaya bankar','','', 'Mumbai','400057', 'Maharashtra', 5000);
GO
insert into client_master_1 values('C0004', 'Ashwini  joshi','','', 'Bangalore','560001', 'Karnataka', 0);
GO
insert into client_master_1 values('C0005', 'Hansel colaco','','', 'Mumbai' ,'400060','Maharashtra', 2000);
GO
insert into client_master_1 values('C0006', 'Deepak sharma','','', 'Mangalore', '560050', 'Karnataka',0);

insert into PRODUCT_MASTER_1 values ('P00015','T-Shirt',5,'Piece',200,50,350,0)
GO
SELECT * FROM PRODUCT_MASTER_1

insert into PRODUCT_MASTER_1 values ('P0345','Shirts',6,'Piece',150,50,500,350);
insert into PRODUCT_MASTER_1 values ('P06734','Cotton jeans',5,'Piece',100,20,600,450);
insert into PRODUCT_MASTER_1 values ('P07865','Jeans',5, 'Piece',100,20,750,500);
insert into PRODUCT_MASTER_1 values ('P07868','Trous',2,'Piece',150,50,850,550);
insert into PRODUCT_MASTER_1 values ('P07885','Pull Overs',2.5,'Piece',80,30,700,450);
insert into PRODUCT_MASTER_1 values ('P07965','Denim jeans',4,'Piece',100,40,350,250);
insert into PRODUCT_MASTER_1 values ('P07975','Lycra tops',5,'Piece',70,30,300,175);
insert into PRODUCT_MASTER_1 values ('P08865','Skirts',5,	'Piece',75,30,450,300);

insert into SALESMAN_MASTER_2 values ('S00001',	'Aman',	'A/14',	'Worli','Mumbai',400002,'Maharashtra',100,60,80,'');
insert into SALESMAN_MASTER_2 values ('S00002','Omkar','65','Nariman','Mumbai',400001,'Maharashtra',70,150,170,'');
insert into SALESMAN_MASTER_2 values ('S00003','Raj','P-7','Bandra','Mumbai',400032, 'Maharashtra',85,75,100,'');
insert into SALESMAN_MASTER_2 values ('S00004','Ashish','A/5','Juhu','Mumbai',400044,'Maharashtra',50,500,800,'');

Create table AUTHOR (
Author_ID varchar(5) PRIMARY KEY NOT NULL,
Lastname VARCHAR(15) NOT NULL,
Firstname VARCHAR(15) NOT NULL,
Email VARCHAR(50),
City VARCHAR (15),
Country VARCHAR(15)
)

Create Table BOOK(
Book_ID VARCHAR(5) PRIMARY KEY CHECK(Book_ID LIKE '%B'), 
Book_Title VARCHAR(40) NOT NULL, 
Copies INTEGER check(Copies>2) NOT NULL
) 

Author_ID,Book_ID
Create table AUTHOR_LIST (
Author_ID  VARCHAR(5),
Book_ID VARCHAR(5),
Role VARCHAR(15),
PRIMARY KEY(Author_ID, Book_ID)
)

insert into AUTHOR values ('A1011', 'Srinivasan', 'Singh','Srinivasan@gmail.com','Chennai', 'India')
insert into AUTHOR values ('A2121', 'Wu', 'JHOU', 'WU@YAHOO.COM','HONKONG', 'CHINA');
insert into AUTHOR values ('A5151', 'Mozart', 'GUPTA', 'GUPTA@GMAIL.COM', 'DELHI', 'INDIA');

insert into BOOK1 values ('1000B', 'DATA BASE SYSTEM',20)

alter table AUTHOR_LIST add Publisher varchar(30)


exec sp_columns AUTHOR_LIST

