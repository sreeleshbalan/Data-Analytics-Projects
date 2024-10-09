
select contactFirstName as FirstName,
contactLastName as LastName,
"Customer" as Type
from customers
UNION
select firstName as FirstName,
lastName as LastName,
"Employee" as Type
from employees;

select contactFirstName as FirstName,
contactLastName as LastName,
"Customer" as Type
from customers
UNION ALL
select firstName as FirstName,
lastName as LastName,
"Employee" as Type
from employees;




select count(FirstName) as "Total No.of People"
from (
select contactFirstName as FirstName,
contactLastName as LastName,
"Customer" as Type
from customers
UNION
select firstName as FirstName,
lastName as LastName,
"Employee" as Type
from employees
) as Final;



select count(FirstName) as "Total No.of People"
from (
select contactFirstName as FirstName,
contactLastName as LastName,
"Customer" as Type
from customers
UNION ALL
select firstName as FirstName,
lastName as LastName,
"Employee" as Type
from employees
) as Final;




