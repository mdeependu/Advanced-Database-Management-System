CREATE DATABASE PRODUCT1
GO
USE PRODUCT1
GO

CREATE TABLE client_master(
CLIENT_NO CHAR(6),
NAME VARCHAR(20), 
ADDRESS1 VARCHAR(30),
ADDRESS2 VARCHAR(30),
CITY VARCHAR(15),
PINCODE INTEGER,
STATE VARCHAR(15),
BAL_DUE DECIMAL(10,2));
GO

SELECT * FROM client_master
GO

CREATE TABLE product_master(
PRODUCT_NO CHAR(6),
DESCRIPTION VARCHAR(15),
PROFITPERCENT DECIMAL(4,2),
UNITMEASURE VARCHAR(10),
QTYONHAND INTEGER,
REORDERLVL INTEGER,
SELLPRICE DECIMAL(8,2),
COSTPRICE DECIMAL(8,2));
GO

CREATE TABLE salesman_master(
SALESMAN_NO CHAR(6),
SALESMANNAME VARCHAR(20),
ADDRESS1 VARCHAR(30),
ADDRESS2 VARCHAR(30),
CITY VARCHAR(20),
PINCODE REAL,
STATE VARCHAR(20),
SALAMT INTEGER,
TGTTOGET DECIMAL(6,2),
YTDSALES DECIMAL(6,2),
REMARKS VARCHAR(60));
GO

insert into client_master values('C0001', 'Ivan bayross','','', 'Mumbai', 400054,'Maharashtra', 15000);
GO
insert into product_master values ('P00001','T-Shirt',5,'Piece',200,50,350,250);
GO
insert into salesman_master values ('S00001',	'Aman',	'A/14',	'Worli','Mumbai',400002,'Maharashtra',0,0,0,'');
GO

SELECT * FROM client_master
insert into client_master values('C0002', 'Mamta muzumdar','','', 'Madras',780001,'Tamilnadu', 0);
insert into client_master values('C0003', 'Chhaya bankar','','', 'Mumbai','400057', 'Maharashtra', 5000);
insert into client_master values('C0004', 'Ashwini  joshi','','', 'Bangalore','560001', 'Karnataka', 0);
insert into client_master values('C0005', 'Hansel colaco','','', 'Mumbai' ,'400060','Maharashtra', 2000);
insert into client_master values('C0006', 'Deepak sharma','','', 'Mangalore', '560050', 'Karnataka',0);
GO

SELECT * FROM product_master
insert into product_master values ('P0345','Shirts',6,'Piece',150,50,500,350);
insert into product_master values ('P06734','Cotton jeans',5,'Piece',100,20,600,450);
insert into product_master values ('P07865','Jeans',5, 'Piece',100,20,750,500);
insert into product_master values ('P07868','Trousers',2,'Piece',150,50,850,550);
insert into product_master values ('P07885','Pull Overs',2.5,'Piece',80,30,700,450);
insert into product_master values ('P07965','Denim jeans',4,'Piece',100,40,350,250);
insert into product_master values ('P07975','Lycra tops',5,'Piece',70,30,300,175);
insert into product_master values ('P08865','Skirts',5,	'Piece',75,30,450,300);
GO

SELECT * FROM salesman_master
insert into salesman_master values ('S00001',	'Aman',	'A/14',	'Worli','Mumbai',400002,'Maharashtra',0,0,0,'');
insert into salesman_master values ('S00002','Omkar','65','Nariman','Mumbai',400001,'Maharashtra',0,0,0,'');
insert into salesman_master values ('S00003','Raj','P-7','Bandra','Mumbai',400032, 'Maharashtra',0,0,0,'');
insert into salesman_master values ('S00004','Ashish','A/5','Juhu','Mumbai',400044,'Maharashtra',0,0,0,'');
GO

select name from client_master;

select * from client_master;

select name, city,state from client_master;

select product_no, description from product_master;

select CLIENT_NO, name from client_master where CITY='Mumbai'