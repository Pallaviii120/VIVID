-- MySQL dump 10.13  Distrib 8.0.24, for Win64 (x86_64)
--
-- Host: localhost    Database: db_tutor
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
-- Table structure for table `tbl_assign_note`
--

DROP TABLE IF EXISTS `tbl_assign_note`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_assign_note` (
  `n_assign_note_id` int NOT NULL AUTO_INCREMENT,
  `s_grp_name` varchar(45) DEFAULT NULL,
  `n_location_id` varchar(45) DEFAULT NULL,
  `s_created_by` varchar(45) DEFAULT NULL,
  `s_updated_by` varchar(45) DEFAULT NULL,
  `s_company_id` varchar(45) DEFAULT NULL,
  `d_created_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `d_modified_date` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`n_assign_note_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_assign_note`
--

LOCK TABLES `tbl_assign_note` WRITE;
/*!40000 ALTER TABLE `tbl_assign_note` DISABLE KEYS */;
INSERT INTO `tbl_assign_note` VALUES (6,'7','5','admin@gmail.com','admin@gmail.com','3','2020-10-18 17:30:13','2020-10-22 12:07:39'),(7,'7,9','5','admin@gmail.com',NULL,'3','2020-10-22 12:37:42','2020-10-22 12:37:42');
/*!40000 ALTER TABLE `tbl_assign_note` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tbl_assign_note_AFTER_INSERT` AFTER INSERT ON `tbl_assign_note` FOR EACH ROW BEGIN
insert into tbl_file_master (n_assign_note_id,s_og_name,s_new_name,s_path,s_uid,s_attach_type) select new.n_assign_note_id,s_og_name,s_new_name,s_path,s_uid,s_attach_type from tbl_temp_file where  s_uid=new.s_created_by;

delete from tbl_temp_file where  s_uid=new.s_created_by;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `tbl_child_master`
--

DROP TABLE IF EXISTS `tbl_child_master`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_child_master` (
  `n_child_id` int NOT NULL AUTO_INCREMENT,
  `n_company_id` int DEFAULT NULL,
  `n_location_id` int DEFAULT NULL,
  `n_group_id` int DEFAULT NULL,
  `s_first_name` varchar(45) DEFAULT NULL,
  `s_last_name` varchar(45) DEFAULT NULL,
  `s_email` varchar(45) DEFAULT NULL,
  `n_contact` varchar(20) DEFAULT NULL,
  `s_address` varchar(500) DEFAULT NULL,
  `s_user_id` varchar(45) DEFAULT NULL,
  `s_password` varchar(45) DEFAULT NULL,
  `n_delete` int DEFAULT '0',
  `s_created_by` varchar(45) DEFAULT NULL,
  `s_updated_by` varchar(45) DEFAULT NULL,
  `d_created_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `d_updated_date` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `n_img_path` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`n_child_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_child_master`
--

LOCK TABLES `tbl_child_master` WRITE;
/*!40000 ALTER TABLE `tbl_child_master` DISABLE KEYS */;
INSERT INTO `tbl_child_master` VALUES (1,2,2,7,'Kirti','Yadav','kirtiyadav@gmail.com','8976541230','Mankhurd west','k1','123456',0,'sa@gmail.com',NULL,'2020-10-16 22:09:46','2020-10-26 14:01:08','/img/avatars/1603701052693-Capture.PNG'),(2,2,2,7,'Amar','Yadav','amar.yadav@g.com','7896520316','Vashi','a1','123456',0,'sa@gmail.com',NULL,'2020-10-16 22:28:29','2020-10-19 19:50:23',NULL),(3,2,2,8,'Sneha','Gaud','sneha.gaud@g.com','7896853120','Kharghar','s1','123456',0,'sa@gmail.com',NULL,'2020-10-16 22:28:29','2020-10-19 19:50:23',NULL),(4,2,2,9,'Snjana','Bind','sanjana.bind@g.com','6548973215','Malad','s2','123456',0,'sa@gmail.com',NULL,'2020-10-16 22:28:29','2020-10-19 21:46:55',NULL),(7,5,16,10,'maxwell','marco','max@gmail.com','9876543213','ghansoli','max','123456',0,'admin@gmail.com','admin@gmail.com','2020-10-22 13:30:19','2021-07-13 11:55:11',NULL),(8,3,5,7,'warren','buffet','warren@gmail.com','9876543213','sweden',NULL,NULL,0,'admin@gmail.com',NULL,'2020-10-22 13:42:44','2020-10-22 13:42:44',NULL),(9,4,9,7,'carolina','barrow','carolin@gmail.com','9876543212','sanpada','b7e762b2','327c948c',1,'admin@gmail.com','admin@gmail.com','2020-10-22 13:46:09','2021-07-13 11:54:58',NULL);
/*!40000 ALTER TABLE `tbl_child_master` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tbl_child_master_BEFORE_INSERT` BEFORE INSERT ON `tbl_child_master` FOR EACH ROW BEGIN

declare password_ varchar(40);
declare username  varchar(100); 

/* SELECT concat('ganesh',date_format(now(), '%m%y'),UUID_SHORT()) as new_user ; */
/*set username=concat(new.s_first_name, date_format(now(), '%m%y'),UUID_SHORT()); */

