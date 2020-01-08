use Transportation_Services
create table Ta(
aid int primary key,
a2 int unique)

create table Tb(
bid int primary key,
b2 int)

create table Tc(
cid int primary key,
aid int foreign key references Ta(aid),
bid int foreign key references Tb(bid))

--populate
insert into Ta (aid,a2)
values (1,1), (2,2), (3,3), (4,4), (5,5), (6,6),
	(7,7), (8,8), (9,9), (10,10)

insert into Tb (bid,b2)
values (1,1), (2,2), (3,3), (4,4), (5,5), (6,6),
	(7,7), (8,8), (9,9), (10,10)

insert into Tc(cid,aid,bid)
values (1,1,1), (2,2,2), (4,4,4), (6,6,6), (7,7,7), (9,9,9)

select * from Ta
select * from Tb
select * from Tc
--a)

--non clustered index scan
select * from Ta
order by a2

--clustered index seek and clustered index scan and key lookup
select * from Tb inner join Tc on Tb.bid=Tc.bid 
inner join Ta on Ta.aid=Tc.aid
order by Ta.aid

--non clustered index seek
select * from Ta left join Tc on Ta.aid=Tc.aid
where a2>4
order by a2


--b)

IF EXISTS (SELECT name FROM sys.indexes WHERE name = N'NCIndx_Tb')
drop index NCIndx_Tb on Tb
go

select * from Tb where b2=40 --uses clustered index scan (before non clustered index was created)

create nonclustered index NCIndx_Tb on Tb(b2)
select * from Tb where b2=40 --non clustered index seek (after non clustered index was created)

--c)
create view View1 as
select Tc.aid,Tc.bid,Tc.cid from Tb inner join Tc on Tb.bid=Tc.bid 
inner join Ta on Ta.aid=Tc.aid
where Tc.aid>3

IF EXISTS (SELECT name FROM sys.indexes WHERE name = N'IX_Tc_Aid')
 DROP INDEX IX_Tc_Aid ON Tc;
GO 

--clustered index scan and seek and nonclustered index seek
select * from  View1
order by aid

CREATE NONCLUSTERED INDEX IX_Tc_Aid  ON Tc (aid) 

--same as before + key lookup
select * from View1
order by aid