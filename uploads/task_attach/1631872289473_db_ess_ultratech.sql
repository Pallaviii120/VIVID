-- MySQL dump 10.13  Distrib 8.0.24, for Win64 (x86_64)
--
-- Host: localhost    Database: db_ess_ultratech
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
-- Table structure for table `tbl_assign_leave`
--

DROP TABLE IF EXISTS `tbl_assign_leave`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_assign_leave` (
  `n_al_id` int NOT NULL AUTO_INCREMENT,
  `s_em_code` varchar(64) DEFAULT NULL,
  `n_type_id` int NOT NULL,
  `n_assiged_days` varchar(50) DEFAULT '0',
  `n_consumed_days` varchar(50) DEFAULT '0',
  `f_dateyear` varchar(64) DEFAULT NULL,
  `d_created_datetime` datetime DEFAULT CURRENT_TIMESTAMP,
  `d_updated_datetime` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`n_al_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_assign_leave`
--

LOCK TABLES `tbl_assign_leave` WRITE;
/*!40000 ALTER TABLE `tbl_assign_leave` DISABLE KEYS */;
INSERT INTO `tbl_assign_leave` VALUES (1,'EMP01',1,'26','1.5','2021-22','2021-08-26 17:17:47','2021-09-03 17:47:20'),(2,'EMP01',2,'24',NULL,'2021-22','2021-08-26 17:17:47','2021-08-26 17:17:47'),(3,'EMP02',1,'26',NULL,'2021-22','2021-08-26 17:17:47','2021-08-26 17:17:47'),(4,'EMP02',2,'24',NULL,'2021-22','2021-08-26 17:17:47','2021-08-26 17:17:47'),(5,'EMP03',1,'26',NULL,'2021-22','2021-08-26 17:17:47','2021-08-26 17:17:47'),(6,'EMP03',2,'24',NULL,'2021-22','2021-08-26 17:17:47','2021-08-26 17:17:47');
/*!40000 ALTER TABLE `tbl_assign_leave` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_attendance`
--

