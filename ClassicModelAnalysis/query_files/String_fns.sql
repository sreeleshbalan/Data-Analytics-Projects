/* CAST - to convert data fomr one type to another */

Select paymentDate as Pdate_without_timestamp,
cast(paymentDate AS datetime) as Pdate_with_timestamp
from payments;


/* substring() */
select substring(paymentDate,1,4) as year
from payments;

select cast(substring(paymentDate,1,4) AS decimal) as year
from payments;


/* concat() */

select customerNumber,
concat(contactFirstName,contactLastName) as FullName,
concat(city,", ",country) as Native
from customers;





