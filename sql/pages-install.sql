CREATE TABLE `pages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `page` varchar(100) NOT NULL,
  `created_on` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_on` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DESCRIBE pages;

DELIMITER $$
CREATE PROCEDURE page_create(_page VARCHAR(100))
    BEGIN
    INSERT INTO pages (page) 
    VALUES (_page);
    END $$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE page_read(_id INT)
    BEGIN
    SELECT * 
    FROM pages
    WHERE id = _id;
    END $$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE page_list(_id INT)
    BEGIN
    SELECT * 
    FROM people
    WHERE id = _id;
    END $$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE page_update(_id INT, _page VARCHAR(100))
    BEGIN
    UPDATE pages 
    SET page = _page
    WHERE id = _id;
    END $$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE page_delete(_id INT)
    BEGIN
    DELETE FROM pages
    WHERE id = _id;
    END $$
DELIMITER ;