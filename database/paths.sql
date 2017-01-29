CREATE TABLE `paths` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `path` varchar(100) NOT NULL,
  `created_on` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_on` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DESCRIBE paths;

DELIMITER $$
CREATE PROCEDURE path_create(_path VARCHAR(100))
    BEGIN
    INSERT INTO paths (path) 
    VALUES (_path);
    END $$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE path_read(_id INT)
    BEGIN
    SELECT * 
    FROM paths
    WHERE id = _id;
    END $$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE path_list(_id INT)
    BEGIN
    SELECT * 
    FROM people
    WHERE id = _id;
    END $$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE path_update(_id INT, _path VARCHAR(100))
    BEGIN
    UPDATE paths 
    SET path = _path
    WHERE id = _id;
    END $$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE path_delete(_id INT)
    BEGIN
    DELETE FROM paths
    WHERE id = _id;
    END $$
DELIMITER ;
