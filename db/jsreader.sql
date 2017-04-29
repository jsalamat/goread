-- MySQL dump 10.13  Distrib 5.7.12, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: read_db
-- ------------------------------------------------------
-- Server version	5.7.15-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `books`
--

DROP TABLE IF EXISTS `books`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `books` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `author` varchar(80) NOT NULL,
  `genre` varchar(100) DEFAULT NULL,
  `isbn` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `books`
--

LOCK TABLES `books` WRITE;
/*!40000 ALTER TABLE `books` DISABLE KEYS */;
INSERT INTO `books` VALUES (1,'My Life as a Gamer','Janet Tashjian','Childrens','978-0-8050-9851-8'),(2,'Middle School the Worst year of my life','James Paterson','Childrens','978-0-316-10169-1'),(3,'Babe Ruth','Matt Christopher','Biography','0-316-01113-4'),(4,'Goosebumps Most Wanted',' R.L. Stine','Childrens','978-0-545-62776-4'),(5,'Who was Albert Einstein','Jess Brallier','Biography','0-448-42496-7'),(6,'Goosebumps Night of the Living Dummy','R.L. Stine','Childrens','978-0-545-03517-0'),(7,'Alvin Ho','Lenore Look','Childrens','978-0-385-38600-5'),(8,'Captaion Unserpants and the big, bad battle of the bionic booger boy','Dav Pilkey','Childrens','0-439-37610-6'),(9,'NO Talking','Andrew Clements','Childrens','978-1-4169-0984-2'),(10,'Amulet, Escape from Lucien','Kazu Kibuishi','Childrens','978-0-545-43315-0'),(11,'Amulet, Firelight','Kazu Kibuishi','Childrens','978-0-545-43316-7'),(12,'Wayne Gretzky','Matt Doeden','Biography','978-0-7607-9170-7');
/*!40000 ALTER TABLE `books` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `class_students`
--

DROP TABLE IF EXISTS `class_students`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `class_students` (
  `class_id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  PRIMARY KEY (`class_id`,`student_id`),
  KEY `student_id` (`student_id`),
  CONSTRAINT `class_students_ibfk_1` FOREIGN KEY (`class_id`) REFERENCES `classes` (`id`),
  CONSTRAINT `class_students_ibfk_2` FOREIGN KEY (`student_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `class_students`
--

LOCK TABLES `class_students` WRITE;
/*!40000 ALTER TABLE `class_students` DISABLE KEYS */;
/*!40000 ALTER TABLE `class_students` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `classes`
--

DROP TABLE IF EXISTS `classes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `classes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `teacher_id` int(11) NOT NULL,
  `grade` varchar(2) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `teacher_id` (`teacher_id`),
  CONSTRAINT `classes_ibfk_1` FOREIGN KEY (`teacher_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `classes`
--

LOCK TABLES `classes` WRITE;
/*!40000 ALTER TABLE `classes` DISABLE KEYS */;
/*!40000 ALTER TABLE `classes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `logs`
--

DROP TABLE IF EXISTS `logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `logs` (
  `user_id` int(11) NOT NULL,
  `book_id` int(11) NOT NULL,
  `created` date NOT NULL,
  `time_lapsed` decimal(6,2) DEFAULT NULL,
  PRIMARY KEY (`user_id`,`book_id`,`created`),
  KEY `book_id` (`book_id`),
  CONSTRAINT `logs_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `logs_ibfk_2` FOREIGN KEY (`book_id`) REFERENCES `books` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `logs`
--

LOCK TABLES `logs` WRITE;
/*!40000 ALTER TABLE `logs` DISABLE KEYS */;
INSERT INTO `logs` VALUES (5,1,'2017-01-12',1.20),(5,1,'2017-01-13',0.50),(5,1,'2017-01-14',0.20),(5,1,'2017-01-15',0.75),(5,2,'2017-02-01',0.50),(5,2,'2017-02-03',1.00),(5,3,'2017-04-27',6.00);
/*!40000 ALTER TABLE `logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `parent_students`
--

DROP TABLE IF EXISTS `parent_students`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `parent_students` (
  `parent_id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  PRIMARY KEY (`parent_id`,`student_id`),
  KEY `student_id` (`student_id`),
  CONSTRAINT `parent_students_ibfk_1` FOREIGN KEY (`parent_id`) REFERENCES `users` (`id`),
  CONSTRAINT `parent_students_ibfk_2` FOREIGN KEY (`student_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `parent_students`
--

LOCK TABLES `parent_students` WRITE;
/*!40000 ALTER TABLE `parent_students` DISABLE KEYS */;
INSERT INTO `parent_students` VALUES (1,2),(1,3),(1,4),(1,5);
/*!40000 ALTER TABLE `parent_students` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_books`
--

DROP TABLE IF EXISTS `user_books`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_books` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `book_id` int(11) NOT NULL,
  `started` date DEFAULT NULL,
  `current_page` int(11) DEFAULT NULL,
  `completed` date DEFAULT NULL,
  PRIMARY KEY (`id`,`book_id`),
  KEY `user_id` (`user_id`),
  KEY `book_id` (`book_id`),
  CONSTRAINT `user_books_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `user_books_ibfk_2` FOREIGN KEY (`book_id`) REFERENCES `books` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_books`
--

LOCK TABLES `user_books` WRITE;
/*!40000 ALTER TABLE `user_books` DISABLE KEYS */;
INSERT INTO `user_books` VALUES (1,5,1,NULL,NULL,NULL),(2,5,2,NULL,NULL,NULL),(3,5,3,NULL,NULL,NULL),(4,5,4,NULL,NULL,NULL),(5,5,5,NULL,NULL,NULL),(6,3,3,NULL,NULL,NULL),(7,3,5,NULL,NULL,NULL),(8,2,8,NULL,NULL,NULL),(9,2,12,NULL,NULL,NULL);
/*!40000 ALTER TABLE `user_books` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password_hash` varchar(255) NOT NULL,
  `usertype` varchar(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'wahlers1','wahlers1@gmail.com','$2a$10$VQGmVXQZgdWnUJGHwSseI.f1kqkp29LOoWzjAJuV2GRMmdv606KdO','R'),(2,'reader1','reader1@read.com','$2a$10$cPd9JlJearYUXU0BlWyPCum7Xeh1.6XGA0VKga4TbyUFNkUPzdj/O','R'),(3,'reader2','reader2@read.com','$2a$10$Dyd9.qInmSGlCO1p1QN3tOg0e5CvFsPVsJQQ.LTD2zmDC.5vddZ1C','R'),(4,'reader3','reader3@read.com','$2a$10$rVfX/4Ly0liFUhjoGh4.5.GjR5OQTR7QsteRvE.ZgEP5WSPEPY/zK','R'),(5,'reader4','reader4@read.com','$2a$10$dWuSSVymriNg9X/v1NMo5eQDahqjSo9QHrorbBFp6wGVJZGI8b8.u','R'),(6,'reader5','reader5@read.com','$2a$10$lFD/n4fCCgPZvhUQ2c84MOkPhFihPDGKHKJilJRbYm29DVZy2EauO','R'),(7,'parent1','parent1@parent1.com','$2a$10$KNw3L.qb0oZ44CSFfiuE9e00APViuwJfR9Jd2REYtMgSwoPwtNVk.','P'),(8,'kid1','kid1@kid.com','$2a$10$4FdSoA..hrtxzcMezWcPtOHlTE4NAxDqvsQ7scrFOuuK/zZDs5pG.','R');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-04-28 23:39:49
