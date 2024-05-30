# list DB, Select DB, List Table

select * from sales
where amount > 10000
order by amount desc;

# order by desc
select * from sales
where geoid='g1'
order by PID, amount desc;

select * from sales
where amount > 10000 AND SaleDate >= "2022-01-01";

select * from sales
where Amount > 10000 and year(SaleDate) = 2022
order by amount desc;

select * from sales
where Boxes <= 50 and Boxes >= 0
order by Boxes desc;

# between
select * from sales
where Boxes between 0 and 50
order by Boxes;

select SaleDate, Amount, Boxes, weekday(SaleDate) as 'Day of Week' from sales
where weekday(saleDate) = 4;

select * from people;

select Salesperson, team from people
where team = 'Delish' OR team = 'Jucies'
order by Salesperson;

select * from people
where team = 'Delish' OR team = 'Jucies';

# Where in 
select * from people
where team in ('Delish', 'Jucies');

show databases;
show tables;
select * from people
where Salesperson like 'B%';

select * from people
where Salesperson like '%B%';

select * from sales;

# case

select SaleDate, Amount,
	case	when amount < 1000 then 'Under 1k'
			when amount < 5000 then 'Under 5k'
            when amount < 10000 then 'Under 10k'
            else '10k or more'
	end as 'Amount catagory'
from sales;

#PART2

#JOINS
select * from sales;
select * from people;

select s.SaleDate, s.Amount, p.Salesperson, s.SPID 
from sales s
join people p on p.SPID = s.SPID;

select s.SaleDate, s.Amount, pr.Product
from sales s
left join products pr on pr.pid = s.pid;

select s.SaleDate, s.Amount, p.Salesperson, pr.Product, p.Team
from sales s
join people p on p.spid = s.spid
join products pr on pr.pid = s.pid;

select s.SaleDate, s.Amount, p.Salesperson, pr.Product, p.Team
from sales s
join people p on p.spid = s.spid
join products pr on pr.pid = s.pid
where s.Amount < 100
and p.Team = '';

select s.SaleDate, s.Amount, p.Salesperson, pr.Product, p.Team
from sales s
join people p on p.spid = s.spid
join products pr on pr.pid = s.pid
join geo g on g.GeoID = s.GeoID
where s.Amount < 100
and p.Team = ''
and g.Geo in ('New Zealand', 'India')
order by s.SaleDate;

#group by #pivote in Excel

select GeoID, sum(Amount), avg(Amount), sum(Boxes)
from sales
group by GeoID;

select g.Geo, sum(Amount), sum(Boxes)
from sales s
join geo g on s.geoID = g.geoId
group by g.geo;

select g.Geo, sum(Amount), sum(Boxes), g.GeoID
from sales s
join geo g on s.geoID = g.geoId
group by g.GeoID
order by g.GeoID;

select pr.Category, p.Team, sum(Boxes), sum(Amount)
from sales s
join people p on p.spid = s.spid
join products pr on pr.pid = s.pid
group by pr.Category, p.Team
order by pr.Category, p.Team;

select pr.Category, p.Team, sum(Boxes), sum(Amount)
from sales s
join people p on p.spid = s.spid
join products pr on pr.pid = s.pid
where p.team <> ''
group by pr.Category, p.Team
order by pr.Category, p.Team;

select pr.Product, sum(s.Amount) as 'Total Amount'
from sales s
join products pr on pr.pid = s.pid
group by pr.Product
order by 'Total Amount' desc;

# top 10

select pr.Product, sum(s.Amount) as 'Total Amount'
from sales s
join products pr on pr.pid = s.pid
group by pr.Product
order by 'Total Amount' desc
limit 3;

select * from products
order by Product;