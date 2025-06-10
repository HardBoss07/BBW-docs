CREATE DATABASE IF NOT EXISTS pizzakurier;
USE pizzakurier;

CREATE TABLE customer (
    id INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(255),
    address VARCHAR(255),
    zip VARCHAR(20),
    city VARCHAR(100),
    phone_number VARCHAR(20),
    email VARCHAR(255),
    PRIMARY KEY (id)
);

CREATE TABLE product (
    id INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(255),
    description TEXT,
    price DECIMAL(6,2),
    category ENUM('pizza', 'pasta', 'drinks'),
    telefonnummer VARCHAR(20),
    PRIMARY KEY (id)
);

CREATE TABLE orders (
    id INT NOT NULL AUTO_INCREMENT,
    fk_customer_id INT NOT NULL,
    order_date DATETIME NOT NULL,
    delivery_date DATETIME,
    PRIMARY KEY (id),
    FOREIGN KEY (fk_customer_id) REFERENCES Customer(id)
);

CREATE TABLE product_order (
    id INT NOT NULL AUTO_INCREMENT,
    fk_order_id INT NOT NULL,
    fk_product_id INT NOT NULL,
    product_amount INT,
    PRIMARY KEY (id),
    FOREIGN KEY (fk_order_id) REFERENCES orders(id),
    FOREIGN KEY (fk_product_id) REFERENCES product(id)
);