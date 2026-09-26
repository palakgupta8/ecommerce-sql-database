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

SELECT * FROM customer;

select name, city , email from customer;

select * from product
where price > 1000;

select productname, price from product
where price between 500 and 20000;

select * from customer
where city in ("bhopal", "delhi", "indore");

select * from product
where productname like "%o%";

select * from product
where productname like "p%";

select * from product
order by price desc;

select * from product
order by price desc limit 3;

select count(*) from customer;

select avg(price) from product;

select max(price) from product;

select min(price) from product;

select sum(price) from product;

select city, count(city) from customer
group by city;

select status , count(status) from orders
group by status;

select sum(totalamount) from orders;

select name from customer
inner join orders
on customer.customerid = orders.customerid;

select name, orderid, status from customer
inner join orders
on customer.customerid = orders.customerid;

select productname, categoryname, price from product
inner join category
on category.categoryid = product.categoryid;

select orders.orderid, productname, quantity, product.price from orders
inner join order_items
on orders.orderid = order_items.orderid
inner join product
on order_items.productid = product.productid;

select name, orderid, totalamount from customer
inner join orders
on customer.customerid = orders.customerid;

select productname , sum(quantity) from product
inner join order_items
on product.productid = order_items.productid
group by product.productid;

select categoryname, count(productid) from category
inner join product
on category.categoryid = product.categoryid
group by category.categoryid;

select * from category
inner join product
on category.categoryid = product.categoryid
where stock > 1;











