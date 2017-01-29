CREATE TABLE `people` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `email` VARCHAR(100) NOT NULL,
  `created_on` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_on` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DESCRIBE people;

DELIMITER $$
CREATE PROCEDURE people_create(_email VARCHAR(100))
    BEGIN
    INSERT INTO email (email) 
    VALUES (_email);
    END $$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE people_read(_id INT)
    BEGIN
    SELECT * 
    FROM people
    WHERE id = _id;
    END $$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE people_list(_id INT)
    BEGIN
    SELECT * 
    FROM people
    WHERE id = _id;
    END $$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE people_update(_id INT, _email VARCHAR(100))
    BEGIN
    UPDATE people 
    SET email = _email
    WHERE id = _id;
    END $$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE people_delete(_id INT)
    BEGIN
    DELETE FROM people
    WHERE id = _id;
    END $$
DELIMITER ;