/*set username=concat(new.s_first_name, new.s_last_name,UUID_SHORT());*/
set username=SUBSTRING(md5(concat(new.s_first_name, ' ',new.s_last_name,' ',new.s_email,' ',UUID())), 1, 8);


/*set password_=uuid();  */
set password_ =SUBSTRING(md5(concat(username, ' ',UUID())), 1, 8);


 IF (EXISTS(SELECT * FROM tbl_child_master WHERE username = NEW.s_user_id)) 
 THEN

set username=SUBSTRING(md5(concat(new.s_first_name, ' ',new.s_last_name,' ',new.s_email,' ',now())), 1, 8);
set password_ =SUBSTRING(md5(concat(username, ' ',UUID())), 1, 8);

  END IF;

set new.s_user_id =username;

set new.s_password =password_;

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `tbl_company_master`
--

DROP TABLE IF EXISTS `tbl_company_master`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_company_master` (
  `n_company_id` int NOT NULL AUTO_INCREMENT,
  `s_default_admin` varchar(80) DEFAULT NULL,
  `s_company_name` varchar(150) DEFAULT NULL,
  `s_phone_no` varchar(13) DEFAULT NULL,
  `s_created_by` varchar(45) DEFAULT NULL,
  `s_updated_by` varchar(45) DEFAULT NULL,
  `d_created_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `d_updated_date` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`n_company_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_company_master`
--

LOCK TABLES `tbl_company_master` WRITE;
/*!40000 ALTER TABLE `tbl_company_master` DISABLE KEYS */;
INSERT INTO `tbl_company_master` VALUES (2,'yadavkamal788@gmail.com','Swami Vivekananda Vidyalaya','0002226598','sa@gmail.com',NULL,'2020-10-15 13:28:51','2020-10-15 13:28:51'),(5,'parent@gmail.com','CVN','9876543212','admin@gmail.com','admin@gmail.com','2020-10-22 13:32:49','2021-07-13 11:19:06');
/*!40000 ALTER TABLE `tbl_company_master` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_file_master`
--

DROP TABLE IF EXISTS `tbl_file_master`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_file_master` (
  `n_file_id` int NOT NULL AUTO_INCREMENT,
  `n_assign_note_id` varchar(45) DEFAULT NULL,
  `s_og_name` varchar(250) DEFAULT NULL,
  `s_new_name` varchar(250) DEFAULT NULL,
  `s_path` varchar(150) DEFAULT NULL,
  `s_uid` varchar(150) DEFAULT NULL,
  `s_attach_type` varchar(5) DEFAULT NULL,
  `d_created_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `d_modified_date` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`n_file_id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_file_master`
--

LOCK TABLES `tbl_file_master` WRITE;
/*!40000 ALTER TABLE `tbl_file_master` DISABLE KEYS */;
INSERT INTO `tbl_file_master` VALUES (15,'6','54306307.pdf','1603022411170_54306307.pdf','./asset/upload/','admin@gmail.com',NULL,'2020-10-18 17:30:13','2020-10-18 17:30:13'),(16,'7','New_Doc_2020-01-03_18.15.42-2.jpg','1603350458621_New_Doc_2020-01-03_18.15.42-2.jpg','./asset/upload/','admin@gmail.com',NULL,'2020-10-22 12:37:42','2020-10-22 12:37:42'),(17,'5','Capture.PNG','1603350490233_Capture.PNG','./asset/upload/','admin@gmail.com',NULL,'2020-10-22 12:38:10','2020-10-22 12:38:10');
/*!40000 ALTER TABLE `tbl_file_master` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_group_master`
--

DROP TABLE IF EXISTS `tbl_group_master`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_group_master` (
  `n_group_id` int NOT NULL AUTO_INCREMENT,
  `s_group_id` varchar(45) DEFAULT NULL,
  `s_group_name` varchar(65) DEFAULT NULL,
  `s_year` varchar(10) DEFAULT NULL,
  `n_reporting_person` varchar(10) DEFAULT NULL,
  `s_created_by` varchar(50) DEFAULT NULL,
  `d_created_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `s_modified_by` varchar(50) DEFAULT NULL,
  `d_modified_date` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`n_group_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_group_master`
--

LOCK TABLES `tbl_group_master` WRITE;
/*!40000 ALTER TABLE `tbl_group_master` DISABLE KEYS */;
INSERT INTO `tbl_group_master` VALUES (7,'001','Class 8 division A','2020','3','admin@gmail.com','2020-10-22 13:59:55',NULL,'2020-10-26 13:48:27'),(8,'002','class 9  Division B','2020','4','admin@gmail.com','2020-10-22 14:00:27',NULL,'2020-10-26 13:48:27'),(9,'003','class 10 Division B','2020','4','admin@gmail.com','2020-10-22 14:00:27',NULL,'2020-10-22 14:00:27'),(10,'004','Parent Feed Back agains thier child','2021','6','admin@gmail.com','2021-07-13 11:32:52',NULL,'2021-07-13 11:32:52');
/*!40000 ALTER TABLE `tbl_group_master` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_location_admin`
--

DROP TABLE IF EXISTS `tbl_location_admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_location_admin` (
  `n_location_admin_id` int NOT NULL AUTO_INCREMENT,
  `n_location_id` int DEFAULT NULL,
  `n_company_id` int DEFAULT NULL,
  `n_staff_id` varchar(50) DEFAULT NULL,
  `s_first_name` varchar(50) DEFAULT NULL,
  `s_last_name` varchar(50) DEFAULT NULL,
  `s_address` varchar(50) DEFAULT NULL,
  `s_pincode` int DEFAULT NULL,
  `s_email` varchar(50) DEFAULT NULL,
  `s_password` varchar(50) DEFAULT NULL,
  `n_contact` int DEFAULT NULL,
  `n_delete` int DEFAULT '0',
  `s_user_name` varchar(50) DEFAULT NULL,
  `s_created_by` varchar(50) DEFAULT NULL,
  `d_created_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `s_modified_by` varchar(50) DEFAULT NULL,
  `d_modified_date` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`n_location_admin_id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_location_admin`
--

LOCK TABLES `tbl_location_admin` WRITE;
/*!40000 ALTER TABLE `tbl_location_admin` DISABLE KEYS */;
INSERT INTO `tbl_location_admin` VALUES (26,8,2,'asmita','asmita','raut','alibag',456565,'asmita@gmail.com','9916026d',767678767,1,'714b1bf4','admin@gmail.com','2020-10-27 17:47:20',NULL,'2020-10-27 17:47:20'),(27,16,5,'Kirti Yadav','Kirti','Yadav','Nerul',400705,'kirtiyadav0404@gmail.com','242c9457',908456732,1,'97bb10a4','admin@gmail.com','2021-07-13 11:26:20',NULL,'2021-07-13 11:26:20');
/*!40000 ALTER TABLE `tbl_location_admin` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tbl_location_admin_BEFORE_INSERT` BEFORE INSERT ON `tbl_location_admin` FOR EACH ROW BEGIN


declare password_ varchar(40);
declare username  varchar(100); 

/* SELECT concat('ganesh',date_format(now(), '%m%y'),UUID_SHORT()) as new_user ; */
/*set username=concat(new.s_first_name, date_format(now(), '%m%y'),UUID_SHORT()); */

