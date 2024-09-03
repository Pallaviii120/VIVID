CREATE DATABASE  IF NOT EXISTS `db_ess_ultratech` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `db_ess_ultratech`;
-- MySQL dump 10.13  Distrib 8.0.16, for Win64 (x86_64)
--
-- Host: localhost    Database: db_ess_ultratech
-- ------------------------------------------------------
-- Server version	5.6.44-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
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
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tbl_assign_leave` (
  `n_al_id` int(11) NOT NULL AUTO_INCREMENT,
  `s_em_code` varchar(64) DEFAULT NULL,
  `n_type_id` int(11) NOT NULL,
  `n_assiged_days` varchar(50) DEFAULT '0',
  `n_consumed_days` varchar(50) DEFAULT '0',
  `f_dateyear` varchar(64) DEFAULT NULL,
  `d_created_datetime` datetime DEFAULT CURRENT_TIMESTAMP,
  `d_updated_datetime` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`n_al_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_assign_leave`
--

LOCK TABLES `tbl_assign_leave` WRITE;
/*!40000 ALTER TABLE `tbl_assign_leave` DISABLE KEYS */;
INSERT INTO `tbl_assign_leave` VALUES (1,'EMP01',1,'26','1','2021-22','2021-08-26 17:17:47','2021-09-12 12:52:34'),(2,'EMP01',2,'24','0','2021-22','2021-08-26 17:17:47','2021-09-24 18:13:05'),(3,'EMP02',1,'26','0','2021-22','2021-08-26 17:17:47','2021-09-12 12:31:27'),(4,'EMP02',2,'24','0','2021-22','2021-08-26 17:17:47','2021-09-07 21:58:25'),(5,'EMP03',1,'26','0','2021-22','2021-08-26 17:17:47','2021-09-07 21:58:25'),(6,'EMP03',2,'24','0','2021-22','2021-08-26 17:17:47','2021-09-07 21:58:25'),(7,'test22',1,'10','0','2021-22','2021-09-09 15:00:49','2021-09-09 15:00:59');
/*!40000 ALTER TABLE `tbl_assign_leave` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_attachment`
--

