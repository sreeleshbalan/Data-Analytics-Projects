select contactFirstName, contactLastName,
case
when creditLimit < 75000 then 'Category A'
when creditLimit between 75000 and 100000 then 'Category B'
when creditLimit between 100000 and 150000 then 'Category C'
when creditLimit > 150000 then 'Category D'
else 'Unknown'
End as 'Credit Category'
from customers;

/* count the number of customers in each category */
select
case
when creditLimit < 75000 then 'Category A'
when creditLimit between 75000 and 100000 then 'Category B'
when creditLimit between 100000 and 150000 then 'Category C'
when creditLimit > 150000 then 'Category D'
else 'Unknown'
End as 'Credit_Category',
count(distinct customerNumber) as No_of_customers
from customers
group by 1;







/* cte with case */
/* identify the credit category of customers all are from New york city */

with CustomCreditClass As
(
select customerNumber,
case
when creditLimit < 75000 then 'Category A'
when creditLimit between 75000 and 100000 then 'Category B'
when creditLimit between 100000 and 150000 then 'Category C'
when creditLimit > 150000 then 'Category D'
else 'Unknown'
End as 'Credit_Category'
from customers
)
select cu.contactFirstName, cu.contactLastName, cc.Credit_Category
from customers cu inner join CustomCreditClass cc
on cu.customerNumber = cc.customerNumber
where cu.city = "NYC";


/* case with flag */

select o.orderNumber, o.orderDate, od.quantityOrdered,
case
when od.quantityOrdered>4 and p.productLine="Motorcycles" then 1
else 0
end as "Flag"
from orders o inner join orderdetails od on o.orderNumber=od.orderNumber
inner join products p on od.productCode=p.productCode;

/* case with flag and cte*/

with MotorCyclesFlag as
(
select o.orderNumber, o.orderDate, od.quantityOrdered,
case
when od.quantityOrdered>4 and p.productLine="Motorcycles" then 1
else 0
end as "Flag"
from orders o inner join orderdetails od on o.orderNumber=od.orderNumber
inner join products p on od.productCode=p.productCode
)
select orderDate, sum(Flag) as "Total" from MotorCyclesFlag
group by orderDate
order by Total desc;




/* analyse the commenst of orders based on the we can set some flags 
find all the comments that has disputed in it*/

select distinct *,
case when lower(comments) like "%dispute%" then 1 else 0 end as "Flag" from orders;


