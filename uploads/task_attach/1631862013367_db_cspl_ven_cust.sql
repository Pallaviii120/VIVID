-- MySQL dump 10.13  Distrib 8.0.24, for Win64 (x86_64)
--
-- Host: localhost    Database: db_cspl_ven_cust
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
-- Table structure for table `customer_tbl`
--

DROP TABLE IF EXISTS `customer_tbl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer_tbl` (
  `id` int NOT NULL AUTO_INCREMENT,
  `customer_name` varchar(100) DEFAULT NULL,
  `customer_email` varchar(100) DEFAULT NULL,
  `date_of_decl` varchar(45) DEFAULT NULL,
  `pan_number` varchar(20) DEFAULT NULL,
  `tan_number` varchar(30) DEFAULT NULL,
  `no_of_buyer` varchar(20) DEFAULT NULL,
  `nat_of_supplier` varchar(20) DEFAULT NULL,
  `cust_roi` varchar(10) DEFAULT NULL,
  `ach_no_fy_18_19` varchar(20) DEFAULT NULL,
  `date_of_roi_fy_18_19` varchar(20) DEFAULT NULL,
  `ach_no_fy_19_20` varchar(20) DEFAULT NULL,
  `date_of_roi_fy_19_20` varchar(20) DEFAULT NULL,
  `tds_tcs` varchar(20) DEFAULT NULL,
  `incom_tax_act` varchar(20) DEFAULT NULL,
  `indi_buyer` varchar(20) DEFAULT NULL,
  `pan_linked_adhar` varchar(20) DEFAULT NULL,
  `pan_adhar_link` varchar(20) DEFAULT NULL,
  `name_declar` varchar(100) DEFAULT NULL,
  `dsig_of_person` varchar(100) DEFAULT NULL,
  `term_condotion` varchar(20) DEFAULT NULL,
  `created_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_date` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_tbl`
--

LOCK TABLES `customer_tbl` WRITE;
/*!40000 ALTER TABLE `customer_tbl` DISABLE KEYS */;
INSERT INTO `customer_tbl` VALUES (1,'sdfvg','RTGTHR@GM.JG','2021-06-18','dfdvdwferg','dfvf',NULL,'Scrap sale','No','','','','','No','Yes','No','No','No','dfv','fev','agree','2021-06-18 12:59:36',NULL);
/*!40000 ALTER TABLE `customer_tbl` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vendor_tbl`
--

DROP TABLE IF EXISTS `vendor_tbl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vendor_tbl` (
  `id` int NOT NULL AUTO_INCREMENT,
  `vendor_name` varchar(100) DEFAULT NULL,
  `vendor_email` varchar(100) DEFAULT NULL,
  `date_of_decl` varchar(45) DEFAULT NULL,
  `pan_number` varchar(20) DEFAULT NULL,
  `tan_number` varchar(30) DEFAULT NULL,
  `no_of_vendor` varchar(20) DEFAULT NULL,
  `nat_of_supplier` varchar(20) DEFAULT NULL,
  `vend_roi` varchar(10) DEFAULT NULL,
  `ach_no_fy_18_19` varchar(20) DEFAULT NULL,
  `date_of_roi_fy_18_19` varchar(20) DEFAULT NULL,
  `ach_no_fy_19_20` varchar(20) DEFAULT NULL,
  `date_of_roi_fy_19_20` varchar(20) DEFAULT NULL,
  `tds_tcs` varchar(20) DEFAULT NULL,
  `indi_vendor` varchar(20) DEFAULT NULL,
  `pan_linked_adhar` varchar(20) DEFAULT NULL,
  `pan_adhar_link` varchar(20) DEFAULT NULL,
  `name_declar` varchar(100) DEFAULT NULL,
  `dsig_of_person` varchar(100) DEFAULT NULL,
  `term_condotion` varchar(20) DEFAULT NULL,
  `created_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_date` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vendor_tbl`
--

LOCK TABLES `vendor_tbl` WRITE;
/*!40000 ALTER TABLE `vendor_tbl` DISABLE KEYS */;
INSERT INTO `vendor_tbl` VALUES (1,'qswd','dewfr@ef','2021-06-22','2321424324','TAndvfkk',NULL,'Goods','No','','','','','Yes','No','No','No','MANISH','dsvc','agree','2021-06-22 13:30:14',NULL);
/*!40000 ALTER TABLE `vendor_tbl` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'db_cspl_ven_cust'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-09-04 13:13:35
