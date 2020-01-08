use Transportation_Services

--populating the tables
insert into Buses (Bid, NoOfSeats)
values (1,60),(2,60),
	(3,100),(4,30),
	(5,30),(6,30),
	(7,70),(8,60),
	(9,100),(10,30)
select * from Buses
--8,2,5,10,9
insert into Drivers (Did, Name, Surname,Age, Salary, Contact, AccidentInsuranceExpirationDate, Bid)
values (1,'Sologiuc','Razvan',35,1200,'0745000001','2020-10-12',8),
	(2,'Apostol','Alexandru-Sergiu',22,1500,'0783001023','2021-05-13',2),
	(3,'Simionescu','Ciprian',NULL,1350,'0754896500','2020-06-18',5),
	(4,'Galusca','Ioan',NULL,1800,'0745200300','2022-12-12',10),
	(5,'Matcasu','Vlad',NULL,NULL,'0745800625','2021-08-15',9)
select* from Drivers


insert into Stations (Sid,Name)
values (1,'Suceava'), (2,'Botosani'),
	(3,'Vatra Dornei'),(4,'Darabani'),
	(5,'Iasi'),(6,'Bucuresti')
insert into Stations (Sid,Name)
values (7,'Hunedoara')
select *from Stations

--busses in use: 1,2,4,5,6,7,9

