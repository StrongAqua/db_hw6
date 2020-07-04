CREATE DATABASE  IF NOT EXISTS `vk_new` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `vk_new`;
-- MySQL dump 10.13  Distrib 8.0.20, for macos10.15 (x86_64)
--
-- Host: localhost    Database: vk_new
-- ------------------------------------------------------
-- Server version	8.0.20

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `likes_photo`
--

DROP TABLE IF EXISTS `likes_photo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `likes_photo` (
  `user_id` int unsigned NOT NULL,
  `photo_id` int unsigned NOT NULL,
  PRIMARY KEY (`user_id`,`photo_id`),
  UNIQUE KEY `uq_likes_photo_user_id_photo_id_idx` (`user_id`,`photo_id`),
  KEY `fk_likes_photo_photo_id_idx` (`photo_id`),
  KEY `fk_likes_photo_user_id_idx` (`user_id`),
  CONSTRAINT `fk_likes_photo_photo_id` FOREIGN KEY (`photo_id`) REFERENCES `photo` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_likes_photo_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `likes_photo`
--

LOCK TABLES `likes_photo` WRITE;
/*!40000 ALTER TABLE `likes_photo` DISABLE KEYS */;
INSERT INTO `likes_photo` VALUES (4,1),(1,2),(2,3),(3,4);
/*!40000 ALTER TABLE `likes_photo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `likes_photo_comment`
--

DROP TABLE IF EXISTS `likes_photo_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `likes_photo_comment` (
  `user_id` int unsigned NOT NULL,
  `photo_comments_id` int unsigned NOT NULL,
  PRIMARY KEY (`user_id`,`photo_comments_id`),
  UNIQUE KEY `uq_likes_photo_comments_user_id_photo_comments_id_idx` (`user_id`,`photo_comments_id`),
  KEY `fk_likes_photo_comment_photo_comment_id_idx` (`photo_comments_id`),
  KEY `fk_likes_photo_comment_user_id_idx` (`user_id`),
  CONSTRAINT `fk_likes_photo_comment_photo_comment_id` FOREIGN KEY (`photo_comments_id`) REFERENCES `photo_comments` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_likes_photo_comment_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `likes_photo_comment`
--

LOCK TABLES `likes_photo_comment` WRITE;
/*!40000 ALTER TABLE `likes_photo_comment` DISABLE KEYS */;
INSERT INTO `likes_photo_comment` VALUES (1,1),(2,2),(1,3);
/*!40000 ALTER TABLE `likes_photo_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `likes_user`
--

DROP TABLE IF EXISTS `likes_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `likes_user` (
  `user_id_1` int unsigned NOT NULL,
  `user_id_2` int unsigned NOT NULL,
  PRIMARY KEY (`user_id_1`,`user_id_2`),
  UNIQUE KEY `uq_likes_user_user_id_1_2` (`user_id_1`,`user_id_2`),
  KEY `fk_likes_user_user_id_1_idx` (`user_id_1`),
  KEY `fk_likes_user_user_id_2_idx` (`user_id_2`),
  CONSTRAINT `fk_likes_user_user_id_1` FOREIGN KEY (`user_id_1`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_likes_user_user_id_2` FOREIGN KEY (`user_id_2`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `likes_user`
--

LOCK TABLES `likes_user` WRITE;
/*!40000 ALTER TABLE `likes_user` DISABLE KEYS */;
INSERT INTO `likes_user` VALUES (1,3),(1,4),(2,1),(3,2),(3,4),(4,2);
/*!40000 ALTER TABLE `likes_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `photo`
--

DROP TABLE IF EXISTS `photo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `photo` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int unsigned NOT NULL,
  `url` varchar(256) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `fk_photo_user_id_idx` (`user_id`),
  CONSTRAINT `fk_photo_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `photo`
--

LOCK TABLES `photo` WRITE;
/*!40000 ALTER TABLE `photo` DISABLE KEYS */;
INSERT INTO `photo` VALUES (1,1,'/jhfjhgfjhf.jpg'),(2,3,'/hftyfhgfh.jpg'),(3,4,'/asdfghjk.jpg'),(4,4,'/zxcvbn.jpg');
/*!40000 ALTER TABLE `photo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `photo_comments`
--

DROP TABLE IF EXISTS `photo_comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `photo_comments` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int unsigned NOT NULL,
  `photo_id` int unsigned NOT NULL,
  `comment` text NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `fk_photo_comments_user_id_idx` (`user_id`),
  KEY `fk_photo_comments_photo_id_idx` (`photo_id`),
  CONSTRAINT `fk_photo_comments_photo_id` FOREIGN KEY (`photo_id`) REFERENCES `photo` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_photo_comments_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `photo_comments`
--

LOCK TABLES `photo_comments` WRITE;
/*!40000 ALTER TABLE `photo_comments` DISABLE KEYS */;
INSERT INTO `photo_comments` VALUES (1,1,3,'cool'),(2,4,2,'cool'),(3,4,3,'cool'),(4,2,1,'cool');
/*!40000 ALTER TABLE `photo_comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Alex'),(4,'John'),(2,'Margo'),(3,'Tom');
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

-- Dump completed on 2020-07-04 17:15:20
