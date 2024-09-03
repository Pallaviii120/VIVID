-- MySQL dump 10.13  Distrib 8.0.24, for Win64 (x86_64)
--
-- Host: localhost    Database: db_cl
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
-- Table structure for table `tbl_cl_comp_trans_data`
--

DROP TABLE IF EXISTS `tbl_cl_comp_trans_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_cl_comp_trans_data` (
  `n_comp_trans_data_id` int NOT NULL AUTO_INCREMENT,
  `n_comp_trans_id` int DEFAULT NULL,
  `n_yes_no` varchar(20) DEFAULT 'No',
  `s_remark` longtext,
  `s_corrective_action` longtext,
  `n_seq` int DEFAULT NULL,
  PRIMARY KEY (`n_comp_trans_data_id`)
) ENGINE=InnoDB AUTO_INCREMENT=78 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_cl_comp_trans_data`
--

LOCK TABLES `tbl_cl_comp_trans_data` WRITE;
/*!40000 ALTER TABLE `tbl_cl_comp_trans_data` DISABLE KEYS */;
INSERT INTO `tbl_cl_comp_trans_data` VALUES (1,1,'No','e 2015, using the var keyword was the only way to declare a JavaScript variable.\r\n\r\nThe 2015 version of JavaScript (ES6) allows the use of the const keyword to define a variable that cannot be reassigned, and the let keyword to define a variable with restricted scope','5e 2015, using the var keyword was the only way to declare a JavaScript variable.\r\n\r\nThe 2015 version of JavaScript (ES6) allows the use of the const keyword to define a variable that cannot be reassigned, and the let keyword to define a variable with restricted scope',1),(2,1,'No','12e 2015, using the var keyword was the only way to declare a JavaScript variable.\r\n\r\nThe 2015 version of JavaScript (ES6) allows the use of the const keyword to define a variable that cannot be reassigned, and the let keyword to define a variable with restricted scope','e 2015, using the var keyword was the only way to declare a JavaScript variable.\r\n\r\nThe 2015 version of JavaScript (ES6) allows the use of the const keyword to define a variable that cannot be reassigned, and the let keyword to define a variable with restricted scope',2),(3,1,'No','e 2015, using the var keyword was the only way to declare a JavaScript variable.\r\n\r\nThe 2015 version of JavaScript (ES6) allows the use of the const keyword to define a variable that cannot be reassigned, and the let keyword to define a variable with restricted scope','e 2015, using the var keyword was the only way to declare a JavaScript variable.\r\n\r\nThe 2015 version of JavaScript (ES6) allows the use of the const keyword to define a variable that cannot be reassigned, and the let keyword to define a variable with restricted scope',3),(4,1,'No','e 2015, using the var keyword was the only way to declare a JavaScript variable.\r\n\r\nThe 2015 version of JavaScript (ES6) allows the use of the const keyword to define a variable that cannot be reassigned, and the let keyword to define a variable with restricted scope','e 2015, using the var keyword was the only way to declare a JavaScript variable.\r\n\r\nThe 2015 version of JavaScript (ES6) allows the use of the const keyword to define a variable that cannot be reassigned, and the let keyword to define a variable with restricted scope',4),(5,1,'No','e 2015, using the var keyword was the only way to declare a JavaScript variable.\r\n\r\nThe 2015 version of JavaScript (ES6) allows the use of the const keyword to define a variable that cannot be reassigned, and the let keyword to define a variable with restricted scope','e 2015, using the var keyword was the only way to declare a JavaScript variable.\r\n\r\nThe 2015 version of JavaScript (ES6) allows the use of the const keyword to define a variable that cannot be reassigned, and the let keyword to define a variable with restricted scope',5),(6,1,'No','e 2015, using the var keyword was the only way to declare a e 2015, using the var keyword was the only way to declare a JavaScript variable.\r\n\r\nThe 2015 version of JavaScript (ES6) allows the use of the const keyword to define a variable that cannot be reassigned, and the let keyword to define a variable with restricted scopeJavaScript variable.\r\n\r\nThe 2015 version of JavaScript (ES6) allows the use of the const keyword to define a variable that cannot be reassigned, and the let keyword to define a variable with restricted scope','e 2015, using the var keyword was the only way to declare a JavaScript variable.\r\n\r\nThe 2015 version of JavaScript (ES6) allows the use of the const keyword to define a variable that cannot be reassigned, and the let keyword to define a variable with restricted scope',6),(7,1,'No','e 2015, using the var keyword was the only way to declare a JavaScript variable.\r\n\r\nThe 2015 version of JavaScript (ES6) allows the use of the const keyword to define a variable that cannot be reassigned, and the let keyword to define a variable with restricted scope','e 2015, using the var keyword was the only way to declare a JavaScript variable.\r\n\r\nThe 2015 version of JavaScript (ES6) allows the use of the const keyword to define a variable that cannot be reassigned, and the let keyword to define a variable with restricted scopee 2015, using the var keyword was the only way to declare a JavaScript variable.\r\n\r\nThe 2015 version of JavaScript (ES6) allows the use of the const keyword to define a variable that cannot be reassigned, and the let keyword to define a variable with restricted scope',7),(8,2,'No',NULL,NULL,1),(9,2,'No',NULL,NULL,2),(10,2,'No',NULL,NULL,3),(11,2,'No',NULL,NULL,4),(12,2,'No',NULL,NULL,5),(13,2,'No',NULL,NULL,6),(14,2,'No',NULL,NULL,7),(15,3,'No',NULL,NULL,1),(16,3,'No',NULL,NULL,2),(17,3,'No',NULL,NULL,3),(18,3,'No',NULL,NULL,4),(19,3,'No',NULL,NULL,5),(20,3,'No',NULL,NULL,6),(21,3,'No',NULL,NULL,7),(22,4,'No',NULL,NULL,1),(23,4,'No',NULL,NULL,2),(24,4,'No',NULL,NULL,3),(25,4,'No',NULL,NULL,4),(26,4,'No',NULL,NULL,5),(27,4,'No',NULL,NULL,6),(28,4,'No',NULL,NULL,7),(29,5,'No','1',NULL,1),(30,5,'No',NULL,NULL,2),(31,5,'No',NULL,NULL,3),(32,5,'No',NULL,NULL,4),(33,5,'No',NULL,NULL,5),(34,5,'No',NULL,NULL,6),(35,5,'No',NULL,NULL,7),(36,6,'No',NULL,NULL,1),(37,6,'No',NULL,NULL,2),(38,6,'No',NULL,NULL,3),(39,6,'No',NULL,NULL,4),(40,6,'No',NULL,NULL,5),(41,6,'No',NULL,NULL,6),(42,6,'No',NULL,NULL,7),(43,7,'No',NULL,NULL,1),(44,7,'No',NULL,NULL,2),(45,7,'No',NULL,NULL,3),(46,7,'No',NULL,NULL,4),(47,7,'No',NULL,NULL,5),(48,7,'No',NULL,NULL,6),(49,7,'No',NULL,NULL,7),(50,8,'No','q',NULL,1),(51,8,'No',NULL,NULL,2),(52,8,'No',NULL,NULL,3),(53,8,'No',NULL,NULL,4),(54,8,'No',NULL,NULL,5),(55,8,'No',NULL,NULL,6),(56,8,'No',NULL,NULL,7),(57,9,'No',NULL,NULL,1),(58,9,'No',NULL,NULL,2),(59,9,'No',NULL,NULL,3),(60,9,'No',NULL,NULL,4),(61,9,'No',NULL,NULL,5),(62,9,'No',NULL,NULL,6),(63,9,'No',NULL,NULL,7),(64,10,'No',NULL,NULL,1),(65,10,'No',NULL,NULL,2),(66,10,'No',NULL,NULL,3),(67,10,'No',NULL,NULL,4),(68,10,'No',NULL,NULL,5),(69,10,'No',NULL,NULL,6),(70,10,'No',NULL,NULL,7),(71,11,'No',NULL,NULL,1),(72,11,'No',NULL,NULL,2),(73,11,'No',NULL,NULL,3),(74,11,'No',NULL,NULL,4),(75,11,'No',NULL,NULL,5),(76,11,'No',NULL,NULL,6),(77,11,'No',NULL,NULL,7);
/*!40000 ALTER TABLE `tbl_cl_comp_trans_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_cl_compliance_trans`
--

DROP TABLE IF EXISTS `tbl_cl_compliance_trans`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_cl_compliance_trans` (
  `n_comp_trans_id` int NOT NULL AUTO_INCREMENT,
  `n_updation_frm_id` int DEFAULT NULL,
  `d_current_date` varchar(65) DEFAULT NULL,
  PRIMARY KEY (`n_comp_trans_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_cl_compliance_trans`
--

LOCK TABLES `tbl_cl_compliance_trans` WRITE;
/*!40000 ALTER TABLE `tbl_cl_compliance_trans` DISABLE KEYS */;
INSERT INTO `tbl_cl_compliance_trans` VALUES (1,1,'2021-05-13'),(2,2,'2021-05-12'),(3,3,'2021-05-11'),(4,4,'2021-04-13'),(5,5,'2021-04-12'),(6,6,'2021-04-10'),(7,7,'2021-05-14'),(8,8,'2021-05-14'),(9,9,'2021-05-14'),(10,10,'2021-05-14'),(11,11,'2021-05-14');
/*!40000 ALTER TABLE `tbl_cl_compliance_trans` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tbl_cl_compliance_trans_AFTER_INSERT` AFTER INSERT ON `tbl_cl_compliance_trans` FOR EACH ROW BEGIN

insert into tbl_cl_comp_trans_data(n_comp_trans_id,n_seq)
values   
(new.n_comp_trans_id,1), -- 1 More than 10 days continuous working
(new.n_comp_trans_id,2), -- 2 More than 60 hours in a week
(new.n_comp_trans_id,3), -- 3 More than 50/75/115 hours in a quarter
(new.n_comp_trans_id,4), -- 4 More than 12 Hours working in a day
(new.n_comp_trans_id,5), -- 5 Number of new CLs joined
(new.n_comp_trans_id,6), -- 6 ESIC Registration done for all new CL
(new.n_comp_trans_id,7); -- 7 PF Registration Done for all new CL

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `tbl_cl_contractor`
--

DROP TABLE IF EXISTS `tbl_cl_contractor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_cl_contractor` (
  `n_contractor_id` int NOT NULL AUTO_INCREMENT,
  `s_contractor_name` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`n_contractor_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_cl_contractor`
--

LOCK TABLES `tbl_cl_contractor` WRITE;
/*!40000 ALTER TABLE `tbl_cl_contractor` DISABLE KEYS */;
INSERT INTO `tbl_cl_contractor` VALUES (1,'Vinod labour Suppliers'),(2,'Fortune Enterprises'),(3,'G4S'),(4,'NTTF');
/*!40000 ALTER TABLE `tbl_cl_contractor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_cl_department`
--

DROP TABLE IF EXISTS `tbl_cl_department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_cl_department` (
  `n_dept_id` int NOT NULL AUTO_INCREMENT,
  `s_dept_name` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`n_dept_id`)
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_cl_department`
--

LOCK TABLES `tbl_cl_department` WRITE;
/*!40000 ALTER TABLE `tbl_cl_department` DISABLE KEYS */;
INSERT INTO `tbl_cl_department` VALUES (1,'Account'),(2,'Accounts'),(3,'Admin'),(4,'Administration'),(5,'Admin / OHC'),(6,'Blown film'),(7,'Auto Capping'),(8,'Auto Packer'),(9,'C&I'),(10,'Core Cutting'),(11,'Decoration'),(12,'Engineering'),(13,'FG'),(14,'Electrical'),(15,'Despatch'),(16,'Graphics'),(17,'Garden'),(18,'Forklift'),(19,'HR/Admin'),(20,'HSL'),(21,'HK'),(22,'Heading'),(23,'HK Colony'),(24,'HK Plant'),(25,'Laminator'),(26,'LSL'),(27,'Mini/Pharma'),(28,'Moulding'),(29,'Mini/Moulding/Printing/RM/Graphics & Major'),(30,'Manual Capping'),(31,'Printing'),(32,'QA'),(33,'RM'),(34,'Quality'),(35,'Operater'),(36,'Office Boy'),(37,'RM/Fg Staff'),(38,'SCM'),(39,'Stores/Dispatch/Printing/Accounts/Engineering/Tubeline/HR'),(40,'Stores'),(41,'Slitting'),(42,'Security'),(43,'Sleeving'),(44,'S.T.P.'),(45,'Store'),(46,'Scrap Yard'),(48,'SAP'),(49,'Tubeline'),(50,'Supply Chain'),(51,'Utility'),(52,'Tool Room'),(53,'Training');
/*!40000 ALTER TABLE `tbl_cl_department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_cl_employee`
--

DROP TABLE IF EXISTS `tbl_cl_employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_cl_employee` (
  `n_emp_id` int NOT NULL AUTO_INCREMENT,
  `s_emp_code` varchar(45) DEFAULT NULL,
  `n_plant_id` varchar(45) DEFAULT NULL,
  `s_login_id` varchar(45) DEFAULT NULL,
  `s_email_id` varchar(75) DEFAULT NULL,
  `s_emp_name` varchar(150) DEFAULT NULL,
  `s_user_type` varchar(20) DEFAULT 'USER',
  PRIMARY KEY (`n_emp_id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_cl_employee`
--

LOCK TABLES `tbl_cl_employee` WRITE;
/*!40000 ALTER TABLE `tbl_cl_employee` DISABLE KEYS */;
INSERT INTO `tbl_cl_employee` VALUES (1,NULL,'*','sunny.kumar','sunny.kumar@eplglobal.com','Sunny Kumar','ADMIN'),(4,NULL,'*','babu.bhaskaran','babu.bhaskaran@eplglobal.com','Babu Bhaskaran','ADMIN'),(5,NULL,'*','pallavi.jadhav','pallavi.jadhav@eplglobal.com','Pallavi Jadhav','ADMIN'),(6,NULL,'1105','henrique.dias','henrique.dias@eplglobal.com','Henrique Dias','USER'),(7,NULL,'1105','alicia.fernandes','alicia.fernandes@eplglobal.com','Alicia Fernandez','USER'),(8,NULL,'1101','ramadas.nair','ramadas.nair@eplglobal.com ','Ramadas Nair','USER'),(9,NULL,'1101','kamalakar.jadhav','kamalakar.jadhav@eplglobal.com','Kamalakar Jadhav','USER'),(10,NULL,'1103','tushar.wakale','tushar.wakale@eplglobal.com','Tushar Wakale','USER'),(11,NULL,'1103','deepak.yadav','deepak.yadav@eplglobal.com','Deepak Yadav','USER'),(12,NULL,'1106','kishori.lal','kishori.lal@eplglobal.com','Kishori Lal','USER'),(13,NULL,'1106','rohit.rana','rohit.rana@eplglobal.com','Rohit Rana','USER'),(14,NULL,'1116','rohan.chowdhuri','rohan.chowdhuri@eplglobal.com','Rohan Chowdhuri','USER'),(15,NULL,'1114','jayesh.mistri','jayesh.mistri@eplglobal.com','Jayesh Mistri','USER'),(16,NULL,'1114','mehul.tamakuwala','mehul.tamakuwala@eplglobal.com','Mehul Tamakuwala','USER');
/*!40000 ALTER TABLE `tbl_cl_employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_cl_machine_section`
--

DROP TABLE IF EXISTS `tbl_cl_machine_section`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_cl_machine_section` (
  `n_machine_sec_id` int NOT NULL AUTO_INCREMENT,
  `s_macahine_name` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`n_machine_sec_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_cl_machine_section`
--

LOCK TABLES `tbl_cl_machine_section` WRITE;
/*!40000 ALTER TABLE `tbl_cl_machine_section` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_cl_machine_section` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_cl_mapping_rol_dep_con_plant`
--

DROP TABLE IF EXISTS `tbl_cl_mapping_rol_dep_con_plant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_cl_mapping_rol_dep_con_plant` (
  `n_mapping_id` int NOT NULL AUTO_INCREMENT,
  `n_dept_id` int DEFAULT NULL,
  `n_role_id` varchar(50) DEFAULT NULL,
  `n_con_id` int DEFAULT NULL,
  `s_plant_code` varchar(45) DEFAULT NULL,
  `n_machine_sec_id` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`n_mapping_id`)
) ENGINE=InnoDB AUTO_INCREMENT=85 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_cl_mapping_rol_dep_con_plant`
--

LOCK TABLES `tbl_cl_mapping_rol_dep_con_plant` WRITE;
/*!40000 ALTER TABLE `tbl_cl_mapping_rol_dep_con_plant` DISABLE KEYS */;
INSERT INTO `tbl_cl_mapping_rol_dep_con_plant` VALUES (1,3,'1',NULL,'1106',NULL),(2,3,'13',NULL,'1106',NULL),(3,3,'13',NULL,'1116',NULL),(4,3,'35',NULL,'1116',NULL),(5,3,'28',NULL,'1116',NULL),(6,3,'28',NULL,'1106',NULL),(7,1,NULL,NULL,'1103',NULL),(8,2,'17',NULL,'1101',NULL),(9,5,NULL,NULL,'1103',NULL),(11,7,NULL,NULL,'1103',NULL),(12,8,NULL,NULL,'1103',NULL),(15,10,'4',1,'1114',NULL),(16,11,NULL,NULL,'1103',NULL),(17,15,NULL,NULL,'1103',NULL),(18,14,NULL,NULL,'1103',NULL),(19,12,'7',NULL,'1106',NULL),(20,12,'8',NULL,'1105',NULL),(21,12,NULL,NULL,'1103',NULL),(22,12,'30',NULL,'1105',NULL),(23,12,'34',NULL,'1105',NULL),(24,12,'34',NULL,'1101',NULL),(25,13,'16',2,'1114',NULL),(26,18,NULL,NULL,'1103',NULL),(27,17,NULL,NULL,'1103',NULL),(28,16,NULL,NULL,'1103',NULL),(29,22,NULL,NULL,'1103',NULL),(30,21,'12',2,'1114',NULL),(31,23,NULL,NULL,'1103',NULL),(32,24,NULL,NULL,'1103',NULL),(33,19,'9',NULL,'1105',NULL),(34,19,'13',NULL,'1105',NULL),(35,19,'25',NULL,'1105',''),(36,19,'28',NULL,'1105',NULL),(37,20,'20',1,'1105',NULL),(38,20,'19',2,'1105',NULL),(39,25,'16',NULL,'1101',NULL),(40,26,'19',1,'1101',NULL),(41,26,'20',1,'1114',NULL),(42,30,NULL,NULL,'1103',NULL),(43,29,NULL,4,'1114',NULL),(44,27,'19',1,'1114',NULL),(45,27,'20',1,'1114',NULL),(46,28,'11',2,'1114',NULL),(47,36,NULL,NULL,'1103',NULL),(48,35,NULL,NULL,'1103',NULL),(49,31,'11',2,'1114',NULL),(50,31,'',NULL,'1103',NULL),(51,31,'23',NULL,'1105',NULL),(52,31,'23',NULL,'1106',NULL),(53,32,'24',NULL,'1105',NULL),(54,34,NULL,NULL,'1103',NULL),(55,33,'16',2,'1114',NULL),(56,37,'27',2,'1114',NULL),(57,44,NULL,NULL,'1103',NULL),(58,48,NULL,NULL,'1103',NULL),(59,38,'26',NULL,'1116',NULL),(60,46,NULL,NULL,'1103',NULL),(61,42,NULL,NULL,'1103',NULL),(62,42,'28',3,'1114',NULL),(63,43,NULL,NULL,'1103',NULL),(64,41,'16',NULL,'1101',NULL),(65,41,'17',NULL,'1101',NULL),(66,45,NULL,NULL,'1103',NULL),(67,40,'22',NULL,'1106',NULL),(68,39,'5',NULL,'1106',NULL),(69,50,'6',NULL,'1105',NULL),(70,50,'10',NULL,'1105',NULL),(71,50,'16',NULL,'1106',NULL),(72,50,'16',NULL,'1101',NULL),(73,50,'17',NULL,'1101',NULL),(74,50,'29',NULL,'1105',NULL),(75,52,NULL,NULL,'1103',NULL),(76,53,NULL,NULL,'1103',NULL),(77,49,'2',NULL,'1116',NULL),(78,49,'3',NULL,'1116',NULL),(79,49,'3',NULL,'1106',NULL),(80,49,'21',NULL,'1116',NULL),(81,49,'31',NULL,'1105',NULL),(82,49,'32',NULL,'1105',NULL),(83,49,'33',NULL,'1105',NULL),(84,51,NULL,NULL,'1103',NULL);
/*!40000 ALTER TABLE `tbl_cl_mapping_rol_dep_con_plant` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_cl_plant`
--

DROP TABLE IF EXISTS `tbl_cl_plant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_cl_plant` (
  `n_plant_id` int NOT NULL AUTO_INCREMENT,
  `s_plant_code` varchar(45) DEFAULT NULL,
  `s_plant_name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`n_plant_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_cl_plant`
--

LOCK TABLES `tbl_cl_plant` WRITE;
/*!40000 ALTER TABLE `tbl_cl_plant` DISABLE KEYS */;
INSERT INTO `tbl_cl_plant` VALUES (1,'1105','Goa'),(2,'1101','Vasind'),(3,'1103','Wada'),(4,'1106','Nalagarh'),(5,'1114','Vapi'),(6,'1116','Assam');
/*!40000 ALTER TABLE `tbl_cl_plant` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_cl_role_master`
--

DROP TABLE IF EXISTS `tbl_cl_role_master`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_cl_role_master` (
  `n_role_id` int NOT NULL AUTO_INCREMENT,
  `s_role_name` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`n_role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_cl_role_master`
--

LOCK TABLES `tbl_cl_role_master` WRITE;
/*!40000 ALTER TABLE `tbl_cl_role_master` DISABLE KEYS */;
INSERT INTO `tbl_cl_role_master` VALUES (1,'Admin'),(2,'Box Maker'),(3,'Checker'),(4,'Core Cutting'),(5,'DEO'),(6,'Dispatch'),(7,'Engineering'),(8,'Engineering Stores'),(9,'Gardening'),(10,'Grinding'),(11,'Helper'),(12,'HK'),(13,'House Keeping'),(14,'Garden'),(15,'Carpenter'),(16,'Loading & Unloading'),(17,'SAP'),(18,'Office work'),(19,'Line Maker'),(20,'Packer/Checker'),(21,'Packers'),(22,'Pallet Cleaning'),(23,'Printing'),(24,'QA'),(25,'Receptionist'),(26,'RM/Dispatch'),(27,'SCM Staff'),(28,'Security'),(29,'Stores'),(30,'Tool Room'),(31,'Tubeline Extra'),(32,'Tubeline Standard'),(33,'Tubeline Training'),(34,'Utility'),(35,'Reception');
/*!40000 ALTER TABLE `tbl_cl_role_master` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_cl_updation_form`
--

DROP TABLE IF EXISTS `tbl_cl_updation_form`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_cl_updation_form` (
  `n_updation_frm_id` int NOT NULL AUTO_INCREMENT,
  `s_login_id` varchar(100) DEFAULT NULL,
  `d_current_date` varchar(60) DEFAULT NULL,
  `s_plant_code` varchar(20) DEFAULT NULL,
  `d_creatd_datetime` datetime DEFAULT CURRENT_TIMESTAMP,
  `d_updated_datetime` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`n_updation_frm_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_cl_updation_form`
--

LOCK TABLES `tbl_cl_updation_form` WRITE;
/*!40000 ALTER TABLE `tbl_cl_updation_form` DISABLE KEYS */;
INSERT INTO `tbl_cl_updation_form` VALUES (1,'deepak.yadav','2021-05-13','1103','2021-05-14 17:43:28',NULL),(2,'deepak.yadav','2021-05-12','1103','2021-05-13 17:51:49',NULL),(3,'deepak.yadav','2021-05-11','1103','2021-05-12 10:53:04',NULL),(4,'deepak.yadav','2021-04-13','1103','2021-04-14 19:50:54',NULL),(5,'deepak.yadav','2021-04-12','1103','2021-04-13 20:09:25',NULL),(6,'deepak.yadav','2021-04-10','1103','2021-04-11 20:10:19',NULL),(7,'deepak.yadav','2021-05-14','1103','2021-05-15 12:14:07',NULL),(8,'henrique.dias','2021-05-14','1105','2021-05-15 18:45:55',NULL),(9,'rohan.chowdhuri','2021-05-14','1116','2021-05-15 18:55:00',NULL),(10,'kishori.lal','2021-05-14','1106','2021-05-15 18:57:36',NULL),(11,'ramadas.nair','2021-05-14','1101','2021-05-15 19:01:23',NULL);
/*!40000 ALTER TABLE `tbl_cl_updation_form` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tbl_cl_updation_form_AFTER_INSERT` AFTER INSERT ON `tbl_cl_updation_form` FOR EACH ROW BEGIN


INSERT INTO `tbl_cl_updation_trans` (`n_updation_frm_id`,`n_mapping_id`)
select new.n_updation_frm_id,n_mapping_id from tbl_cl_mapping_rol_dep_con_plant 
where s_plant_code = new.s_plant_code;



END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `tbl_cl_updation_trans`
--

DROP TABLE IF EXISTS `tbl_cl_updation_trans`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_cl_updation_trans` (
  `n_tran_id` int NOT NULL AUTO_INCREMENT,
  `n_updation_frm_id` int DEFAULT NULL,
  `n_mapping_id` int DEFAULT NULL,
  `s_actual_manday` varchar(20) DEFAULT '0',
  `s_ot_manday` varchar(20) DEFAULT '0',
  `s_total_manday` varchar(20) DEFAULT '0',
  `d_creatd_datetime` datetime DEFAULT CURRENT_TIMESTAMP,
  `d_updated_datetime` datetime DEFAULT NULL,
  PRIMARY KEY (`n_tran_id`)
) ENGINE=InnoDB AUTO_INCREMENT=276 DEFAULT CHARSET=latin1 COMMENT='transaction data';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_cl_updation_trans`
--

LOCK TABLES `tbl_cl_updation_trans` WRITE;
/*!40000 ALTER TABLE `tbl_cl_updation_trans` DISABLE KEYS */;
INSERT INTO `tbl_cl_updation_trans` VALUES (1,1,7,'1','1','2','2021-05-14 17:43:28',NULL),(2,1,9,'1','1','2','2021-05-14 17:43:28',NULL),(3,1,11,'1','0','1','2021-05-14 17:43:28',NULL),(4,1,12,'0','0','0','2021-05-14 17:43:28',NULL),(5,1,16,'0','0','0','2021-05-14 17:43:28',NULL),(6,1,17,'0','0','0','2021-05-14 17:43:28',NULL),(7,1,18,'0','0','0','2021-05-14 17:43:28',NULL),(8,1,21,'0','0','0','2021-05-14 17:43:28',NULL),(9,1,26,'0','0','0','2021-05-14 17:43:28',NULL),(10,1,27,'0','0','0','2021-05-14 17:43:28',NULL),(11,1,28,'0','0','0','2021-05-14 17:43:28',NULL),(12,1,29,'0','0','0','2021-05-14 17:43:28',NULL),(13,1,31,'1','0','1','2021-05-14 17:43:28',NULL),(14,1,32,'0','0','0','2021-05-14 17:43:28',NULL),(15,1,42,'0','0','0','2021-05-14 17:43:28',NULL),(16,1,47,'0','0','0','2021-05-14 17:43:28',NULL),(17,1,48,'0','0','0','2021-05-14 17:43:28',NULL),(18,1,50,'0','0','0','2021-05-14 17:43:28',NULL),(19,1,54,'0','0','0','2021-05-14 17:43:28',NULL),(20,1,57,'0','0','0','2021-05-14 17:43:28',NULL),(21,1,58,'0','0','0','2021-05-14 17:43:28',NULL),(22,1,60,'0','0','0','2021-05-14 17:43:28',NULL),(23,1,61,'0','0','0','2021-05-14 17:43:28',NULL),(24,1,63,'0','0','0','2021-05-14 17:43:28',NULL),(25,1,66,'0','0','0','2021-05-14 17:43:28',NULL),(26,1,75,'0','0','0','2021-05-14 17:43:28',NULL),(27,1,76,'0','0','0','2021-05-14 17:43:28',NULL),(28,1,84,'0','0','0','2021-05-14 17:43:28',NULL),(32,2,7,'0','0','0','2021-05-13 17:51:49',NULL),(33,2,9,'123','0','123','2021-05-13 17:51:49',NULL),(34,2,11,'0','321','321','2021-05-13 17:51:49',NULL),(35,2,12,'0','123','123','2021-05-13 17:51:49',NULL),(36,2,16,'0','0','0','2021-05-13 17:51:49',NULL),(37,2,17,'0','0','0','2021-05-13 17:51:49',NULL),(38,2,18,'0','0','0','2021-05-13 17:51:49',NULL),(39,2,21,'0','0','0','2021-05-13 17:51:49',NULL),(40,2,26,'0','0','0','2021-05-13 17:51:49',NULL),(41,2,27,'0','0','0','2021-05-13 17:51:49',NULL),(42,2,28,'0','0','0','2021-05-13 17:51:49',NULL),(43,2,29,'0','0','0','2021-05-13 17:51:49',NULL),(44,2,31,'0','0','0','2021-05-13 17:51:49',NULL),(45,2,32,'0','0','0','2021-05-13 17:51:49',NULL),(46,2,42,'0','0','0','2021-05-13 17:51:49',NULL),(47,2,47,'0','0','0','2021-05-13 17:51:49',NULL),(48,2,48,'0','0','0','2021-05-13 17:51:49',NULL),(49,2,50,'0','0','0','2021-05-13 17:51:49',NULL),(50,2,54,'0','0','0','2021-05-13 17:51:49',NULL),(51,2,57,'0','0','0','2021-05-13 17:51:49',NULL),(52,2,58,'0','0','0','2021-05-13 17:51:49',NULL),(53,2,60,'0','0','0','2021-05-13 17:51:49',NULL),(54,2,61,'0','0','0','2021-05-13 17:51:49',NULL),(55,2,63,'0','0','0','2021-05-13 17:51:49',NULL),(56,2,66,'0','0','0','2021-05-13 17:51:49',NULL),(57,2,75,'0','0','0','2021-05-13 17:51:49',NULL),(58,2,76,'0','0','0','2021-05-13 17:51:49',NULL),(59,2,84,'0','0','0','2021-05-13 17:51:49',NULL),(63,3,7,'12','34','46','2021-05-12 10:53:04',NULL),(64,3,9,'11','11','22','2021-05-12 10:53:04',NULL),(65,3,11,'3','0','3','2021-05-12 10:53:04',NULL),(66,3,12,'0','0','0','2021-05-12 10:53:04',NULL),(67,3,16,'0','0','0','2021-05-12 10:53:04',NULL),(68,3,17,'0','0','0','2021-05-12 10:53:04',NULL),(69,3,18,'0','0','0','2021-05-12 10:53:04',NULL),(70,3,21,'0','0','0','2021-05-12 10:53:04',NULL),(71,3,26,'0','0','0','2021-05-12 10:53:04',NULL),(72,3,27,'0','0','0','2021-05-12 10:53:04',NULL),(73,3,28,'0','0','0','2021-05-12 10:53:04',NULL),(74,3,29,'0','0','0','2021-05-12 10:53:04',NULL),(75,3,31,'0','0','0','2021-05-12 10:53:04',NULL),(76,3,32,'0','0','0','2021-05-12 10:53:04',NULL),(77,3,42,'0','0','0','2021-05-12 10:53:04',NULL),(78,3,47,'0','0','0','2021-05-12 10:53:04',NULL),(79,3,48,'0','0','0','2021-05-12 10:53:04',NULL),(80,3,50,'0','0','0','2021-05-12 10:53:04',NULL),(81,3,54,'0','0','0','2021-05-12 10:53:04',NULL),(82,3,57,'0','0','0','2021-05-12 10:53:04',NULL),(83,3,58,'0','0','0','2021-05-12 10:53:04',NULL),(84,3,60,'0','0','0','2021-05-12 10:53:04',NULL),(85,3,61,'0','0','0','2021-05-12 10:53:04',NULL),(86,3,63,'0','0','0','2021-05-12 10:53:04',NULL),(87,3,66,'0','0','0','2021-05-12 10:53:04',NULL),(88,3,75,'0','0','0','2021-05-12 10:53:04',NULL),(89,3,76,'0','0','0','2021-05-12 10:53:04',NULL),(90,3,84,'0','0','0','2021-05-12 10:53:04',NULL),(94,4,7,'0','0','0','2021-04-14 19:50:54',NULL),(95,4,9,'0','0','0','2021-04-14 19:50:54',NULL),(96,4,11,'0','0','0','2021-04-14 19:50:54',NULL),(97,4,12,'0','0','0','2021-04-14 19:50:54',NULL),(98,4,16,'0','0','0','2021-04-14 19:50:54',NULL),(99,4,17,'0','0','0','2021-04-14 19:50:54',NULL),(100,4,18,'0','0','0','2021-04-14 19:50:54',NULL),(101,4,21,'0','0','0','2021-04-14 19:50:54',NULL),(102,4,26,'0','0','0','2021-04-14 19:50:54',NULL),(103,4,27,'0','0','0','2021-04-14 19:50:54',NULL),(104,4,28,'0','0','0','2021-04-14 19:50:54',NULL),(105,4,29,'0','0','0','2021-04-14 19:50:54',NULL),(106,4,31,'0','0','0','2021-04-14 19:50:54',NULL),(107,4,32,'0','0','0','2021-04-14 19:50:54',NULL),(108,4,42,'0','0','0','2021-04-14 19:50:54',NULL),(109,4,47,'0','0','0','2021-04-14 19:50:54',NULL),(110,4,48,'0','0','0','2021-04-14 19:50:54',NULL),(111,4,50,'0','0','0','2021-04-14 19:50:54',NULL),(112,4,54,'0','0','0','2021-04-14 19:50:54',NULL),(113,4,57,'0','0','0','2021-04-14 19:50:54',NULL),(114,4,58,'0','0','0','2021-04-14 19:50:54',NULL),(115,4,60,'0','0','0','2021-04-14 19:50:54',NULL),(116,4,61,'0','0','0','2021-04-14 19:50:54',NULL),(117,4,63,'0','0','0','2021-04-14 19:50:54',NULL),(118,4,66,'0','0','0','2021-04-14 19:50:54',NULL),(119,4,75,'0','0','0','2021-04-14 19:50:54',NULL),(120,4,76,'0','0','0','2021-04-14 19:50:54',NULL),(121,4,84,'0','0','0','2021-04-14 19:50:54',NULL),(125,5,7,'1','0','1','2021-04-13 20:09:25',NULL),(126,5,9,'0','0','0','2021-04-13 20:09:25',NULL),(127,5,11,'0','0','0','2021-04-13 20:09:25',NULL),(128,5,12,'0','0','0','2021-04-13 20:09:25',NULL),(129,5,16,'0','0','0','2021-04-13 20:09:25',NULL),(130,5,17,'0','0','0','2021-04-13 20:09:25',NULL),(131,5,18,'0','0','0','2021-04-13 20:09:25',NULL),(132,5,21,'0','0','0','2021-04-13 20:09:25',NULL),(133,5,26,'0','0','0','2021-04-13 20:09:25',NULL),(134,5,27,'0','0','0','2021-04-13 20:09:25',NULL),(135,5,28,'0','0','0','2021-04-13 20:09:25',NULL),(136,5,29,'0','0','0','2021-04-13 20:09:25',NULL),(137,5,31,'0','0','0','2021-04-13 20:09:25',NULL),(138,5,32,'0','0','0','2021-04-13 20:09:25',NULL),(139,5,42,'0','0','0','2021-04-13 20:09:25',NULL),(140,5,47,'0','0','0','2021-04-13 20:09:25',NULL),(141,5,48,'0','0','0','2021-04-13 20:09:25',NULL),(142,5,50,'0','0','0','2021-04-13 20:09:25',NULL),(143,5,54,'0','0','0','2021-04-13 20:09:25',NULL),(144,5,57,'0','0','0','2021-04-13 20:09:25',NULL),(145,5,58,'0','0','0','2021-04-13 20:09:25',NULL),(146,5,60,'0','0','0','2021-04-13 20:09:25',NULL),(147,5,61,'0','0','0','2021-04-13 20:09:25',NULL),(148,5,63,'0','0','0','2021-04-13 20:09:25',NULL),(149,5,66,'0','0','0','2021-04-13 20:09:25',NULL),(150,5,75,'0','0','0','2021-04-13 20:09:25',NULL),(151,5,76,'0','0','0','2021-04-13 20:09:25',NULL),(152,5,84,'0','0','0','2021-04-13 20:09:25',NULL),(156,6,7,'0','0','0','2021-04-11 20:10:19',NULL),(157,6,9,'0','0','0','2021-04-11 20:10:19',NULL),(158,6,11,'0','0','0','2021-04-11 20:10:19',NULL),(159,6,12,'0','0','0','2021-04-11 20:10:19',NULL),(160,6,16,'0','0','0','2021-04-11 20:10:19',NULL),(161,6,17,'0','0','0','2021-04-11 20:10:19',NULL),(162,6,18,'0','0','0','2021-04-11 20:10:19',NULL),(163,6,21,'0','0','0','2021-04-11 20:10:19',NULL),(164,6,26,'0','0','0','2021-04-11 20:10:19',NULL),(165,6,27,'0','0','0','2021-04-11 20:10:19',NULL),(166,6,28,'0','0','0','2021-04-11 20:10:19',NULL),(167,6,29,'0','0','0','2021-04-11 20:10:19',NULL),(168,6,31,'0','0','0','2021-04-11 20:10:19',NULL),(169,6,32,'0','0','0','2021-04-11 20:10:19',NULL),(170,6,42,'0','0','0','2021-04-11 20:10:19',NULL),(171,6,47,'0','0','0','2021-04-11 20:10:19',NULL),(172,6,48,'0','0','0','2021-04-11 20:10:19',NULL),(173,6,50,'0','0','0','2021-04-11 20:10:19',NULL),(174,6,54,'0','0','0','2021-04-11 20:10:19',NULL),(175,6,57,'0','0','0','2021-04-11 20:10:19',NULL),(176,6,58,'0','0','0','2021-04-11 20:10:19',NULL),(177,6,60,'0','0','0','2021-04-11 20:10:19',NULL),(178,6,61,'0','0','0','2021-04-11 20:10:19',NULL),(179,6,63,'0','0','0','2021-04-11 20:10:19',NULL),(180,6,66,'0','0','0','2021-04-11 20:10:19',NULL),(181,6,75,'0','0','0','2021-04-11 20:10:19',NULL),(182,6,76,'0','0','0','2021-04-11 20:10:19',NULL),(183,6,84,'0','0','0','2021-04-11 20:10:19',NULL),(184,7,7,'0','21','21','2021-05-15 12:14:07',NULL),(185,7,9,'0','0','0','2021-05-15 12:14:07',NULL),(186,7,11,'0','0','0','2021-05-15 12:14:07',NULL),(187,7,12,'0','0','0','2021-05-15 12:14:07',NULL),(188,7,16,'0','0','0','2021-05-15 12:14:07',NULL),(189,7,17,'0','0','0','2021-05-15 12:14:07',NULL),(190,7,18,'0','0','0','2021-05-15 12:14:07',NULL),(191,7,21,'0','0','0','2021-05-15 12:14:07',NULL),(192,7,26,'0','0','0','2021-05-15 12:14:07',NULL),(193,7,27,'0','0','0','2021-05-15 12:14:07',NULL),(194,7,28,'0','0','0','2021-05-15 12:14:07',NULL),(195,7,29,'0','0','0','2021-05-15 12:14:07',NULL),(196,7,31,'0','0','0','2021-05-15 12:14:07',NULL),(197,7,32,'0','0','0','2021-05-15 12:14:07',NULL),(198,7,42,'0','0','0','2021-05-15 12:14:07',NULL),(199,7,47,'0','0','0','2021-05-15 12:14:07',NULL),(200,7,48,'0','0','0','2021-05-15 12:14:07',NULL),(201,7,50,'0','0','0','2021-05-15 12:14:07',NULL),(202,7,54,'0','0','0','2021-05-15 12:14:07',NULL),(203,7,57,'0','0','0','2021-05-15 12:14:07',NULL),(204,7,58,'0','0','0','2021-05-15 12:14:07',NULL),(205,7,60,'0','0','0','2021-05-15 12:14:07',NULL),(206,7,61,'0','0','0','2021-05-15 12:14:07',NULL),(207,7,63,'0','0','0','2021-05-15 12:14:07',NULL),(208,7,66,'0','0','0','2021-05-15 12:14:07',NULL),(209,7,75,'0','0','0','2021-05-15 12:14:07',NULL),(210,7,76,'0','0','0','2021-05-15 12:14:07',NULL),(211,7,84,'0','0','0','2021-05-15 12:14:07',NULL),(215,8,20,'1','1','2','2021-05-15 18:45:55',NULL),(216,8,22,'0','0','0','2021-05-15 18:45:55',NULL),(217,8,23,'0','0','0','2021-05-15 18:45:55',NULL),(218,8,33,'0','0','0','2021-05-15 18:45:55',NULL),(219,8,34,'0','0','0','2021-05-15 18:45:55',NULL),(220,8,35,'0','0','0','2021-05-15 18:45:55',NULL),(221,8,36,'0','0','0','2021-05-15 18:45:55',NULL),(222,8,37,'0','0','0','2021-05-15 18:45:55',NULL),(223,8,38,'0','0','0','2021-05-15 18:45:55',NULL),(224,8,51,'0','0','0','2021-05-15 18:45:55',NULL),(225,8,53,'0','0','0','2021-05-15 18:45:55',NULL),(226,8,69,'0','0','0','2021-05-15 18:45:55',NULL),(227,8,70,'0','0','0','2021-05-15 18:45:55',NULL),(228,8,74,'0','0','0','2021-05-15 18:45:55',NULL),(229,8,81,'0','0','0','2021-05-15 18:45:55',NULL),(230,8,82,'0','0','0','2021-05-15 18:45:55',NULL),(231,8,83,'0','0','0','2021-05-15 18:45:55',NULL),(246,9,3,'1','0','1','2021-05-15 18:55:00',NULL),(247,9,4,'0','0','0','2021-05-15 18:55:00',NULL),(248,9,5,'0','0','0','2021-05-15 18:55:00',NULL),(249,9,59,'0','0','0','2021-05-15 18:55:00',NULL),(250,9,77,'0','0','0','2021-05-15 18:55:00',NULL),(251,9,78,'0','0','0','2021-05-15 18:55:00',NULL),(252,9,80,'0','0','0','2021-05-15 18:55:00',NULL),(253,10,1,'7','0','7','2021-05-15 18:57:36',NULL),(254,10,2,'0','0','0','2021-05-15 18:57:36',NULL),(255,10,6,'0','0','0','2021-05-15 18:57:36',NULL),(256,10,19,'0','0','0','2021-05-15 18:57:36',NULL),(257,10,52,'0','0','0','2021-05-15 18:57:36',NULL),(258,10,67,'0','0','0','2021-05-15 18:57:36',NULL),(259,10,68,'0','0','0','2021-05-15 18:57:36',NULL),(260,10,71,'0','0','0','2021-05-15 18:57:36',NULL),(261,10,79,'0','0','0','2021-05-15 18:57:36',NULL),(268,11,8,'1','0','1','2021-05-15 19:01:23',NULL),(269,11,24,'0','0','0','2021-05-15 19:01:23',NULL),(270,11,39,'0','0','0','2021-05-15 19:01:23',NULL),(271,11,40,'0','0','0','2021-05-15 19:01:23',NULL),(272,11,64,'0','0','0','2021-05-15 19:01:23',NULL),(273,11,65,'0','0','0','2021-05-15 19:01:23',NULL),(274,11,72,'0','0','0','2021-05-15 19:01:23',NULL),(275,11,73,'0','0','0','2021-05-15 19:01:23',NULL);
/*!40000 ALTER TABLE `tbl_cl_updation_trans` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'db_cl'
--
/*!50003 DROP FUNCTION IF EXISTS `cl_contractor_name_by_id` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `cl_contractor_name_by_id`(contractor_id int(11)) RETURNS varchar(5000) CHARSET utf8mb4
BEGIN
declare contractor_name varchar(5000) default 'None';

if contractor_id is not null then 
	SELECT s_contractor_name into contractor_name FROM tbl_cl_contractor where n_contractor_id=contractor_id;
 
end if;

RETURN contractor_name;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `cl_dep_name_by_id` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `cl_dep_name_by_id`(dep_id int(11)) RETURNS varchar(5000) CHARSET utf8mb4
BEGIN
declare dept_name varchar(5000)  default 'None';

if dep_id is not null then 
	SELECT s_dept_name into dept_name FROM tbl_cl_department where n_dept_id=dep_id;

end if;

RETURN dept_name;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `cl_role_name_by_id` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `cl_role_name_by_id`(role_id int(11)) RETURNS varchar(5000) CHARSET utf8mb4
BEGIN
declare role_name varchar(5000) default 'None';

if role_id is not null then 
	SELECT s_role_name into role_name FROM tbl_cl_role_master where n_role_id=role_id;
end if;

RETURN role_name;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `pro_cl_insert_new` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `pro_cl_insert_new`(login_id varchar(100), preivousDate varchar(50),plantDet varchar(50))
BEGIN
declare cnt int(11);
select  count(n_updation_frm_id) into cnt  from tbl_cl_updation_form where s_login_id=login_id and d_current_date=preivousDate and s_plant_code=plantDet; 
if cnt = 0 then 
insert into tbl_cl_updation_form (s_login_id,d_current_date,s_plant_code) values(login_id,preivousDate,plantDet);  select max(n_updation_frm_id) as updationid from tbl_cl_updation_form where s_login_id=login_id and d_current_date=preivousDate and s_plant_code=plantDet; 
end if;
select cnt;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `pro_cl_save_and_update_cl_form1` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `pro_cl_save_and_update_cl_form1`(updation_frm_id int(11), input_value varchar(20),tran_id int(11), mapping_id int(11),tag varchar(20))
BEGIN
if tag = 'AM' then 
update tbl_cl_updation_trans set s_actual_manday=input_value where n_mapping_id=mapping_id and n_tran_id=tran_id;
elseif  tag = 'OM' then 
update tbl_cl_updation_trans set s_ot_manday=input_value where n_mapping_id=mapping_id and n_tran_id=tran_id;
elseif  tag = 'TM' then 
update tbl_cl_updation_trans set s_total_manday=input_value where n_mapping_id=mapping_id and n_tran_id=tran_id;
end if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `pro_cl_save_and_update_cl_form2` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `pro_cl_save_and_update_cl_form2`( input_value varchar(5000),comp_trans_data_id int(11), comp_trans_id int(11), tag varchar(20))
BEGIN
 
if tag = 'YN' then 
update tbl_cl_comp_trans_data set n_yes_no=input_value where n_comp_trans_id=comp_trans_id and n_comp_trans_data_id=comp_trans_data_id;
elseif  tag = 'RE' then 
update tbl_cl_comp_trans_data set s_remark=input_value where n_comp_trans_id=comp_trans_id and n_comp_trans_data_id=comp_trans_data_id;
elseif  tag = 'CA' then 
update tbl_cl_comp_trans_data set s_corrective_action=input_value where n_comp_trans_id=comp_trans_id and n_comp_trans_data_id=comp_trans_data_id;
end if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-09-04 13:13:37
