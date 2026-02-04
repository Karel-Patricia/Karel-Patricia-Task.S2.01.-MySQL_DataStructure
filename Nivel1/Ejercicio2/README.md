# Task S2.01. MySQL Data Structure

## 📌 Level 1

### Exercise 2

This project consists of the design and implementation of a relational database for a home delivery pizzeria web application. The database has been developed using MySQL, managed through MySQL Workbench, and deployed in a Docker environment.

The objective is to model customers, orders, products, stores, employees, and geographical data, ensuring data integrity and proper normalization.

The repository includes:

* A relational model diagram (PNG/JPG)
* A SQL script to create the database schema
* A SQL script with sample data
* Example queries to validate the design

#### Database Design

The database follows a normalized relational model based on an Entity–Relationship (ER) diagram.

Main Entities
* Province
* City
* Customer
* Store
* Employee
* Order
* Product (pizza, hamburger, drink)
* Pizza Category

Key Relationships
* One province has many cities
* One city belongs to one province
* One customer can place many orders
* One order belongs to one customer
* One store handles many orders
* One store employs many employees
* One order contains many products (N:M)
* One pizza belongs to one category
* One category can have many pizzas

The many-to-many relationship between orders and products is resolved using the order_product table, which also stores the quantity of each product.

#### Database Schema

The database schema is named:
pizzeria

All tables are created using SQL scripts, respecting foreign key constraints and referential integrity.

#### Sample Data

The project includes sample INSERT statements to populate:

* Provinces and cities
* Stores
* Customers
* Employees
* Products (including drinks)
* Orders
* Order-product relationships

These inserts allow testing of the required queries.

####  Validation Queries

1. Total drinks sold in a given city

2. Total orders handled by an employee


## 🛠️ Technologies
- MySQL – Database engine
- MySQL Workbench – Database modeling and SQL execution
- Docker – Containerized MySQL environment for consistent local development
- Git & GitHub 

