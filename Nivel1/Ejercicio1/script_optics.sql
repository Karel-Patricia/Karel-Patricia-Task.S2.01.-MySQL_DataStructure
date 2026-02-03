CREATE SCHEMA optics_culdampolla;
USE optics_culdampolla;

CREATE TABLE supplier (
	supplier_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    street VARCHAR(100),
    street_number VARCHAR(10),
    floor VARCHAR(10),
    door VARCHAR(10),
    city VARCHAR(50),
    postal_code VARCHAR(10),
    country VARCHAR(50),
    phone VARCHAR(20),
    fax VARCHAR(20),
    nif VARCHAR(20),
    UNIQUE (nif)
);

CREATE TABLE brand (
	brand_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    supplier_id INT NOT NULL,
    UNIQUE (name),
    CONSTRAINT fk_brand_supplier
		FOREIGN KEY (supplier_id)
        REFERENCES supplier(supplier_id)
);

CREATE TABLE glasses (
	glasses_id INT AUTO_INCREMENT PRIMARY KEY,
    brand_id INT NOT NULL,
    left_lens_graduation DECIMAL(4,2),
    right_lens_graduation DECIMAL(4,2),
    frame_type ENUM('floating', 'plastic', 'metal') NOT NULL,
    frame_color VARCHAR(30),
    left_lens_color VARCHAR(30),
    right_lens_color VARCHAR(30),
    price DECIMAL(8,2) NOT NULL,
    CONSTRAINT fk_glasses_brand
		FOREIGN KEY (brand_id)
        REFERENCES brand(brand_id)
);

CREATE TABLE customer (
	customer_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    postal_address VARCHAR(20),
    phone VARCHAR(20),
    email VARCHAR(100),
    registration_date DATE NOT NULL,
    recommended_by INT,
    CONSTRAINT fk_customer_recommended_by
        FOREIGN KEY (recommended_by)
        REFERENCES customer(customer_id)
);

CREATE TABLE employee (
	employee_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL
);

CREATE TABLE sale (
	sale_id INT AUTO_INCREMENT PRIMARY KEY,
    sale_date DATE NOT NULL,
    customer_id INT NOT NULL,
    employee_id INT NOT NULL,
    glasses_id INT NOT NULL,
		CONSTRAINT fk_sale_customer FOREIGN KEY (customer_id) REFERENCES customer(customer_id),
        CONSTRAINT fk_sale_employee FOREIGN KEY (employee_id) REFERENCES employee(employee_id),
        CONSTRAINT fk_sale_glasses FOREIGN KEY (glasses_id) REFERENCES glasses(glasses_id)
);




    


    
    


	