DROP TABLE IF EXISTS `tbl_attachment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tbl_attachment` (
  `n_id` int(11) NOT NULL AUTO_INCREMENT,
  `s_ogi_name` varchar(500) DEFAULT NULL,
  `s_new_name` varchar(500) DEFAULT NULL,
  `s_path` varchar(45) DEFAULT NULL,
  `s_em_code` varchar(50) DEFAULT NULL,
  `s_attach_type` varchar(45) DEFAULT NULL,
  `n_task_id` int(11) NOT NULL,
  PRIMARY KEY (`n_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_attachment`
--

LOCK TABLES `tbl_attachment` WRITE;
/*!40000 ALTER TABLE `tbl_attachment` DISABLE KEYS */;
INSERT INTO `tbl_attachment` VALUES (1,'certificate.pdf','1631872041619_certificate.pdf','/task_attach','EMP02','TASK_FILE',8),(2,'db_cl.sql','1631872224145_db_cl.sql','/task_attach','EMP02','TASK_FILE',9),(3,'db_ess_ultratech.sql','1631872289473_db_ess_ultratech.sql','/task_attach','EMP02','TASK_FILE',9),(5,'db_tutor.sql','1631877268123_db_tutor.sql','/task_attach','EMP01','TASK_FILE',10),(6,'bpmn.sql','1632071481379_bpmn.sql','/task_attach','EMP01','TASK_FILE',11),(7,'db_hk.sql','1632071676996_db_hk.sql','/task_attach','EMP02','TASK_FILE',12),(8,'icehrm.sql','1632075046864_icehrm.sql','/task_attach','EMP02','TASK_FILE',14),(9,'certificate.pdf','1632122466102_certificate.pdf','/task_attach','EMP01','TASK_FILE',15),(10,'.babelrc.js','1632122530145_.babelrc.js','/task_attach','EMP01','TASK_FILE',16),(11,'LICENSE','1632123656076_LICENSE','/task_attach','EMP02','TASK_FILE',19);
/*!40000 ALTER TABLE `tbl_attachment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_attendance`
--

DROP TABLE IF EXISTS `tbl_attendance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tbl_attendance` (
  `n_att_id` int(11) NOT NULL AUTO_INCREMENT,
  `s_em_code` varchar(64) DEFAULT NULL,
  `s_shift_id` varchar(10) DEFAULT NULL,
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
  `s_work_type` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`n_att_id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_attendance`
--

LOCK TABLES `tbl_attendance` WRITE;
/*!40000 ALTER TABLE `tbl_attendance` DISABLE KEYS */;
INSERT INTO `tbl_attendance` VALUES (9,'EMP01','A','2021-09-12','17:27','17:28','08:00:00',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2021-09-12 17:27:46','2021-09-12 17:28:42','WFH'),(10,'EMP01','A','2021-09-17','20:01',NULL,'08:00:00',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2021-09-17 20:01:02','2021-09-17 20:01:02','WFH'),(11,'EMP01','A','2021-09-18','10:48',NULL,'08:00:00',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2021-09-18 10:48:49','2021-09-18 10:48:49','WFH'),(12,'EMP02','A','2021-09-18','11:57',NULL,'08:00:00',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2021-09-18 11:57:41','2021-09-18 11:57:41','WFH'),(13,'EMP05',NULL,'2021-09-20','12:42',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2021-09-20 12:42:48','2021-09-20 12:42:48','WFH'),(14,'EMP02','A','2021-09-20','13:22',NULL,'08:00:00',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2021-09-20 13:22:20','2021-09-20 13:22:20','WFH'),(15,'EMP01','A','2021-09-20','14:14','18:27','08:00:00','04:13:00',NULL,'434 minute','207 minute','0 minute','A','P','HD','2021-09-20 14:14:16','2021-09-20 18:27:11','WFH'),(16,'EMP01','A','2021-09-21','11:28',NULL,'08:00:00',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2021-09-21 11:28:17','2021-09-21 11:28:17','WFH'),(17,'EMP03','B','2021-09-24','17:37',NULL,'08:00:00',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2021-09-24 17:37:16','2021-09-24 17:37:16','WFH'),(18,'EMP01','A','2021-09-24','19:51',NULL,'08:00:00',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2021-09-24 19:51:37','2021-09-24 19:51:37','WFH'),(19,'EMP01','A','2021-09-25','13:04',NULL,'08:00:00',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2021-09-25 13:04:44','2021-09-25 13:04:44','WFH'),(20,'EMP03','B','2021-09-25','16:49',NULL,'08:00:00',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2021-09-25 16:49:48','2021-09-25 16:49:48','WFH'),(21,'EMP03','B','2021-09-27','11:26',NULL,'08:00:00',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2021-09-27 11:26:21','2021-09-27 11:26:21','WFH'),(22,'EMP03','B','2021-09-28','15:51',NULL,'08:00:00',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2021-09-28 15:51:04','2021-09-28 15:51:04','WFH');
/*!40000 ALTER TABLE `tbl_attendance` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `db_ess_ultratech`.`tbl_attendance_BEFORE_INSERT` BEFORE INSERT ON `tbl_attendance` FOR EACH ROW
BEGIN
declare inhour integer(4);
declare outhour integer(4);
declare indatetime varchar(30);
declare outdate varchar(30);
declare outdatetime varchar(30);
declare actualwork varchar (10); 
declare attenddate varchar(30);

declare shiftid varchar(11);
declare shinhour integer(4);
declare shouthour integer(4);
declare sh_strt_time varchar(10);
declare sh_end_time varchar(10);
declare sh_gross_strttym varchar(10);
declare sh_gross_endtym varchar(10);
declare shoutdate varchar(30);
declare shoutdatetime varchar(30);
declare shindatetime varchar(30);
declare worktime varchar (10); 
declare eout integer(10);
declare lin integer(10);
declare glin integer(10);
declare geout integer(10);
declare overtym integer(10);
declare grossindtym varchar(30);
declare grossoutdtym varchar(30);
declare minwork integer(4);
#if new.s_status = 'E' THEN
#set new.s_status='P';
#end If;
if new.t_signin_time is not null and new.t_signin_time !='' and upper(new.t_signin_time) !='NULL' and new.t_signin_time !='null' and new.t_signout_time is not null and new.t_signout_time != '' and upper(new.t_signout_time) !='NULL' and new.t_signout_time !='null' THEN
select hour(new.t_signin_time),hour(new.t_signout_time) into inhour,outhour;

SELECT DATE_FORMAT(STR_TO_DATE(new.d_atten_date, '%Y-%m-%d'), '%Y-%m-%d') into attenddate;
if inhour > 12 and outhour < 12 then
SELECT DATE_ADD(attenddate, INTERVAL 1 DAY) into outdate;
else
set outdate = attenddate;
end if;

SELECT STR_TO_DATE(concat(attenddate,' ',new.t_signin_time),'%Y-%m-%d %H:%i') into indatetime;

SELECT STR_TO_DATE(concat(outdate,' ',new.t_signout_time),'%Y-%m-%d %H:%i') into outdatetime;

select TIMEDIFF(outdatetime,indatetime) into actualwork;
set new.s_actual_working_hour=actualwork;
#-------------------------------------------------------------------------------------
#for fetching daily working time
select n_shift_id into shiftid from tbl_emp_shift where n_emp_shift_id = (select max(n_emp_shift_id) from tbl_emp_shift where s_em_code=new.s_em_code);
if shiftid is not null then

set new.s_shift_id=shiftid;

select t_start_time,t_end_time,s_gross_start_time,s_gross_end_time,s_min_work_hours into sh_strt_time,sh_end_time,sh_gross_strttym,sh_gross_endtym,minwork from tbl_shift where s_shift=shiftid;
else
SELECT t_start_time,t_end_time,s_gross_start_time,s_gross_end_time,s_min_work_hours into sh_strt_time,sh_end_time,sh_gross_strttym,sh_gross_endtym,minwork FROM tbl_shift GROUP BY ABS(Time_to_sec(t_start_time)) ORDER BY MIN(ABS(ABS(Time_to_sec(t_start_time))  - Time_to_sec(new.t_signin_time))) LIMIT 1;
end if;

select hour(sh_strt_time),hour(sh_end_time) into shinhour,shouthour;
if shinhour > 12 and shouthour < 12 then
SELECT DATE_ADD(attenddate, INTERVAL 1 DAY) into shoutdate;
else
set shoutdate = attenddate;
end if;
SELECT STR_TO_DATE(concat(attenddate,' ',sh_strt_time),'%Y-%m-%d %H:%i') into shindatetime;
SELECT STR_TO_DATE(concat(shoutdate,' ',sh_end_time),'%Y-%m-%d %H:%i') into shoutdatetime;
select TIMEDIFF(shoutdatetime,shindatetime) into worktime;

set new.s_daily_working_hour=worktime;
#-----------------------------------------------------------------------------------

#grosstime
select date_add(shindatetime,interval sh_gross_strttym minute) into grossindtym;
select date_add(shoutdatetime,interval sh_gross_endtym minute) into grossoutdtym;

#overtime;
SELECT round((TIME_TO_SEC(actualwork) - TIME_TO_SEC(worktime))/60,2 ) into overtym;
if overtym < 1 then
set new.s_overtime="0 minute";
else
set new.s_overtime=concat(overtym," minute");
end if;
 
#----------------------------------------------------------------------------------------

select TIMESTAMPDIFF(MINUTE,indatetime,shindatetime) into lin;
 if lin > 1 then
	# if not minus then before the start time 
	set new.s_lateIn =concat('-',lin," minute"); #comes early
	set new.s_first_half="P";
else 
	# if minus then after the start time 
	set new.s_lateIn=concat(abs(lin)," minute");  #comes late
    select TIMESTAMPDIFF(MINUTE,shindatetime,indatetime) into glin;
    if glin <= sh_gross_strttym then
		set new.s_first_half="P";
	else
		set new.s_first_half="A";
    end if;
    
end if;
#----------------------------------------------------------------------------------------

select TIMESTAMPDIFF(MINUTE,outdatetime,shoutdatetime) into eout;
 if eout > 1 then
	# if not minus then before the start time 
	set new.s_earlyOut =concat('-',eout," minute"); #out early
    
    select TIMESTAMPDIFF(MINUTE,outdatetime,shoutdatetime) into geout;
	if geout <= sh_gross_endtym then
		set new.s_scound_half="P";
	else
		set new.s_scound_half="A";
    end if;
else 
	# if minus then after the start time 
	set new.s_earlyOut=concat(abs(eout)," minute");  #out late 
    set new.s_scound_half="P";
    
    
end if;
if new.s_first_half = 'P' and new.s_scound_half= 'P' then
	set new.s_status='P';
elseif (new.s_first_half = 'P' and new.s_scound_half= 'A') or (new.s_first_half = 'A' and new.s_scound_half= 'P') then
	set new.s_status='HD';
elseif new.s_first_half = 'A' and new.s_scound_half= 'A' then
	set new.s_status='A';
end if;
end if;


END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `db_ess_ultratech`.`tbl_attendance_AFTER_INSERT` AFTER INSERT ON `tbl_attendance` FOR EACH ROW
BEGIN

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `db_ess_ultratech`.`tbl_attendance_BEFORE_UPDATE` BEFORE UPDATE ON `tbl_attendance` FOR EACH ROW
BEGIN
declare inhour integer(4);
declare outhour integer(4);
declare indatetime varchar(30);
declare outdate varchar(30);
declare outdatetime varchar(30);
declare actualwork varchar (10); 
declare attenddate varchar(30);

declare shiftid varchar(11);
declare shinhour integer(4);
declare shouthour integer(4);
declare sh_strt_time varchar(10);
declare sh_end_time varchar(10);
declare sh_gross_strttym varchar(10);
declare sh_gross_endtym varchar(10);
declare shoutdate varchar(30);
declare shoutdatetime varchar(30);
declare shindatetime varchar(30);
declare worktime varchar (10); 
declare eout integer(10);
declare lin integer(10);
declare glin integer(10);
declare geout integer(10);
declare overtym integer(10);
declare grossindtym varchar(30);
declare grossoutdtym varchar(30);
declare minwork integer(4);

if new.s_status = 'E' THEN
set new.s_status='P';
end If;

if new.t_signin_time is not null and new.t_signin_time !='' and upper(new.t_signin_time) !='NULL' and new.t_signin_time !='null' and new.t_signout_time is not null and new.t_signout_time != '' and upper(new.t_signout_time) !='NULL' and new.t_signout_time !='null' THEN

select hour(new.t_signin_time),hour(new.t_signout_time) into inhour,outhour;

SELECT DATE_FORMAT(STR_TO_DATE(new.d_atten_date, '%Y-%m-%d'), '%Y-%m-%d') into attenddate;
if inhour > 12 and outhour < 12 then
SELECT DATE_ADD(attenddate, INTERVAL 1 DAY) into outdate;
else
set outdate = attenddate;
end if;

SELECT STR_TO_DATE(concat(attenddate,' ',new.t_signin_time),'%Y-%m-%d %H:%i') into indatetime;

SELECT STR_TO_DATE(concat(outdate,' ',new.t_signout_time),'%Y-%m-%d %H:%i') into outdatetime;

select TIMEDIFF(outdatetime,indatetime) into actualwork;
set new.s_actual_working_hour=actualwork;
#-------------------------------------------------------------------------------------
#for fetching daily working time
select n_shift_id into shiftid from tbl_emp_shift where n_emp_shift_id = (select max(n_emp_shift_id) from tbl_emp_shift where s_em_code=new.s_em_code);
if shiftid is not null then

set new.s_shift_id=shiftid;

select t_start_time,t_end_time,s_gross_start_time,s_gross_end_time,s_min_work_hours into sh_strt_time,sh_end_time,sh_gross_strttym,sh_gross_endtym,minwork from tbl_shift where s_shift=shiftid;
else
SELECT t_start_time,t_end_time,s_gross_start_time,s_gross_end_time,s_min_work_hours into sh_strt_time,sh_end_time,sh_gross_strttym,sh_gross_endtym,minwork FROM tbl_shift GROUP BY ABS(Time_to_sec(t_start_time)) ORDER BY MIN(ABS(ABS(Time_to_sec(t_start_time))  - Time_to_sec(new.t_signin_time))) LIMIT 1;
end if;

select hour(sh_strt_time),hour(sh_end_time) into shinhour,shouthour;
if shinhour > 12 and shouthour < 12 then
SELECT DATE_ADD(attenddate, INTERVAL 1 DAY) into shoutdate;
else
set shoutdate = attenddate;
end if;
SELECT STR_TO_DATE(concat(attenddate,' ',sh_strt_time),'%Y-%m-%d %H:%i') into shindatetime;
SELECT STR_TO_DATE(concat(shoutdate,' ',sh_end_time),'%Y-%m-%d %H:%i') into shoutdatetime;
select TIMEDIFF(shoutdatetime,shindatetime) into worktime;

set new.s_daily_working_hour=worktime;
#-----------------------------------------------------------------------------------

#grosstime
select date_add(shindatetime,interval sh_gross_strttym minute) into grossindtym;
select date_add(shoutdatetime,interval sh_gross_endtym minute) into grossoutdtym;

#overtime;
SELECT round((TIME_TO_SEC(actualwork) - TIME_TO_SEC(worktime))/60,2 ) into overtym;
if overtym < 1 then
set new.s_overtime="0 minute";
else
set new.s_overtime=concat(overtym," minute");
end if;
 
#----------------------------------------------------------------------------------------

select TIMESTAMPDIFF(MINUTE,indatetime,shindatetime) into lin;
 if lin > 1 then
	# if not minus then before the start time 
	set new.s_lateIn =concat('-',lin," minute"); #comes early
	set new.s_first_half="P";
else 
	# if minus then after the start time 
	set new.s_lateIn=concat(abs(lin)," minute");  #comes late
    select TIMESTAMPDIFF(MINUTE,shindatetime,indatetime) into glin;
    if glin <= sh_gross_strttym then
		set new.s_first_half="P";
	else
		set new.s_first_half="A";
    end if;
    
end if;
#----------------------------------------------------------------------------------------

select TIMESTAMPDIFF(MINUTE,outdatetime,shoutdatetime) into eout;
 if eout > 1 then
	# if not minus then before the start time 
	set new.s_earlyOut =concat('-',eout," minute"); #out early
    
    select TIMESTAMPDIFF(MINUTE,outdatetime,shoutdatetime) into geout;
	if geout <= sh_gross_endtym then
		set new.s_scound_half="P";
	else
		set new.s_scound_half="A";
    end if;
else 
	# if minus then after the start time 
	set new.s_earlyOut=concat(abs(eout)," minute");  #out late 
    set new.s_scound_half="P";
    
    
end if;
if new.s_first_half = 'P' and new.s_scound_half= 'P' then
	set new.s_status='P';
elseif (new.s_first_half = 'P' and new.s_scound_half= 'A') or (new.s_first_half = 'A' and new.s_scound_half= 'P') then
	set new.s_status='HD';
elseif new.s_first_half = 'A' and new.s_scound_half= 'A' then
	set new.s_status='A';
end if;
#delete from tblattendance_data where emp_id=new.emp_id and d_atten_date=new.d_atten_date;
end if;


END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `tbl_comment`
--

DROP TABLE IF EXISTS `tbl_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tbl_comment` (
  `n_com_id` int(11) NOT NULL AUTO_INCREMENT,
  `s_type` varchar(45) DEFAULT 'TASK_MASTER',
  `n_task_id` int(11) NOT NULL,
  `s_em_code` varchar(50) DEFAULT NULL,
  `s_comment` text,
  `d_created_datetime` datetime DEFAULT CURRENT_TIMESTAMP,
  `d_updated_datetime` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`n_com_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_comment`
--

LOCK TABLES `tbl_comment` WRITE;
/*!40000 ALTER TABLE `tbl_comment` DISABLE KEYS */;
INSERT INTO `tbl_comment` VALUES (1,'TASK_MASTER',17,'EMP01','Enter you commenst s','2021-09-20 16:48:48',NULL),(2,'TASK_MASTER',19,'EMP01','please eneter the data as per given sheets','2021-09-20 16:51:47',NULL),(3,'TASK_MASTER',19,'EMP01','oostang zoodles disqus groupon greplin oooj voxy zoodles, weebly ning heekya handango imeem plugg dopplr jibjab, movity jajah plickers sifteo edmodo ifttt zimbra. Babblely odeo kaboodle quora plaxo ideeli hulu weebly balihoo...Etsy doostang zoodles disqus groupon greplin oooj voxy zoodles, weebly ning heekya han','2021-09-20 16:55:02',NULL),(4,'TASK_MASTER',19,'EMP01','fttt zimbra. Babblely odeo kaboodle quora plaxo ideeli hulu weebly balihoo...Etsy doostang zoodles disqus groupon greplin oooj voxy zoodles, weebly ning heekya handango imeem plugg dopplr jibjab, movity jajah plickers sifteo e','2021-09-20 16:55:31',NULL),(5,'TASK_MASTER',19,'EMP01','ugg dopplr jibjab, movity jajah plickers sifteo edmodo ifttt zimbra. Babblely odeo kaboodle quora plaxo ideeli hulu weebly balihoo...Etsy doostang zoodles disqus groupon greplin oooj voxy zoodles, weebly ning heekya handango imeem plugg dopplr jibjab, movity jajah plickers sifteo edmodo ifttt zimbra. Babblely odeo kaboodle quora plax','2021-09-21 16:57:00',NULL),(6,'TASK_MASTER',19,'EMP01','cs c cdc ','2021-09-21 16:57:11',NULL),(7,'TASK_MASTER',19,'EMP01','avfg b','2021-09-21 17:04:18',NULL),(8,'TASK_MASTER',19,'EMP01','okay fine','2021-09-21 18:01:03',NULL),(9,'TASK_MASTER',11,'EMP01','sb v  yjmy ujm ','2021-09-21 18:21:48',NULL),(10,'TASK_MASTER',16,'EMP01','Fhhjj fhhfyy gjgv','2021-09-20 18:34:29',NULL),(11,'TASK_MASTER',18,'EMP01','ss','2021-09-22 15:39:57',NULL),(12,'TASK_MASTER',16,'EMP01','sdfn','2021-09-22 16:27:14',NULL);
/*!40000 ALTER TABLE `tbl_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_department`
--

DROP TABLE IF EXISTS `tbl_department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tbl_department` (
  `n_dep_id` int(11) NOT NULL AUTO_INCREMENT,
  `s_dep_name` varchar(64) NOT NULL,
  `s_dep_head` varchar(64) NOT NULL,
  `d_created_datetime` datetime DEFAULT CURRENT_TIMESTAMP,
  `d_updated_datetime` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `s_created_by` varchar(45) DEFAULT NULL,
  `s_updated_by` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`n_dep_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_department`
--

LOCK TABLES `tbl_department` WRITE;
/*!40000 ALTER TABLE `tbl_department` DISABLE KEYS */;
INSERT INTO `tbl_department` VALUES (1,'Administration','EMP09','2021-08-26 16:51:10','2021-09-20 13:07:44',NULL,'ROHAN.PATIL@APPONEXT.COM'),(2,'Finance, HR, & Administration','EMP02','2021-08-26 16:51:10','2021-08-31 21:38:31',NULL,'ROHAN.PATIL@APPONEXT.COM'),(3,'Research','EMP03','2021-08-26 16:51:10','2021-08-31 21:38:52',NULL,'ROHAN.PATIL@APPONEXT.COM'),(4,'Information Technology','EMP08','2021-08-26 16:51:10','2021-09-16 14:14:52',NULL,NULL),(6,'Support','EMP09','2021-08-31 21:44:40','2021-09-18 16:50:20','ROHAN.PATIL@APPONEXT.COM','EMP04');
/*!40000 ALTER TABLE `tbl_department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_emp_shift`
--

DROP TABLE IF EXISTS `tbl_emp_shift`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tbl_emp_shift` (
  `n_emp_shift_id` int(11) NOT NULL AUTO_INCREMENT,
  `s_em_code` varchar(65) NOT NULL,
  `n_shift_id` varchar(30) NOT NULL,
  `d_start_date` varchar(20) NOT NULL,
  `d_end_date` varchar(20) NOT NULL,
  `d_created_datetime` datetime DEFAULT CURRENT_TIMESTAMP,
  `d_updated_datetime` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`n_emp_shift_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_emp_shift`
--

LOCK TABLES `tbl_emp_shift` WRITE;
/*!40000 ALTER TABLE `tbl_emp_shift` DISABLE KEYS */;
INSERT INTO `tbl_emp_shift` VALUES (1,'EMP01','A','2021-01-01','2021-12-01','2021-08-26 17:13:23','2021-09-12 13:41:31'),(4,'EMP02','A','2021-01-01','2021-12-01','2021-08-26 17:14:21','2021-09-12 13:41:31'),(5,'EMP03','B','2021-05-01','2021-10-01','2021-08-26 17:14:21','2021-08-26 17:14:21');
/*!40000 ALTER TABLE `tbl_emp_shift` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_employee`
--

DROP TABLE IF EXISTS `tbl_employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tbl_employee` (
  `n_id` int(11) NOT NULL AUTO_INCREMENT,
  `n_location_id` int(11) DEFAULT NULL,
  `s_em_code` varchar(64) NOT NULL,
  `s_designation` varchar(150) DEFAULT NULL,
  `n_dep_id` int(11) DEFAULT NULL,
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
  `s_em_age` int(11) DEFAULT NULL,
  `s_em_pan` varchar(15) DEFAULT NULL,
  `s_em_adhar` varchar(15) DEFAULT NULL,
  `s_em_pf_no` varchar(20) DEFAULT NULL,
  `s_em_marital_status` varchar(20) DEFAULT NULL,
  `s_em_reporting1` varchar(64) NOT NULL,
  `s_em_reporting2` varchar(65) NOT NULL,
  `d_created_datetime` datetime DEFAULT CURRENT_TIMESTAMP,
  `d_updated_datetime` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`n_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_employee`
--

LOCK TABLES `tbl_employee` WRITE;
/*!40000 ALTER TABLE `tbl_employee` DISABLE KEYS */;
INSERT INTO `tbl_employee` VALUES (1,1,'EMP01','CEO',2,'KAMAL','KANT','YADAV','KAMAL.YADAV@APPONEXT.COM','123','EMPLOYEE','sdsdsdsd sffdfdfdf','ACTIVE','Male','8286736553','','O+','2021-09-01','../assets/img/avatars/1631188197295-pexels-photo-771742.jpeg',26,'','456709874556665','',NULL,'EMP03','EMP02','2021-08-26 16:54:33','2021-09-28 17:09:35'),(2,NULL,'EMP02','2',2,'SHIKHA','DAYARAM','DWIVEDI','SHIKHA.DWIVEDI@APPONEXT.COM','123','EMPLOYEE','-','ACTIVE','Female','8091238198','26-10-1994','O+',NULL,NULL,26,'OPI7856FTF','45670987455666','123UGRER','UNMARIED','EMP01','EMP04','2021-08-26 16:56:44','2021-09-16 14:14:33'),(3,NULL,'EMP03','2',3,'SANKET','','SAGVEKAR','SANKET.SAGVEKAR@APPONEXT.COM','123','EMPLOYEE','-','ACTIVE','Male','8091238193','26-10-1994','O+',NULL,NULL,26,'OPI7856FTF','45670987455666','123UGRER','UNMARIED','EMP01','EMP02','2021-08-26 16:57:51','2021-09-16 14:14:33'),(4,NULL,'ADM04','2',4,'ROHAN','','PATIL','ROHAN.PATIL@APPONEXT.COM','123','ADMIN','-','ACTIVE','Male','9078563412','26-10-1994','O+',NULL,NULL,26,'OPI7856FTF','45670987455666','123UGRER','UNMARIED','','','2021-08-26 16:59:01','2021-09-20 12:46:03'),(5,NULL,'EMP05','2',2,'SACHIN','','KANWAR','SACHIN.KANWAR@APPONEXT.COM','123','EMPLOYEE','-','ACTIVE','Male','9078563412','26-10-1994','O+',NULL,NULL,26,'OPI7856FTF','45670987455666','123UGRER','UNMARIED','EMP01','EMP03','2021-08-26 17:00:58','2021-09-15 17:09:56'),(6,NULL,'test22','HR',6,'new','test','user','test@gmail.com','test22@123','EMPLOYEE','','ACTIVE','Male','897454561231','','A+','2021-09-01','../assets/img/avatars/1631179828456-pexels-photo-771742.jpeg',NULL,'54656546','666565','868687768','Unmarried','EMP01','EMP02','2021-09-09 14:54:28','2021-09-09 15:00:28');
/*!40000 ALTER TABLE `tbl_employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_holiday`
--

DROP TABLE IF EXISTS `tbl_holiday`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tbl_holiday` (
  `n_id` int(11) NOT NULL AUTO_INCREMENT,
  `n_location_id` int(11) DEFAULT NULL,
  `s_holiday_name` varchar(256) DEFAULT NULL,
  `d_from_date` varchar(64) DEFAULT NULL,
  `d_to_date` varchar(64) DEFAULT NULL,
  `n_number_of_days` varchar(64) DEFAULT NULL,
  `f_year` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`n_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_holiday`
--

LOCK TABLES `tbl_holiday` WRITE;
/*!40000 ALTER TABLE `tbl_holiday` DISABLE KEYS */;
INSERT INTO `tbl_holiday` VALUES (1,1,'Gandhi Jayanti','2021-10-02','2021-09-02','1','2021'),(2,2,'Gandhi Jayanti','2021-10-02','2021-10-02','1','2021');
/*!40000 ALTER TABLE `tbl_holiday` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_leave_transaction`
--

DROP TABLE IF EXISTS `tbl_leave_transaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tbl_leave_transaction` (
  `n_emp_leave_id` int(11) NOT NULL AUTO_INCREMENT,
  `s_em_code` varchar(64) DEFAULT NULL,
  `n_type_id` int(11) NOT NULL,
  `s_leave_type` varchar(64) DEFAULT NULL,
  `d_start_date` varchar(64) DEFAULT NULL,
  `d_end_date` varchar(64) DEFAULT NULL,
  `d_leave_duration` varchar(10) DEFAULT NULL,
  `d_apply_date` varchar(64) DEFAULT NULL,
  `s_reason` varchar(1024) DEFAULT NULL,
  `s_leave_status` enum('Approved','Not Approve','Rejected') NOT NULL DEFAULT 'Not Approve',
  `s_em_approver` varchar(65) NOT NULL,
  `d_created_datetime` datetime DEFAULT CURRENT_TIMESTAMP,
  `d_updated_datetime` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `s_created_by` varchar(45) DEFAULT NULL,
  `s_updated_by` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`n_emp_leave_id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_leave_transaction`
--

LOCK TABLES `tbl_leave_transaction` WRITE;
/*!40000 ALTER TABLE `tbl_leave_transaction` DISABLE KEYS */;
INSERT INTO `tbl_leave_transaction` VALUES (9,'EMP01',1,'ABOVE A DAY','2021-09-07','2021-09-08','2','2021-09-06','need to go out ','Approved','EMP04','2021-09-06 22:11:35','2021-09-08 00:43:43','EMP01','EMP04'),(10,'EMP01',2,'2 HALF','2021-09-08','','1','2021-09-07','need to get mail ','Rejected','EMP04','2021-09-07 16:48:52','2021-09-08 00:43:56','EMP01','EMP04'),(11,'EMP01',2,'ABOVE A DAY','2021-10-01','2021-10-10','10','2021-09-07','sdf  drtj thm','Approved','EMP04','2021-09-07 17:03:51','2021-09-08 00:44:33','EMP01','EMP04'),(12,'EMP02',1,'2 HALF','2021-09-08','','1','2021-09-07','2nd halh will be half day ','Rejected','EMP01','2021-09-07 19:37:34','2021-09-08 00:48:25','EMP02','EMP01'),(14,'EMP01',1,'FULL DAY','2021-09-08','','1','2021-09-08','sc  c wfgf  yg ','Not Approve','EMP04','2021-09-08 00:46:26','2021-09-08 00:46:26','EMP04',NULL),(16,'EMP01',1,'1 HALF','2021-09-09','','1','2021-09-08','Rejer rew reg bv ','Not Approve','EMP04','2021-09-08 13:31:15','2021-09-08 13:31:15','EMP04',NULL),(17,'EMP01',1,'1 HALF','2021-09-10','','0.5','2021-09-08','wrwegw hrryth jyghn','Approved','EMP04','2021-09-08 13:37:59','2021-09-12 12:51:18','EMP04','EMP04'),(18,'EMP01',1,'1 HALF','2021-09-11','','0.5','2021-09-10','SDFGHGNGDC FFERGH','Approved','EMP04','2021-09-10 17:11:31','2021-09-12 12:52:34','EMP02','EMP04');
/*!40000 ALTER TABLE `tbl_leave_transaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_leave_types`
--

DROP TABLE IF EXISTS `tbl_leave_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tbl_leave_types` (
  `n_type_id` int(11) NOT NULL AUTO_INCREMENT,
  `s_name` varchar(64) NOT NULL,
  `n_leave_day` varchar(255) NOT NULL,
  `n_status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`n_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;
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
-- Table structure for table `tbl_location_master`
--

DROP TABLE IF EXISTS `tbl_location_master`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tbl_location_master` (
  `n_location_id` int(11) NOT NULL AUTO_INCREMENT,
  `s_location_name` varchar(100) DEFAULT NULL,
  `d_created_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `d_updated_date` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`n_location_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_location_master`
--

LOCK TABLES `tbl_location_master` WRITE;
/*!40000 ALTER TABLE `tbl_location_master` DISABLE KEYS */;
INSERT INTO `tbl_location_master` VALUES (1,'Vashi','2021-09-28 15:53:33',NULL),(2,'Taloja','2021-09-28 15:53:33',NULL);
/*!40000 ALTER TABLE `tbl_location_master` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_shift`
--

DROP TABLE IF EXISTS `tbl_shift`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tbl_shift` (
  `n_shift_id` int(11) NOT NULL AUTO_INCREMENT,
  `s_shift` varchar(30) DEFAULT NULL,
  `s_shift_desc` varchar(30) DEFAULT NULL,
  `t_start_time` varchar(20) DEFAULT NULL,
  `t_end_time` varchar(20) DEFAULT NULL,
  `s_gross_start_time` varchar(20) DEFAULT NULL,
  `s_gross_end_time` varchar(20) DEFAULT NULL,
  `s_min_work_hours` int(11) DEFAULT NULL,
  `d_created_datetime` datetime DEFAULT CURRENT_TIMESTAMP,
  `d_updated_datetime` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`n_shift_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_shift`
--

LOCK TABLES `tbl_shift` WRITE;
/*!40000 ALTER TABLE `tbl_shift` DISABLE KEYS */;
INSERT INTO `tbl_shift` VALUES (1,'A','SHIFT A','07:00','15:00','30','30',4,'2021-08-26 16:44:48','2021-09-12 13:31:12'),(2,'B','SHIFT B','15:00','23:00','30','30',4,'2021-08-26 16:44:48','2021-09-12 13:31:12'),(3,'C','SHIFT C','23:00','07:00','30','30',4,'2021-08-26 16:44:48','2021-09-12 13:31:12'),(4,'D','SHIFT D','19:00','3:00','30','30',4,'2021-08-26 16:44:48','2021-09-12 13:31:12'),(7,'qw','wq','23:59','12:59','30','30',4,'2021-09-10 17:02:37','2021-09-12 13:31:12');
/*!40000 ALTER TABLE `tbl_shift` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_task_header`
--

DROP TABLE IF EXISTS `tbl_task_header`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tbl_task_header` (
  `n_task_id` int(11) NOT NULL AUTO_INCREMENT,
  `n_dep_id` int(11) DEFAULT NULL,
  `d_start_date` varchar(64) DEFAULT NULL,
  `d_due_date` varchar(64) DEFAULT NULL,
  `s_task_name` varchar(500) DEFAULT NULL,
  `s_task_desc` varchar(2000) DEFAULT NULL,
  `s_remark` varchar(500) DEFAULT NULL,
  `s_priority` enum('Important','Medium','Low') DEFAULT 'Low',
  `s_status` enum('WIP','Completed','Pending','Assigned') DEFAULT 'Assigned',
  `s_created_by` varchar(45) DEFAULT NULL,
  `d_created_datetime` datetime DEFAULT CURRENT_TIMESTAMP,
  `s_updated_by` varchar(45) DEFAULT NULL,
  `d_updated_datetime` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`n_task_id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_task_header`
--

LOCK TABLES `tbl_task_header` WRITE;
/*!40000 ALTER TABLE `tbl_task_header` DISABLE KEYS */;
INSERT INTO `tbl_task_header` VALUES (11,4,'2021-09-20','2021-09-20','Task 1','task 1 assign to my self.',NULL,'Important','Pending','EMP01','2021-09-19 22:42:36',NULL,'2021-09-21 13:13:48'),(12,2,'2021-09-20','2021-09-21','Task 2','tasak2 assign to my child','','Medium','Pending','EMP02','2021-09-19 22:45:08','EMP05','2021-09-22 00:15:44'),(14,2,'2021-09-21','2021-09-22','Task value ','task assitn to sachin kanwr','','Medium','Completed','EMP02','2021-09-19 23:40:54','EMP05','2021-09-20 12:19:04'),(15,2,'2021-09-21','2021-09-22','Design the solution','Identify resources to be monitored\nDefine users and workflow\nIdentify event sources by resource type.\nDefine the relationship between resources and business systems.\nIdentify tasks and URLs by resource type.\nDefine the server configuration.',NULL,'Important','Assigned','EMP02','2021-09-20 12:51:15',NULL,'2021-09-20 13:09:10'),(16,2,'2021-09-20','2021-09-20','Prepare for implementation','	Identify the implementation team.\nOrder the server hardware for production as well as test/quality assurance (QA).\nOrder console machines.\nOrder prerequisite software.\nIdentify the test LPAR.\nIdentify production LPARs.',NULL,'Important','Pending','EMP02','2021-09-20 12:52:21',NULL,'2021-09-21 13:23:48'),(17,2,'2021-09-21','2021-09-21','Prepare the test/QA environment','Install test and QA servers and prerequisite software.\nInstall console machines and prerequisite software.\nVerify connectivity from test and QA servers to test LPAR, Tivoli Enterprise Console(R) server, and console machines.',NULL,'Important','Pending','EMP02','2021-09-20 12:53:06',NULL,'2021-09-22 00:15:44'),(18,2,'2021-09-23','2021-09-23','Install the product in the test/QA environment.','Install Tivoli Business Systems Manager and appropriate patches on test or QA servers.\nInstall Tivoli Business Systems Manager on console machines.\nInstall event enablement on the Tivoli Enterprise Console server.\nInstall Tivoli Business Systems Manager and appropriate maintenance on the test LPAR.\nCreate configuration level objects for the test LPAR.\nConfigure servers, Source/390 on the test LPAR, event enablement on the Tivoli Enterprise Console server, and verify connectivity.',NULL,'Medium','Assigned','EMP02','2021-09-20 12:53:44',NULL,'2021-09-20 13:09:10'),(19,2,'2021-09-25','2021-09-26','Implement distributed data feeds (this can be done in parallel with the Source/390 data feed implementation).','For each resource type, do the following tasks:\nExtend the data model.\nConfigure the instance placement.\nConfigure the Tivoli Enterprise Console rules to send events.\nAssociate tasks and URLs with object types.','done','Low','Completed','EMP02','2021-09-20 13:11:03','EMP01','2021-09-22 16:34:38');
/*!40000 ALTER TABLE `tbl_task_header` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_task_transaction`
--

DROP TABLE IF EXISTS `tbl_task_transaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tbl_task_transaction` (
  `n_tran_task_id` int(11) NOT NULL AUTO_INCREMENT,
  `n_task_id` int(11) DEFAULT NULL,
  `s_em_code` varchar(64) DEFAULT NULL,
  `s_remark` varchar(500) DEFAULT NULL,
  `s_status` enum('WIP','Completed','Pending','Assigned') DEFAULT 'Assigned',
  `d_created_datetime` datetime DEFAULT CURRENT_TIMESTAMP,
  `d_updated_datetime` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `s_created_by` varchar(45) DEFAULT NULL,
  `s_updated_by` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`n_tran_task_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_task_transaction`
--

LOCK TABLES `tbl_task_transaction` WRITE;
/*!40000 ALTER TABLE `tbl_task_transaction` DISABLE KEYS */;
INSERT INTO `tbl_task_transaction` VALUES (4,11,'EMP01',NULL,'Assigned','2021-09-19 22:42:36','2021-09-19 22:42:36',NULL,NULL),(5,12,'EMP05','','Completed','2021-09-19 22:45:08','2021-09-20 12:20:05',NULL,'EMP05'),(6,14,'EMP05','','Completed','2021-09-19 23:40:54','2021-09-20 12:19:04',NULL,'EMP05'),(7,15,'EMP05',NULL,'Assigned','2021-09-20 12:51:15','2021-09-20 12:51:15',NULL,NULL),(8,16,'EMP01',NULL,'Assigned','2021-09-20 12:52:21','2021-09-20 12:52:21',NULL,NULL),(9,17,'EMP01',NULL,'Assigned','2021-09-20 12:53:06','2021-09-20 12:53:06',NULL,NULL),(10,18,'EMP01',NULL,'Assigned','2021-09-20 12:53:44','2021-09-20 12:53:44',NULL,NULL),(11,19,'EMP01','done','Completed','2021-09-20 13:11:03','2021-09-22 16:34:38',NULL,'EMP01');
/*!40000 ALTER TABLE `tbl_task_transaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_temp_attachment`
--

DROP TABLE IF EXISTS `tbl_temp_attachment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tbl_temp_attachment` (
  `n_temp_id` int(11) NOT NULL AUTO_INCREMENT,
  `s_ogi_name` varchar(500) DEFAULT NULL,
  `s_new_name` varchar(500) DEFAULT NULL,
  `s_path` varchar(45) DEFAULT NULL,
  `s_em_code` varchar(50) DEFAULT NULL,
  `s_attach_type` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`n_temp_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1 COMMENT='attchemnt for task';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_temp_attachment`
--

LOCK TABLES `tbl_temp_attachment` WRITE;
/*!40000 ALTER TABLE `tbl_temp_attachment` DISABLE KEYS */;
INSERT INTO `tbl_temp_attachment` VALUES (6,'CODE_OF_CONDUCT.md','1632122662431_CODE_OF_CONDUCT.md','/task_attach','EMP01','TASK_FILE'),(8,'images (4).jpeg','1632143169400_images__4_.jpeg','/task_attach','EMP01','TASK_FILE');
/*!40000 ALTER TABLE `tbl_temp_attachment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `tbl_vw_login`
--

DROP TABLE IF EXISTS `tbl_vw_login`;
/*!50001 DROP VIEW IF EXISTS `tbl_vw_login`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `tbl_vw_login` AS SELECT 
 1 AS `s_em_code`,
 1 AS `n_dep_id`,
 1 AS `s_em_password`,
 1 AS `s_em_role`,
 1 AS `n_status`,
 1 AS `name`,
 1 AS `s_em_email`,
 1 AS `s_em_image`,
 1 AS `dep_head`*/;
SET character_set_client = @saved_cs_client;

--
-- Dumping events for database 'db_ess_ultratech'
--
/*!50106 SET @save_time_zone= @@TIME_ZONE */ ;
/*!50106 DROP EVENT IF EXISTS `reset_task_status` */;
DELIMITER ;;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;;
/*!50003 SET character_set_client  = utf8mb4 */ ;;
/*!50003 SET character_set_results = utf8mb4 */ ;;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;;
/*!50003 SET @saved_time_zone      = @@time_zone */ ;;
/*!50003 SET time_zone             = 'SYSTEM' */ ;;
/*!50106 CREATE*/ /*!50117 DEFINER=`root`@`localhost`*/ /*!50106 EVENT `reset_task_status` ON SCHEDULE EVERY 1 MINUTE STARTS '2021-09-21 13:13:48' ON COMPLETION NOT PRESERVE ENABLE DO update  tbl_task_header
set s_status='Pending'  
where d_due_date < date_sub(now(),interval 24 hour) 
  and (s_status<> 'Completed'  or s_status<>'Pending') */ ;;
/*!50003 SET time_zone             = @saved_time_zone */ ;;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;;
/*!50003 SET character_set_client  = @saved_cs_client */ ;;
/*!50003 SET character_set_results = @saved_cs_results */ ;;
/*!50003 SET collation_connection  = @saved_col_connection */ ;;
/*!50106 DROP EVENT IF EXISTS `test_event_02` */;;
DELIMITER ;;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;;
/*!50003 SET character_set_client  = utf8mb4 */ ;;
/*!50003 SET character_set_results = utf8mb4 */ ;;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;;
/*!50003 SET @saved_time_zone      = @@time_zone */ ;;
/*!50003 SET time_zone             = 'SYSTEM' */ ;;
/*!50106 CREATE*/ /*!50117 DEFINER=`root`@`localhost`*/ /*!50106 EVENT `test_event_02` ON SCHEDULE AT '2021-09-09 15:30:35' ON COMPLETION PRESERVE DISABLE DO INSERT INTO messages(message,created_at)
   VALUES('Test MySQL Event 2',NOW()) */ ;;
/*!50003 SET time_zone             = @saved_time_zone */ ;;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;;
/*!50003 SET character_set_client  = @saved_cs_client */ ;;
/*!50003 SET character_set_results = @saved_cs_results */ ;;
/*!50003 SET collation_connection  = @saved_col_connection */ ;;
DELIMITER ;
/*!50106 SET TIME_ZONE= @save_time_zone */ ;

--
-- Dumping routines for database 'db_ess_ultratech'
--
/*!50003 DROP FUNCTION IF EXISTS `CHECK_DEPT_HEAD_IS` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `CHECK_DEPT_HEAD_IS`(em_code varchar(100)) RETURNS varchar(100) CHARSET latin1
BEGIN
declare is_head binary default false ;
declare cnt int default 0 ;
 select count(*) into cnt FROM tbl_department where s_dep_head=em_code;
 if cnt <> 0 then
	set is_head = true;
else 
	set is_head = false;
end if;
RETURN is_head;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `current_fisical_year` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `current_fisical_year`() RETURNS varchar(50) CHARSET latin1
BEGIN
 DECLARE FIYear VARCHAR(50)  ;  #SUBSTRING("SQL Tutorial", 5, 3)
set FIYear = CASE 
WHEN MONTH(current_timestamp()) > 3 THEN
          concat(YEAR(current_timestamp()), '-',SUBSTRING(YEAR(current_timestamp())+1, 3, 2)) 
	 ELSE concat(YEAR(current_timestamp())-1, '-',SUBSTRING(YEAR(current_timestamp())+1, 3, 2)) END ;

RETURN FIYear;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `getDeptById` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `getDeptById`(id integer(11)) RETURNS varchar(64) CHARSET utf8mb4
BEGIN
declare dept_nm varchar(64);
select s_dep_name into dept_nm from tbl_department where n_dep_id=id;
RETURN dept_nm;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `getEmpById` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `getEmpById`(id varchar(64)) RETURNS varchar(64) CHARSET utf8mb4
BEGIN
declare emp_nm varchar(64);
select concat(s_first_name ," ",s_last_name) into emp_nm from tbl_employee where s_em_code=id;
RETURN emp_nm;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `getLeaveNameById` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `getLeaveNameById`(id integer(11)) RETURNS varchar(64) CHARSET utf8mb4
BEGIN
declare name varchar(64);
select s_name into name from tbl_leave_types where n_type_id=id;
RETURN name;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `getLocationById` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `getLocationById`(id integer(11)) RETURNS varchar(100) CHARSET latin1
BEGIN
declare loc_nm varchar(100);
select s_location_name into loc_nm from tbl_location_master where n_location_id=id;

RETURN loc_nm;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `getShiftNameById` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `getShiftNameById`(id integer(11)) RETURNS varchar(64) CHARSET utf8mb4
BEGIN
declare name varchar(64);
select s_shift into name from tbl_shift where n_shift_id=id;
RETURN name;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `get_leave_type_name` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
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
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
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
/*!50003 DROP FUNCTION IF EXISTS `get_profile` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `get_profile`(em_code varchar(30)) RETURNS varchar(500) CHARSET utf8mb4
BEGIN 
declare ipath varchar(500);
select s_em_image into ipath from tbl_employee where s_em_code = em_code;

RETURN ipath;
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
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
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
/*!50003 DROP FUNCTION IF EXISTS `upsertAssignLeave` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `upsertAssignLeave`(em_code varchar(64),type_id int(11),assiged_days varchar(50),dateyear varchar(64)) RETURNS varchar(100) CHARSET utf8mb4
BEGIN
declare cnt int(10);
declare msg varchar(100);
select count(*) into cnt from  tbl_assign_leave where s_em_code = em_code and n_type_id=type_id and f_dateyear=dateyear;
if cnt > 0 then
update tbl_assign_leave set n_assiged_days=assiged_days where s_em_code = em_code and n_type_id=type_id and f_dateyear=dateyear;
set msg="Data Updated";
else
insert into tbl_assign_leave(s_em_code,n_type_id,n_assiged_days,f_dateyear) values(em_code,type_id,assiged_days,dateyear);
set msg="Data Inserted";
end if;
RETURN msg;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `upsertEmployee` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `upsertEmployee`(em_code varchar(64),designation varchar(250),dep_id int(11),first_name varchar(128),middle_name varchar(128),last_name varchar(128),em_email varchar(64),em_address varchar(512),em_gender varchar(15),em_phone varchar(64),em_birthday varchar(128),em_blood_group varchar(5),em_joining_date varchar(128),em_pan varchar(15),em_adhar varchar(15),em_pf_no varchar(20),em_marital_status varchar(20),em_reporting1 varchar(64),em_reporting2 varchar(64),location_id integer(11)) RETURNS varchar(64) CHARSET utf8mb4
BEGIN
declare cnt int(10);
select count(*) into cnt from  tbl_employee where s_em_code = em_code;
if cnt > 0 then
update tbl_employee set s_designation=designation,n_dep_id=dep_id,s_first_name=first_name,s_middle_name=middle_name,s_last_name=last_name,s_em_email=em_email,s_em_address=em_address,s_em_gender=em_gender,s_em_phone=em_phone,s_em_birthday=em_birthday,s_em_blood_group=em_blood_group,d_em_joining_date=em_joining_date,s_em_pan=em_pan,s_em_adhar=em_adhar,s_em_pf_no=em_pf_no,s_em_marital_status=em_marital_status,s_em_reporting1=em_reporting1,s_em_reporting2=em_reporting2,n_location_id=location_id where s_em_code = em_code;
else
insert into tbl_employee(s_em_code,s_designation,n_dep_id,s_first_name,s_middle_name,s_last_name,s_em_email,s_em_password,s_em_role,s_em_address,s_em_gender,s_em_phone,s_em_birthday,s_em_blood_group,d_em_joining_date,s_em_pan,s_em_adhar,s_em_pf_no,s_em_marital_status,s_em_reporting1,s_em_reporting2,n_location_id) values(em_code,designation,dep_id,first_name,middle_name,last_name,em_email,concat(s_em_code,'@123'),'EMPLOYEE',em_address,em_gender,em_phone,em_birthday,em_blood_group,em_joining_date,em_pan,em_adhar,em_pf_no,em_marital_status,em_reporting1,em_reporting2,location_id);
end if;
RETURN em_code;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `attach_upload` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `attach_upload`(att_type varchar(20),ogi_name varchar(500),new_name varchar(500),spath varchar(20),em_code varchar(50))
BEGIN

INSERT INTO  `tbl_temp_attachment` (`s_ogi_name`,`s_new_name`,`s_path`,`s_em_code`,`s_attach_type`)
VALUES (ogi_name, new_name, spath, em_code, att_type);


END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `attendance_update` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `attendance_update`(cur_date varchar(50) , sign_in varchar(50) ,sing_out varchar(50),em_code varchar(200), work_type varchar(100),tag varchar(20))
BEGIN

declare shift_id varchar(10);
declare sh_strt_time varchar(10);
declare sh_end_time varchar(10);
declare sh_gross_strttym varchar(10);
declare sh_gross_endtym varchar(10);

declare shoutdatetime varchar(30);
declare shindatetime varchar(30);

declare worktime varchar (10); 
declare cnt int(2);

declare grossindtym varchar(30);
declare grossoutdtym varchar(30);

select  s_shift, t_start_time, t_end_time, s_gross_start_time, s_gross_end_time into shift_id, sh_strt_time,sh_end_time,sh_gross_strttym,sh_gross_endtym from tbl_shift where  s_shift = (select n_shift_id from tbl_emp_shift where  s_em_code = em_code);

SELECT STR_TO_DATE(concat(cur_date,' ',sh_strt_time),'%Y-%m-%d %H:%i') into shindatetime;
SELECT STR_TO_DATE(concat(cur_date,' ',sh_end_time),'%Y-%m-%d %H:%i') into shoutdatetime;
select TIMEDIFF(shoutdatetime,shindatetime) into worktime;
# gross in date time 
select  date_add(shindatetime, interval sh_gross_strttym minute) into grossindtym;
# gross out date time 
select  date_add(shindatetime, interval -(sh_gross_endtym) minute) into grossindtym;

select count(*) into cnt from tbl_attendance where s_em_code= em_code and d_atten_date=cur_date;
if cnt = 0 and tag = 'PUNCH_IN' then 
	insert into tbl_attendance (s_em_code,d_atten_date,s_shift_id,t_signin_time,s_daily_working_hour,s_work_type) values(em_code,cur_date,shift_id,sign_in,worktime,work_type);
elseif tag = 'PUNCH_OUT' THEN
	update tbl_attendance set t_signout_time=sing_out where s_em_code= em_code and d_atten_date=cur_date;
end if;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `call_comment` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `call_comment`(tag varchar(20),em_code varchar(50),task_id int,comments text,com_id INT)
BEGIN

if(tag = 'I') THEN 
INSERT INTO  `tbl_comment`
( `n_task_id`,`s_em_code`,`s_comment`) VALUES (task_id,em_code,comments);
ELSEIF tag = 'D' then 
DELETE FROM tbl_comment WHERE n_com_id=com_id AND s_em_code=em_code;
END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `current_fisical_year` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `current_fisical_year`()
BEGIN
# DECLARE FIYear VARCHAR(20)  ;  SUBSTRING("SQL Tutorial", 5, 3)
SELECT CASE 
WHEN MONTH(current_timestamp()) > 3 THEN
          concat(YEAR(current_timestamp()), '-',SUBSTRING(YEAR(current_timestamp())+1, 3, 2)) 
	 ELSE concat(YEAR(current_timestamp())-1, '-',SUBSTRING(YEAR(current_timestamp())+1, 3, 2)) END AS financial_year;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `start_and_stop_mysql_event_scheduler` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `start_and_stop_mysql_event_scheduler`(action_takken varchar(150))
BEGIN
SHOW PROCESSLIST; # show the list;
if (action_takken = 'Start') then 
	# If the event scheduler is not enabled, you can set the event_scheduler system variable to enable and start it:
	SET GLOBAL event_scheduler = ON;
elseif action_takken= 'Stop' then  
	#To disable and stop the event scheduler thread, you set event_scheduler system variable to OFF 
	SET GLOBAL event_scheduler = OFF;
end if;

#show all events
#SHOW EVENTS FROM classicmodels;
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
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `submit_leave`(em_code varchar(100),type_id int,start_date varchar(100),end_date varchar(100),leave_type  varchar(100),reason varchar(100),created_by varchar(100),leave_duration varchar(20))
BEGIN
declare rep_pers varchar(100);
select s_em_reporting1 into rep_pers from tbl_employee where s_em_code =em_code;
if rep_pers is not null then 
	INSERT INTO `tbl_leave_transaction` (`s_em_code`, `n_type_id`, `d_start_date`, `d_end_date`, `s_leave_type`, `d_apply_date`, `s_reason`, `s_em_approver`,`s_created_by`,`d_leave_duration`)
VALUES (em_code,type_id,start_date,end_date,leave_type,current_date(),reason,rep_pers,created_by,leave_duration);
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
/*!50003 DROP PROCEDURE IF EXISTS `submit_task` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `submit_task`(dep_id varchar(5), em_code varchar(100), start_date varchar(100), due_date varchar(100), task_name varchar(500), task_desc  varchar(1800), priority varchar(50), statuss varchar(50),created_by varchar(50))
BEGIN
declare task_id int(11);
INSERT INTO  `tbl_task_header` (`n_dep_id`, `d_start_date`, `d_due_date`, `s_task_name`, `s_task_desc` ,`s_priority`,`s_created_by`,`s_status`) VALUES (dep_id,start_date,due_date,task_name,task_desc,priority,created_by,statuss);

select n_task_id into task_id from tbl_task_header where n_dep_id=dep_id and s_task_name=task_name and s_created_by=created_by;

insert into tbl_task_transaction (n_task_id,s_em_code,s_status) values(task_id,em_code,statuss);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `update_task` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `update_task`(statuss varchar(20), task_id int(11), remark varchar(400),em_code varchar(50))
BEGIN

update tbl_task_header set s_status=statuss ,s_updated_by=em_code,s_remark=remark where n_task_id=task_id;
update tbl_task_transaction set s_status=statuss ,s_updated_by=em_code,s_remark=remark where n_task_id=task_id;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `tbl_vw_login`
--

/*!50001 DROP VIEW IF EXISTS `tbl_vw_login`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `tbl_vw_login` AS select `tbl_employee`.`s_em_code` AS `s_em_code`,`tbl_employee`.`n_dep_id` AS `n_dep_id`,`tbl_employee`.`s_em_password` AS `s_em_password`,`tbl_employee`.`s_em_role` AS `s_em_role`,`tbl_employee`.`n_status` AS `n_status`,concat(`tbl_employee`.`s_first_name`,' ',`tbl_employee`.`s_middle_name`,' ',`tbl_employee`.`s_last_name`) AS `name`,`tbl_employee`.`s_em_email` AS `s_em_email`,`tbl_employee`.`s_em_image` AS `s_em_image`,if((`CHECK_DEPT_HEAD_IS`(`tbl_employee`.`s_em_code`) = 1),'DH','NDH') AS `dep_head` from `tbl_employee` */;
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

-- Dump completed on 2021-09-30 17:54:10
