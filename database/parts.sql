CREATE TABLE `parts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `part` varchar(100) NOT NULL,
  `created_on` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_on` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DESCRIBE parts;

DELIMITER $$
CREATE PROCEDURE part_create(_part VARCHAR(100))
    BEGIN
    INSERT INTO parts (part) 
    VALUES (_part);
    END $$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE part_read(_id INT)
    BEGIN
    SELECT * 
    FROM parts
    WHERE id = _id;
    END $$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE part_list(_id INT)
    BEGIN
    SELECT * 
    FROM people
    WHERE id = _id;
    END $$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE part_update(_id INT, _part VARCHAR(100))
    BEGIN
    UPDATE parts 
    SET part = _part
    WHERE id = _id;
    END $$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE part_delete(_id INT)
    BEGIN
    DELETE FROM parts
    WHERE id = _id;
    END $$
DELIMITER ;