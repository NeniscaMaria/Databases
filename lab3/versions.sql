use Transportation_Services

drop table CurrentVersion
create table CurrentVersion(
	Vid int primary key identity,
	Version int not null)

insert into CurrentVersion (Version) values (0)

--a
create procedure GoToVersion1 
as
begin
	alter table Employees
	alter column Age tinyint
end
go

--reverse
create procedure ReverseVersion1 as
alter table Employees
alter column Age int
go

--b
create procedure GoToVersion2 as
alter table Routes
add TravelTime int
go
--reverse
create procedure ReverseVersion2 as
alter table Routes
drop column TravelTime
go

--c
create procedure GoToVersion3 as
alter table Tickets
add constraint df_defaultTicketPrice 
default 10 for Price
go
--reverse
create procedure ReverseVersion3 as
alter table Tickets
drop constraint df_defaultTicketPrice
go

--d
create procedure GoToVersion4 as
create table Complaints(
	ComplaintId int not null,
	Description varchar(max),
	ClientID int)
alter table Complaints
add constraint pk_Complaints primary key(ComplaintId)
go
--reverse
create procedure ReverseVersion4 as
alter table Complaints
drop constraint pk_Complaints
drop table Complaints
go

--e
create procedure GoToVersion5 as
alter table Drivers
add constraint ck_UniqueDrivers unique(Contact)
go
--reverse
create procedure ReverseVersion5 as
alter table Drivers
drop constraint ck_UniqueDrivers
go

--f
create procedure GoToVersion6 as
alter table Complaints
add constraint fk_Complaints foreign key(ClientID) references Customers(Cid)
go
--reverse
create procedure ReverseVersion6 as
alter table Complaints
drop constraint fk_Complaints
go
--g
create procedure GoToVersion7 as
create table Managers(
	Mid int primary key,
	Name varchar(50),
	Surname varchar(50))
go
--reverse
create procedure ReverseVersion7 as
drop table Managers
go

create procedure goToVersion @version int as
begin
declare @currentVersion int
select @currentVersion = (select top 1 Version from  CurrentVersion as c order by Vid desc) 
if @version>7 or @version<0
	begin
	print 'Invalid version number'
	end
if @version=@currentVersion
	begin
	print 'Database already in that version'
	end
else
	begin 
		if @version<@currentVersion --we need to reverse
			begin
			while @currentVersion>@version
				begin
				if @currentVersion=7
						begin
						exec ReverseVersion7
						end
				if @currentVersion=6
						begin
						exec ReverseVersion6
						end
				if @currentVersion=5
						begin
						exec ReverseVersion5
						end
				if @currentVersion=4
						begin
						exec ReverseVersion4
						end
				if @currentVersion=3
						begin
						exec ReverseVersion3
						end
				if @currentVersion=2
						begin
						exec ReverseVersion2
						end
				if @currentVersion=1
						begin
						exec ReverseVersion1
						end
				set @currentVersion=@currentVersion-1
				end
				insert into CurrentVersion (Version) values (@version)
			end
		else
		begin
			if @version>@currentVersion --we need to go up
				begin
					set @currentVersion = @currentVersion+1
					while @currentVersion<=@version
						begin
						if @currentVersion=7
							begin
							exec GoToVersion7
							end
						if @currentVersion=6
							begin
							exec GoToVersion6
							end
						if @currentVersion=5
							begin
							exec GoToVersion5
							end
						if @currentVersion=4
							begin
							exec GoToVersion4
							end
						if @currentVersion=3
							begin
							exec GoToVersion3
							end
						if @currentVersion=2
							begin
							exec GoToVersion2
							end
						if @currentVersion=1
							begin
							exec GoToVersion1
							end
						set @currentVersion=@currentVersion+1
						end
					end
			insert into CurrentVersion (Version) values (@version)
		end
	end
end
go

declare @v int
set @v=0
exec goToVersion @v

select * from CurrentVersion