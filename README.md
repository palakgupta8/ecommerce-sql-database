E-commerce SQL Database

Project Overview

This project is a relational **E-commerce Database Management System** built using **MySQL**.

The project demonstrates the design of an e-commerce database, including customers, products, categories, orders, and order items. It also includes SQL queries covering filtering, sorting, aggregation, joins, grouping, and data analysis.

---

Technologies Used

* MySQL
* MySQL Workbench
* SQL
* Git & GitHub

---

Database Structure

The database is named: sql ecommerce

Tables

 1. Customer

Stores customer information.

| Column     | Description           |
| ---------- | --------------------- |
| customerid | Primary Key           |
| name       | Customer name         |
| city       | Customer city         |
| email      | Customer email        |
| phone      | Customer phone number |

 2. Category

Stores product categories.

| Column       | Description   |
| ------------ | ------------- |
| categoryid   | Primary Key   |
| categoryname | Category name |

 3. Product

Stores product information.

| Column      | Description     |
| ----------- | --------------- |
| productid   | Primary Key     |
| productname | Product name    |
| price       | Product price   |
| stock       | Available stock |
| categoryid  | Foreign Key     |

 4. Orders

Stores customer order information.

| Column      | Description        |
| ----------- | ------------------ |
| orderid     | Primary Key        |
| orderdate   | Date of order      |
| customerid  | Foreign Key        |
| totalamount | Total order amount |
| status      | Order status       |

 5. Order Items

Stores individual products included in each order.

| Column      | Description                        |
| ----------- | ---------------------------------- |
| orderitemid | Primary Key                        |
| orderid     | Foreign Key                        |
| productid   | Foreign Key                        |
| quantity    | Quantity ordered                   |
| price       | Product price at the time of order |


 Relationships

* One customer can place multiple orders.
* One order can contain multiple order items.
* One product can appear in multiple order items.
* One category can contain multiple products.


 SQL Concepts Covered

The project includes **40 SQL queries** covering:

* `SELECT`
* `WHERE`
* `BETWEEN`
* `IN`
* `LIKE`
* `ORDER BY`
* `LIMIT`
* `COUNT()`
* `SUM()`
* `AVG()`
* `MAX()`
* `MIN()`
* `GROUP BY`
* `HAVING`
* `INNER JOIN`
* `LEFT JOIN`
* Aggregate functions
* Filtering joined data
* Calculated values
* Date filtering
* Identifying customers/products without related records



 Project Structure

ecommerce-sql-database/
│
├── ecommerce.sql
└── README.md


 `ecommerce.sql`

Contains:

* Database creation
* Table creation
* Primary and foreign keys
* Sample data
* Data updates
* 40 SQL practice queries

### `README.md`

Contains project documentation, database structure, relationships.

---

 Learning Objectives

This project was created to practice and strengthen:

* Relational database design
* Primary and foreign keys
* SQL data manipulation
* Joins and relationships
* Aggregate functions
* Grouping and filtering
* Writing analytical SQL queries
* Working with MySQL Workbench
* Using Git and GitHub for project management

