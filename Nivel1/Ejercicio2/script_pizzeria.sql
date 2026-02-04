CREATE DATABASE pizzeria;
USE pizzeria;


CREATE TABLE province (
	province_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL
);


CREATE TABLE city (
	city_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    province_id INT NOT NULL,
    FOREIGN KEY (province_id) REFERENCES province(province_id)
);


CREATE TABLE customer (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    address VARCHAR(150) NOT NULL,
    postal_code VARCHAR(10) NOT NULL,
    phone VARCHAR(20) NOT NULL,
    city_id INT NOT NULL,
    FOREIGN KEY (city_id) REFERENCES city(city_id)
);


CREATE TABLE store (
    store_id INT AUTO_INCREMENT PRIMARY KEY,
    address VARCHAR(150) NOT NULL,
    postal_code VARCHAR(10) NOT NULL,
    city_id INT NOT NULL,
    FOREIGN KEY (city_id) REFERENCES city(city_id)
);


CREATE TABLE employee (
    employee_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    nif VARCHAR(15) NOT NULL UNIQUE,
    phone VARCHAR(20),
    role ENUM('cook', 'delivery') NOT NULL,
    store_id INT NOT NULL,
    FOREIGN KEY (store_id) REFERENCES store(store_id)
);


CREATE TABLE product (
    product_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    description TEXT,
    image VARCHAR(255),
    price DECIMAL(8,2) NOT NULL,
    product_type ENUM('pizza', 'hamburger', 'drink') NOT NULL,
    category_id INT,
    CONSTRAINT fk_product_category
        FOREIGN KEY (category_id)
        REFERENCES pizza_category(category_id)
);


CREATE TABLE pizza_category (
	category_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL
);


CREATE TABLE `order` (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    order_date DATETIME NOT NULL,
    delivery_type ENUM('home_delivery', 'pickup') NOT NULL,
    total_price DECIMAL(10,2) NOT NULL,
    customer_id INT NOT NULL,
    store_id INT NOT NULL,
    delivery_employee_id INT,
    delivery_datetime DATETIME,
    FOREIGN KEY (customer_id) REFERENCES customer(customer_id),
    FOREIGN KEY (store_id) REFERENCES store(store_id),
    FOREIGN KEY (delivery_employee_id) REFERENCES employee(employee_id)
);


CREATE TABLE order_product (
    order_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity INT NOT NULL,
    PRIMARY KEY (order_id, product_id),
    FOREIGN KEY (order_id) REFERENCES `order`(order_id),
    FOREIGN KEY (product_id) REFERENCES product(product_id)
);





