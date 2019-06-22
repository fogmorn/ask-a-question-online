CREATE DATABASE `questions` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;

USE questions;

CREATE TABLE `category` (
    `id` TINYINT(2) UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `name` VARCHAR(35) NOT NULL,
    UNIQUE(name)
) ENGINE=InnoDB;


CREATE TABLE `user` (
    `id` TINYINT(2) UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `login` VARCHAR(25) NOT NULL,
    `email` VARCHAR(50) NOT NULL,
    UNIQUE(login)
) ENGINE=InnoDB;


CREATE TABLE `user_category` (
    `id` SMALLINT(4) UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `userid` TINYINT(2) UNSIGNED NOT NULL,
    `categoryid` TINYINT(2) UNSIGNED NOT NULL,
    
    INDEX(userid),
    INDEX(categoryid),
    UNIQUE(userid, categoryid),
    FOREIGN KEY (`userid`) REFERENCES user(id) ON DELETE RESTRICT,
    FOREIGN KEY (`categoryid`) REFERENCES category(id) ON DELETE RESTRICT
) ENGINE=InnoDB;


CREATE TABLE `question` (
    `id` SMALLINT(4) UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `userid` TINYINT(2) UNSIGNED,
    `categoryid` TINYINT(2) UNSIGNED NOT NULL,
    `question_text` TEXT NOT NULL,
    `question_date` DATE NOT NULL,
    `created` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `visible` TINYINT(1) UNSIGNED NOT NULL,
    `asker_name` VARCHAR(50) NOT NULL,
    `email` VARCHAR(50) NOT NULL,
    `groupname` VARCHAR(15),
    `answer_text` TEXT NOT NULL,
    
    INDEX(userid),
    INDEX(categoryid),
    FOREIGN KEY (`userid`) REFERENCES user(id) ON DELETE RESTRICT,
    FOREIGN KEY (`categoryid`) REFERENCES category(id) ON DELETE RESTRICT
) ENGINE=InnoDB;


INSERT INTO category (name) VALUES ('Учебный процесс'),('Приемная комиссия'),('Дополнительное образование'),('Общие вопросы');

GRANT SELECT,INSERT,UPDATE,DELETE,CREATE TEMPORARY TABLES ON questions.* TO answerer@localhost IDENTIFIED BY 'xxxxxxxxxx';