/*set username=concat(new.s_first_name, new.s_last_name,UUID_SHORT());*/
set username=SUBSTRING(md5(concat(new.s_first_name, ' ',new.s_last_name,' ',new.s_email,' ',UUID())), 1, 8);


/*set password_=uuid();  */
set password_ =SUBSTRING(md5(concat(username, ' ',UUID())), 1, 8);


 IF (EXISTS(SELECT * FROM tbl_location_admin WHERE username = NEW.s_user_name)) 
 THEN

set username=SUBSTRING(md5(concat(new.s_first_name, ' ',new.s_last_name,' ',new.s_email,' ',now())), 1, 8);
set password_ =SUBSTRING(md5(concat(username, ' ',UUID())), 1, 8);

  END IF;

set new.s_user_name =username;

set new.s_password =password_;

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `tbl_location_admin_old`
--

DROP TABLE IF EXISTS `tbl_location_admin_old`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_location_admin_old` (
  `n_location_admin_id` int NOT NULL AUTO_INCREMENT,
  `n_location_id` int DEFAULT NULL,
  `n_company_id` int DEFAULT NULL,
  `n_satff_id` int DEFAULT NULL,
  `n_delete` int DEFAULT '0',
  `s_created_by` varchar(50) DEFAULT NULL,
  `d_created_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `s_modified_by` varchar(50) DEFAULT NULL,
  `d_modified_date` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`n_location_admin_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_location_admin_old`
--

