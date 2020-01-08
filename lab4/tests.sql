use Transportation_Services

--creating 3 views
create view BusesAndDrivers as --high paying customers
select sum(a.Price)/count(a.Cid) as average, a.Cid
from (select c.Cid,c.Name,c.Surname,c.Age,t.Tid,t.Price,t.DateBought,t.Rid
from Customers c inner join TicketsToCustomers tc on c.Cid=tc.Cid
inner join Tickets t on tc.Tid=t.Tid) as a
group by a.Cid
having sum(a.Price)/count(a.Cid)>=(select avg(b.Price) from 
						(select distinct Price from Tickets) as b )
go

create view TicketsAndCustomers as
	select c.Cid,c.Name,c.Surname,c.Age,t.Tid,t.Price,t.DateBought,t.Rid
	from Customers c inner join TicketsToCustomers tc on c.Cid=tc.Cid
	inner join Tickets t on tc.Tid=t.Tid
go

create view StationsRoutes as --how stations are connected between eachother
select t.DepartureStation*10+t.arrivalStation as id,t.DepartureStation,t.ArrivalStation
from (select distinct DepartureStation,ArrivalStation
		from Routes) as t
go

--populating the test tables
insert into Views (Name)
values ('BusesAndDrivers'),('TicketsAndCustomers'),('StationsRoutes')
select * from Views

--creating a new table which has a multicolumn primary key
create table DoublePrimaryKey(
	ID1 int not null,
	ID2 int not null) on [primary]
go

ALTER TABLE DoublePrimaryKey WITH NOCHECK ADD 
	CONSTRAINT [PK_DoublePrimaryKey] PRIMARY KEY  CLUSTERED 
	(	ID1,
		ID2
	)  ON [PRIMARY] 
GO

insert into Tables (Name)
values ('Customers'),('Tickets'),('DoublePrimaryKey')
select * from Tables

insert into Tests (Name) 
values ('Del/Ins Customers'),
		('Del/Ins Tickets'),
		('Del/Ins DoublePrimaryKey'),
		('Evaluate BusesAndDrivers'),
		('Evaluate TicketsAndCustomers'),
		('Evaluate StationsRoutes')
select * from Tests

insert into TestViews (TestId,ViewID)
values (4,1),(5,2),(6,3)
select * from TestViews

insert into TestTables (TestID,TableID,NoOfRows,Position)
values (1,1,300,3),
	(2,2,300,2),
	(3,3,500,1)
select * from TestTables




--writing the procedures that test the tables
create procedure DeleteInsertCustomers 
as
begin
	declare @n int 
	set @n=(select NoOfRows from TestTables where TableId=1)
	declare @i int
	set @i=1
	declare @maxCid int
	set @maxCid=(select max(Cid) from Customers)
	while @i<=@n
	begin
		insert into Customers (Cid,Name,Surname,Age)
		values (@maxCid+@i,'Popescu','Ana',20+@i)
		set @i=@i+1
	end
	while @i>=1
	begin
		delete from Customers
		where Cid=@maxCid+@i
		set @i=@i-1
	end
end
go

create procedure DeleteInsertTickets as
begin
	declare @n int 
	set @n=(select NoOfRows from TestTables where TableId=2)
	declare @i int
	set @i=1
	declare @maxTid int
	set @maxTid=(select max(Tid) from Tickets)
	declare @rid int
	set @rid=(select max(Rid) from Tickets)
	while @i<=@n
	begin
		insert into Tickets (Tid,Price,DateBought,Rid)
		values (@maxTid+@i,20,'2018-10-20',@rid)
		set @i=@i+1
	end
	while @i>=1
	begin
		delete from Tickets
		where Tid=@maxTid+@i
		set @i=@i-1
	end
end
go

create procedure DeleteInsertDoublePrimaryKey as
begin
	declare @n int 
	set @n=(select NoOfRows from TestTables where TableId=3)
	declare @i int
	set @i=1
	while @i<=@n
	begin
		insert into DoublePrimaryKey (ID1,ID2)
		values (@i-1,@i)
		set @i=@i+1
	end
	while @i>=1
	begin
		delete from DoublePrimaryKey
		where ID2=@i
		set @i=@i-1
	end
end
go

--writing the procedures that evaluate the views
create procedure EvaluateView1 as
begin
select * from BusesAndDrivers
end
go

create procedure EvaluateView2 as
begin
select * from TicketsAndCustomers
end
go

create procedure EvaluateView3 as
begin
select * from StationsRoutes
end
go

--
create procedure main @view int, @table int as
begin
declare @maxViewID int
set @maxViewID=(select max(ViewID) from Views)
declare @maxTableID int
set @maxTableID=(select max(TableID) from Tables)
if @view>@maxViewID
begin
	print 'Invalid view ID'
end
else 
	begin
	if @table>@maxTableID
		begin
		print 'Invalid table ID'	
		end
	else
		begin
		declare @viewTestID int
		set @viewTestID=(select TestID from TestViews where ViewID=@view)
		declare @tableTestID int
		set @tableTestID=(select TestID from TestTables where TableID=@table)
		declare @t1 datetime
		declare @t2 datetime
		declare @t3 datetime
		declare @description varchar(100)
		set @t1=GETDATE()
		--executing test for table
		if @tableTestID=1
			begin
			exec DeleteInsertCustomers
			set @description='delete insert in Customers and '
			end
		if @tableTestID=2
			begin
			exec DeleteInsertTickets
			set @description='delete insert in Tickets and '
			end
		if @tableTestID=3
			begin
			exec DeleteInsertDoublePrimaryKey
			set @description='delete insert in DoublePrimaryKey and '
			end
		set @t2=GETDATE()
		--executing test for the view
		if @viewTestID=4
			begin
			exec EvaluateView1
			set @description=@description+'evaluate BusesAndDrivers'
			end
		if @viewTestID=5
			begin
			exec EvaluateView2
			set @description=@description+'evaluate TicketsAndCustomers'
			end
		if @viewTestID=6
			begin
			exec EvaluateView3
			set @description=@description+'evaluate StationsRoutes'
			end
		set @t3=GETDATE()

		--logging the overall test result
		insert into TestRuns (Description,StartAt,EndAt)
		values (@description,@t1,@t3)
		select* from TestRuns
		--logging the table test result
		declare @max int
		set @max=(select max(TestRunID) from TestRuns)
		insert into TestRunTables (TestRunID,TableID,StartAt,EndAt)
		values (@max,@table,@t1,@t2)
	
		--logging the view test result
		insert into TestRunViews (TestRunID,ViewID,StartAt,EndAt)
		values (@max,@view,@t2,@t3)
	
		select * from TestRunTables
		select * from TestRunViews
		end
	end
end
go

