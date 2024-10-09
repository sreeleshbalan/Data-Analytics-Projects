/* Country wise */
with JoinedTable As
(
select o.orderDate, o.orderNumber, 
p.productName, p.productLine, 
od.quantityOrdered, od.priceEach, p.buyPrice,
c.city, c.country
from customers c
inner join orders o on c.customerNumber = o.customerNumber
inner join orderdetails od on o.orderNumber = od.orderNumber
inner join products p on p.productCode = od.productCode
where year(o.orderDate)=2004
)
(
select country, sum(quantityOrdered*priceEach) as TotalSaleUnitByCountry,
sum((quantityOrdered*priceEach)-(quantityOrdered*buyPrice)) as TotalProfitByCountry
from JoinedTable
group by country
order by TotalProfitByCountry desc, TotalSaleUnitByCountry desc
);
/*--------------------------------------------------------------------*/


/* City wise */
with JoinedTable As
(
select o.orderDate, o.orderNumber, 
p.productName, p.productLine, 
od.quantityOrdered, od.priceEach, p.buyPrice,
c.city, c.country
from customers c
inner join orders o on c.customerNumber = o.customerNumber
inner join orderdetails od on o.orderNumber = od.orderNumber
inner join products p on p.productCode = od.productCode
where year(o.orderDate)=2004
)
(
select city, sum(quantityOrdered*priceEach) as TotalSaleUnitByCity,
sum((quantityOrdered*priceEach)-(quantityOrdered*buyPrice)) as TotalProfitByCity
from JoinedTable
group by city
order by TotalProfitByCity desc, TotalSaleUnitByCity desc
);
/*--------------------------------------------------------------------*/



/* Product wise */
with JoinedTable As
(
select o.orderDate, o.orderNumber, 
p.productName, p.productLine, 
od.quantityOrdered, od.priceEach, p.buyPrice,
c.city, c.country
from customers c
inner join orders o on c.customerNumber = o.customerNumber
inner join orderdetails od on o.orderNumber = od.orderNumber
inner join products p on p.productCode = od.productCode
where year(o.orderDate)=2004
)
(
select productLine, sum(quantityOrdered*priceEach) as TotalSaleUnitByProduct,
sum((quantityOrdered*priceEach)-(quantityOrdered*buyPrice)) as TotalProfitByProduct
from JoinedTable
group by productLine
order by TotalProfitByProduct desc, TotalSaleUnitByProduct desc
);