LOCK TABLES `tbl_location_admin_old` WRITE;
/*!40000 ALTER TABLE `tbl_location_admin_old` DISABLE KEYS */;
INSERT INTO `tbl_location_admin_old` VALUES (2,2,2,7,0,'sa@gmail.com','2020-10-15 13:31:20','sa@gmail.com','2020-10-19 14:40:00');
/*!40000 ALTER TABLE `tbl_location_admin_old` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_location_master`
--

DROP TABLE IF EXISTS `tbl_location_master`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_location_master` (
  `n_location_id` int NOT NULL AUTO_INCREMENT,
  `s_address` varchar(250) DEFAULT NULL,
  `s_city` varchar(65) DEFAULT NULL,
  `s_area_code` varchar(45) DEFAULT NULL,
  `s_state` varchar(65) DEFAULT NULL,
  `s_country` varchar(65) DEFAULT NULL,
  `s_type` varchar(45) DEFAULT NULL,
  `n_company_id` varchar(45) DEFAULT NULL,
  `s_created_by` varchar(45) DEFAULT NULL,
  `s_updated_by` varchar(45) DEFAULT NULL,
  `d_created_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `d_updated_date` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`n_location_id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_location_master`
--

LOCK TABLES `tbl_location_master` WRITE;
/*!40000 ALTER TABLE `tbl_location_master` DISABLE KEYS */;
INSERT INTO `tbl_location_master` VALUES (5,'nerul','mumbai','west 234','maharashtra','india','Music','3','',NULL,'2020-10-18 17:04:43','2020-10-18 17:04:43'),(16,'RB2 ROAD','KURLA','400042','MAHARASHTRA','INDIA','Education','5','admin@gmail.com',NULL,'2021-07-13 11:25:01','2021-07-13 11:25:01');
/*!40000 ALTER TABLE `tbl_location_master` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_que_grp_transaction__`
--

DROP TABLE IF EXISTS `tbl_que_grp_transaction__`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_que_grp_transaction__` (
  `n_transaction_id` int NOT NULL AUTO_INCREMENT,
  `n_group_id` int DEFAULT NULL,
  `n_question_header_id` int DEFAULT NULL COMMENT 'template id',
  `n_assigner_staff_id` int DEFAULT NULL,
  `d_exam_date` datetime DEFAULT NULL,
  `t_exam_start_time` datetime DEFAULT NULL,
  `t_exam_end_time` datetime DEFAULT NULL,
  PRIMARY KEY (`n_transaction_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_que_grp_transaction__`
--

LOCK TABLES `tbl_que_grp_transaction__` WRITE;
/*!40000 ALTER TABLE `tbl_que_grp_transaction__` DISABLE KEYS */;
INSERT INTO `tbl_que_grp_transaction__` VALUES (1,7,1,5,'2020-10-17 13:34:52','2020-10-16 13:00:00','2020-10-16 16:00:00'),(2,8,1,5,'2020-10-17 13:34:52','2020-10-16 13:00:00','2020-10-16 16:00:00');
/*!40000 ALTER TABLE `tbl_que_grp_transaction__` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_question_attchment`
--

DROP TABLE IF EXISTS `tbl_question_attchment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_question_attchment` (
  `n_qmaster_id` int NOT NULL AUTO_INCREMENT,
  `n_qmst_id` int DEFAULT NULL,
  `s_og_name` varchar(250) DEFAULT NULL,
  `s_new_name` varchar(250) DEFAULT NULL,
  `s_path` varchar(150) DEFAULT NULL,
  `s_uid` varchar(150) DEFAULT NULL,
  `s_attach_type` varchar(20) DEFAULT NULL,
  `d_created_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `d_modified_date` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`n_qmaster_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_question_attchment`
--

LOCK TABLES `tbl_question_attchment` WRITE;
/*!40000 ALTER TABLE `tbl_question_attchment` DISABLE KEYS */;
INSERT INTO `tbl_question_attchment` VALUES (1,11,'1603467016992_tbl_project_router.csv',NULL,'/img/QuestionMaster/','admin','QMASTER','2020-10-23 21:00:20',NULL),(2,11,'1603470260598_tbl_project_router.csv',NULL,'/img/QuestionMaster/','admin','QMASTER','2020-10-23 21:54:25',NULL),(3,11,'1603470407658_tbl_project_router.json',NULL,'/img/QuestionMaster/','admin','QMASTER','2020-10-23 21:56:52',NULL),(4,1,'1604160817919_IMG_20200803_135422.jpg',NULL,'/img/QuestionMaster/','admin','QMASTER','2020-10-31 21:43:46',NULL),(5,1,'1604160917429_IMG_20200803_135422.jpg',NULL,'/img/QuestionMaster/','admin','QMASTER','2020-10-31 21:45:20',NULL);
/*!40000 ALTER TABLE `tbl_question_attchment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_question_header`
--

DROP TABLE IF EXISTS `tbl_question_header`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_question_header` (
  `n_question_header_id` int NOT NULL AUTO_INCREMENT,
  `n_total_marks` int DEFAULT NULL,
  `s_header_name` varchar(150) DEFAULT NULL,
  `s_decription` varchar(400) DEFAULT NULL,
  `s_subject` varchar(45) DEFAULT NULL,
  `s_duration` varchar(45) DEFAULT NULL,
  `n_delete` int DEFAULT '0' COMMENT '0 = not delete \n1 = Delete',
  `s_created_by` varchar(45) DEFAULT NULL,
  `d_created_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `s_updated_by` varchar(45) DEFAULT NULL,
  `d_updated_date` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`n_question_header_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_question_header`
--

LOCK TABLES `tbl_question_header` WRITE;
/*!40000 ALTER TABLE `tbl_question_header` DISABLE KEYS */;
INSERT INTO `tbl_question_header` VALUES (1,20,'Swami Vivekanand','ssci paper today test','Science','2',0,'admin@gmail.com',NULL,NULL,NULL),(3,80,'Student Survey','hindi paper','HIndi 1','3',0,'admin',NULL,'admin','2021-07-12 21:49:23'),(4,20,'Parent FeedBack','Parent Feed Back agains thier child','Child Performance','1',0,'admin','2021-07-13 11:33:50',NULL,NULL);
/*!40000 ALTER TABLE `tbl_question_header` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_question_master`
--

DROP TABLE IF EXISTS `tbl_question_master`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_question_master` (
  `n_question_id` int NOT NULL AUTO_INCREMENT,
  `n_section_id` int DEFAULT NULL,
  `s_question_desc` varchar(500) DEFAULT NULL,
  `s_question_type` varchar(45) DEFAULT NULL,
  `s_default_value` varchar(150) DEFAULT NULL,
  `s_correct_ans` text,
  `s_created_by` varchar(65) DEFAULT NULL,
  `d_created_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `s_updated_by` varchar(65) DEFAULT NULL,
  `d_updated_date` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`n_question_id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_question_master`
--

LOCK TABLES `tbl_question_master` WRITE;
/*!40000 ALTER TABLE `tbl_question_master` DISABLE KEYS */;
INSERT INTO `tbl_question_master` VALUES (1,11,'we breath in?','RADIO','gas,carbon dioxide,oxygen,wind','oxygen','admin','2020-10-23 21:02:08',NULL,'2020-10-23 22:29:52'),(2,11,'fillinvf j nkln ','RADIO','sheep,rabbit,frog,giraffe,cat','rabbit','admin','2020-10-23 21:54:25',NULL,'2020-10-23 22:29:53'),(3,11,'we cannot see at ?','RADIO','closing your eyes,no light,dark,bright,morning','closing your eyes','admin','2020-10-23 21:56:52',NULL,'2020-10-23 22:31:47'),(4,11,'Why is the sky blue?','TEXT','','The atmosphere (i.e., air, one of the four elements) is a mixture of gasses, mostly nitrogen and oxygen.','admin','2020-10-23 22:18:25',NULL,'2020-10-23 22:28:37'),(5,10,'What are the names of people attending?','TEXT','','','admin','2020-10-23 22:35:06',NULL,NULL),(8,10,'Comments and/or questions ?','TEXTAREA','','','admin','2020-10-24 19:46:41',NULL,NULL),(9,1,'ruyru uyyu tuytu','TEXT','qrf rwe','dfwef','admin','2020-10-31 21:43:46',NULL,NULL),(13,1,'ruyru uyyu tuytu','TEXT','qrf rwe','dfwef','admin','2020-10-31 21:43:52',NULL,NULL),(15,1,' gigiu iu','RADIO','rew,ree,retgt,vr','vr','admin','2020-10-31 21:45:20',NULL,NULL),(16,1,' gigiu iu','CHECKBOX','rew,ree,retgt,vr','vr','admin','2020-10-31 21:45:31',NULL,NULL),(17,2,' KJlv grd JHUG','TEXTAREA','','TBUIUTUFILTVUFU GIUG IU GGK GGUGKG,JGU','admin','2020-10-31 21:45:57',NULL,NULL),(18,2,' KJlv grd JHUG','TEXT','','TBUIUTUFIVD GDGLTVUFU GIUG IU GGK GGUGKG,JGU','admin','2020-10-31 21:46:04',NULL,NULL),(20,12,'In your opinion, to what extent do you think you can help your child develop good relationships with kids in a similar age group?','CHECKBOX','A lot,Somewhat,A little,Not at all','A lot,Somewhat,A little,Not at all','admin','2021-07-13 11:45:59',NULL,NULL),(21,12,'On a scale of 1-5, please rate yourself for the ability to make decisions about your child’s education. (1 being the lowest and 5 being the highest)','RADIO','1,2,3,4,5','1,2,3,4,5','admin','2021-07-13 11:46:59',NULL,NULL),(22,12,'On a scale of 1 to 5, how much do you think you can help in motivating your child? (1 being the lowest and 5 being the highest)','RADIO','1,2,3,4,5','1,2,3,4,5','admin','2021-07-13 11:47:50',NULL,NULL),(23,12,'To what level do you agree, that you are good at building a healthy relationship and communicating with other parents?','RADIO','Completely agree, Somewhat agree, Neutral, Somewhat disagree, Completely disagree','','admin','2021-07-13 11:49:20',NULL,NULL),(24,12,'In your opinion, to what level do you agree that you are capable of dealing with your child’s emotions appropriately?','RADIO','Extremely capable,Very capable,Somewhat capable,Don’t know,Somewhat incapable,Very incapable,Extremely incapable,','','admin','2021-07-13 11:50:17',NULL,NULL);
/*!40000 ALTER TABLE `tbl_question_master` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tbl_question_master_AFTER_INSERT` AFTER INSERT ON `tbl_question_master` FOR EACH ROW BEGIN


insert into tbl_question_attchment (n_qmst_id,s_og_name,s_path,s_uid,s_attach_type) 
select n_tbl_ai_id,s_og_name,s_path,s_uid,s_attach_type from tbl_temp_file
where s_uid=new.s_created_by;

delete from tbl_temp_file where  s_uid=new.s_created_by;

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `tbl_section_master`
--

DROP TABLE IF EXISTS `tbl_section_master`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_section_master` (
  `n_section_id` int NOT NULL AUTO_INCREMENT,
  `n_question_header_id` varchar(45) DEFAULT NULL,
  `s_sectin_desc` varchar(200) DEFAULT NULL,
  `n_each_question_marks` int DEFAULT NULL,
  `n_total_no_of_question` int DEFAULT NULL,
  `n_attempt_question` int DEFAULT NULL,
  `n_seq` int DEFAULT NULL,
  PRIMARY KEY (`n_section_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_section_master`
--

LOCK TABLES `tbl_section_master` WRITE;
/*!40000 ALTER TABLE `tbl_section_master` DISABLE KEYS */;
INSERT INTO `tbl_section_master` VALUES (1,'1','Attempt Any 2',2,4,2,1),(2,'1','1 sentance answer Attempt Any 3',2,6,3,2),(10,'3','Fill In the blanks',1,6,3,6),(11,'1','Any the foloowing question',2,4,4,2),(12,'4','Parent survey questions for self-assessment',5,5,NULL,1);
/*!40000 ALTER TABLE `tbl_section_master` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_seq`
--

DROP TABLE IF EXISTS `tbl_seq`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_seq` (
  `s_seq_no` int NOT NULL,
  `s_table_name` varchar(55) NOT NULL,
  `s_month` int NOT NULL,
  `s_year` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_seq`
--

LOCK TABLES `tbl_seq` WRITE;
/*!40000 ALTER TABLE `tbl_seq` DISABLE KEYS */;
INSERT INTO `tbl_seq` VALUES (1,'tbl_staff_member',10,2020);
/*!40000 ALTER TABLE `tbl_seq` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_session`
--

DROP TABLE IF EXISTS `tbl_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_session` (
  `n_session_id` int NOT NULL AUTO_INCREMENT,
  `n_group_id` varchar(50) NOT NULL,
  `n_template_id` varchar(45) NOT NULL,
  `s_date` varchar(45) DEFAULT NULL,
  `s_time` varchar(45) DEFAULT NULL,
  `e_time` varchar(45) DEFAULT NULL,
  `n_done` int DEFAULT '0' COMMENT '0 = not start yet\n1 = Start \n2 = complet or done',
  `s_created_by` varchar(45) DEFAULT NULL,
  `s_modified_by` varchar(45) DEFAULT NULL,
  `d_created_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `d_modified_date` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`n_session_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_session`
--

LOCK TABLES `tbl_session` WRITE;
/*!40000 ALTER TABLE `tbl_session` DISABLE KEYS */;
INSERT INTO `tbl_session` VALUES (4,'1,2','3','2020-10-21','12:22 am','12:27 am',2,'staff1@gmail.com','kenny@gmail.com','2020-10-19 20:00:31','2020-10-25 16:52:43'),(7,'7,8','3','2020-10-24','7:49 pm','7:49 pm',2,'staff1@gmail.com',NULL,'2020-10-21 19:43:38','2020-10-26 13:56:43'),(8,'7,8','3','2020-10-22','7:50 pm','10:59 pm',2,'staff1@gmail.com',NULL,'2020-10-21 19:44:22','2020-10-26 13:56:43'),(9,'8','3','2020-10-30','7:49 pm','7:51 pm',0,'staff1@gmail.com',NULL,'2020-10-21 19:45:38','2020-10-30 11:53:25'),(10,'7,8,9','1','2020-10-21','7:48 pm','7:53 pm',2,'staff1@gmail.com',NULL,'2020-10-21 19:48:38','2020-10-26 13:56:43'),(11,'7,8,9','1','2020-10-30','8:15 am','8:55 pm',1,'staff1@gmail.com',NULL,'2020-10-21 20:49:52','2020-10-30 11:51:01'),(12,'10','4','2021-07-13','12:40 pm','2:00 pm',1,'admin@gmail.com',NULL,'2021-07-13 11:51:36','2021-07-13 12:40:00');
/*!40000 ALTER TABLE `tbl_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_staff_location`
--

DROP TABLE IF EXISTS `tbl_staff_location`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_staff_location` (
  `n_staff_location_id` int NOT NULL AUTO_INCREMENT,
  `n_location_id` varchar(45) NOT NULL,
  `n_staff_id` varchar(45) NOT NULL,
  `s_created_by` varchar(45) DEFAULT NULL,
  `s_updated_by` varchar(45) DEFAULT NULL,
  `d_created_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `d_updated_date` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`n_staff_location_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_staff_location`
--

LOCK TABLES `tbl_staff_location` WRITE;
/*!40000 ALTER TABLE `tbl_staff_location` DISABLE KEYS */;
INSERT INTO `tbl_staff_location` VALUES (11,'5','3','admin@gmail.com',NULL,'2020-10-22 13:25:39','2020-10-22 13:25:39'),(13,'16','6','admin@gmail.com',NULL,'2021-07-13 11:31:54','2021-07-13 11:31:54');
/*!40000 ALTER TABLE `tbl_staff_location` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_staff_member`
--

DROP TABLE IF EXISTS `tbl_staff_member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_staff_member` (
  `n_staff_id` int NOT NULL AUTO_INCREMENT,
  `n_company_id` varchar(45) DEFAULT NULL,
  `s_first_name` varchar(45) DEFAULT NULL,
  `s_last_name` varchar(45) DEFAULT NULL,
  `s_email` varchar(45) DEFAULT NULL,
  `s_address` varchar(45) DEFAULT NULL,
  `s_pincode` varchar(45) DEFAULT NULL,
  `n_contact` varchar(20) DEFAULT NULL,
  `s_user_id` varchar(45) DEFAULT NULL,
  `s_password` varchar(45) DEFAULT NULL,
  `n_delete` int DEFAULT NULL,
  `s_created_by` varchar(45) DEFAULT NULL,
  `s_updated_by` varchar(45) DEFAULT NULL,
  `d_created_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `d_updated_date` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `n_img_path` varchar(45) DEFAULT NULL,
  `n_status` int DEFAULT NULL,
  PRIMARY KEY (`n_staff_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_staff_member`
--

LOCK TABLES `tbl_staff_member` WRITE;
/*!40000 ALTER TABLE `tbl_staff_member` DISABLE KEYS */;
INSERT INTO `tbl_staff_member` VALUES (3,'2','john','kenny','kenny@gmail.com','nerul','98765','765432','st1','123456',0,'admin@gmail.com','admin@gmail.com','2020-10-22 11:40:58','2021-07-12 20:57:48','/img/avatars/1626102601343-admin.png',1),(4,'2','abc','xyz','xyz@gmail.com','thane wets','8765','87654','e6b6f6f9','e68434cd',NULL,'admin@gmail.com','admin@gmail.com','2020-10-22 12:26:46','2020-10-22 12:38:36',NULL,1),(5,'2','ganesh','ambrulkar','ganesh@gmail.com','ghansoli','900898','9876543219','e09f451e','07373f20',NULL,'admin@gmail.com',NULL,'2020-10-22 13:17:16','2020-10-22 13:17:16',NULL,1),(6,'5','Kirti','Yadav','kirti@gmail.com','Nerul','400706','9087456231','89791fc9','f5c82898',NULL,'admin@gmail.com',NULL,'2021-07-13 11:28:53','2021-07-13 11:28:53',NULL,1);
/*!40000 ALTER TABLE `tbl_staff_member` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tbl_staff_member_BEFORE_INSERT` BEFORE INSERT ON `tbl_staff_member` FOR EACH ROW BEGIN
declare password_ varchar(40);
declare username  varchar(100); 

/* SELECT concat('ganesh',date_format(now(), '%m%y'),UUID_SHORT()) as new_user ; */
/*set username=concat(new.s_first_name, date_format(now(), '%m%y'),UUID_SHORT()); */

