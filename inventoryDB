#1. Create a new database for this assignment. Include the clause to check if it is present
CREATE SCHEMA IF NOT EXISTS `inventory_management`;

USE inventory_management;

/* From the data below, create 4 separate tables that are in 3NF. You may add any additional
fields. The column order can be re-arranged. */

CREATE TABLE IF NOT EXISTS `inventory_management`.`brands` (
    `brand_id` TINYINT UNSIGNED NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(40) NOT NULL,
    PRIMARY KEY (`brand_id`)
);
  ALTER TABLE brands AUTO_INCREMENT = 100;
  
   
INSERT INTO `inventory_management`.`brands` (`name`) 
VALUES ('Adidas'),
('H&M'),
('Chevy'),
('Mazda'),
('Nike'),
('Dockers'),
('Lacoste'),
('Gucci'),
('Prada'),
('Channel'),
('GE'),
('Dove'),
('Apple'),
('Google');
  

CREATE TABLE IF NOT EXISTS `inventory_management`.`products` (
  `product_id` SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `brand_id` TINYINT UNSIGNED NOT NULL,
  `price` DECIMAL(7,2) NOT NULL DEFAULT '0.00',
  `size` VARCHAR(20) NOT NULL,
  `color` VARCHAR(20) NOT NULL,
  PRIMARY KEY(`product_id`));

  ALTER TABLE `inventory_management`.`products`
  ADD INDEX `fk_brand_idx` (`brand_id` ASC),
  ADD CONSTRAINT `fk_brand`
  FOREIGN KEY (`brand_id`)
  REFERENCES `inventory_management`.`brands` (`brand_id`);
  ALTER TABLE products AUTO_INCREMENT = 200;

    

  
INSERT INTO `inventory_management`.`products` (`brand_id`,`price`, `size`, `color`) 
VALUES 
(100, '99.99', 'L', 'Black'),
(101, '275.99', 'XXL', 'Orange'),
(102, '40400', 'Mid-size', 'Red'),
(103, '38000', 'Compact', 'Blue'),
(104, '299.99', '13', 'Green'),
(100, '179.00', 'Youth Large', 'Purple'),
(105, '39.99', '10', 'Grey'),
(106, '49.99', 'Small', 'White'),
(107, '2464', 'Large', 'Gold'),
(108, '3400', 'Oversize', 'Silver'),
(109, '500', '40', 'Bronze'),
(110, '700', 'Medium', 'Metallic'),
(111, '4.99', 'Youth', 'White'),
(112, '661.41', 'XL', 'Black'),
(113, '999.00', 'XL', 'White');
  
  
  CREATE TABLE IF NOT EXISTS `inventory_management`.`vendors` (
  `vendor_id` SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `address` VARCHAR(100) NOT NULL,
  `city` VARCHAR(20) NOT NULL,
  `province` CHAR(2) NOT NULL DEFAULT 'ON',
  PRIMARY KEY(`vendor_id`)
  );
      ALTER TABLE vendors AUTO_INCREMENT = 300;
      
INSERT INTO `inventory_management`.`vendors`
(`address`, `city`)
VALUES
('1 Joe St ','Barrie'),
('98 Dock Rd','Midland'),
('138 Carroll Crossroad','Thunder Bay'),
('5792 Feeney Curve','Sudbury'),
('35 Clara Village','Algoma'),
('344 Brooklyn Rd','Nipissing'),
('Demarco Harbors','Kenora'),
('6375 Hill Valleys','North Bay'),
('956 Cummings Landing','Sault Ste Marie'),
('495 Rolfson Islands','Hearst'),
('1362 Cali Junctions','Vaughan'),
('104 Hermiston Row','Concord'),
('157 Dalton Ways','Markam'),
('517 Spencer Freeway','Toronto'),
('193 Poplar Plains','Hamilton');

   CREATE TABLE IF NOT EXISTS `inventory_management`.`consumers` (
  `consumer_id` SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `satisfaction` ENUM('Very High', 'High', 'Medium', 'Low', 'Very Low', 'Medium-Low', 'Medium-High') NULL,
  `review` TEXT NOT NULL,
  PRIMARY KEY(`consumer_id`)
  );
        ALTER TABLE consumers AUTO_INCREMENT = 400;

INSERT INTO `inventory_management`.`consumers` (`satisfaction`, `review`)
VALUES 
('High', 'I love my new pants'),
('Medium', 'I light up the room when I walk in'),
('Low', 'Build to last!'),
('Medium-Low', 'Get out of my dreams and into my car'),
('Very High', 'Just did it'),
('Very Low', 'It\'s more than a brand, it\'s a lifestyle'),
('Medium', 'Tough people need tough shoes'),
('Low', 'You can always trust an alligator'),
('High', 'High class comes at a steep price'),
(NULL, 'If you don\'t gotta, you\'re nadda'),
('Medium-High', 'Tune in to fashion'),
('High', 'Saved a lot by making the switch'),
('Very High', 'I love the gentleness of this product'),
('Low', 'They have a spell on me'),
('Medium', 'Best phone on the market!');

CREATE TABLE `inventory_management`.`inventory` (
  `product_id` SMALLINT UNSIGNED NOT NULL,
  `vendor_id` SMALLINT UNSIGNED NOT NULL,
  `consumer_id` SMALLINT UNSIGNED NOT NULL,
  INDEX `fk_product_idx` (`product_id` ASC),
  INDEX `fk_vendor_idx` (`vendor_id` ASC),
  INDEX `fk_consumer_idx` (`consumer_id` ASC),
  CONSTRAINT `fk_product`
    FOREIGN KEY (`product_id`)
    REFERENCES `inventory_management`.`products` (`product_id`),
  CONSTRAINT `fk_vendor`
    FOREIGN KEY (`vendor_id`)
    REFERENCES `inventory_management`.`vendors` (`vendor_id`),
    CONSTRAINT `fk_consumer`
    FOREIGN KEY (`consumer_id`)
    REFERENCES `inventory_management`.`consumers` (`consumer_id`)
  );
   
INSERT INTO `inventory_management`.`inventory` (`product_id`, `vendor_id`, `consumer_id`) 
VALUES 
(200, 300, 400),
(201, 301, 401),
(202, 302, 402),
(203, 303, 403),
(204, 304, 404),
(205, 305, 405),
(206, 306, 406),
(207, 307, 407),
(208, 308, 408),
(209, 309, 409),
(210, 310, 410),
(211, 311, 411),
(212, 312, 412),
(213, 313, 413),
(214, 314, 414);

#Using the inventory table, write the query to display the product brand, product price, consumer satisfaction and consumer review for all data.

SELECT brands.`name`, products.price, consumers.satisfaction, consumers.review
FROM `inventory_management`.`inventory`
INNER JOIN products USING (product_id) 
INNER JOIN consumers USING (consumer_id)
INNER JOIN brands USING (brand_id);

#Using the inventory table, write the query to display the product brand and vendor information for all data.


SELECT brands.`name`, vendors.address, vendors.city, vendors.province
FROM `inventory_management`.`inventory`
INNER JOIN products USING (product_id)
INNER JOIN brands USING (brand_id)
INNER JOIN vendors USING (vendor_id);
