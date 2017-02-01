CREATE TABLE `properties` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `property` VARCHAR(100) NOT NULL,
  `created_on` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_on` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DESCRIBE properties;

DELIMITER $$
CREATE PROCEDURE property_create(_property VARCHAR(100))
    BEGIN
    INSERT INTO properties (property) 
    VALUES (_property);
    END $$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE property_read(_id INT)
    BEGIN
    SELECT * 
    FROM properties
    WHERE id = _id;
    END $$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE property_list(_limit INT, _offset INT)
    BEGIN
    SELECT * 
    FROM properties
    LIMIT _limit, _offset;
    END $$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE property_update(_id INT, _property VARCHAR(100))
    BEGIN
    UPDATE properties 
    SET property = _property
    WHERE id = _id;
    END $$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE property_delete(_id INT)
    BEGIN
    DELETE FROM properties
    WHERE id = _id;
    END $$
DELIMITER ;