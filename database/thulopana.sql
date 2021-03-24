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
  `b_id` INT NOT NULL AUTO_INCREMENT,
  `user_id` INT NOT NULL,
  `isbn` VARCHAR(25) NOT NULL,
  `title` VARCHAR(50) NOT NULL,
  `description` LONGTEXT NOT NULL,
  `author` VARCHAR(40) NOT NULL,
  `category` INT NOT NULL,
  `type` VARCHAR(10) NOT NULL,
  `pages` INT NOT NULL,
  `price` INT NOT NULL,
  `image` LONGTEXT NOT NULL,
  `uploaded_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`b_id`),
  FOREIGN KEY (`category`) REFERENCES category(`c_id`)
) AUTO_INCREMENT = 21 ;

drop table book;

-- On update 
ALTER TABLE book
ADD COLUMN `updated_at` 
  TIMESTAMP DEFAULT CURRENT_TIMESTAMP 
  ON UPDATE CURRENT_TIMESTAMP;
  
-- Inserting data into book table
INSERT INTO `book` (`b_id`, `user_id`, `isbn`, `title`, `description`, `author`, `category`, `type`, `pages`, `price`, `image`, `uploaded_at`, `updated_at`) VALUES
(1, 3, '12345' , 'Web Development', 'Containing over 5,000 entries from Aalto to ziggurat, this is the most comprehensive and up-to-date dictionary of
 architecture in paperback. Beautifully illustrated and written in a clear and concise style, it is an invaluable work of reference for both students of architecture
 and the general reader, as well as professional architects. Covers all periods of Western architectural history, from ancient times to the present day Concise biographies 
 of leading architects, from Brunelleschi and Imhotep to Le Corbusier and Richard Rogers Over 250 illustrations specially drawn for this volume',
 'Sajan Kc', '17', 'new', 209, 550, 'upload_image/book1.jpg', now(), now()),
(2, 3, '123456' , 'Java Full Stack', 'Containing over 5,000 entries from Aalto to ziggurat, this is the most comprehensive and up-to-date dictionary of
 architecture in paperback. Beautifully illustrated and written in a clear and concise style, it is an invaluable work of reference for both students of architecture
 and the general reader, as well as professional architects. Covers all periods of Western architectural history, from ancient times to the present day Concise biographies 
 of leading architects, from Brunelleschi and Imhotep to Le Corbusier and Richard Rogers Over 250 illustrations specially drawn for this volume',
 'Ngima Sherpa', '17', 'new', 500, 650, 'upload_image/book2.jpg', now(), now()),
 (3, 3, '12304' , 'Javascript', 'Containing over 5,000 entries from Aalto to ziggurat, this is the most comprehensive and up-to-date dictionary of
 architecture in paperback. Beautifully illustrated and written in a clear and concise style, it is an invaluable work of reference for both students of architecture
 and the general reader, as well as professional architects. Covers all periods of Western architectural history, from ancient times to the present day Concise biographies 
 of leading architects, from Brunelleschi and Imhotep to Le Corbusier and Richard Rogers Over 250 illustrations specially drawn for this volume',
 'Gopal Yadab', '17', 'new', 209, 550, 'upload_image/book3.jpg', now(), now()),
 (4, 3, '123401' , 'PHP Full Stack', 'Containing over 5,000 entries from Aalto to ziggurat, this is the most comprehensive and up-to-date dictionary of
 architecture in paperback. Beautifully illustrated and written in a clear and concise style, it is an invaluable work of reference for both students of architecture
 and the general reader, as well as professional architects. Covers all periods of Western architectural history, from ancient times to the present day Concise biographies 
 of leading architects, from Brunelleschi and Imhotep to Le Corbusier and Richard Rogers Over 250 illustrations specially drawn for this volume',
 'Muna Thapa', '17', 'new', 500, 650, 'upload_image/book4.jpg', now(), now()),
 (5, 3, '12345' , 'Scripting Language', 'Containing over 5,000 entries from Aalto to ziggurat, this is the most comprehensive and up-to-date dictionary of
 architecture in paperback. Beautifully illustrated and written in a clear and concise style, it is an invaluable work of reference for both students of architecture
 and the general reader, as well as professional architects. Covers all periods of Western architectural history, from ancient times to the present day Concise biographies 
 of leading architects, from Brunelleschi and Imhotep to Le Corbusier and Richard Rogers Over 250 illustrations specially drawn for this volume',
 'Sajan Kc', '17', 'new', 209, 550, 'upload_image/book5.jpg', now(), now()),
 (6, 3, '123456' , 'Operating System', 'Containing over 5,000 entries from Aalto to ziggurat, this is the most comprehensive and up-to-date dictionary of
 architecture in paperback. Beautifully illustrated and written in a clear and concise style, it is an invaluable work of reference for both students of architecture
 and the general reader, as well as professional architects. Covers all periods of Western architectural history, from ancient times to the present day Concise biographies 
 of leading architects, from Brunelleschi and Imhotep to Le Corbusier and Richard Rogers Over 250 illustrations specially drawn for this volume',
 'Ngima Sherpa', '17', 'new', 500, 650, 'upload_image/book6.jpg', now(), now());

  -- View all records of role table    
SELECT * FROM book;

-- ------------------------------------------
-- Creating book category table
-- ------------------------------------------

CREATE TABLE IF NOT EXISTS `category` (
  `c_id` INT NOT NULL AUTO_INCREMENT,
  `c_name` VARCHAR(30) NOT NULL,
  PRIMARY KEY (`c_id`)
) AUTO_INCREMENT = 20;

-- Inserting data into book category table

INSERT INTO `category` (`c_id`, `c_name`) VALUES
(1, 'Astrology'),
(2, 'Architecture'),
(3, 'Art And Culture'),
(4, 'Tracking'),
(5, 'Fiction'),
(6, 'Comics'),
(7, 'Computer Programming'),
(8, 'Cooking'),
(9, 'Science'),
(10, 'Forest'),
(11, 'Sports'),
(12, 'Business'),
(13, 'Economics'),
(14, 'Agriculture'),
(15, 'Tourism'),
(16, 'Yoga'),
(17, 'Religion'),
(18, 'Management'),
(19, 'Novel');

-- View all records of category table 
SELECT * FROM category;

