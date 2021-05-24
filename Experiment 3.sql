create database experiment3_b2
GO
use experiment3_b2
GO

CREATE TABLE Supplier (
scode varchar(6) not null,
sname varchar(50),
scity varchar(50),
turnover decimal(10,2),
PRIMARY KEY (scode)
);

create TABLE Part (
pcode varchar(6) not null,
weight decimal(8,2),
colour varchar(20),
cost decimal(8,2),
sellingprice decimal(8,2),
PRIMARY KEY(pcode)
);
GO
exec sp_columns Part

CREATE TABLE Supplier_Part (
scode varchar(6) not null,
pcode varchar(6) not null,
quantity integer,
PRIMARY KEY(scode,pcode),
FOREIGN KEY(scode) REFERENCES Supplier(scode),
FOREIGN KEY(pcode) REFERENCES Part(pcode)
);
exec sp_columns Supplier_Part

insert into Supplier values ('sup005', 'Amdah', 'San Diego', 1000000.50)

insert into Supplier values('sup001', 'White Stag', 'Delhi', 100000.00)
insert into Supplier values('sup010', 'Whitman',  'Denver', 500000.00 )
insert into Supplier values('sup101', 'Data General', 'Atlanta', 800000.00 )

insert into Supplier values ('sup005', 'Amdah', 'San Diego', 1000000.50)

insert into Supplier values('sup001', 'White Stag', 'Delhi', 100000.00)
insert into Supplier values('sup010', 'Whitman',  'Denver', 500000.00 )
insert into Supplier values('sup101', 'Data General', 'Atlanta', 800000.00 )

insert into Part values('p00001', 50.00, 'pink', 10.50, 12.50)
insert into Part values('p00002', 1000.00, 'gray', 20.00, 32.00)
insert into Part values('p00003', 40.00, 'black', 685.00, 700.00)
insert into Part values('p00004', 5000.00, 'black', 450.00, 400.00)

insert into Supplier_Part values ('sup005', 'p00001', 150)
insert into Supplier_Part values('sup001', 'p00002', 500)
insert into Supplier_Part values('sup010', 'p00003',  45 )
insert into Supplier_Part values('sup101', 'p00004', 100 )

--count()
select count(*) from Supplier
--max()
select max(turnover) from Supplier
--min()
select min(turnover) from Supplier
--avg()
select avg(turnover) from Supplier
--sum()
select sum(turnover) from Supplier
--count()
select count(turnover) from Supplier

select count(distinct turnover ) from Supplier

select colour, count(*)
from Part
group by colour

select colour
from Part
order by colour desc

select colour
from Part
order by colour asc

use experiment3_b2
select scode, pcode from Supplier_Part
order by scode asc
--1.
insert into Supplier values('sup050', 'Hidusthan Liver',  'Bombay', 100000.00)

--2.
select * from Supplier 
where scity= 'Bombay' AND turnover>50.00

--3.
select count(*) from Supplier

--4.
select pcode from Part
where weight BETWEEN 25.00 AND 35.00

--5.
select scode from Supplier
where turnover=0.00

--6.
select pcode from Part
where cost = 20.00 or cost=30.00 or cost=40.00

--7.
select quantity from Supplier_Part
where pcode='p00002'

--8.
select sname from Supplier, Supplier_Part
where Supplier.scode=Supplier_Part.scode
and Supplier_Part.pcode='p00002'

--9.
SELECT * FROM Part
WHERE cost >(SELECT AVG(cost) FROM Part)

--10.
Select scode, turnover from Supplier
order by turnover desc