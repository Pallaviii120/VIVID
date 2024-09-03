-- MySQL dump 10.13  Distrib 8.0.24, for Win64 (x86_64)
--
-- Host: localhost    Database: db_hk
-- ------------------------------------------------------
-- Server version	8.0.24

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `contactus`
--

DROP TABLE IF EXISTS `contactus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contactus` (
  `id` int NOT NULL AUTO_INCREMENT,
  `phoneno` varchar(55) DEFAULT NULL,
  `emailid` varchar(100) DEFAULT NULL,
  `subject` varchar(200) DEFAULT NULL,
  `mailbody` varchar(20) DEFAULT NULL,
  `type` varchar(100) DEFAULT NULL,
  `status` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contactus`
--

LOCK TABLES `contactus` WRITE;
/*!40000 ALTER TABLE `contactus` DISABLE KEYS */;
/*!40000 ALTER TABLE `contactus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gallery`
--

DROP TABLE IF EXISTS `gallery`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gallery` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title_social` varchar(100) DEFAULT NULL,
  `ogi_name` varchar(1000) DEFAULT NULL COMMENT 'path',
  `new_name` varchar(1000) DEFAULT NULL,
  `path` varchar(50) DEFAULT NULL,
  `desc_social` varchar(50) DEFAULT NULL,
  `type` varchar(20) DEFAULT 'G',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gallery`
--

LOCK TABLES `gallery` WRITE;
/*!40000 ALTER TABLE `gallery` DISABLE KEYS */;
INSERT INTO `gallery` VALUES (40,'file 1','1.jpg','1609540217994-1.jpg','/collection','this is file 1 1','G'),(41,'file 2','2.jpg','1609540251320-2.jpg','/collection','2nd file \r\n','G'),(42,'3rd file ','3.jpg','1609540282999-3.jpg','/collection','csvdg nb','G'),(43,'fil 4 ','4.jpg','1609541082755-4.jpg','/collection','sdc','G'),(44,'File 6','12.jpeg','1609569071268-12.jpeg','/collection','file 545','G');
/*!40000 ALTER TABLE `gallery` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_emp`
--

DROP TABLE IF EXISTS `tbl_emp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_emp` (
  `n_emp_auto_id` int NOT NULL AUTO_INCREMENT,
  `s_emp_name` varchar(55) DEFAULT NULL,
  `s_emp_id` varchar(100) DEFAULT NULL,
  `s_designation` varchar(200) DEFAULT NULL,
  `s_office` varchar(20) DEFAULT NULL,
  `s_dept_name` varchar(100) DEFAULT NULL,
  `s_company` varchar(100) DEFAULT NULL,
  `s_location` varchar(55) DEFAULT NULL,
  `n_mobile_no` varchar(55) DEFAULT NULL,
  `s_email_id` varchar(55) DEFAULT NULL,
  `s_pass` varchar(55) DEFAULT NULL,
  `n_isadmin` int DEFAULT '2',
  `n_status` int DEFAULT '1',
  `role` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`n_emp_auto_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_emp`
--

LOCK TABLES `tbl_emp` WRITE;
/*!40000 ALTER TABLE `tbl_emp` DISABLE KEYS */;
INSERT INTO `tbl_emp` VALUES (1,'suadmin','su12',NULL,NULL,NULL,NULL,NULL,NULL,'suadmin@gmail.com','123',2,1,'SUADMIN'),(2,'AAK',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'aak@gmail.com','aak',1,1,'SUADMIN');
/*!40000 ALTER TABLE `tbl_emp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'db_hk'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-09-04 13:13:26