set username=concat(new.s_first_name, new.s_last_name,UUID_SHORT());
set username=SUBSTRING(md5(concat(new.s_first_name, ' ',new.s_last_name,' ',new.s_email,' ',UUID())), 1, 8);


/*set password_=uuid();  */
set password_ =SUBSTRING(md5(concat(username, ' ',UUID())), 1, 8);


 IF (EXISTS(SELECT * FROM tbl_staff_member WHERE username = NEW.s_user_id)) 
 THEN

set username=SUBSTRING(md5(concat(new.s_first_name, ' ',new.s_last_name,' ',new.s_email,' ',now())), 1, 8);
set password_ =SUBSTRING(md5(concat(username, ' ',UUID())), 1, 8);

  END IF;

set new.s_user_id =username;

set new.s_password =password_;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `tbl_temp_file`
--

DROP TABLE IF EXISTS `tbl_temp_file`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_temp_file` (
  `n_temp_id` int NOT NULL AUTO_INCREMENT,
  `s_og_name` varchar(250) DEFAULT NULL,
  `s_new_name` varchar(250) DEFAULT NULL,
  `s_path` varchar(150) DEFAULT NULL,
  `s_attach_type` varchar(50) DEFAULT NULL,
  `s_uid` varchar(45) DEFAULT NULL,
  `n_tbl_ai_id` int DEFAULT NULL,
  PRIMARY KEY (`n_temp_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_temp_file`
--

LOCK TABLES `tbl_temp_file` WRITE;
/*!40000 ALTER TABLE `tbl_temp_file` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_temp_file` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `v_tbl_login`
--