insert into Routes (Rid,DepartureStation,ArrivalStation,DepartureTime,ArrivalTime,NoOfTicketsAvailable)
values (1,4,1,'07:00','09:00',30),
	(2,1,4,'17:00','19:00',30),
	(3,1,2,'05:00','05:30',30),
	(4,1,2,'09:00','09:45',30),
	(5,1,2,'13:30','14:20',30),
	(6,1,2,'19:15','20:00',30),
	(7,2,1,'06:00','06:45',60),
	(8,2,1,'08:00','08:45',60),
	(9,2,1,'12:45','13:30',60),
	(10,2,1,'18:30','19:15',60),
	(11,4,2,'05:30','07:00',30),
	(12,4,2,'13:00','14:30',30),
	(13,2,4,'08:30','10:00',30),
	(14,2,4,'15:00','16:30',30),
	(15,2,3,'8:00','11:15',100),
	(28,2,3,'12:45','16:15',100),
	(16,3,2,'06:15','09:15',100),
	(17,3,2,'17:15','20:15',100),
	(18,2,5,'10:00','12:00',70),
	(19,2,5,'16:30','19:00',70),
	(20,2,5,'20:30','22:30',70),`
	(21,5,2,'8:30','10:30',70),
	(22,5,2,'13:30','16:00',70),
	(23,5,2,'20:30','22:30',70),
	(24,2,6,'06:00','13:45',60),
	(25,2,6,'10:00','18:29',60),
	(26,6,2,'19:00','02:30',60),
	(27,6,2,'07:00','15:10',60)

select* from routes

insert into BusesOnRoutes (Rid,Bid) values (1,4),(2,4),(3,5),(4,5),(5,5),(6,5),(7,1),(8,1),(9,1),(10,1),(11,6),(12,6),(13,6),(14,6),
											(15,9),(28,9),(16,9),(17,9),(18,7),(19,7),(20,7),(21,7),(22,7),(23,7),(24,2),(25,2),(26,2),(27,2)

--No duplicates allowed because Rid and Bid are primary keys
--insert into BusesOnRoutes (Rid,Bid) values (1,4)

select* from BusesOnRoutes

insert into ITPs (Bid,ExpirationDate) values (1,'2020-12-01'),
											(2,'2019-12-15'),
											(3,'2020-07-23'),
											(4,'2020-09-13'),
											(5,'2020-05-04'),
											(6,'2020-07-10'),
											(7,'2020-6-12'),
											(8,'2020-05-20'),
											(9,'2020-10-10'),
											(10,'2020-11-12')
select* from ITPs

insert into Employees (Eid,Sid,Name,Surname,Contact,Age,Salary) 
values (1,1,'Ignatescu','Lucia','0745000002',20,1300),
		(2,1,'Danilet','Madalina','0783002222',21,1250),
		(3,2,'Straton','Iulia','0230225638',35,1800),
		(4,2,'Livadariu','Andra','0745896365',45,1500),
		(5,2,'Zalinschi','Marinela','0456258963',33,1700),
		(6,2,'Malac','Andrei','0256369874',56,3000),
		(7,2,'Croitoru','Marcel','0256365785',36,1500),
		(8,3,'Cazacu','Maria','0562369874',23,1340),
		(9,3,'Belici','Cosmina','0789456123',29,1400),
		(10,4,'Ciurariu','Lorena','0123456789',24,1256),
		(11,5,'Mardari','Delia','0231456958',36,1325),
		(12,5,'Ciobanu','Andrei','0789562345',23,1450),
		(13,5,'Florea','Eduard','0452896451',45,2450),
		(14,5,'Cozma','Andreea','0456223558',35,2400),
		(15,5,'Moraru','Bianca','0256335548',26,3000),
		(16,6,'Buburuzan','Andreea','0564889955',35,3000),
		(17,6,'Gavrilovici','Catalina','0745200360',34,2500),
		(18,6,'Teodorovici','Paul','0783506809',37,1600),
		(19,6,'Albu','Albert','0745889664',27,1300),
		(20,6,'Velehorschi','Alexandra','0745669102',30,3400)
select* from Employees

insert into HealthInsurances (Eid,Value,ExpirationDate)
values (1,2000,'2022-05-15'),
		(2,2000,'2021-11-15'),
		(3,2200,'2023-10-23'),
		(4,2000,'2020-02-15'),
		(5,2000,'2022-06-11'),
		(6,2500,'2020-07-08'),
		(7,2200,'2020-12-23'),
		(8,2300,'2021-03-25'),
		(10,2000,'2021-09-13'),
		(11,2000,'2019-11-14'),
		(12,2400,'2019-09-04'),
		(13,2500,'2021-12-30'),
		(14,2010,'2020-09-20'),
		(15,2020,'2020-02-16'),
		(16,2200,'2021-12-15'),
		(17,2450,'2020-09-04'),
		(18,2700,'2021-11-10'),
		(19,3000,'2023-10-15'),
		(20,4500,'2024-05-13')
select * from HealthInsurances


--Darabani-Suceava dus intors - Bid 4 Rid 1,2   30lei
--Suceava-Botosani - Bid 5 dus Rid 3,4,5,6   12 lei
					--Bid 1 intors Rid 7,8,9,10
--Darabani-Botosani Bid 6 Rid 11,12,13,14  16 lei
--Botosani-Vatra Dornei Bid 9  Rid 15,28,15,17 25 lei
--Botosani-Iasi Bid 7  Rid 18,19,20,21,22,23  35 lei
--botosani-bucuresti bid 2 Rid 24,25,26,27  100 lei
--for next lab add a price and traveltime column to the Routes table

insert into Tickets (Tid,Rid,Price,DateBought)
values (1,1,30, '2019-10-23'),
		(2,2,30,'2019-10-23'),
		(3,3,12,'2019-09-15'),
		(4,4,12,'2019-09-15'),
		(5,11,16,'2019-10-20'),
		(6,11,16,'2019-10-20'),
		(7,11,16,'2019-10-20'),
		(8,20,35,'2019-10-11'),
		(9,23,35,'2019-10-11'),
		(10,25,100,'2019-10-20'),
		(11,25,100,'2019-09-18'),
		(12,25,100,'2019-09-18'),
		(13,15,25,'2019-09-21'),
		(14,15,25,'2019-10-11'),
		(15,23,35,'2019-10-08')

select * from Tickets


insert into Customers (Cid,Name,Surname,Age)
values (1,'Popescu','Ion',45),
		(2,'Bostan','Marcela',35),
		(3,'Croitoru','Adelin',23),
		(4,'Bravo','Mircea',46),
		(5,'Mironescu','Constantina',19),
		(6,'Pinzariu','Iustin',21),
		(7,'Mihail','Ion',45),
		(8,'Zaharia','Vasile',23)
		
select* from Customers
insert into Customers (Cid,Name,Surname,Age)
values (9,'Danila','Andreea',56),
		(10,'Rotaru','Paraschiva',67)
		

insert into TicketsToCustomers(Tid,Cid)
values (1,1),(2,1),(3,2),(4,3),(5,4),(6,1),(7,5),(8,6),(9,6),(10,1),
		(11,7),(12,8),(13,9),(14,10),(15,2)
select* from TicketsToCustomers
		
--UPDATE 1: Due to new regaulations, you have to increase the health insurance value to 2300
--for those who have it between 2000 and 2300
select* from HealthInsurances
update HealthInsurances
set Value=2300
where Value between 2000 and 2300
select* from HealthInsurances

--UPDATE 2: A new year has passed and you need to update the age of the Drivers (where that is known)
select * from Drivers
update Drivers
set Age=Age+1
where Age is not null
select* from Drivers
--In the UPDATE / DELETE statements,
--use at least once: 
-- IN

--UPDATE 3: Give a raise of 100 to all your employees that are older than 30 and currently earn less then 2400
select* from Employees
update Employees
set Salary=Salary+100
where Age>=30 and Salary<=2400
select* from Employees

--DELETE 1: Delete all the tickets that were bought last year
select* from Tickets
delete from Tickets
where DateBought like '2018%'
select* from Tickets
--Run this to recover these tickets
--insert into Tickets (Tid,Rid,Price,DateBought)
--values (16,23,35,'2018-05-12'),
--		(17,20,35,'2018-11-02')

--DELETE 2: Route 9 and 10 have been canceled.
--insert into Routes (Rid,DepartureStation,ArrivalStation,DepartureTime,ArrivalTime,NoOfTicketsAvailable)
--values(9,2,1,'12:45','13:30',60),
--	(10,2,1,'18:30','19:15',60)
--insert into BusesOnRoutes (Rid,Bid) values (9,1),(10,1)
select* from BusesOnRoutes
delete from BusesOnRoutes
where Rid in (9,10)
select* from BusesOnRoutes

select * from Routes
delete from Routes 
where Rid in (9,10)
select* from Routes

--SELECT
--a)See the drivers that have the age or salary set as null
select *  from Drivers
where Age is null or Salary is null

--see the buses that have an itp that expires this year or whose driver have an accident issurance that expire this year
select b.Bid from Buses b inner join ITPs i on b.Bid=i.Bid
where i.ExpirationDate like '2019%'
union
select b1.Bid from Buses b1 inner join Drivers d on b1.Bid=d.Bid
where d.AccidentInsuranceExpirationDate like '2019%'

--b)See top 4 employees who are older than 30 and have a salary bigger than 2300
select top 4 * from Employees e
where e.Age>=30 and e.Salary in (select e1.Salary from Employees e1
								where e1.Salary>=2300)
order by e.Salary desc

--See all the buses that leave from stations 2 or 3 and their departure time is before 12:00
select* from Routes
where DepartureStation in (2,3)
intersect
select* from Routes
where ArrivalTime<='12:00'


--c)Show all the employees below 30 but not those with salary less then 1400 
select* from Employees
where Age<=30
except
select* from Employees
where Salary<=1400

--Show all the routes leaving after 08:00, except those who leave from stations 1 and 3
select * from Routes
where DepartureTime<='08:00' and DepartureStation not in ( select r.DepartureStation from Routes r
															where r.DepartureStation in (1,3))

--d)
--list all the buses and their driver (if they have one)
select b.Bid,d.Did,d.Name,d.Surname,d.Contact,d.Age 
from Buses b left join Drivers d on b.Bid=d.Bid

--show what tickets each client bought (3 tables joined) and order by age of customer
select c.Cid,c.Name,c.Surname,c.Age,t.Tid,t.Price,t.DateBought,t.Rid
from Customers c inner join TicketsToCustomers tc on c.Cid=tc.Cid
inner join Tickets t on tc.Tid=t.Tid
order by c.Age

--2 many to may relationships joined (Tickets-Customers and Buses-Routes)
--show all the buses and the customers that were on those buses and between which hours
select b.Bid,br.Rid,c.Name,c.Surname,c.Age,r.DepartureTime as fromHour,r.ArrivalTime as toHour
from Buses b inner join BusesOnRoutes br on br.Bid=b.Bid 
inner join Tickets t on br.Rid=t.Rid 
inner join TicketsToCustomers tc on t.Tid=tc.Tid
inner join Customers c on c.Cid=tc.Cid
inner join Routes r on r.Rid=br.Rid

--show all the stations and their routes, if they have any
select r.Rid,s.Name as departure,r.ArrivalStation, r.DepartureTime,r.ArrivalTime,
		r.NoOfTicketsAvailable
from Routes r full outer join Stations s on s.Sid=r.DepartureStation

--see all the employees and their health insurances
select*
from HealthInsurances h right join Employees e
on h.Eid=e.Eid

--e)
--show the tickets with a price higher than 30 lei sold in 2019-10
select* from Tickets 
where Price>=30 and DateBought in (select t.DateBought from Tickets t
									where DateBought like '2019-10%')

--show all the customers over 20 years that bought tickets over 30 lei and order by age
select * from Customers c
where c.Age>=20
and c.Cid in (select tc.Cid from TicketsToCustomers tc
			where tc.Cid=c.Cid and tc.Tid in(select t.Tid from Tickets t
											where t.Price>=30))
order by c.Age

--f)
--show only the buses that have a driver
select* from Buses b
where exists( Select 1 from Drivers d where b.Bid=d.Bid)

--show all the buses that are currently in use
select * from Buses b
where exists (select 1 from BusesOnRoutes br where b.Bid=br.Bid)

--g)
--show all the tickets on the route 25 bought on 2019-09-18 and the customers that bought them
select c.Cid,c.Name,c.Surname,c.Age,t.Tid,t.Price,t.DateBought,t.Rid
from Customers c inner join TicketsToCustomers tc on c.Cid=tc.Cid
	inner join Tickets t on tc.Tid=t.Tid
where t.Rid=25 and t.DateBought='2019-09-18'

--show all the buses that have an ITP that expires in 2019 and their drivers information so that you can inform them on this
select b.Bid,d.Did,d.Name,d.Surname,d.Contact,i.ExpirationDate as ITP_expiration_date
from Buses b inner join Drivers d on b.Bid=d.Bid
	inner join ITPs i on i.Bid=b.Bid
where i.ExpirationDate like '2019%'

--show how the stations are connected between each other
select t.DepartureStation*10+t.arrivalStation as id,t.DepartureStation,t.ArrivalStation
from (select distinct DepartureStation,ArrivalStation
		from Routes) as t

--h)
--see top 5 stations with most traffic
select top 5 (a.countArrival+d.countDeparture) as totalBuses, a.ArrivalStation as station 
from (select count(r.DepartureStation) as countDeparture,r.DepartureStation
		from Routes r
		group by r.DepartureStation) as d
		inner join (select count(r.ArrivalStation) as countArrival,r.ArrivalStation
					from Routes r
					group by r.ArrivalStation) as a on d.DepartureStation=a.ArrivalStation
order by totalBuses desc

--you want to see the average travel time by age
select a.Age,sum(a.total)/count(*) as averageTravelTimeMinutes
from (select b.Bid,br.Rid,c.Name,c.Cid,c.Surname,c.Age,datediff(minute,r.DepartureTime,r.ArrivalTime) as total
	from Buses b inner join BusesOnRoutes br on br.Bid=b.Bid 
	inner join Tickets t on br.Rid=t.Rid 
	inner join TicketsToCustomers tc on t.Tid=tc.Tid
	inner join Customers c on c.Cid=tc.Cid
	inner join Routes r on r.Rid=br.Rid)as a
group by a.Age

--see in which days where sold tickets which have an average price bigger than the average price of the tickets sold so far
select count(Rid) as noOfTickets,DateBought,sum(Price)/count(Rid) as averagePrice
from Tickets
group by DateBought
having sum(Price)/count(Rid)>(select avg(a.Price) from (select distinct Price from Tickets) as a)

--You want to give a discount to the customers that bought more than 2 tickets.
select count(c.Name) as numberOfTicketsBought,min(c.Name) as Name,min(c.Surname) as Surname,c.Cid
from Customers c inner join TicketsToCustomers tc on c.Cid=tc.Cid
			inner join Tickets t on tc.Tid=t.Tid
group by c.Cid
having count(c.Name)>=2
order by numberOfTicketsBought desc

--Show the routes that have the minimum travel time bigger than the average travel time
select t.id,min(travelTime) as minimumTravelTime
from (select datediff(minute,r.DepartureTime,r.ArrivalTime) as travelTime, r.Rid,
		r.DepartureStation*10+r.ArrivalStation as id
		from Routes r) as t
group by t.id
having min(travelTime)>( select avg(travelTime) from (select datediff(minute,r.DepartureTime,r.ArrivalTime) as travelTime, r.Rid,
								r.DepartureStation*10+r.ArrivalStation as id
								from Routes r) as t)
--show all the customers that paid on tickets (on average) more than the average cost of the sold tickets because you also want to ofer them a discount of 5% on their next ticket
select sum(a.Price)/count(a.Cid) as average, a.Cid
from (select c.Cid,c.Name,c.Surname,c.Age,t.Tid,t.Price,t.DateBought,t.Rid
from Customers c inner join TicketsToCustomers tc on c.Cid=tc.Cid
inner join Tickets t on tc.Tid=t.Tid) as a
group by a.Cid
having sum(a.Price)/count(a.Cid)>=(select avg(b.Price) from 
						(select distinct Price from Tickets) as b )
--i)
--see the cheapest tickets sold
select * from Tickets
where Price = (select min(Price) from Tickets)
--equivalent
select * from Tickets
where Price<=all(select Price from Tickets)

--see the employee(s) that earn the most
select* from Employees
where Salary = (select max(Salary) from Employees)
--equivalent
select* from Employees
where Salary>=all(select Salary from Employees)

--See all the buses that leave from station 2
select * from Buses
where Bid in (select Bid
			from Routes r inner join BusesOnRoutes br on br.Rid=r.Rid
			where DepartureStation=2)
--equivalent
select * from Buses
where Bid =ANY(select Bid
			from Routes r inner join BusesOnRoutes br on br.Rid=r.Rid
			where DepartureStation=2)

--see all the employees that don't work in station 1
select * from Employees
where Eid not in (select Eid from Employees where Sid=1)
--equivalent
select * from Employees
where Eid <>all (select Eid from Employees where Sid=1)

