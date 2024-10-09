select orderNumber, orderDate,
Year(orderDate) as "Year",
Month(orderDate) as "Month",
Day(orderDate) as "Day"
from orders;

/* Datediff() */
select orderDate, requiredDate,
datediff(requiredDate,orderDate) as "Days expected",
datediff(now(),orderDate) as "Ordered For (Days)"
from orders;


/* date_add() */
select orderDate,
date_add(orderDate,interval 7 day) as "OneWeekAfterOrder",
date_add(orderDate,interval 1 month) as "OneMonthAfterOrder",
date_add(orderDate,interval 1 year) as "OneYearAfterOrder"
from orders;

/* date_sub() - find all orders placed 19 years before */

select * from orders
where orderDate <= date_sub(now(),interval 19 year);



