select *
from customers t1
inner join orders t2
on t1.customerNumber = t2.customerNumber;


select *
from customers t1
inner join orders t2
on t1.customerNumber = t2.customerNumber
where t1.customerNumber = 424;




select firstName,lastName,customerName
from employees t1
left join customers t2
on t1.employeeNumber=t2.salesRepEmployeeNumber;


select *
from employees t1
left join customers t2
on t1.employeeNumber=t2.salesRepEmployeeNumber
where t2.customerName is null;

select c.customerNumber,c.customerName, p.paymentDate, p.amount
from customers c
inner join payments p
on c.customerNumber = p.customerNumber;

select c.customerNumber,c.customerName, p.paymentDate, p.amount
from customers c
left  join payments p
on c.customerNumber = p.customerNumber;


select c.customerNumber,c.customerName, p.paymentDate, p.amount
from customers c
left  join payments p
on c.customerNumber = p.customerNumber
where p.customerNumber is NULL;

select count(*) as "No.of customers don't have payment"
from customers c
left  join payments p
on c.customerNumber = p.customerNumber
where p.customerNumber is NULL;

/* -----Excercise question----- 1 */
select c.contactFirstName, c.contactLastName, o.orderDate, o.status
from customers c
inner join orders o
on c.customerNumber= o.customerNumber;


/* -----Excercise question 2----- */
select c.contactFirstName, c.contactLastName, o.orderDate, o.orderNumber
from customers c
left join orders o
on c.customerNumber= o.customerNumber;