DROP TABLE IF EXISTS `tbl_attendance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_attendance` (
  `n_att_id` int NOT NULL AUTO_INCREMENT,
  `s_em_code` varchar(64) DEFAULT NULL,
  `n_shift_id` int DEFAULT NULL,
  `d_atten_date` varchar(64) DEFAULT NULL,
  `t_signin_time` varchar(64) DEFAULT NULL,
  `t_signout_time` varchar(64) DEFAULT NULL,
  `s_daily_working_hour` varchar(64) DEFAULT NULL,
  `s_actual_working_hour` varchar(64) DEFAULT NULL,
  `s_absence` varchar(128) DEFAULT NULL,
  `s_lateIn` varchar(65) DEFAULT NULL,
  `s_earlyOut` varchar(65) DEFAULT NULL,
  `s_overtime` varchar(128) DEFAULT NULL,
  `s_first_half` varchar(45) DEFAULT NULL,
  `s_scound_half` varchar(45) DEFAULT NULL,
  `s_status` varchar(64) DEFAULT NULL,
  `d_created_datetime` datetime DEFAULT CURRENT_TIMESTAMP,
  `d_updated_datetime` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`n_att_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_attendance`
--

LOCK TABLES `tbl_attendance` WRITE;
/*!40000 ALTER TABLE `tbl_attendance` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_attendance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_department`
--

DROP TABLE IF EXISTS `tbl_department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_department` (
  `n_dep_id` int NOT NULL AUTO_INCREMENT,
  `s_dep_name` varchar(64) NOT NULL,
  `s_dep_head` varchar(64) NOT NULL,
  `d_created_datetime` datetime DEFAULT CURRENT_TIMESTAMP,
  `d_updated_datetime` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `s_created_by` varchar(45) DEFAULT NULL,
  `s_updated_by` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`n_dep_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_department`
--

LOCK TABLES `tbl_department` WRITE;
/*!40000 ALTER TABLE `tbl_department` DISABLE KEYS */;
INSERT INTO `tbl_department` VALUES (1,'Administration','EMP01','2021-08-26 16:51:10','2021-08-31 21:38:22',NULL,'ROHAN.PATIL@APPONEXT.COM'),(2,'Finance, HR, & Administration','EMP02','2021-08-26 16:51:10','2021-08-31 21:38:31',NULL,'ROHAN.PATIL@APPONEXT.COM'),(3,'Research','EMP03','2021-08-26 16:51:10','2021-08-31 21:38:52',NULL,'ROHAN.PATIL@APPONEXT.COM'),(4,'Information Technology','EMP04','2021-08-26 16:51:10','2021-08-26 16:51:10',NULL,NULL),(6,'Support','EMP01','2021-08-31 21:44:40','2021-08-31 21:44:40','ROHAN.PATIL@APPONEXT.COM',NULL);
/*!40000 ALTER TABLE `tbl_department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_emp_shift`
--

DROP TABLE IF EXISTS `tbl_emp_shift`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_emp_shift` (
  `n_emp_shift_id` int NOT NULL AUTO_INCREMENT,
  `s_em_code` varchar(65) NOT NULL,
  `n_shift_id` varchar(30) NOT NULL,
  `d_start_date` varchar(20) NOT NULL,
  `d_end_date` varchar(20) NOT NULL,
  `d_created_datetime` datetime DEFAULT CURRENT_TIMESTAMP,
  `d_updated_datetime` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`n_emp_shift_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_emp_shift`
--

LOCK TABLES `tbl_emp_shift` WRITE;
/*!40000 ALTER TABLE `tbl_emp_shift` DISABLE KEYS */;
INSERT INTO `tbl_emp_shift` VALUES (1,'EMP01','A','2021-01-01','2021-09-01','2021-08-26 17:13:23','2021-08-26 17:13:23'),(4,'EMP02','A','2021-01-01','2021-09-01','2021-08-26 17:14:21','2021-08-26 17:14:21'),(5,'EMP03','B','2021-05-01','2021-10-01','2021-08-26 17:14:21','2021-08-26 17:14:21');
/*!40000 ALTER TABLE `tbl_emp_shift` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_employee`
--

DROP TABLE IF EXISTS `tbl_employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_employee` (
  `n_id` int NOT NULL AUTO_INCREMENT,
  `s_em_code` varchar(64) NOT NULL,
  `n_des_id` int DEFAULT NULL,
  `n_dep_id` int DEFAULT NULL,
  `s_first_name` varchar(128) DEFAULT NULL,
  `s_middle_name` varchar(128) DEFAULT NULL,
  `s_last_name` varchar(128) DEFAULT NULL,
  `s_em_email` varchar(64) DEFAULT NULL,
  `s_em_password` varchar(512) NOT NULL,
  `s_em_role` enum('ADMIN','EMPLOYEE','SUPER ADMIN') NOT NULL DEFAULT 'EMPLOYEE',
  `s_em_address` varchar(512) DEFAULT NULL,
  `n_status` enum('ACTIVE','INACTIVE') NOT NULL DEFAULT 'ACTIVE',
  `s_em_gender` enum('Male','Female') NOT NULL DEFAULT 'Male',
  `s_em_phone` varchar(64) DEFAULT NULL,
  `s_em_birthday` varchar(128) DEFAULT NULL,
  `s_em_blood_group` enum('O+','O-','A+','A-','B+','B-','AB+','OB+') DEFAULT NULL,
  `d_em_joining_date` varchar(128) DEFAULT NULL,
  `s_em_image` varchar(128) DEFAULT NULL,
  `s_em_age` int DEFAULT NULL,
  `s_em_pan` varchar(15) DEFAULT NULL,
  `s_em_adhar` varchar(15) DEFAULT NULL,
  `s_em_pf_no` varchar(20) DEFAULT NULL,
  `s_em_marital_status` varchar(20) DEFAULT NULL,
  `s_em_reporting1` varchar(64) NOT NULL,
  `s_em_reporting2` varchar(65) NOT NULL,
  `d_created_datetime` datetime DEFAULT CURRENT_TIMESTAMP,
  `d_updated_datetime` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`n_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_employee`
--

LOCK TABLES `tbl_employee` WRITE;
/*!40000 ALTER TABLE `tbl_employee` DISABLE KEYS */;
INSERT INTO `tbl_employee` VALUES (1,'EMP01',1,4,'KAMAL','KANT','YADAV','KAMAL.YADAV@APPONEXT.COM','123','EMPLOYEE','-','ACTIVE','Male','8286736553','05-10-1994','O+',NULL,NULL,26,'OPI7856FTF','45670987455666','123UGRER','UNMARIED','EMP04','EMP02','2021-08-26 16:54:33','2021-08-26 16:54:33'),(2,'EMP02',2,4,'SHIKHA','DAYARAM','DWIVEDI','SHIKHA.DWIVEDI@APPONEXT.COM','123','EMPLOYEE','-','ACTIVE','Female','8091238198','26-10-1994','O+',NULL,NULL,26,'OPI7856FTF','45670987455666','123UGRER','UNMARIED','EMP01','EMP04','2021-08-26 16:56:44','2021-08-26 16:56:44'),(3,'EMP03',2,3,'SANKET','','SAGVEKAR','SANKET.SAGVEKAR@APPONEXT.COM','123','EMPLOYEE','-','ACTIVE','Male','8091238193','26-10-1994','O+',NULL,NULL,26,'OPI7856FTF','45670987455666','123UGRER','UNMARIED','EMP01','EMP02','2021-08-26 16:57:51','2021-08-26 17:00:07'),(4,'EMP04',2,4,'ROHAN','','PATIL','ROHAN.PATIL@APPONEXT.COM','123','ADMIN','-','ACTIVE','Male','9078563412','26-10-1994','O+',NULL,NULL,26,'OPI7856FTF','45670987455666','123UGRER','UNMARIED','','','2021-08-26 16:59:01','2021-08-26 16:59:18'),(5,'EMP05',2,3,'SACHIN','','KANWAR','SACHIN.KANWAR@APPONEXT.COM','123','EMPLOYEE','-','ACTIVE','Male','9078563412','26-10-1994','O+',NULL,NULL,26,'OPI7856FTF','45670987455666','123UGRER','UNMARIED','EMP01','EMP03','2021-08-26 17:00:58','2021-08-26 17:00:58');
/*!40000 ALTER TABLE `tbl_employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_holiday`
--

DROP TABLE IF EXISTS `tbl_holiday`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_holiday` (
  `n_id` int NOT NULL AUTO_INCREMENT,
  `s_holiday_name` varchar(256) DEFAULT NULL,
  `d_from_date` varchar(64) DEFAULT NULL,
  `d_to_date` varchar(64) DEFAULT NULL,
  `n_number_of_days` varchar(64) DEFAULT NULL,
  `f_year` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`n_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_holiday`
--

LOCK TABLES `tbl_holiday` WRITE;
/*!40000 ALTER TABLE `tbl_holiday` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_holiday` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_leave_transaction`
--

DROP TABLE IF EXISTS `tbl_leave_transaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_leave_transaction` (
  `n_emp_leave_id` int NOT NULL AUTO_INCREMENT,
  `s_em_code` varchar(64) DEFAULT NULL,
  `n_type_id` int NOT NULL,
  `s_leave_type` varchar(64) DEFAULT NULL,
  `d_start_date` varchar(64) DEFAULT NULL,
  `d_end_date` varchar(64) DEFAULT NULL,
  `d_leave_duration` varchar(128) DEFAULT NULL,
  `d_apply_date` varchar(64) DEFAULT NULL,
  `s_reason` varchar(1024) DEFAULT NULL,
  `s_leave_status` enum('Approve','Not Approve','Rejected') NOT NULL DEFAULT 'Not Approve',
  `s_em_approver` varchar(65) NOT NULL,
  `d_created_datetime` datetime DEFAULT CURRENT_TIMESTAMP,
  `d_updated_datetime` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `s_created_by` varchar(45) DEFAULT NULL,
  `s_updated_by` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`n_emp_leave_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_leave_transaction`
--

LOCK TABLES `tbl_leave_transaction` WRITE;
/*!40000 ALTER TABLE `tbl_leave_transaction` DISABLE KEYS */;
INSERT INTO `tbl_leave_transaction` VALUES (1,'EMP01',1,NULL,'2021-09-04','2021-09-05','AD','2021-09-03','sqdcvfv edfwer','Not Approve','EMP04','2021-09-03 22:07:18','2021-09-03 22:07:18','EMP01',NULL);
/*!40000 ALTER TABLE `tbl_leave_transaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_leave_types`
--

DROP TABLE IF EXISTS `tbl_leave_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_leave_types` (
  `n_type_id` int NOT NULL AUTO_INCREMENT,
  `s_name` varchar(64) NOT NULL,
  `n_leave_day` varchar(255) NOT NULL,
  `n_status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`n_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_leave_types`
--

LOCK TABLES `tbl_leave_types` WRITE;
/*!40000 ALTER TABLE `tbl_leave_types` DISABLE KEYS */;
INSERT INTO `tbl_leave_types` VALUES (1,'FACTORY','26',1),(2,'OFFICE','24',1);
/*!40000 ALTER TABLE `tbl_leave_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_shift`
--

DROP TABLE IF EXISTS `tbl_shift`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_shift` (
  `n_shift_id` int NOT NULL AUTO_INCREMENT,
  `s_shift` varchar(30) DEFAULT NULL,
  `s_shift_desc` varchar(30) DEFAULT NULL,
  `t_start_time` varchar(20) DEFAULT NULL,
  `t_end_time` varchar(20) DEFAULT NULL,
  `s_gross_start_time` varchar(20) DEFAULT NULL,
  `s_gross_end_time` varchar(20) DEFAULT NULL,
  `s_min_work_hours` int DEFAULT NULL,
  `d_created_datetime` datetime DEFAULT CURRENT_TIMESTAMP,
  `d_updated_datetime` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`n_shift_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_shift`
--

LOCK TABLES `tbl_shift` WRITE;
/*!40000 ALTER TABLE `tbl_shift` DISABLE KEYS */;
INSERT INTO `tbl_shift` VALUES (1,'A','SHIFT A','07:00','15:00','30','30',6,'2021-08-26 16:44:48','2021-08-26 16:44:48'),(2,'B','SHIFT B','15:00','23:00','30','30',6,'2021-08-26 16:44:48','2021-08-26 16:44:48'),(3,'C','SHIFT C','23:00','07:00','30','30',6,'2021-08-26 16:44:48','2021-08-26 16:44:48'),(4,'D','SHIFT D','19:00','3:00','30','30',6,'2021-08-26 16:44:48','2021-08-26 16:44:48');
/*!40000 ALTER TABLE `tbl_shift` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_task_header`
--

DROP TABLE IF EXISTS `tbl_task_header`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_task_header` (
  `n_task_id` int NOT NULL AUTO_INCREMENT,
  `n_dep_id` int DEFAULT NULL,
  `s_em_code` varchar(64) DEFAULT NULL,
  `d_start_date` varchar(64) DEFAULT NULL,
  `d_due_date` varchar(64) DEFAULT NULL,
  `s_task_name` varchar(64) DEFAULT NULL,
  `s_task_desc` varchar(2000) DEFAULT NULL,
  `s_remark` varchar(500) DEFAULT NULL,
  `s_priority` enum('HIGH','MEDIUM','LOW') DEFAULT 'LOW',
  `s_status` enum('WIP','COMPLETE','PENDING') DEFAULT 'PENDING',
  PRIMARY KEY (`n_task_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_task_header`
--

LOCK TABLES `tbl_task_header` WRITE;
/*!40000 ALTER TABLE `tbl_task_header` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_task_header` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_task_transaction`
--

DROP TABLE IF EXISTS `tbl_task_transaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_task_transaction` (
  `n_tran_task_id` int NOT NULL AUTO_INCREMENT,
  `n_task_id` int DEFAULT NULL,
  `s_em_code` varchar(64) DEFAULT NULL,
  `s_remark` varchar(500) DEFAULT NULL,
  `s_status` enum('WIP','COMPLETE','PENDING') DEFAULT 'PENDING',
  PRIMARY KEY (`n_tran_task_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_task_transaction`
--

LOCK TABLES `tbl_task_transaction` WRITE;
/*!40000 ALTER TABLE `tbl_task_transaction` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_task_transaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'db_ess_ultratech'
--
/*!50003 DROP FUNCTION IF EXISTS `get_leave_type_name` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `get_leave_type_name`(type_id  int(11)) RETURNS varchar(100) CHARSET utf8mb4
BEGIN
declare type_name varchar(100);
select s_name into type_name from tbl_leave_types where n_type_id =type_id  ;
RETURN type_name;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `get_name_by_emp_code` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `get_name_by_emp_code`(em_code varchar(30)) RETURNS varchar(500) CHARSET utf8mb4
BEGIN 
declare emp_name varchar(500);
select concat(s_first_name,' ',s_middle_name,' ',s_last_name) into emp_name from tbl_employee where s_em_code = em_code;

RETURN emp_name;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `get_role_by_emp_code` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `get_role_by_emp_code`(em_code varchar(100)) RETURNS varchar(100) CHARSET utf8mb4
BEGIN
declare rol varchar(100);
select s_em_role into rol from tbl_employee where s_em_code = em_code;
RETURN rol;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `submit_leave` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `submit_leave`(em_code varchar(100),type_id int,start_date varchar(100),end_date varchar(100),leave_duration  varchar(100),reason varchar(100),created_by varchar(100))
BEGIN
declare rep_pers varchar(100);
select s_em_reporting1 into rep_pers from tbl_employee where s_em_code =em_code;
if rep_pers is not null then 
	INSERT INTO `tbl_leave_transaction` (`s_em_code`, `n_type_id`, `d_start_date`, `d_end_date`, `d_leave_duration`, `d_apply_date`, `s_reason`, `s_em_approver`,`s_created_by`)
VALUES (em_code,type_id,start_date,end_date,leave_duration,current_date(),reason,rep_pers,created_by);
set rep_pers= 'Inserted';
else 
	set rep_pers= 'Reporting Person is not mentioned';
end if;

SELECT rep_pers;
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

-- Dump completed on 2021-09-04 13:13:29
