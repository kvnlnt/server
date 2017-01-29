CREATE TABLE `pieces` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `piece` varchar(100) NOT NULL,
  `created_on` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_on` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DESCRIBE pieces;

DELIMITER $$
CREATE PROCEDURE piece_create(_piece VARCHAR(100))
    BEGIN
    INSERT INTO pieces (piece) 
    VALUES (_piece);
    END $$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE piece_read(_id INT)
    BEGIN
    SELECT * 
    FROM pieces
    WHERE id = _id;
    END $$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE piece_list(_id INT)
    BEGIN
    SELECT * 
    FROM people
    WHERE id = _id;
    END $$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE piece_update(_id INT, _piece VARCHAR(100))
    BEGIN
    UPDATE pieces 
    SET piece = _piece
    WHERE id = _id;
    END $$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE piece_delete(_id INT)
    BEGIN
    DELETE FROM pieces
    WHERE id = _id;
    END $$
DELIMITER ;