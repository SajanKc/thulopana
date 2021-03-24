CREATE DATABASE thulopana;
USE thulopana;

-- ------------------------------------------
-- Creating user table
-- ------------------------------------------

CREATE TABLE IF NOT EXISTS `user` (
	`uid` INT NOT NULL AUTO_INCREMENT,
    `username` VARCHAR(20) NOT NULL,
	`password` VARCHAR(255) NOT NULL,
    `email` VARCHAR(30) NOT NULL,
    `phone` varchar(15) NOT NULL,
    `role` INT NOT NULL,
    `registered_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (`uid`),
    FOREIGN KEY (`role`) REFERENCES role(`rid`)
) AUTO_INCREMENT = 5;

-- On update 
ALTER TABLE user
ADD COLUMN `updated_at` 
  TIMESTAMP DEFAULT CURRENT_TIMESTAMP 
  ON UPDATE CURRENT_TIMESTAMP;
  
-- View all records of user table
SELECT * FROM user;

-- Inserting data into user table
INSERT INTO user VALUES
	(1,'sajankc','81dc9bdb52d04dc20036dbd8313ed055','sazankce@gmail.com','9843337779',1,now(),now()),
	(2,'ngimasherpa','81dc9bdb52d04dc20036dbd8313ed055','sazankce@gmail.com','9842868111',1,now(),now()),	
	(3,'namrata','81dc9bdb52d04dc20036dbd8313ed055','namrata@gmail.com','9841112223',2,now(),now()),	
	(4,'muna','81dc9bdb52d04dc20036dbd8313ed055','muna@yahoo.com','9846667778',3,now(),now());

-- ------------------------------------------
-- Creating role table
-- ------------------------------------------

CREATE TABLE IF NOT EXISTS `role` (
	`rid` INT NOT NULL,
    `role` VARCHAR(10) NOT NULL,
    PRIMARY KEY (`rid`)
) AUTO_INCREMENT = 4;

-- Inserting data into role table
INSERT INTO role VALUES
	(1,'admin'),
    (2,'buyer'),
    (3,'seller');
    
-- View all records of role table    
SELECT * FROM role;

-- ------------------------------------------
-- Creating book table
-- ------------------------------------------

CREATE TABLE IF NOT EXISTS `book` (
  `b_id` int(4) NOT NULL AUTO_INCREMENT,
  `b_name` varchar(60) NOT NULL,
  `b_subcat` varchar(25) NOT NULL,
  `b_description` longtext NOT NULL,
  `b_publisher` varchar(40) NOT NULL,
  `b_edition` varchar(20) NOT NULL,
  `b_isbn` varchar(10) NOT NULL,
  `b_page` int(5) NOT NULL,
  `b_price` int(5) NOT NULL,
  `b_img` longtext NOT NULL,
  PRIMARY KEY (`b_id`)
) AUTO_INCREMENT=31 ;