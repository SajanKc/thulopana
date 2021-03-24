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
  `published_year` INT NOT NULL,
  `uploaded_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`b_id`),
  FOREIGN KEY (`category`) REFERENCES category(`c_id`)
) AUTO_INCREMENT = 25 ;

drop table book;

-- On update 
ALTER TABLE book
ADD COLUMN `updated_at` 
  TIMESTAMP DEFAULT CURRENT_TIMESTAMP 
  ON UPDATE CURRENT_TIMESTAMP;
  
-- Inserting data into book table
INSERT INTO `book` (`b_id`, `user_id`, `isbn`, `title`, `description`, `author`, `category`, `type`, `pages`, `price`, `image`, `published_year`,`uploaded_at`, `updated_at`) 
VALUES
(1, 3, '9937856345' , 'Seto Dharati', 'Seto Dharti is a novel written by Amar Neupane. 
It received Madan Puraskar, which is the biggest literary award in Nepal. 
This book was first released in March 2012, rapidly becoming a best seller inside the country. 
The language of this book is in native Nepali. This book reveals the bitter reality of Nepalese society. 
This is a painful story of a widow.',
'Amar Neupane ', '19', 'new', 380, 400, 'upload_image/setoDharti.jpg', 2012, now(), now()),
(2, 3, '9789937827935' , 'Karnali Blues', 'The story starts with the short narration related with the story of the birth of the son, Brishabahadur. 
The book is divided into eleven parts, each mentioned as a day. The novel is part present and more of a flashback. 
The narrator, who himself is the writer, comes to visit his father and during the eleven days that he spends taking care of his sick father,
his mind drifts towards the past.The changing perception of the son regarding his father is expressed beautifully in this novel. ',
'Buddhisagar ', '19', 'new', 384, 450, 'upload_image/karnaliBlues.jpg', 2010, now(), now()), 
(3, 3, '9789937856386' , 'Summer Love', 'There was crowd to see the entrance result in Central Department of Environmental Science, Kirtipur.
In the notice board Atit saw the name - Saya in the number one. He did not see Saya but just her name. 
He was impressed by her name, and when he met the beautiful and talented Saya, he fell in love with her.
And their two-years-collage-romance starts... ',
'Subin Bhattarai', '19', 'new', 247, 550, 'upload_image/summerLove.jpg', 2013, now(), now()), 
(4, 3, '9937905877' , 'Palpasa Café', 'Felicitated by Madan Purashkar in the year 2005, Palpasa Cafe, a novel by Narayan Wagle, is one stop for readers of all kinds and ages. 
The editor of Kantipur Daily, Wagle novel is  set during the 10-year-long Maoists insurgency in Nepal.',
'Narayan Wagle', '19', 'new', 240, 350, 'upload_image/palpasaCafe.jpg', 2008, now(), now()), 
(5, 3, '9993329053' , 'Radha', 'Radharepresents an example of an outstanding nepali novel. This Novel is written by Krishna Dharabasi.
It plots the story of ancient epic Mahabharat with some changes that are not included in that epic. 
However the character Radha is very famous for the love relationship with Krishna in Hindu religion, 
she has been left far behind in the story of Mahabharat.
Dharabasi starts his own story of Radha where the epic has left her. The plot of Radha resembles with the situation of Nepal at the time of its publiation. 
In Radha, Mr. Dharabasi tried to picture the scenario of Nepal at the time of Peopleâ€™s war of Maoist.',
'Krishna Dharabasi', '19', 'new', 262, 300, 'upload_image/radha.jpg', 2005, now(), now()),
(6, 3, '9937322138' , 'Nepali Shakuntala', 'Mahakavi Laxmi Prasad Devkota wrote Shakuntala, his first epic poem and also the first 
"Mahakavya" (epic poem) written in the Nepali language, in a mere three months. Published in 1945, 
Shakuntala is a voluminous work in 24 cantos based on Kalidasas famous Sanskrit play Abhijñanasakuntalam. 
Shakuntala demonstrates Devkotas mastery of Sanskrit meter and diction which he incorporated heavily while 
working primarily in Nepali. According to the late scholar and translator of Devkota, David Rubin, Shakuntala is among his greatest accomplishments.',
'Laxmi Prasad Devkota', '19', 'new', 371, 450, 'upload_image/Shakuntala.png', 1945, now(), now()),
(7, 3, '9969499416' , 'Muna Madan', 'Muna Madan is a Nepali episodic love poem published in 1936 by the poet Laxmi Prasad Devkota. Considered a classic 
of Nepali literature, Muna Madan remains a popular poem and is taught in schools',
'Laxmi Prasad Devkota', '19', 'new', 41, 150, 'upload_image/muna-madan.jpg', 1936, now(), now()),
(8, 3, '9789937734066' , 'Yatrama', 'Sharda Sharma is a poet whose words wil nott stop flowing and at the same time has the ability to stand firm. 
Her poetry is of high standard. The poem, Amritkendra feels like reaching into Upanishad according to poet Madhav Ghimire.',
'Sharda Sharma', '19', 'new', 110, 325, 'upload_image/yatrama.jpg', 2011, now(), now()),
(9, 3, '9993320501 ' , 'Gauri', ' Gauri is an eponymous tragic epic written by Nepali National Poet Madhav Prasad Ghimire, in memory of his first wife,
following her premature death. It is widely regarded as one of the poets finest works; it is also the most popular.
Ghimire has named Gauri as one of his favourites, among his works. ',
'Madhav Prasad Ghimire', '19', 'new', 34, 65, 'upload_image/Gauri.jpg', 1945, now(), now()),
(10, 3, '9789937322690 ' , 'Aama ko Sapana', '‘Aamako Sapana’ (Mother’s Dream) is the collection of authors short poems that reflected the democratic ideologies. ',
'Gopal Prasad Rimal', '19', 'new',71, 110, 'upload_image/aamaKoSapana.jpg', 2070, now(), now()),
(11, 3, '0916360636 ' , 'ASTROLOGY  A COSMIC SCIENCE', 'This is a new approach to astrology that has for too long been neglected in astrological textbooks. 
This book combines the inner and outer aspects of astrology in a unique and inspirational manner.
The blueprint we call the horoscope deals with the personality, showing the tendencies and the habit
patterns brought into this lifetime from other lifetimes. Some are good, some destructive. There is nothing fatalistic about astrology.',
'Isabel M. Hickey', '1', 'new', 356, 3750, 'upload_image/CosmicScience.jpg', 2011, now(), now()),
(12, 3, '0553378384 ' , 'ASTROLOGY FOR THE SOUL', ' Gauri is an eponymous tragic epic written by Nepali National Poet Madhav Prasad Ghimire, in memory of his first wife,
following her premature death. It is widely regarded as one of the poets finest works; it is also the most popular.
Ghimire has named Gauri as one of his favourites, among his works. ',
'Jan Spiller', '1', 'new', 528, 1350, 'upload_image/for-the-Soul.jpg', 1997, now(), now()),
(13, 3, '0850303850' , 'THE TWELVE HOUSES', 'A guide to the twelve houses of the astrological chart. This text aims to help the reader discover how the heavens looked when 
they were born and to use the enclosed map to guide them to their true destiny. ',
'Howard Sasportas', '1', 'new', 400, 1655, 'upload_image/TheTwelveHouses.jpg', 1997, now(), now()),
(14, 3, '9780767908184 ' , 'A SHORT HISTORY OF NEARLY EVERYTHING', 'In Brysons biggest book, he confronts his greatest challenge: to understand—and, if possible, answer—the oldest, biggest questions 
we have posed about the universe and ourselves. Taking as territory everything from the Big Bang to the rise of civilization, Bryson 
seeks to understand how we got from there being nothing at all to there being us. To that end, he has attached himself to a host of the 
world’s most advanced (and often obsessed) archaeologists, anthropologists, and mathematicians, travelling to their offices, laboratories, 
and field camps. He has read (or tried to read) their books, pestered them with questions, apprenticed himself to their powerful minds.',
'Bill Bryson', '9', 'new', 544, 2665, 'upload_image/ShortHistoryofNearlyEverything.jpg', 2004, now(), now()),
(15, 3, '9780375508325 ' , 'COSMOS', 'Cosmos has 13 heavily illustrated chapters, corresponding to the 13 episodes of the Cosmos television series. In the book, Sagan explores 
15 billion years of cosmic evolution and the development of science and civilization. Cosmos traces the origins of knowledge and the scientific 
method, mixing science and philosophy, and speculates to the future of science. The book also discusses the underlying premises of science by 
providing biographical anecdotes about many prominent scientists throughout history, placing their contributions into the broader context of the
 development of modern science. 
','Carl Sagan', '9', 'new', 384, 4065, 'upload_image/Cosmos.jpg', 1980, now(), now()),
(16, 3, '0618249060' , 'SILENT SPRING', 'Rachel Carson’s Silent Spring was first published in three serialized excerpts in the New Yorker in June of 1962.
 The book appeared in September of that year and the outcry that followed its publication forced the banning of DDT 
and spurred revolutionary changes in the laws affecting our air, land, and water. Carson’s passionate concern for the 
future of our planet reverberated powerfully throughout the world, and her eloquent book was instrumental in launching 
the environmental movement. It is without question one of the landmark books of the twentieth century. 
','Rachel Carson,', '9', 'new', 387, 2065, 'upload_image/SilentSpring.jpg', 2002, now(), now()),
(17, 3, '978-9353065782 ' , 'INTRO TO JAVA PROGRAMMING', 'Daniel Liang teaches concepts of problem-solving and object-oriented programming using a fundamentals-first approach. 
Beginning programmers learn critical problem-solving techniques then move on to grasp the key concepts of object-oriented,
 GUI programming, advanced GUI and Web programming using Java.
This title is a Pearson Global Edition. The Editorial team at Pearson has worked closely with educators around the world to
 include content which is especially relevant to students outside the United States. 
','Y. Daniel Liang', '7', 'new', 1344, 1950, 'upload_image/java.jpg', 2018, now(), now()),
(18, 3, '978-9386052308 ' , 'CORE PYTHON PROGRAMMING', ' At present, Java occupies number 1 rank as the most used programming language since almost all the projects are developed
in Java. Python is already occupying 2nd to 4th position and will be the most demanded language after Java in near future. 
Python is used with other programming languages on Internet as well as for developing standalone applications. Python programmers 
are paid high salaries in the software development industry. Hence, it is time for beginners as well as existing programmers to focus 
their attention on Python.',
'R. Nageswara Rao', '7', 'new', 904, 650, 'upload_image/python.jpg', 2018, now(), now()),
(19, 3, '978-9351199076' , 'HTML 5 BLACK BOOK', ' HTML5 Black Book is the one-time reference book, written from the Web professional’s point of view, containing hundreds of examples and covering 
nearly every aspect of HTML5. It will help you to master various Web technologies, other than HTML5, including CSS3, JavaScript, XML and AJAX.
 If you are a Web designer or developer, then this book is your introduction to new features and elements of HTML5, including audio and video 
media elements, the canvas element for drawing, and many others.',
'DT Editorial Services', '7', 'new', 1230,1000, 'upload_image/html.jpg', 2016, now(), now()),
(20, 3, '978-9351199434' , 'CORE C', ' This book covers all concepts of C in an easy and simple language. The reader starts at the basic level and goes up to the higher
 levels as he/she gains knowledge of the concepts. This book also explains the logic behind each program, and thus instills logical
 thinking in the minds of the students. As this book contains hundreds of programs, it can be used by students of Indian universities t
o solve programs generally asked in their theory and lab examinations as part of the courses like B.C.A., B.Sc., M.Sc., M.C.A., B.E., B.Tech., M.Tech., etc.
','Dr. R. Nageswara Rao', '7', 'new', 560, 680, 'upload_image/c.jpg', 2016, now(), now()),
(21, 3, '9789937910422' , 'Abiram Baburam', 'This is biographic account of Baburam Bhattarai who was Prime Minister of Nepal. It begins from the crescendo of the political life of Dr. Bhattarai when he decided to dissociate himself quietly from the Maoist party last year..',
 'Anil Thapa', '12', 'new', 333, 350, 'upload_image/Baburam.jpg',2016, now(), now()), 
(22, 3, '9937905834' , 'Binod Chaudhary', 'The autobiography covers Chaudharys life from a student at a government school in Gana Bahal, playing and growing in the streets of Khichapokhari,
 running a discotheque, pursuing a hobby as a singer and a filmmaker, leading the Nepali business community, expanding beyond Nepal and reaching
 a place where any other Nepali is yet to reach.','Binod Chaudhary', '12', 'new', 252, 250, 'upload_image/binodCdy.jpg', 2018, now(), now()), 
 (23, 3, '9937921279' , 'Achyut Krishna Kharel', 'This book is an autobiography of Former IGP Achyut Krishna Kharel. 
This autobiography reveals how football led him to the police force and then to lead the entire police force. 
This book also reveals high profile cases like 33 kg gold smuggling, arrest of Former Police IGP DB Lama and former Prince Dhirendras 
ADC Colonel Bharat Gurung to the hit and run case of musician Pravin Gurung and many more. Kharel has also written about political
 intervention in promotion and posting of police officers. IGP Kharels story accounts a life of a policeman and also portrays the pitiful 
situation of the sports sector during his time. Unfortunately, both the situation remains indifferent after all these years.',
 'Achyut Krishna Kharel', '12', 'new', 408, 450, 'upload_image/krishnaK.jpg', 2018, now(), now()),
(24, 3, '993787407' , 'Rookmangud Katawal', 'This book is a story of former General of Nepalese Army. The book includes a sensational opening as 
45-page prologue and 11 other chapters that tell the stories of his childhood, student life and career in army, the Maoist conflict, the royal take over, 
and the events after the Maoists came to the peace process.',
'Rookmangud Katawal', '12', 'new', 255, 280, 'upload_image/rookmangud K.jpg', 2018, now(), now());


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

