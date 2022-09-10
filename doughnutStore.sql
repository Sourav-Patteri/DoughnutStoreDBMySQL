#1. Create a new database for this assignment. Include the clause to check if it is present
CREATE SCHEMA IF NOT EXISTS `go_nuts_doughnut_store`;

SHOW SCHEMAS;
SHOW SCHEMAS LIKE "go_nuts_doughnut_store";
USE go_nuts_doughnut_store;

#2. Create a new table that will store doughnut information. Include the clause to check if it is present
CREATE TABLE IF NOT EXISTS `go_nuts_doughnut_store`.`doughnuts_info` (
  `doughnut_identifier` INT UNSIGNED NOT NULL,
  `doughnut_name` VARCHAR(20) NOT NULL UNIQUE,
  `cost` DECIMAL(3,2) NOT NULL DEFAULT '0.00',
  `customer_rating` ENUM('1', '2', '3') NOT NULL,
  PRIMARY KEY(`doughnut_identifier`)
  );

SHOW TABLES;
SELECT * FROM `doughnuts_info`;

#3. Populate the table with the following data. Please note that some data may not be possible to add. Row entries that are not possible to add, ignore.
# Two entries cannot be added as their values for the fields doughnut_name and doughnut_identifier are not unique.
INSERT INTO `go_nuts_doughnut_store`.`doughnuts_info` (`doughnut_identifier`,`doughnut_name`,`cost`,`customer_rating`) VALUES (1, 'Apple Fritter', 2.70, 1);
INSERT INTO `go_nuts_doughnut_store`.`doughnuts_info` (`doughnut_identifier`,`doughnut_name`,`cost`,`customer_rating`) VALUES (3, 'Apple Cruller', 3, 2);
INSERT INTO `go_nuts_doughnut_store`.`doughnuts_info` (`doughnut_identifier`,`doughnut_name`,`cost`,`customer_rating`) VALUES (4, 'Chocolate Ring', 1.5, 3);
INSERT INTO `go_nuts_doughnut_store`.`doughnuts_info` (`doughnut_identifier`,`doughnut_name`,`cost`,`customer_rating`) VALUES (2, 'Caramel Ring', 4, 2);
INSERT INTO `go_nuts_doughnut_store`.`doughnuts_info` (`doughnut_identifier`,`doughnut_name`,`cost`,`customer_rating`) VALUES (5, 'Jelly Filled', 2.15, 3);
INSERT INTO `go_nuts_doughnut_store`.`doughnuts_info` (`doughnut_identifier`,`doughnut_name`,`cost`,`customer_rating`) VALUES (6, 'Maple Ring', 1.85, 1);
INSERT INTO `go_nuts_doughnut_store`.`doughnuts_info` (`doughnut_identifier`,`doughnut_name`,`cost`,`customer_rating`) VALUES (7, 'Birthday Cake', 4.40, 1);

#4. Display all doughnut field names and data
SELECT * FROM `doughnuts_info`;

#5. Display all doughnut field names and data with a cost greater than $1.50
SELECT * FROM `doughnuts_info` WHERE cost > 1.50;

#6. Display all doughnut field names and data with a rating of less than 3
SELECT * FROM `doughnuts_info` WHERE customer_rating < 3;

#7. Display all doughnut field names and data where the doughnut name ENDS with the word “Ring”
SELECT * FROM `doughnuts_info` WHERE doughnut_name LIKE "%Ring";

#8. Display all doughnut field names and data where the doughnut name STARTS with the word “Apple”
SELECT * FROM `doughnuts_info` WHERE doughnut_name LIKE "Apple%";

#9. Display all doughnut field names and data in descending rating order 
SELECT * FROM `doughnuts_info` ORDER BY customer_rating DESC;

#10. Display all doughnut field names and data in ascending price order
SELECT * FROM `doughnuts_info` ORDER BY cost;

#11. Display all doughnut field names and data where the price is greater than $2.50, and rating is 3
SELECT * FROM `doughnuts_info` WHERE cost > 2.50 AND customer_rating = 3;

#12 Display the doughnut name, cost and rating of the doughnuts with the unique identifier of 4 using 5 unique queries

