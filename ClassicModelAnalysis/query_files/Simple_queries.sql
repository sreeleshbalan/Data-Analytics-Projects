select * from customers
where contactLastName<>"Young";

select customerName,contactFirstName, contactLastName, phone, city, country
from customers
where contactFirstName="Julie" and country="USA";

select contactFirstName, contactLastName,country
from customers
where country="Norway" or country="Sweden";

select contactFirstName, contactLastName,country
from customers
where country in ("Norway","Sweden");


select * from customers
where country="USA" and contactLastName="Brown";

select * from employees
where jobTitle="Sales Rep";

select * from employees
where lower(firstName) = "leslie";

select * from employees
where upper(email)="DMURPHY@CLASSICMODELCARS.COM";

select *,upper(email) as EMAIL from employees
where employeeNumber>1200 and employeeNumber<1300;

select distinct country from customers;


select distinct city from customers
where city like "%New%";

select * from customers
where country="USA"
order by contactLastName;


select * from customers
order by contactLastName desc, contactFirstName asc;


select distinct orderDate
from orders
order by orderDate DESC;

select count(distinct orderDate)
from orders;

select *
from orders
where lower(comments) like "%negotiate%"
order by customerNumber;








