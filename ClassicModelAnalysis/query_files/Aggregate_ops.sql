select paymentDate,sum(amount) as Day_Total_Amount
from payments
group by paymentDate
order by paymentDate desc;

select paymentDate,sum(amount)
from payments
group by 1
order by 1 desc;

select paymentDate,round(sum(amount),2) as Day_Total_Amount
from payments
group by paymentDate
order by paymentDate desc;


select paymentDate,round(sum(amount),2) as Day_Total_Amount
from payments
group by paymentDate
having Day_Total_Amount > 50000
order by paymentDate desc;

select productCode, count(distinct orderNumber) as Order_Count
from orderdetails
group by 1;

select productCode, count(distinct orderNumber) as Order_Count
from orderdetails
group by 1
order by Order_Count desc, productCode ASC limit 1 offset 3;


/* -------Excercise 1------- */
select c.customerName,SUM(p.amount) as Total_Amount
from customers c inner join payments p
on c.customerNumber = p.customerNumber
group by c.customerName
order by Total_Amount desc limit 1;


/* -------Excercise 2------- */
select c.customerName, 
min(o.orderDate) as First_Order_Date,
max(o.orderDate) as Last_Order_Date
from customers c inner join orders o
on c.customerNumber = o.customerNumber
group by c.customerNumber;



