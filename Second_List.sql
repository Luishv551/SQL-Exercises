Q2. Report the number of employees in each country.
Execute:
> select country, COUNT(*)
from Offices, Employees
where Offices.officeCode = Employees.officeCode
group by country
+ ------------ + ------------- +
| country | COUNT(*) |
+ ------------ + ------------- +
| USA | 10 |
| France | 5 |
| Japan | 2 |
| Australia | 4 |
| UK | 2 |
+ ------------ + ------------- +
5 rows
Q3. What is the total payment received from customers in Australia?
Execute:
> select SUM(amount)
from Payments, Customers
where Customers.customerNumber = Payments.customerNumber
and country = 'Australia'
+ ---------------- +
| SUM(amount) |
+ ---------------- +
| 509385.81999999995 |
+ ---------------- +
1 rows
Q4. Report the total value (rename this column as “total_value”) of each cancelled order for each customer.
Sort the results by customer name and order number. You can assume order value is the multiplication of
priceEach and quantityOrdered.
Execute:
> select customerName, Orders.orderNumber, sum(quantityOrdered * priceEach) AS total_value
from OrderDetails, Orders, Customers
where Customers.customerNumber = Orders.customerNumber
and Orders.orderNumber = OrderDetails.orderNumber
and status = 'Cancelled'
group by customerName, Orders.orderNumber
order by customerName, Orders.orderNumber
+ ----------------- + ---------------- + ---------------- +
| customerName | orderNumber | total_value |
+ ----------------- + ---------------- + ---------------- +
| Euro+ Shopping Channel | 10262 | 47065.36 |
| GiftsForHim.com | 10260 | 37769.380000000005 |
| Kellys Gift Shop | 10179 | 22963.600000000002 |
| Land of Toys Inc. | 10248 | 41445.21 |
| Scandinavian Gift Ideas | 10167 | 44167.090000000004 |
| UK Collectables, Ltd. | 10253 | 45443.53999999999 |
+ ----------------- + ---------------- + ---------------- +
6 rows
Q5. Report the total value ordered for each product line in January 2004 sorted by product line.
Hint: https://dev.mysql.com/doc/refman/8.0/en/date-and-time-functions.html
Execute:
> select productLine, sum(quantityOrdered * priceEach) AS total_value
from Products, OrderDetails, Orders
where Products.productCode = OrderDetails.productCode
and Orders.orderNumber = OrderDetails.orderNumber
and month(orderDate) = 1
and year(orderDate) = 2004
group by productLine
order by productLine
+ ---------------- + ---------------- +
| productLine | total_value |
+ ---------------- + ---------------- +
| Classic Cars | 116763.04999999997 |
| Motorcycles | 39987.35999999999 |
| Planes | 31158.75 |
| Ships | 26310.11 |
| Trains | 6386.58 |
| Trucks and Buses | 4615.64 |
| Vintage Cars | 67163.72 |
+ ---------------- + ---------------- +
7 rows
Q6. List the number of employees by office code and country (show the country name, officeCode, and number
of employees in that office and country). Filter the results to show countries and offices with more than 2
employees.
Execute:
> select country, Offices.officeCode, count(*)
from Offices, Employees
where Offices.officeCode = Employees.officeCode
group by Offices.officeCode, country
having count(*) > 2
+ ------------ + --------------- + ------------- +
| country | officeCode | count(*) |
+ ------------ + --------------- + ------------- +
| USA | 1 | 6 |
| France | 4 | 5 |
| Australia | 6 | 4 |
+ ------------ + --------------- + ------------- +
3 rows
Q7. How many customers in Madrid and Paris have a credit limit between 50,000 and 80,000?
Execute:
> select count(*)
from Customers
where city in ("Madrid", "Paris")
and creditLimit between 50000 and 80000
+ ------------- +
| count(*) |
+ ------------- +
| 2 |
+ ------------- +
1 rows
Q8. Which products (show productName and productCode) have a shipped date of May 20, 2005? Remove
cancelled, disputed, and “on hold” orders and only list products with a buy price cheaper than 50.
Execute:
> select productName, Products.productCode
from Products, OrderDetails, Orders
where Products.productCode = OrderDetails.productCode
and Orders.orderNumber = OrderDetails.orderNumber
and buyPrice < 50
and status not in ("Cancelled", "Disputed", "On Hold")
and month(shippedDate) = 05
and year(shippedDate) = 2005
and day(shippedDate) = 20
+ ---------------- + ---------------- +
| productName | productCode |
+ ---------------- + ---------------- +
| 1969 Dodge Super Bee | S18_3278 |
| 1957 Vespa GS150 | S18_3782 |
| 1982 Ducati 900 Monster | S24_2360 |
| 1961 Chevrolet Impala | S24_4620 |
| 1982 Ducati 996 R | S32_2206 |
| 2002 Yamaha YZR M1 | S50_4713 |
+ ---------------- + ---------------- +
6 rows
For each query, include your code and the results (see example below).
Example:
Q1. Execute:
> select productName
from Products
where productCode = 'S10_1678'
+ ---------------- +
| productName |
+ ---------------- +
| 1969 Harley Davidson Ultimate Chopper |
+ ---------------- +
1 rows