DROP TABLE IF EXISTS `v_tbl_login`;
/*!50001 DROP VIEW IF EXISTS `v_tbl_login`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `v_tbl_login` AS SELECT 
 1 AS `fullname`,
 1 AS `s_email`,
 1 AS `n_contact`,
 1 AS `s_user_id`,
 1 AS `s_password`,
 1 AS `n_delete`,
 1 AS `role`*/;
SET character_set_client = @saved_cs_client;

--
-- Dumping routines for database 'db_tutor'
--
/*!50003 DROP FUNCTION IF EXISTS `getgroupname` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `getgroupname`(group_ids varchar(600)) RETURNS varchar(800) CHARSET latin1
BEGIN
declare group_name varchar(200);
select group_concat(s_group_name) into group_name from tbl_group_master where find_in_set(n_group_id,group_ids);

RETURN group_name;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `getlocation` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `getlocation`(id int(11)) RETURNS varchar(150) CHARSET latin1
BEGIN
declare location_name varchar(150);
	select CONCAT(s_address,",",s_city,",",s_area_code,",",s_state,",",s_country,",",s_type)into location_name from tbl_location_master where n_location_id=id;
    
RETURN location_name;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `getstaff` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `getstaff`(id int(11)) RETURNS varchar(150) CHARSET latin1
BEGIN
declare staff_data varchar(150);
	/*select staff_name into staff_name from tbl_staff_member where n_staff_id=id;*/
    select CONCAT(s_first_name,",",s_email)into staff_data from tbl_staff_member where n_staff_id=id;
    
