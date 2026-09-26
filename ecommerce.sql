create database ecommerce;

show databases;

use ecommerce;

create table customer(
customerid int primary key,
name varchar (30),
city varchar (20),
email varchar (30) not null,
phone varchar (10));

DESCRIBE customer;

create table category(
categoryid int primary key,
categoryname varchar (40) not null);

create table product(
productid int primary key,
productname varchar (20),
price decimal,
stock int,
categoryid int,
foreign key (categoryid) references category(categoryid));

create table orders(
orderid int primary key,
orderdate date ,
customerid int ,
totalamount int ,
status varchar(10),
foreign key (customerid) references customer(customerid) );

create table order_items(
orderitemid int primary key,
orderid int,
productid int,
quantity int ,
price decimal (10,2),
foreign key (orderid) references orders(orderid),
foreign key (productid) references product(productid));

alter table orders
modify totalamount decimal(10,2);

alter table product
modify price decimal(10,2);

insert into category(categoryid, categoryname)
values
(1, "electronics"),
(2, "clothing"),
(3, "sports"),
(4, "makeup"),
(5, 'books');

insert into customer 
(customerid, name, city, email, phone)
values
(101, "palak gupta", "bhopal", "palak@gmail.com", "2347897324"),
(102, "shivani", "bangalore", "shivanigmail.com", "9877897324"),
(103, "kajal", "indore", "kajal@gmail.com", "2347997324"),
(104, "amrita", "jaipur", "amrita@gmail.com", "2347897998"),
(107, "sita", "delhi", "sita@gmail.com", "2347898888"),
(108, "geeta", "bhopal", "geeta@gmail.com", "9893897324");

insert into product
(productid, productname, price, stock, categoryid)
values
(201, "laptop", 70000.00, 10, 1),
(202, "phone", 20000.00, 18,1),
(203, "shirt", 700.00, 30,2),
(204, "jeans", 1200.00, 20,2),
(205, "ball", 400.00, 10,3),
(206, "yoga mat", 1000.00, 10,3),
(207, "lipstick", 300.00, 70,4),
(208, "musafir cafe", 300.00, 24,5);

update customer set email = "shivani@gamil.com" where customerid = 102;

select * from customer;

insert into orders
(orderid, orderdate, customerid, totalamount, status)
values
(301, "2026-09-01", 101, 70000.00, "Delivered"),
(302, "2026-09-03", 102, 20000.00, "Shipped"),
(303, "2026-09-05", 103, 1900.00, "Delivered"),
(304, "2026-09-07", 104, 300.00, "Pending"),
(305, "2026-09-10", 101, 1200.00, "Delivered"),
(306, "2026-09-12", 107, 1000.00, "Cancelled"),
(307, "2026-09-15", 108, 75000.00, "Shipped"),
(308, "2026-09-18", 103, 1600.00, "Pending");

update orders set totalamount = 90000.00 where orderid = 307;

insert into order_items
(orderitemid, orderid, productid, quantity, price)
values
(401, 302, 202, 1, 20000.00),
(402, 301, 201, 1, 70000.00),
(403, 303, 203, 1, 700.00),
(404, 303, 204, 1, 1200.00),
(405, 304, 207, 1, 300.00),
(406, 305, 204, 1, 1200.00),
(407, 306, 206, 1, 1000.00),
(408, 307, 201, 1, 70000.00),
(409, 307, 202, 1, 20000.00),
(410, 308, 207, 4, 300.00);


-- Query 1
SELECT * FROM customer;

-- Query 2
select name, city , email from customer;

-- Query 3
select * from product
where price > 1000;

-- Query 4
select productname, price from product
where price between 500 and 20000;

-- Query 5
select * from customer
where city in ("bhopal", "delhi", "indore");

-- Query 6
select * from product
where productname like "%o%";

-- Query 7
select * from product
where productname like "p%";

-- Query 8
select * from product
order by price desc;

-- Query 9
select * from product
order by price desc limit 3;

-- Query 10
select count(*) from customer;

-- Query 12
select avg(price) from product;

-- Query 13
select max(price) from product;

-- Query 14
select min(price) from product;

-- Query 15
select sum(price) from product;

-- Query 16
select city, count(city) from customer
group by city;

-- Query 17
select status , count(status) from orders
group by status;

-- Query 18
select sum(totalamount) from orders;

-- Query 19
select name from customer
inner join orders
on customer.customerid = orders.customerid;

-- Query 20
select name, orderid, status from customer
inner join orders
on customer.customerid = orders.customerid;

-- Query 21
select productname, categoryname, price from product
inner join category
on category.categoryid = product.categoryid;

-- Query 22
select orders.orderid, productname, quantity, product.price from orders
inner join order_items
on orders.orderid = order_items.orderid
inner join product
on order_items.productid = product.productid;

-- Query 23
select name, orderid, totalamount from customer
inner join orders
on customer.customerid = orders.customerid;

-- Query 24
select productname , sum(quantity) from product
inner join order_items
on product.productid = order_items.productid
group by product.productid;

-- Query 25
select categoryname, count(productid) from category
inner join product
on category.categoryid = product.categoryid
group by category.categoryid;

-- Query 26
SELECT categoryname, COUNT(productid)
FROM category
INNER JOIN product
ON category.categoryid = product.categoryid
GROUP BY category.categoryid
HAVING COUNT(productid) > 1;

-- Query 27
select name , count(orderid) from customer
inner join orders
on customer.customerid = orders.customerid
group by customer.customerid; 

-- Query 28
select name, sum(totalamount) from customer
inner join orders
on customer.customerid = orders.customerid
group by customer.customerid;

-- Query 29
select productname, sum(quantity * order_items.price) as totalsales
from product
inner join order_items
on product.productid = order_items.productid
group by product.productid;

-- Query 30
select orders.orderid , sum(quantity*price) as totalcalculatedamt
from orders
inner join order_items
on orders.orderid = order_items.orderid
group by orders.orderid;

-- Query 31
SELECT name, status
FROM customer
INNER JOIN orders
ON customer.customerid = orders.customerid
WHERE orders.status = 'Delivered';

-- Query 32
select name, orderid from customer
inner join orders
on customer.customerid = orders.customerid
group by customer.name;

-- Query 33
select name, orderid from customer
left join orders
on customer.customerid = orders.customerid
where orders.orderid is null;
 
 -- Query 34
 select product.productid, productname from product
 left join order_items
 on product.productid = order_items.productid
 where order_items.productid is null;

-- Query 35 
select name, SUM(totalamount) from customer
inner join orders
on customer.customerid = orders.customerid
group by customer.customerid
having sum(totalamount) > 50000;

-- Query 36
select productname, stock from product
where stock < 15;

-- Query 37
select orderid, orderdate from orders
where orderdate> '2026-09-05';

-- Query 38
select name, orderid, orderdate from customer
inner join orders
on customer.customerid = orders.customerid
where orderdate > '2026-09-05';

-- Query 39
select name, orderid, status, totalamount from customer
inner join orders
on customer.customerid = orders.customerid
where totalamount > 10000;

-- Query 40
select orderid, orderdate, customer.customerid, totalamount, status from customer
inner join orders
on customer.customerid = orders.customerid
where status = "pending";

-- Query 41
select productid, price from product where price > (select avg(price) from product);

-- Query 42
select productname, price from product where price = (select max(price) from product);

-- Query 43
select name from customer where customerid in( select customerid from orders);