SELECT doughnut_name, cost, customer_rating FROM `doughnuts_info` WHERE doughnut_identifier = 4;
SELECT doughnut_name, cost, customer_rating FROM `doughnuts_info` WHERE doughnut_name = "Chocolate Ring";
SELECT doughnut_name, cost, customer_rating FROM `doughnuts_info` WHERE customer_rating = 3 AND cost = 1.50;
SELECT doughnut_name, cost, customer_rating FROM `doughnuts_info` ORDER BY doughnut_identifier LIMIT 3,1;
SELECT doughnut_name, cost, customer_rating FROM `doughnuts_info` WHERE customer_rating > 2 AND cost < 2;
SELECT doughnut_name, cost, customer_rating FROM `doughnuts_info` WHERE doughnut_name LIKE "Ch%" ;

#13. Display the doughnut name, cost and rating of the doughnuts with the unique identifiers of 1 and 3 using 7 unique queries
SELECT doughnut_name, cost, customer_rating FROM `doughnuts_info` WHERE doughnut_identifier = 1 OR doughnut_identifier = 3;
SELECT doughnut_name, cost, customer_rating FROM `doughnuts_info` WHERE doughnut_name LIKE "Apple%";
SELECT doughnut_name, cost, customer_rating FROM `doughnuts_info` WHERE cost = 2.70 OR cost = 3.00;
SELECT doughnut_name, cost, customer_rating FROM `doughnuts_info` WHERE doughnut_name LIKE "%e_" AND (customer_rating = 1 OR customer_rating = 2);
SELECT doughnut_name, cost, customer_rating FROM `doughnuts_info` WHERE 4 > doughnut_identifier > 0 AND NOT doughnut_identifier = 2;
SELECT doughnut_name, cost, customer_rating FROM `doughnuts_info` ORDER BY doughnut_name LIMIT 2;
SELECT doughnut_name, cost, customer_rating FROM `doughnuts_info` ORDER BY cost DESC LIMIT 2,2  ;


#14. Add a row with any data you choose to the doughnut table 
INSERT INTO `go_nuts_doughnut_store`.`doughnuts_info` (`doughnut_identifier`,`doughnut_name`,`cost`,`customer_rating`) VALUES (8, 'Oreo Crawler', 2.75, 3);

#15. Remove the lowest rating and most expensive doughnut in 5 unique ways 
SET SQL_SAFE_UPDATES = 0;

DELETE FROM `go_nuts_doughnut_store`.`doughnuts_info` WHERE customer_rating = 1 AND cost > 4;
DELETE FROM `go_nuts_doughnut_store`.`doughnuts_info` WHERE cost = 4.40;
DELETE FROM `go_nuts_doughnut_store`.`doughnuts_info` WHERE doughnut_identifier = 7;
DELETE FROM `go_nuts_doughnut_store`.`doughnuts_info` WHERE doughnut_name LIKE "%Cake";
DELETE FROM `go_nuts_doughnut_store`.`doughnuts_info` ORDER BY cost DESC LIMIT 1;



#16. Display the doughnut “Name”, “Cost” and “Sale Cost”. A sale cost is a calculated column of one doughnut at 30% reduction. NOTE: the names in quotes should be the field names.
SELECT doughnut_name, cost, cost - cost * 0.3 as sale_cost FROM `doughnuts_info`;
#ALSO
SELECT doughnut_name, cost, ROUND(cost * 0.7, 2) as sale_cost FROM `doughnuts_info`;

#17. Display the doughnut name, cost (renamed to “Single Cost”) and “Dozen Cost”. A dozen cost a calculated column of 12 doughnuts at regular price with a 20% reduction.
SELECT doughnut_name, cost as single_cost, cost * 12 - cost * 12 * 0.20 as dozen_cost FROM `doughnuts_info`;
#ALSO
SELECT doughnut_name, cost as single_cost, ROUND(cost * 9.6, 2) as dozen_cost FROM `doughnuts_info`;

#18. Double the cost of every doughnut 
UPDATE `go_nuts_doughnut_store`.`doughnuts_info` SET `cost` = cost * 2;

#19. Change the customer rating to a include ratings of 4, 5 and 0.
ALTER TABLE `go_nuts_doughnut_store`.`doughnuts_info` CHANGE COLUMN `customer_rating` `customer_rating` ENUM('0', '1', '2', '3', '4', '5') NOT NULL;

#20. Change the customer rating to the highest possible value for every doughnut that contains the letter C.
UPDATE `go_nuts_doughnut_store`.`doughnuts_info` SET `customer_rating` = '5' WHERE doughnut_name LIKE "%C%";
