/* ------- Create Database Schema ------- */

CREATE DATABASE IF NOT EXISTS `akdys` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `akdys`;

/* ------- Create userType table ------- */

DROP TABLE IF EXISTS `userType`;
CREATE TABLE `userType` (
  `typeId` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(45) CHARACTER SET utf8 COLLATE utf8_turkish_ci DEFAULT NULL,
  `type` varchar(10) CHARACTER SET utf8 COLLATE utf8_turkish_ci DEFAULT NULL,
  PRIMARY KEY (`typeId`),
  UNIQUE KEY `id_UNIQUE` (`typeId`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

/* ------- Create userType table ------- */

/* ------- ------- ------- ------- ------- ------- */

/* ------- Added prepared user type data ------- */

LOCK TABLES `userType` WRITE;

INSERT INTO `usertype` VALUES 
(1,'Author','Author'),
(2,'Editor','Editor'),
(3,'Referee','Referee');

UNLOCK TABLES;

/* ------- Added prepared user type data ------- */

/* ------- ------- ------- ------- ------- ------- */

/* ------- Create user table ------- */

DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `userId` int(11) NOT NULL AUTO_INCREMENT,
  `firstName` varchar(10) CHARACTER SET utf8 COLLATE utf8_turkish_ci NOT NULL,
  `lastName` varchar(10) CHARACTER SET utf8 COLLATE utf8_turkish_ci DEFAULT NULL,
  `username` varchar(20) CHARACTER SET utf8 COLLATE utf8_turkish_ci NOT NULL,
  `password` varchar(20) CHARACTER SET utf8 COLLATE utf8_turkish_ci NOT NULL,
  `gender` varchar(6) CHARACTER SET utf8 COLLATE utf8_turkish_ci DEFAULT 'NA',
  `location` varchar(45) COLLATE utf8_turkish_ci DEFAULT NULL,
  `userType` int(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`userId`),
  UNIQUE KEY `userName_UNIQUE` (`username`),
  KEY `type` (`userType`),
  CONSTRAINT `user_ibfk_1` FOREIGN KEY (`userType`) REFERENCES `userType` (`typeid`)
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

/* ------- Create user table ------- */

/* ------- ------- ------- ------- ------- ------- */

/* ------- Added prepared user data ------- */

LOCK TABLES `user` WRITE;

INSERT INTO `user` VALUES 
(1,'Ömer Faruk','Genç','omerfarukgenc34','yazar','Erkek','İstanbul',1),
(2,'Faruk','Genç','farukgenc34','editor','Erkek','Ankara',2),
(3,'Ömer','Genç','genc34','hakem','Erkek','Elazığ',3);

UNLOCK TABLES;

/* ------- Added prepared user data ------- */

/* ------- ------- ------- ------- ------- ------- */

/* ------- Create Article Table ------- */

DROP TABLE IF EXISTS `article`;
CREATE TABLE `article` (
  `articleId` int(11) NOT NULL AUTO_INCREMENT,
  `articleStatus` int(11) DEFAULT NULL,
  `title` varchar(60) COLLATE utf8_turkish_ci DEFAULT NULL,
  `subject` text COLLATE utf8_turkish_ci,
  `keywords` varchar(100) COLLATE utf8_turkish_ci DEFAULT NULL,
  `languange` varchar(10) COLLATE utf8_turkish_ci DEFAULT NULL,
  `copyright` varchar(10) COLLATE utf8_turkish_ci DEFAULT NULL,
  `filePath` varchar(100) COLLATE utf8_turkish_ci DEFAULT NULL,
  `journalName` varchar(200) COLLATE utf8_turkish_ci DEFAULT NULL,
  `authorName` varchar(45) COLLATE utf8_turkish_ci DEFAULT NULL,
  `editorName` varchar(45) COLLATE utf8_turkish_ci DEFAULT NULL,
  `refereeName` varchar(45) COLLATE utf8_turkish_ci DEFAULT NULL,
  `rejectText` varchar(250) COLLATE utf8_turkish_ci DEFAULT NULL,
  PRIMARY KEY (`articleId`)
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

/* ------- ------- ------- ------- ------- ------- */

/* ------- Create Article Table ------- */