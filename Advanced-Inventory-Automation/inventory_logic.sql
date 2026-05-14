-- 1. Database 
CREATE DATABASE IF NOT EXISTS inventory_mgmt_adv;
USE inventory_mgmt_adv;

-- 2. Tables 
CREATE TABLE IF NOT EXISTS suppliers (
    supplier_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    contact_email VARCHAR(100)
);

CREATE TABLE IF NOT EXISTS products (
    product_id INT PRIMARY KEY AUTO_INCREMENT,
    product_name VARCHAR(100) NOT NULL,
    price DECIMAL(10, 2),
    stock_quantity INT DEFAULT 0,
    min_stock_level INT DEFAULT 10,
    supplier_id INT,
    FOREIGN KEY (supplier_id) REFERENCES suppliers(supplier_id)
);

CREATE TABLE IF NOT EXISTS stock_alerts (
    alert_id INT PRIMARY KEY AUTO_INCREMENT,
    product_id INT,
    alert_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    message VARCHAR(255),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

-- 3. Trigger 
DROP TRIGGER IF EXISTS check_stock_after_update;
DELIMITER //
CREATE TRIGGER check_stock_after_update
AFTER UPDATE ON products
FOR EACH ROW
BEGIN
    IF NEW.stock_quantity < NEW.min_stock_level THEN
        INSERT INTO stock_alerts (product_id, message)
        VALUES (NEW.product_id, CONCAT('Warning: Low stock for ', NEW.product_name, '. Current stock: ', NEW.stock_quantity));
    END IF;
END;
//
DELIMITER ;

-- Data 
INSERT INTO suppliers (name, contact_email) VALUES ('Tech Supply Co', 'contact@tech.com');
INSERT INTO products (product_name, price, stock_quantity, min_stock_level, supplier_id) 
VALUES ('Keyboard', 45.00, 12, 10, 1);

-- Update
UPDATE products SET stock_quantity = stock_quantity - 5 WHERE product_id = 1;

-- Alert 
SELECT * FROM stock_alerts;