
/*--------Row Number---------*/
/* we want to see each customers orders in a result set order by date from oldest to newest */
/* Here we need tofind customer wise orders, and the order of each customer has to be numbered from oldest to newest */

select c.customerNumber, o.orderNumber, o.orderDate,
row_number() over (partition by c.customerNumber order by o.orderDate) as Purchase_Number
from customers c inner join orders o
on c.customerNumber = o.customerNumber
order by c.customerNumber,o.orderNumber;

/* find the second purchse details of eah customers */
with MainCTE AS
(
select c.customerNumber,o.orderNumber, o.orderDate,
row_number() over (partition by c.customerNumber order by o.orderDate) as Purchase_Number
from customers c inner join orders o on c.customerNumber=o.customerNumber
order by c.customerNumber,o.orderNumber
)
select * from MainCTE where Purchase_Number=2;



/*--------Lead---------*/
/* find each customers and their payments along with next payment amount */
select c.customerName, c.customerNumber, p.paymentDate, p.amount,
lead(p.amount) over (partition by c.customerNumber order by p.paymentDate) as Next_Payment
from customers c inner join payments p on c.customerNumber=p.customerNumber
order by c.customerNumber, p.paymentDate;


/*--------Lag---------*/
/* find each customers and their payments along with next payment amount and previous payment amount */
select c.customerNumber, p.paymentDate, p.amount,
lead(p.amount) over(partition by c.customerNumber order by p.paymentDate) as Next_Payment,
lag(p.amount) over (partition by c.customerNumber order by p.paymentDate) as Prev_Payment
from customers c inner join payments p
on c.customerNumber = p.customerNumber
order by c.customerNumber,p.paymentDate;



/*--------row_number + Lead + Lag ---------*/
select c.customerNumber, p.paymentDate, p.amount,
row_number() over(partition by c.customerNumber order by p.paymentDate) as Payment_Number,
lead(p.amount) over(partition by c.customerNumber order by p.paymentDate) as Next_Payment,
lag(p.amount) over (partition by c.customerNumber order by p.paymentDate) as Prev_Payment
from customers c inner join payments p
on c.customerNumber = p.customerNumber
order by c.customerNumber,p.paymentDate;



/* ------Excercise 1 ------------*/   
/* Display orderdate, ordernumber and salesrepemployeenumber fro each sales rep's second order */
with MainCte As
(
select c.salesRepEmployeeNumber, o.orderNumber, o.orderDate,
row_number() over (partition by c.salesRepEmployeeNumber order by o.orderDate) as Order_Number
from customers c inner join orders o on c.customerNumber=o.customerNumber
order by c.salesRepEmployeeNumber, o.orderNumber
)

select * from MainCte where Order_Number=2;




 