RETURN staff_data;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `get_company_name` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `get_company_name`(comapnayname varchar(200)) RETURNS varchar(45) CHARSET latin1
BEGIN
declare company_name varchar(45);


	select s_company_name into company_name from tbl_company_master where n_company_id = comapnayname;


RETURN company_name;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `get_que_template_detail` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `get_que_template_detail`(template_id int(11)) RETURNS varchar(500) CHARSET latin1
BEGIN
declare details varchar(500); 
	if template_id is not null then 
		select CONCAT(s_header_name,'|',s_subject,'|',n_total_marks,'|',s_duration) into details from tbl_question_header where n_question_header_id = template_id;
	else 
		 set details = 'WRNTEMPID';
	end if;
RETURN details;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `get_que_tem_id_by_ses_id` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `get_que_tem_id_by_ses_id`(session_id int(11)) RETURNS int
BEGIN

 declare qid int(11) default 0;
 if(session_id) then
	select n_template_id into qid from tbl_session where n_session_id = session_id;
    SET  qid = qid;
 end if;
RETURN qid;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `v_tbl_login`
--

/*!50001 DROP VIEW IF EXISTS `v_tbl_login`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_tbl_login` AS select 'admin' AS `fullname`,'admin@gmail.com' AS `s_email`,'8286736553' AS `n_contact`,'admin' AS `s_user_id`,'123456' AS `s_password`,0 AS `n_delete`,'ADMIN' AS `role` union all select concat(`a`.`s_first_name`,' ',`a`.`s_last_name`) AS `fullname`,`a`.`s_email` AS `s_email`,`a`.`n_contact` AS `n_contact`,`a`.`s_user_id` AS `s_user_id`,`a`.`s_password` AS `s_password`,`a`.`n_delete` AS `n_delete`,'TUTOR' AS `role` from `tbl_staff_member` `a` union all select concat(`tbl_child_master`.`s_first_name`,' ',`tbl_child_master`.`s_last_name`) AS `fullname`,`tbl_child_master`.`s_email` AS `s_email`,`tbl_child_master`.`n_contact` AS `n_contact`,`tbl_child_master`.`s_user_id` AS `s_user_id`,`tbl_child_master`.`s_password` AS `s_password`,`tbl_child_master`.`n_delete` AS `n_delete`,'CHILD' AS `role` from `tbl_child_master` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-09-04 13:13:20
