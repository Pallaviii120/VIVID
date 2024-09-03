-- MySQL dump 10.13  Distrib 8.0.24, for Win64 (x86_64)
--
-- Host: localhost    Database: icehrm
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
-- Table structure for table `applications`
--

DROP TABLE IF EXISTS `applications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `applications` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `job` bigint NOT NULL,
  `candidate` bigint DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `referredByEmail` varchar(200) DEFAULT NULL,
  `notes` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `job` (`job`,`candidate`),
  KEY `Fk_Applications_Candidates` (`candidate`),
  CONSTRAINT `Fk_Applications_Candidates` FOREIGN KEY (`candidate`) REFERENCES `candidates` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `Fk_Applications_Job` FOREIGN KEY (`job`) REFERENCES `job` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `applications`
--

LOCK TABLES `applications` WRITE;
/*!40000 ALTER TABLE `applications` DISABLE KEYS */;
/*!40000 ALTER TABLE `applications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `archivedemployees`
--

DROP TABLE IF EXISTS `archivedemployees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `archivedemployees` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `ref_id` bigint NOT NULL,
  `employee_id` varchar(50) DEFAULT NULL,
  `first_name` varchar(100) NOT NULL DEFAULT '',
  `last_name` varchar(100) NOT NULL DEFAULT '',
  `gender` enum('Male','Female') DEFAULT NULL,
  `ssn_num` varchar(100) DEFAULT '',
  `nic_num` varchar(100) DEFAULT '',
  `other_id` varchar(100) DEFAULT '',
  `work_email` varchar(100) DEFAULT NULL,
  `joined_date` datetime DEFAULT NULL,
  `confirmation_date` datetime DEFAULT NULL,
  `supervisor` bigint DEFAULT NULL,
  `department` bigint DEFAULT NULL,
  `termination_date` datetime DEFAULT NULL,
  `notes` text,
  `data` longtext,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `archivedemployees`
--

LOCK TABLES `archivedemployees` WRITE;
/*!40000 ALTER TABLE `archivedemployees` DISABLE KEYS */;
/*!40000 ALTER TABLE `archivedemployees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `attendance`
--

DROP TABLE IF EXISTS `attendance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `attendance` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `employee` bigint NOT NULL,
  `in_time` datetime DEFAULT NULL,
  `out_time` datetime DEFAULT NULL,
  `note` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `in_time` (`in_time`),
  KEY `out_time` (`out_time`),
  KEY `employee_in_time` (`employee`,`in_time`),
  KEY `employee_out_time` (`employee`,`out_time`),
  CONSTRAINT `Fk_Attendance_Employee` FOREIGN KEY (`employee`) REFERENCES `employees` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attendance`
--

LOCK TABLES `attendance` WRITE;
/*!40000 ALTER TABLE `attendance` DISABLE KEYS */;
/*!40000 ALTER TABLE `attendance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auditlog`
--

DROP TABLE IF EXISTS `auditlog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auditlog` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `time` datetime DEFAULT NULL,
  `user` bigint NOT NULL,
  `ip` varchar(100) DEFAULT NULL,
  `type` varchar(100) NOT NULL,
  `employee` varchar(300) DEFAULT NULL,
  `details` text,
  PRIMARY KEY (`id`),
  KEY `Fk_AuditLog_Users` (`user`),
  CONSTRAINT `Fk_AuditLog_Users` FOREIGN KEY (`user`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auditlog`
--

LOCK TABLES `auditlog` WRITE;
/*!40000 ALTER TABLE `auditlog` DISABLE KEYS */;
/*!40000 ALTER TABLE `auditlog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `benifits`
--

DROP TABLE IF EXISTS `benifits`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `benifits` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(250) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `benifits`
--

LOCK TABLES `benifits` WRITE;
/*!40000 ALTER TABLE `benifits` DISABLE KEYS */;
INSERT INTO `benifits` VALUES (1,'Retirement plan'),(2,'Health plan'),(3,'Life insurance'),(4,'Paid vacations');
/*!40000 ALTER TABLE `benifits` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `calls`
--

DROP TABLE IF EXISTS `calls`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `calls` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `job` bigint NOT NULL,
  `candidate` bigint DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  `status` varchar(100) DEFAULT NULL,
  `notes` text,
  PRIMARY KEY (`id`),
  KEY `Fk_Calls_Job` (`job`),
  KEY `Fk_Calls_Candidates` (`candidate`),
  CONSTRAINT `Fk_Calls_Candidates` FOREIGN KEY (`candidate`) REFERENCES `candidates` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `Fk_Calls_Job` FOREIGN KEY (`job`) REFERENCES `job` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `calls`
--

LOCK TABLES `calls` WRITE;
/*!40000 ALTER TABLE `calls` DISABLE KEYS */;
/*!40000 ALTER TABLE `calls` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `candidates`
--

DROP TABLE IF EXISTS `candidates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `candidates` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `first_name` varchar(100) NOT NULL DEFAULT '',
  `last_name` varchar(100) NOT NULL DEFAULT '',
  `nationality` bigint DEFAULT NULL,
  `birthday` datetime DEFAULT NULL,
  `gender` enum('Male','Female') DEFAULT NULL,
  `marital_status` enum('Married','Single','Divorced','Widowed','Other') DEFAULT NULL,
  `address1` varchar(100) DEFAULT '',
  `address2` varchar(100) DEFAULT '',
  `city` varchar(150) DEFAULT '',
  `country` char(2) DEFAULT NULL,
  `province` bigint DEFAULT NULL,
  `postal_code` varchar(20) DEFAULT NULL,
  `email` varchar(200) DEFAULT NULL,
  `home_phone` varchar(50) DEFAULT NULL,
  `mobile_phone` varchar(50) DEFAULT NULL,
  `cv_title` varchar(200) NOT NULL DEFAULT '',
  `cv` varchar(150) DEFAULT NULL,
  `cvtext` text,
  `industry` text,
  `profileImage` varchar(150) DEFAULT NULL,
  `head_line` text,
  `objective` text,
  `work_history` text,
  `education` text,
  `skills` text,
  `referees` text,
  `linkedInUrl` varchar(500) DEFAULT NULL,
  `linkedInData` text,
  `totalYearsOfExperience` int DEFAULT NULL,
  `totalMonthsOfExperience` int DEFAULT NULL,
  `htmlCVData` longtext,
  `generatedCVFile` varchar(150) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  `expectedSalary` int DEFAULT NULL,
  `preferedPositions` text,
  `preferedJobtype` varchar(60) DEFAULT NULL,
  `preferedCountries` text,
  `tags` text,
  `notes` text,
  `calls` text,
  `age` int DEFAULT NULL,
  `hash` varchar(100) DEFAULT NULL,
  `linkedInProfileLink` varchar(250) DEFAULT NULL,
  `linkedInProfileId` varchar(50) DEFAULT NULL,
  `facebookProfileLink` varchar(250) DEFAULT NULL,
  `facebookProfileId` varchar(50) DEFAULT NULL,
  `twitterProfileLink` varchar(250) DEFAULT NULL,
  `twitterProfileId` varchar(50) DEFAULT NULL,
  `googleProfileLink` varchar(250) DEFAULT NULL,
  `googleProfileId` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `candidates`
--

LOCK TABLES `candidates` WRITE;
/*!40000 ALTER TABLE `candidates` DISABLE KEYS */;
/*!40000 ALTER TABLE `candidates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `certifications`
--

DROP TABLE IF EXISTS `certifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `certifications` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `description` varchar(400) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `certifications`
--

LOCK TABLES `certifications` WRITE;
/*!40000 ALTER TABLE `certifications` DISABLE KEYS */;
INSERT INTO `certifications` VALUES (1,'Red Hat Certified Architect (RHCA)','Red Hat Certified Architect (RHCA)'),(2,'GIAC Secure Software Programmer -Java','GIAC Secure Software Programmer -Java'),(3,'Risk Management Professional (PMI)','Risk Management Professional (PMI)'),(4,'IT Infrastructure Library (ITIL) Expert Certification','IT Infrastructure Library (ITIL) Expert Certification'),(5,'Microsoft Certified Architect','Microsoft Certified Architect'),(6,'Oracle Exadata 11g Certified Implementation Specialist','Oracle Exadata 11g Certified Implementation Specialist'),(7,'Cisco Certified Design Professional (CCDP)','Cisco Certified Design Professional (CCDP)'),(8,'Cisco Certified Internetwork Expert (CCIE)','Cisco Certified Internetwork Expert (CCIE)'),(9,'Cisco Certified Network Associate','Cisco Certified Network Associate'),(10,'HP/Master Accredited Solutions Expert (MASE)','HP/Master Accredited Solutions Expert (MASE)'),(11,'HP/Master Accredited Systems Engineer (Master ASE)','HP/Master Accredited Systems Engineer (Master ASE)'),(12,'Certified Information Security Manager (CISM)','Certified Information Security Manager (CISM)'),(13,'Certified Information Systems Auditor (CISA)','Certified Information Systems Auditor (CISA)'),(14,'CyberSecurity Forensic Analyst (CSFA)','CyberSecurity Forensic Analyst (CSFA)'),(15,'Open Group Certified Architect (OpenCA)','Open Group Certified Architect (OpenCA)'),(16,'Oracle DBA Administrator Certified Master OCM','Oracle DBA Administrator Certified Master OCM'),(17,'Project Management Professional','Project Management Professional'),(18,'Apple Certified Support Professional','Apple Certified Support Professional'),(19,'Certified Public Accountant (CPA)','Certified Public Accountant (CPA)'),(20,'Chartered Financial Analyst','Chartered Financial Analyst'),(21,'Professional in Human Resources (PHR)','Professional in Human Resources (PHR)');
/*!40000 ALTER TABLE `certifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clients`
--

DROP TABLE IF EXISTS `clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clients` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `details` text,
  `first_contact_date` date DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `address` text,
  `contact_number` varchar(25) DEFAULT NULL,
  `contact_email` varchar(100) DEFAULT NULL,
  `company_url` varchar(500) DEFAULT NULL,
  `status` enum('Active','Inactive') DEFAULT 'Active',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clients`
--

LOCK TABLES `clients` WRITE;
/*!40000 ALTER TABLE `clients` DISABLE KEYS */;
INSERT INTO `clients` VALUES (1,'IceHrm Sample Client 1',NULL,'2012-01-04','2013-01-03 05:47:33','001, Sample Road,\nSample City, USA','678-894-1047','icehrm+client1@web-stalk.com','http://icehrm.com','Active'),(2,'IceHrm Sample Client 2',NULL,'2012-01-04','2013-01-03 05:47:33','001, Sample Road,\nSample City, USA','678-894-1047','icehrm+client1@web-stalk.com','http://icehrm.com','Active'),(3,'IceHrm Sample Client 3',NULL,'2012-01-04','2013-01-03 05:47:33','001, Sample Road,\nSample City, USA','678-894-1047','icehrm+client1@web-stalk.com','http://icehrm.com','Active');
/*!40000 ALTER TABLE `clients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `companydocuments`
--

DROP TABLE IF EXISTS `companydocuments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `companydocuments` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `details` text,
  `valid_until` date DEFAULT NULL,
  `status` enum('Active','Inactive','Draft') DEFAULT 'Active',
  `notify_employees` enum('Yes','No') DEFAULT 'Yes',
  `attachment` varchar(100) DEFAULT NULL,
  `share_departments` varchar(100) DEFAULT NULL,
  `share_employees` varchar(100) DEFAULT NULL,
  `share_userlevel` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `companydocuments`
--

LOCK TABLES `companydocuments` WRITE;
/*!40000 ALTER TABLE `companydocuments` DISABLE KEYS */;
/*!40000 ALTER TABLE `companydocuments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `companyloans`
--

DROP TABLE IF EXISTS `companyloans`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `companyloans` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `details` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `companyloans`
--

LOCK TABLES `companyloans` WRITE;
/*!40000 ALTER TABLE `companyloans` DISABLE KEYS */;
INSERT INTO `companyloans` VALUES (1,'Personal loan','Personal loans'),(2,'Educational loan','Educational loan');
/*!40000 ALTER TABLE `companyloans` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `companystructures`
--

DROP TABLE IF EXISTS `companystructures`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `companystructures` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `title` tinytext NOT NULL,
  `description` text NOT NULL,
  `address` text,
  `type` enum('Company','Head Office','Regional Office','Department','Unit','Sub Unit','Other') DEFAULT NULL,
  `country` varchar(2) NOT NULL DEFAULT '0',
  `parent` bigint DEFAULT NULL,
  `timezone` varchar(100) NOT NULL DEFAULT 'Europe/London',
  `heads` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `Fk_CompanyStructures_Own` (`parent`),
  CONSTRAINT `Fk_CompanyStructures_Own` FOREIGN KEY (`parent`) REFERENCES `companystructures` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `companystructures`
--

LOCK TABLES `companystructures` WRITE;
/*!40000 ALTER TABLE `companystructures` DISABLE KEYS */;
INSERT INTO `companystructures` VALUES (1,'Your Company','Please update your company name here. You can update, delete or add units according to your needs','','Company','US',NULL,'Europe/London',NULL),(2,'Head Office','US Head office','PO Box 001002\nSample Road, Sample Town','Head Office','US',1,'Europe/London',NULL),(3,'Marketing Department','Marketing Department','PO Box 001002\nSample Road, Sample Town','Department','US',2,'Europe/London',NULL);
/*!40000 ALTER TABLE `companystructures` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `country`
--

DROP TABLE IF EXISTS `country`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `country` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `code` char(2) NOT NULL DEFAULT '',
  `namecap` varchar(80) DEFAULT '',
  `name` varchar(80) NOT NULL DEFAULT '',
  `iso3` char(3) DEFAULT NULL,
  `numcode` smallint DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=240 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `country`
--

LOCK TABLES `country` WRITE;
/*!40000 ALTER TABLE `country` DISABLE KEYS */;
INSERT INTO `country` VALUES (1,'AF','AFGHANISTAN','Afghanistan','AFG',4),(2,'AL','ALBANIA','Albania','ALB',8),(3,'DZ','ALGERIA','Algeria','DZA',12),(4,'AS','AMERICAN SAMOA','American Samoa','ASM',16),(5,'AD','ANDORRA','Andorra','AND',20),(6,'AO','ANGOLA','Angola','AGO',24),(7,'AI','ANGUILLA','Anguilla','AIA',660),(8,'AQ','ANTARCTICA','Antarctica',NULL,NULL),(9,'AG','ANTIGUA AND BARBUDA','Antigua and Barbuda','ATG',28),(10,'AR','ARGENTINA','Argentina','ARG',32),(11,'AM','ARMENIA','Armenia','ARM',51),(12,'AW','ARUBA','Aruba','ABW',533),(13,'AU','AUSTRALIA','Australia','AUS',36),(14,'AT','AUSTRIA','Austria','AUT',40),(15,'AZ','AZERBAIJAN','Azerbaijan','AZE',31),(16,'BS','BAHAMAS','Bahamas','BHS',44),(17,'BH','BAHRAIN','Bahrain','BHR',48),(18,'BD','BANGLADESH','Bangladesh','BGD',50),(19,'BB','BARBADOS','Barbados','BRB',52),(20,'BY','BELARUS','Belarus','BLR',112),(21,'BE','BELGIUM','Belgium','BEL',56),(22,'BZ','BELIZE','Belize','BLZ',84),(23,'BJ','BENIN','Benin','BEN',204),(24,'BM','BERMUDA','Bermuda','BMU',60),(25,'BT','BHUTAN','Bhutan','BTN',64),(26,'BO','BOLIVIA','Bolivia','BOL',68),(27,'BA','BOSNIA AND HERZEGOVINA','Bosnia and Herzegovina','BIH',70),(28,'BW','BOTSWANA','Botswana','BWA',72),(29,'BV','BOUVET ISLAND','Bouvet Island',NULL,NULL),(30,'BR','BRAZIL','Brazil','BRA',76),(31,'IO','BRITISH INDIAN OCEAN TERRITORY','British Indian Ocean Territory',NULL,NULL),(32,'BN','BRUNEI DARUSSALAM','Brunei Darussalam','BRN',96),(33,'BG','BULGARIA','Bulgaria','BGR',100),(34,'BF','BURKINA FASO','Burkina Faso','BFA',854),(35,'BI','BURUNDI','Burundi','BDI',108),(36,'KH','CAMBODIA','Cambodia','KHM',116),(37,'CM','CAMEROON','Cameroon','CMR',120),(38,'CA','CANADA','Canada','CAN',124),(39,'CV','CAPE VERDE','Cape Verde','CPV',132),(40,'KY','CAYMAN ISLANDS','Cayman Islands','CYM',136),(41,'CF','CENTRAL AFRICAN REPUBLIC','Central African Republic','CAF',140),(42,'TD','CHAD','Chad','TCD',148),(43,'CL','CHILE','Chile','CHL',152),(44,'CN','CHINA','China','CHN',156),(45,'CX','CHRISTMAS ISLAND','Christmas Island',NULL,NULL),(46,'CC','COCOS (KEELING) ISLANDS','Cocos (Keeling) Islands',NULL,NULL),(47,'CO','COLOMBIA','Colombia','COL',170),(48,'KM','COMOROS','Comoros','COM',174),(49,'CG','CONGO','Congo','COG',178),(50,'CD','CONGO, THE DEMOCRATIC REPUBLIC OF THE','Congo, the Democratic Republic of the','COD',180),(51,'CK','COOK ISLANDS','Cook Islands','COK',184),(52,'CR','COSTA RICA','Costa Rica','CRI',188),(53,'CI','COTE D\'IVOIRE','Cote D\'Ivoire','CIV',384),(54,'HR','CROATIA','Croatia','HRV',191),(55,'CU','CUBA','Cuba','CUB',192),(56,'CY','CYPRUS','Cyprus','CYP',196),(57,'CZ','CZECH REPUBLIC','Czech Republic','CZE',203),(58,'DK','DENMARK','Denmark','DNK',208),(59,'DJ','DJIBOUTI','Djibouti','DJI',262),(60,'DM','DOMINICA','Dominica','DMA',212),(61,'DO','DOMINICAN REPUBLIC','Dominican Republic','DOM',214),(62,'EC','ECUADOR','Ecuador','ECU',218),(63,'EG','EGYPT','Egypt','EGY',818),(64,'SV','EL SALVADOR','El Salvador','SLV',222),(65,'GQ','EQUATORIAL GUINEA','Equatorial Guinea','GNQ',226),(66,'ER','ERITREA','Eritrea','ERI',232),(67,'EE','ESTONIA','Estonia','EST',233),(68,'ET','ETHIOPIA','Ethiopia','ETH',231),(69,'FK','FALKLAND ISLANDS (MALVINAS)','Falkland Islands (Malvinas)','FLK',238),(70,'FO','FAROE ISLANDS','Faroe Islands','FRO',234),(71,'FJ','FIJI','Fiji','FJI',242),(72,'FI','FINLAND','Finland','FIN',246),(73,'FR','FRANCE','France','FRA',250),(74,'GF','FRENCH GUIANA','French Guiana','GUF',254),(75,'PF','FRENCH POLYNESIA','French Polynesia','PYF',258),(76,'TF','FRENCH SOUTHERN TERRITORIES','French Southern Territories',NULL,NULL),(77,'GA','GABON','Gabon','GAB',266),(78,'GM','GAMBIA','Gambia','GMB',270),(79,'GE','GEORGIA','Georgia','GEO',268),(80,'DE','GERMANY','Germany','DEU',276),(81,'GH','GHANA','Ghana','GHA',288),(82,'GI','GIBRALTAR','Gibraltar','GIB',292),(83,'GR','GREECE','Greece','GRC',300),(84,'GL','GREENLAND','Greenland','GRL',304),(85,'GD','GRENADA','Grenada','GRD',308),(86,'GP','GUADELOUPE','Guadeloupe','GLP',312),(87,'GU','GUAM','Guam','GUM',316),(88,'GT','GUATEMALA','Guatemala','GTM',320),(89,'GN','GUINEA','Guinea','GIN',324),(90,'GW','GUINEA-BISSAU','Guinea-Bissau','GNB',624),(91,'GY','GUYANA','Guyana','GUY',328),(92,'HT','HAITI','Haiti','HTI',332),(93,'HM','HEARD ISLAND AND MCDONALD ISLANDS','Heard Island and Mcdonald Islands',NULL,NULL),(94,'VA','HOLY SEE (VATICAN CITY STATE)','Holy See (Vatican City State)','VAT',336),(95,'HN','HONDURAS','Honduras','HND',340),(96,'HK','HONG KONG','Hong Kong','HKG',344),(97,'HU','HUNGARY','Hungary','HUN',348),(98,'IS','ICELAND','Iceland','ISL',352),(99,'IN','INDIA','India','IND',356),(100,'ID','INDONESIA','Indonesia','IDN',360),(101,'IR','IRAN, ISLAMIC REPUBLIC OF','Iran, Islamic Republic of','IRN',364),(102,'IQ','IRAQ','Iraq','IRQ',368),(103,'IE','IRELAND','Ireland','IRL',372),(104,'IL','ISRAEL','Israel','ISR',376),(105,'IT','ITALY','Italy','ITA',380),(106,'JM','JAMAICA','Jamaica','JAM',388),(107,'JP','JAPAN','Japan','JPN',392),(108,'JO','JORDAN','Jordan','JOR',400),(109,'KZ','KAZAKHSTAN','Kazakhstan','KAZ',398),(110,'KE','KENYA','Kenya','KEN',404),(111,'KI','KIRIBATI','Kiribati','KIR',296),(112,'KP','KOREA, DEMOCRATIC PEOPLE\'S REPUBLIC OF','Korea, Democratic People\'s Republic of','PRK',408),(113,'KR','KOREA, REPUBLIC OF','Korea, Republic of','KOR',410),(114,'KW','KUWAIT','Kuwait','KWT',414),(115,'KG','KYRGYZSTAN','Kyrgyzstan','KGZ',417),(116,'LA','LAO PEOPLE\'S DEMOCRATIC REPUBLIC','Lao People\'s Democratic Republic','LAO',418),(117,'LV','LATVIA','Latvia','LVA',428),(118,'LB','LEBANON','Lebanon','LBN',422),(119,'LS','LESOTHO','Lesotho','LSO',426),(120,'LR','LIBERIA','Liberia','LBR',430),(121,'LY','LIBYAN ARAB JAMAHIRIYA','Libyan Arab Jamahiriya','LBY',434),(122,'LI','LIECHTENSTEIN','Liechtenstein','LIE',438),(123,'LT','LITHUANIA','Lithuania','LTU',440),(124,'LU','LUXEMBOURG','Luxembourg','LUX',442),(125,'MO','MACAO','Macao','MAC',446),(126,'MK','MACEDONIA, THE FORMER YUGOSLAV REPUBLIC OF','Macedonia, the Former Yugoslav Republic of','MKD',807),(127,'MG','MADAGASCAR','Madagascar','MDG',450),(128,'MW','MALAWI','Malawi','MWI',454),(129,'MY','MALAYSIA','Malaysia','MYS',458),(130,'MV','MALDIVES','Maldives','MDV',462),(131,'ML','MALI','Mali','MLI',466),(132,'MT','MALTA','Malta','MLT',470),(133,'MH','MARSHALL ISLANDS','Marshall Islands','MHL',584),(134,'MQ','MARTINIQUE','Martinique','MTQ',474),(135,'MR','MAURITANIA','Mauritania','MRT',478),(136,'MU','MAURITIUS','Mauritius','MUS',480),(137,'YT','MAYOTTE','Mayotte',NULL,NULL),(138,'MX','MEXICO','Mexico','MEX',484),(139,'FM','MICRONESIA, FEDERATED STATES OF','Micronesia, Federated States of','FSM',583),(140,'MD','MOLDOVA, REPUBLIC OF','Moldova, Republic of','MDA',498),(141,'MC','MONACO','Monaco','MCO',492),(142,'MN','MONGOLIA','Mongolia','MNG',496),(143,'MS','MONTSERRAT','Montserrat','MSR',500),(144,'MA','MOROCCO','Morocco','MAR',504),(145,'MZ','MOZAMBIQUE','Mozambique','MOZ',508),(146,'MM','MYANMAR','Myanmar','MMR',104),(147,'NA','NAMIBIA','Namibia','NAM',516),(148,'NR','NAURU','Nauru','NRU',520),(149,'NP','NEPAL','Nepal','NPL',524),(150,'NL','NETHERLANDS','Netherlands','NLD',528),(151,'AN','NETHERLANDS ANTILLES','Netherlands Antilles','ANT',530),(152,'NC','NEW CALEDONIA','New Caledonia','NCL',540),(153,'NZ','NEW ZEALAND','New Zealand','NZL',554),(154,'NI','NICARAGUA','Nicaragua','NIC',558),(155,'NE','NIGER','Niger','NER',562),(156,'NG','NIGERIA','Nigeria','NGA',566),(157,'NU','NIUE','Niue','NIU',570),(158,'NF','NORFOLK ISLAND','Norfolk Island','NFK',574),(159,'MP','NORTHERN MARIANA ISLANDS','Northern Mariana Islands','MNP',580),(160,'NO','NORWAY','Norway','NOR',578),(161,'OM','OMAN','Oman','OMN',512),(162,'PK','PAKISTAN','Pakistan','PAK',586),(163,'PW','PALAU','Palau','PLW',585),(164,'PS','PALESTINIAN TERRITORY, OCCUPIED','Palestinian Territory, Occupied',NULL,NULL),(165,'PA','PANAMA','Panama','PAN',591),(166,'PG','PAPUA NEW GUINEA','Papua New Guinea','PNG',598),(167,'PY','PARAGUAY','Paraguay','PRY',600),(168,'PE','PERU','Peru','PER',604),(169,'PH','PHILIPPINES','Philippines','PHL',608),(170,'PN','PITCAIRN','Pitcairn','PCN',612),(171,'PL','POLAND','Poland','POL',616),(172,'PT','PORTUGAL','Portugal','PRT',620),(173,'PR','PUERTO RICO','Puerto Rico','PRI',630),(174,'QA','QATAR','Qatar','QAT',634),(175,'RE','REUNION','Reunion','REU',638),(176,'RO','ROMANIA','Romania','ROM',642),(177,'RU','RUSSIAN FEDERATION','Russian Federation','RUS',643),(178,'RW','RWANDA','Rwanda','RWA',646),(179,'SH','SAINT HELENA','Saint Helena','SHN',654),(180,'KN','SAINT KITTS AND NEVIS','Saint Kitts and Nevis','KNA',659),(181,'LC','SAINT LUCIA','Saint Lucia','LCA',662),(182,'PM','SAINT PIERRE AND MIQUELON','Saint Pierre and Miquelon','SPM',666),(183,'VC','SAINT VINCENT AND THE GRENADINES','Saint Vincent and the Grenadines','VCT',670),(184,'WS','SAMOA','Samoa','WSM',882),(185,'SM','SAN MARINO','San Marino','SMR',674),(186,'ST','SAO TOME AND PRINCIPE','Sao Tome and Principe','STP',678),(187,'SA','SAUDI ARABIA','Saudi Arabia','SAU',682),(188,'SN','SENEGAL','Senegal','SEN',686),(189,'CS','SERBIA AND MONTENEGRO','Serbia and Montenegro',NULL,NULL),(190,'SC','SEYCHELLES','Seychelles','SYC',690),(191,'SL','SIERRA LEONE','Sierra Leone','SLE',694),(192,'SG','SINGAPORE','Singapore','SGP',702),(193,'SK','SLOVAKIA','Slovakia','SVK',703),(194,'SI','SLOVENIA','Slovenia','SVN',705),(195,'SB','SOLOMON ISLANDS','Solomon Islands','SLB',90),(196,'SO','SOMALIA','Somalia','SOM',706),(197,'ZA','SOUTH AFRICA','South Africa','ZAF',710),(198,'GS','SOUTH GEORGIA AND THE SOUTH SANDWICH ISLANDS','South Georgia and the South Sandwich Islands',NULL,NULL),(199,'ES','SPAIN','Spain','ESP',724),(200,'LK','SRI LANKA','Sri Lanka','LKA',144),(201,'SD','SUDAN','Sudan','SDN',736),(202,'SR','SURINAME','Suriname','SUR',740),(203,'SJ','SVALBARD AND JAN MAYEN','Svalbard and Jan Mayen','SJM',744),(204,'SZ','SWAZILAND','Swaziland','SWZ',748),(205,'SE','SWEDEN','Sweden','SWE',752),(206,'CH','SWITZERLAND','Switzerland','CHE',756),(207,'SY','SYRIAN ARAB REPUBLIC','Syrian Arab Republic','SYR',760),(208,'TW','TAIWAN, PROVINCE OF CHINA','Taiwan','TWN',158),(209,'TJ','TAJIKISTAN','Tajikistan','TJK',762),(210,'TZ','TANZANIA, UNITED REPUBLIC OF','Tanzania, United Republic of','TZA',834),(211,'TH','THAILAND','Thailand','THA',764),(212,'TL','TIMOR-LESTE','Timor-Leste',NULL,NULL),(213,'TG','TOGO','Togo','TGO',768),(214,'TK','TOKELAU','Tokelau','TKL',772),(215,'TO','TONGA','Tonga','TON',776),(216,'TT','TRINIDAD AND TOBAGO','Trinidad and Tobago','TTO',780),(217,'TN','TUNISIA','Tunisia','TUN',788),(218,'TR','TURKEY','Turkey','TUR',792),(219,'TM','TURKMENISTAN','Turkmenistan','TKM',795),(220,'TC','TURKS AND CAICOS ISLANDS','Turks and Caicos Islands','TCA',796),(221,'TV','TUVALU','Tuvalu','TUV',798),(222,'UG','UGANDA','Uganda','UGA',800),(223,'UA','UKRAINE','Ukraine','UKR',804),(224,'AE','UNITED ARAB EMIRATES','United Arab Emirates','ARE',784),(225,'GB','UNITED KINGDOM','United Kingdom','GBR',826),(226,'US','UNITED STATES','United States','USA',840),(227,'UM','UNITED STATES MINOR OUTLYING ISLANDS','United States Minor Outlying Islands',NULL,NULL),(228,'UY','URUGUAY','Uruguay','URY',858),(229,'UZ','UZBEKISTAN','Uzbekistan','UZB',860),(230,'VU','VANUATU','Vanuatu','VUT',548),(231,'VE','VENEZUELA','Venezuela','VEN',862),(232,'VN','VIET NAM','Viet Nam','VNM',704),(233,'VG','VIRGIN ISLANDS, BRITISH','Virgin Islands, British','VGB',92),(234,'VI','VIRGIN ISLANDS, U.S.','Virgin Islands, U.s.','VIR',850),(235,'WF','WALLIS AND FUTUNA','Wallis and Futuna','WLF',876),(236,'EH','WESTERN SAHARA','Western Sahara','ESH',732),(237,'YE','YEMEN','Yemen','YEM',887),(238,'ZM','ZAMBIA','Zambia','ZMB',894),(239,'ZW','ZIMBABWE','Zimbabwe','ZWE',716);
/*!40000 ALTER TABLE `country` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `courses`
--

DROP TABLE IF EXISTS `courses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `courses` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `code` varchar(300) NOT NULL,
  `name` varchar(300) NOT NULL,
  `description` text,
  `coordinator` bigint DEFAULT NULL,
  `trainer` varchar(300) DEFAULT NULL,
  `trainer_info` text,
  `paymentType` enum('Company Sponsored','Paid by Employee') DEFAULT 'Company Sponsored',
  `currency` varchar(3) DEFAULT NULL,
  `cost` decimal(12,2) DEFAULT '0.00',
  `status` enum('Active','Inactive') DEFAULT 'Active',
  `created` datetime DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `Fk_Courses_Employees` (`coordinator`),
  CONSTRAINT `Fk_Courses_Employees` FOREIGN KEY (`coordinator`) REFERENCES `employees` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `courses`
--

LOCK TABLES `courses` WRITE;
/*!40000 ALTER TABLE `courses` DISABLE KEYS */;
INSERT INTO `courses` VALUES (1,'C0001','Info Marketing','Learn how to Create and Outsource Info Marketing Products',1,'Tim Jhon','Tim Jhon has a background in business management and has been working with small business to establish their online presence','Company Sponsored','USD',55.00,'Active','2021-07-07 15:47:50','2021-07-07 15:47:50'),(2,'C0002','People Management','Learn how to Manage People',1,'Tim Jhon','Tim Jhon has a background in business management and has been working with small business to establish their online presence','Company Sponsored','USD',59.00,'Active','2021-07-07 15:47:50','2021-07-07 15:47:50');
/*!40000 ALTER TABLE `courses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `crons`
--

DROP TABLE IF EXISTS `crons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `crons` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `class` varchar(100) NOT NULL,
  `lastrun` datetime DEFAULT NULL,
  `frequency` int NOT NULL,
  `time` varchar(50) NOT NULL,
  `type` enum('Minutely','Hourly','Daily','Weekly','Monthly','Yearly') DEFAULT 'Hourly',
  `status` enum('Enabled','Disabled') DEFAULT 'Enabled',
  PRIMARY KEY (`id`),
  KEY `KEY_Crons_frequency` (`frequency`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `crons`
--

LOCK TABLES `crons` WRITE;
/*!40000 ALTER TABLE `crons` DISABLE KEYS */;
INSERT INTO `crons` VALUES (1,'Email Sender Task','EmailSenderTask',NULL,1,'1','Minutely','Enabled'),(2,'Document Expire Alert','DocumentExpiryNotificationTask',NULL,1,'16','Hourly','Enabled');
/*!40000 ALTER TABLE `crons` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `currencytypes`
--

DROP TABLE IF EXISTS `currencytypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `currencytypes` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `code` varchar(3) NOT NULL DEFAULT '',
  `name` varchar(70) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `CurrencyTypes_code` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=181 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `currencytypes`
--

LOCK TABLES `currencytypes` WRITE;
/*!40000 ALTER TABLE `currencytypes` DISABLE KEYS */;
INSERT INTO `currencytypes` VALUES (3,'AED','Utd. Arab Emir. Dirham'),(4,'AFN','Afghanistan Afghani'),(5,'ALL','Albanian Lek'),(6,'ANG','NL Antillian Guilder'),(7,'AOR','Angolan New Kwanza'),(8,'ARS','Argentine Peso'),(10,'AUD','Australian Dollar'),(11,'AWG','Aruban Florin'),(12,'BBD','Barbados Dollar'),(13,'BDT','Bangladeshi Taka'),(15,'BGL','Bulgarian Lev'),(16,'BHD','Bahraini Dinar'),(17,'BIF','Burundi Franc'),(18,'BMD','Bermudian Dollar'),(19,'BND','Brunei Dollar'),(20,'BOB','Bolivian Boliviano'),(21,'BRL','Brazilian Real'),(22,'BSD','Bahamian Dollar'),(23,'BTN','Bhutan Ngultrum'),(24,'BWP','Botswana Pula'),(25,'BZD','Belize Dollar'),(26,'CAD','Canadian Dollar'),(27,'CHF','Swiss Franc'),(28,'CLP','Chilean Peso'),(29,'CNY','Chinese Yuan Renminbi'),(30,'COP','Colombian Peso'),(31,'CRC','Costa Rican Colon'),(32,'CUP','Cuban Peso'),(33,'CVE','Cape Verde Escudo'),(34,'CYP','Cyprus Pound'),(37,'DJF','Djibouti Franc'),(38,'DKK','Danish Krona'),(39,'DOP','Dominican Peso'),(40,'DZD','Algerian Dinar'),(41,'ECS','Ecuador Sucre'),(42,'EUR','Euro'),(43,'EEK','Estonian Krona'),(44,'EGP','Egyptian Pound'),(46,'ETB','Ethiopian Birr'),(48,'FJD','Fiji Dollar'),(49,'FKP','Falkland Islands Pound'),(51,'GBP','Pound Sterling'),(52,'GHC','Ghanaian Cedi'),(53,'GIP','Gibraltar Pound'),(54,'GMD','Gambian Dalasi'),(55,'GNF','Guinea Franc'),(57,'GTQ','Guatemalan Quetzal'),(58,'GYD','Guyanan Dollar'),(59,'HKD','Hong Kong Dollar'),(60,'HNL','Honduran Lempira'),(61,'HRK','Croatian Kuna'),(62,'HTG','Haitian Gourde'),(63,'HUF','Hungarian Forint'),(64,'IDR','Indonesian Rupiah'),(66,'ILS','Israeli New Shekel'),(67,'INR','Indian Rupee'),(68,'IQD','Iraqi Dinar'),(69,'IRR','Iranian Rial'),(70,'ISK','Iceland Krona'),(72,'JMD','Jamaican Dollar'),(73,'JOD','Jordanian Dinar'),(74,'JPY','Japanese Yen'),(75,'KES','Kenyan Shilling'),(76,'KHR','Kampuchean Riel'),(77,'KMF','Comoros Franc'),(78,'KPW','North Korean Won'),(79,'KRW','Korean Won'),(80,'KWD','Kuwaiti Dinar'),(81,'KYD','Cayman Islands Dollar'),(82,'KZT','Kazakhstan Tenge'),(83,'LAK','Lao Kip'),(84,'LBP','Lebanese Pound'),(85,'LKR','Sri Lanka Rupee'),(86,'LRD','Liberian Dollar'),(87,'LSL','Lesotho Loti'),(88,'LTL','Lithuanian Litas'),(90,'LVL','Latvian Lats'),(91,'LYD','Libyan Dinar'),(92,'MAD','Moroccan Dirham'),(93,'MGF','Malagasy Franc'),(94,'MMK','Myanmar Kyat'),(95,'MNT','Mongolian Tugrik'),(96,'MOP','Macau Pataca'),(97,'MRO','Mauritanian Ouguiya'),(98,'MTL','Maltese Lira'),(99,'MUR','Mauritius Rupee'),(100,'MVR','Maldive Rufiyaa'),(101,'MWK','Malawi Kwacha'),(102,'MXN','Mexican New Peso'),(103,'MYR','Malaysian Ringgit'),(104,'MZM','Mozambique Metical'),(105,'NAD','Namibia Dollar'),(106,'NGN','Nigerian Naira'),(107,'NIO','Nicaraguan Cordoba Oro'),(109,'NOK','Norwegian Krona'),(110,'NPR','Nepalese Rupee'),(111,'NZD','New Zealand Dollar'),(112,'OMR','Omani Rial'),(113,'PAB','Panamanian Balboa'),(114,'PEN','Peruvian Nuevo Sol'),(115,'PGK','Papua New Guinea Kina'),(116,'PHP','Philippine Peso'),(117,'PKR','Pakistan Rupee'),(118,'PLN','Polish Zloty'),(120,'PYG','Paraguay Guarani'),(121,'QAR','Qatari Rial'),(122,'ROL','Romanian Leu'),(123,'RUB','Russian Rouble'),(125,'SBD','Solomon Islands Dollar'),(126,'SCR','Seychelles Rupee'),(127,'SDD','Sudanese Dinar'),(128,'SDP','Sudanese Pound'),(129,'SEK','Swedish Krona'),(130,'SKK','Slovak Koruna'),(131,'SGD','Singapore Dollar'),(132,'SHP','St. Helena Pound'),(135,'SLL','Sierra Leone Leone'),(136,'SOS','Somali Shilling'),(137,'SRD','Surinamese Dollar'),(138,'STD','Sao Tome/Principe Dobra'),(139,'SVC','El Salvador Colon'),(140,'SYP','Syrian Pound'),(141,'SZL','Swaziland Lilangeni'),(142,'THB','Thai Baht'),(143,'TND','Tunisian Dinar'),(144,'TOP','Tongan Pa\'anga'),(145,'TRL','Turkish Lira'),(146,'TTD','Trinidad/Tobago Dollar'),(147,'TWD','Taiwan Dollar'),(148,'TZS','Tanzanian Shilling'),(149,'UAH','Ukraine Hryvnia'),(150,'UGX','Uganda Shilling'),(151,'USD','United States Dollar'),(152,'UYP','Uruguayan Peso'),(153,'VEB','Venezuelan Bolivar'),(154,'VND','Vietnamese Dong'),(155,'VUV','Vanuatu Vatu'),(156,'WST','Samoan Tala'),(158,'XAF','CFA Franc BEAC'),(159,'XAG','Silver (oz.)'),(160,'XAU','Gold (oz.)'),(161,'XCD','Eastern Caribbean Dollars'),(162,'XOF','CFA Franc BCEAO'),(163,'XPD','Palladium (oz.)'),(164,'XPF','CFP Franc'),(165,'XPT','Platinum (oz.)'),(166,'YER','Yemeni Riyal'),(167,'YUM','Yugoslavian Dinar'),(168,'ZAR','South African Rand'),(169,'ZRN','New Zaire'),(170,'ZWD','Zimbabwe Dollar'),(171,'CZK','Czech Koruna'),(172,'MXP','Mexican Peso'),(173,'SAR','Saudi Arabia Riyal'),(175,'YUN','Yugoslav Dinar'),(176,'ZMK','Zambian Kwacha'),(177,'ARP','Argentina Pesos'),(179,'XDR','IMF Special Drawing Right'),(180,'RUR','Russia Rubles');
/*!40000 ALTER TABLE `currencytypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customfields`
--

DROP TABLE IF EXISTS `customfields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customfields` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `type` varchar(20) NOT NULL,
  `name` varchar(20) NOT NULL,
  `data` text,
  `display` enum('Form','Table and Form','Hidden') DEFAULT 'Form',
  `created` datetime DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  `field_type` varchar(20) DEFAULT NULL,
  `field_label` varchar(50) DEFAULT NULL,
  `field_validation` varchar(50) DEFAULT NULL,
  `field_options` varchar(500) DEFAULT NULL,
  `display_order` int DEFAULT '0',
  `display_section` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `CustomFields_name` (`type`,`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customfields`
--

LOCK TABLES `customfields` WRITE;
/*!40000 ALTER TABLE `customfields` DISABLE KEYS */;
/*!40000 ALTER TABLE `customfields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customfieldvalues`
--

DROP TABLE IF EXISTS `customfieldvalues`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customfieldvalues` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `type` varchar(20) NOT NULL,
  `name` varchar(60) NOT NULL,
  `object_id` varchar(60) NOT NULL,
  `value` text,
  `updated` datetime DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `CustomFields_type_name_object_id` (`type`,`name`,`object_id`),
  KEY `CustomFields_type_object_id` (`type`,`object_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customfieldvalues`
--

LOCK TABLES `customfieldvalues` WRITE;
/*!40000 ALTER TABLE `customfieldvalues` DISABLE KEYS */;
/*!40000 ALTER TABLE `customfieldvalues` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dataentrybackups`
--

DROP TABLE IF EXISTS `dataentrybackups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dataentrybackups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `tableType` varchar(200) DEFAULT NULL,
  `data` longtext,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dataentrybackups`
--

LOCK TABLES `dataentrybackups` WRITE;
/*!40000 ALTER TABLE `dataentrybackups` DISABLE KEYS */;
/*!40000 ALTER TABLE `dataentrybackups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dataimport`
--

DROP TABLE IF EXISTS `dataimport`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dataimport` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(60) NOT NULL,
  `dataType` varchar(60) NOT NULL,
  `details` text,
  `columns` text,
  `updated` datetime DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dataimport`
--

LOCK TABLES `dataimport` WRITE;
/*!40000 ALTER TABLE `dataimport` DISABLE KEYS */;
INSERT INTO `dataimport` VALUES (1,'Employee Data Import','EmployeeDataImporter','','[{\"name\":\"employee_id\",\"title\":\"\",\"type\":\"Normal\",\"dependOn\":\"NULL\",\"dependOnField\":\"\",\"isKeyField\":\"No\",\"idField\":\"Yes\",\"id\":\"columns_7\"},{\"name\":\"first_name\",\"title\":\"\",\"type\":\"Normal\",\"dependOn\":\"NULL\",\"dependOnField\":\"\",\"isKeyField\":\"No\",\"idField\":\"No\",\"id\":\"columns_3\"},{\"name\":\"middle_name\",\"title\":\"\",\"type\":\"Normal\",\"dependOn\":\"NULL\",\"dependOnField\":\"\",\"isKeyField\":\"No\",\"idField\":\"No\",\"id\":\"columns_5\"},{\"name\":\"last_name\",\"title\":\"\",\"type\":\"Normal\",\"dependOn\":\"NULL\",\"dependOnField\":\"\",\"isKeyField\":\"No\",\"idField\":\"No\",\"id\":\"columns_6\"},{\"name\":\"address1\",\"title\":\"Address1\",\"type\":\"Normal\",\"dependOn\":\"NULL\",\"dependOnField\":\"\",\"isKeyField\":\"No\",\"idField\":\"No\",\"id\":\"columns_8\"},{\"name\":\"address2\",\"title\":\"Address2\",\"type\":\"Normal\",\"dependOn\":\"NULL\",\"dependOnField\":\"\",\"isKeyField\":\"No\",\"idField\":\"No\",\"id\":\"columns_9\"},{\"name\":\"home_phone\",\"title\":\"\",\"type\":\"Normal\",\"dependOn\":\"NULL\",\"dependOnField\":\"\",\"isKeyField\":\"No\",\"idField\":\"No\",\"id\":\"columns_14\"},{\"name\":\"mobile_phone\",\"title\":\"\",\"type\":\"Normal\",\"dependOn\":\"NULL\",\"dependOnField\":\"\",\"isKeyField\":\"No\",\"idField\":\"No\",\"id\":\"columns_15\"},{\"name\":\"work_email\",\"title\":\"\",\"type\":\"Normal\",\"dependOn\":\"NULL\",\"dependOnField\":\"\",\"isKeyField\":\"No\",\"idField\":\"No\",\"id\":\"columns_16\"},{\"name\":\"gender\",\"title\":\"\",\"type\":\"Normal\",\"dependOn\":\"NULL\",\"dependOnField\":\"\",\"isKeyField\":\"No\",\"idField\":\"No\",\"id\":\"columns_17\"},{\"name\":\"marital_status\",\"title\":\"\",\"type\":\"Normal\",\"dependOn\":\"NULL\",\"dependOnField\":\"\",\"isKeyField\":\"No\",\"idField\":\"No\",\"id\":\"columns_18\"},{\"name\":\"birthday\",\"title\":\"\",\"type\":\"Normal\",\"dependOn\":\"NULL\",\"dependOnField\":\"\",\"isKeyField\":\"No\",\"idField\":\"No\",\"id\":\"columns_20\"},{\"name\":\"nationality\",\"title\":\"Nationality\",\"type\":\"Reference\",\"dependOn\":\"Nationality\",\"dependOnField\":\"name\",\"isKeyField\":\"Yes\",\"idField\":\"No\",\"id\":\"columns_22\"},{\"name\":\"ethnicity\",\"title\":\"Ethnicity\",\"type\":\"Normal\",\"dependOn\":\"Ethnicity\",\"dependOnField\":\"name\",\"isKeyField\":\"Yes\",\"idField\":\"No\",\"id\":\"columns_23\"},{\"name\":\"EmergencyContact/name\",\"title\":\"\",\"type\":\"Attached\",\"dependOn\":\"EmergencyContact\",\"dependOnField\":\"name\",\"isKeyField\":\"Yes\",\"idField\":\"No\",\"id\":\"columns_24\"},{\"name\":\"EmergencyContact/relationship\",\"title\":\"\",\"type\":\"Attached\",\"dependOn\":\"EmergencyContact\",\"dependOnField\":\"relationship\",\"isKeyField\":\"No\",\"idField\":\"No\",\"id\":\"columns_25\"},{\"name\":\"EmergencyContact/home_phone\",\"title\":\"\",\"type\":\"Attached\",\"dependOn\":\"EmergencyContact\",\"dependOnField\":\"home_phone\",\"isKeyField\":\"No\",\"idField\":\"No\",\"id\":\"columns_26\"},{\"name\":\"ssn_num\",\"title\":\"\",\"type\":\"Normal\",\"dependOn\":\"NULL\",\"dependOnField\":\"\",\"isKeyField\":\"No\",\"idField\":\"No\",\"id\":\"columns_31\"},{\"name\":\"job_title\",\"title\":\"\",\"type\":\"Reference\",\"dependOn\":\"JobTitle\",\"dependOnField\":\"name\",\"isKeyField\":\"Yes\",\"idField\":\"No\",\"id\":\"columns_32\"},{\"name\":\"employment_status\",\"title\":\"\",\"type\":\"Reference\",\"dependOn\":\"EmploymentStatus\",\"dependOnField\":\"name\",\"isKeyField\":\"Yes\",\"idField\":\"No\",\"id\":\"columns_33\"},{\"name\":\"joined_date\",\"title\":\"\",\"type\":\"Normal\",\"dependOn\":\"NULL\",\"dependOnField\":\"\",\"isKeyField\":\"No\",\"idField\":\"No\",\"id\":\"columns_36\"},{\"name\":\"department\",\"title\":\"\",\"type\":\"Reference\",\"dependOn\":\"CompanyStructure\",\"dependOnField\":\"title\",\"isKeyField\":\"Yes\",\"idField\":\"No\",\"id\":\"columns_38\"}]','2016-06-02 18:56:32','2016-06-02 18:56:32'),(2,'Attendance Data Import','AttendanceDataImporter','','[{\"name\":\"employee\",\"title\":\"\",\"type\":\"Reference\",\"dependOn\":\"Employee\",\"dependOnField\":\"employee_id\",\"isKeyField\":\"Yes\",\"idField\":\"No\",\"id\":\"columns_1\"},{\"name\":\"in_time\",\"title\":\"\",\"type\":\"Normal\",\"dependOn\":\"NULL\",\"dependOnField\":\"\",\"isKeyField\":\"No\",\"idField\":\"No\",\"id\":\"columns_2\"},{\"name\":\"out_time\",\"title\":\"\",\"type\":\"Normal\",\"dependOn\":\"NULL\",\"dependOnField\":\"\",\"isKeyField\":\"No\",\"idField\":\"No\",\"id\":\"columns_3\"},{\"name\":\"note\",\"title\":\"\",\"type\":\"Normal\",\"dependOn\":\"NULL\",\"dependOnField\":\"\",\"isKeyField\":\"No\",\"idField\":\"No\",\"id\":\"columns_4\"}]','2016-08-14 02:51:56','2016-08-14 02:51:56');
/*!40000 ALTER TABLE `dataimport` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dataimportfiles`
--

DROP TABLE IF EXISTS `dataimportfiles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dataimportfiles` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(60) NOT NULL,
  `data_import_definition` varchar(200) NOT NULL,
  `status` varchar(15) DEFAULT NULL,
  `file` varchar(100) DEFAULT NULL,
  `details` text,
  `updated` datetime DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dataimportfiles`
--

LOCK TABLES `dataimportfiles` WRITE;
/*!40000 ALTER TABLE `dataimportfiles` DISABLE KEYS */;
/*!40000 ALTER TABLE `dataimportfiles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `deductiongroup`
--

DROP TABLE IF EXISTS `deductiongroup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `deductiongroup` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `description` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `deductiongroup`
--

LOCK TABLES `deductiongroup` WRITE;
/*!40000 ALTER TABLE `deductiongroup` DISABLE KEYS */;
/*!40000 ALTER TABLE `deductiongroup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `deductions`
--

DROP TABLE IF EXISTS `deductions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `deductions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `componentType` varchar(250) DEFAULT NULL,
  `component` varchar(250) DEFAULT NULL,
  `payrollColumn` int DEFAULT NULL,
  `rangeAmounts` text,
  `deduction_group` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `Fk_Deductions_DeductionGroup` (`deduction_group`),
  CONSTRAINT `Fk_Deductions_DeductionGroup` FOREIGN KEY (`deduction_group`) REFERENCES `deductiongroup` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `deductions`
--

LOCK TABLES `deductions` WRITE;
/*!40000 ALTER TABLE `deductions` DISABLE KEYS */;
/*!40000 ALTER TABLE `deductions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `documents`
--

DROP TABLE IF EXISTS `documents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `documents` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `details` text,
  `expire_notification` enum('Yes','No') DEFAULT 'Yes',
  `expire_notification_month` enum('Yes','No') DEFAULT 'Yes',
  `expire_notification_week` enum('Yes','No') DEFAULT 'Yes',
  `expire_notification_day` enum('Yes','No') DEFAULT 'Yes',
  `sign` enum('Yes','No') DEFAULT 'Yes',
  `sign_label` varchar(500) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `documents`
--

LOCK TABLES `documents` WRITE;
/*!40000 ALTER TABLE `documents` DISABLE KEYS */;
INSERT INTO `documents` VALUES (1,'ID Copy','Your ID copy','Yes','Yes','Yes','Yes','No',NULL,'2021-07-07 15:47:41','2021-07-07 15:47:41'),(2,'Degree Certificate','Degree Certificate','Yes','Yes','Yes','Yes','Yes',NULL,'2021-07-07 15:47:41','2021-07-07 15:47:41'),(3,'Driving License','Driving License','Yes','Yes','Yes','Yes','Yes',NULL,'2021-07-07 15:47:41','2021-07-07 15:47:41');
/*!40000 ALTER TABLE `documents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `educationlevel`
--

DROP TABLE IF EXISTS `educationlevel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `educationlevel` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(250) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `educationlevel`
--

LOCK TABLES `educationlevel` WRITE;
/*!40000 ALTER TABLE `educationlevel` DISABLE KEYS */;
INSERT INTO `educationlevel` VALUES (1,'Unspecified'),(2,'High School or equivalent'),(3,'Certification'),(4,'Vocational'),(5,'Associate Degree'),(6,'Bachelor\'s Degree'),(7,'Master\'s Degree'),(8,'Doctorate'),(9,'Professional'),(10,'Some College Coursework Completed'),(11,'Vocational - HS Diploma'),(12,'Vocational - Degree'),(13,'Some High School Coursework');
/*!40000 ALTER TABLE `educationlevel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `educations`
--

DROP TABLE IF EXISTS `educations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `educations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `description` varchar(400) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `educations`
--

LOCK TABLES `educations` WRITE;
/*!40000 ALTER TABLE `educations` DISABLE KEYS */;
INSERT INTO `educations` VALUES (1,'Bachelors Degree','Bachelors Degree'),(2,'Diploma','Diploma'),(3,'Masters Degree','Masters Degree'),(4,'Doctorate','Doctorate');
/*!40000 ALTER TABLE `educations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `emails`
--

DROP TABLE IF EXISTS `emails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `emails` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `subject` varchar(300) NOT NULL,
  `toEmail` varchar(300) NOT NULL,
  `template` text,
  `params` text,
  `cclist` varchar(500) DEFAULT NULL,
  `bcclist` varchar(500) DEFAULT NULL,
  `error` varchar(500) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  `status` enum('Pending','Sent','Error') DEFAULT 'Pending',
  PRIMARY KEY (`id`),
  KEY `KEY_Emails_status` (`status`),
  KEY `KEY_Emails_created` (`created`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `emails`
--

LOCK TABLES `emails` WRITE;
/*!40000 ALTER TABLE `emails` DISABLE KEYS */;
/*!40000 ALTER TABLE `emails` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `emergencycontacts`
--

DROP TABLE IF EXISTS `emergencycontacts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `emergencycontacts` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `employee` bigint NOT NULL,
  `name` varchar(100) NOT NULL,
  `relationship` varchar(100) DEFAULT NULL,
  `home_phone` varchar(15) DEFAULT NULL,
  `work_phone` varchar(15) DEFAULT NULL,
  `mobile_phone` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `Fk_EmergencyContacts_Employee` (`employee`),
  CONSTRAINT `Fk_EmergencyContacts_Employee` FOREIGN KEY (`employee`) REFERENCES `employees` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `emergencycontacts`
--

LOCK TABLES `emergencycontacts` WRITE;
/*!40000 ALTER TABLE `emergencycontacts` DISABLE KEYS */;
/*!40000 ALTER TABLE `emergencycontacts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employeeapprovals`
--

DROP TABLE IF EXISTS `employeeapprovals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employeeapprovals` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `type` varchar(100) NOT NULL,
  `element` bigint NOT NULL,
  `approver` bigint DEFAULT NULL,
  `level` int DEFAULT '0',
  `status` int DEFAULT '0',
  `active` int DEFAULT '0',
  `created` datetime DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `EmployeeApprovals_type_element_level` (`type`,`element`,`level`),
  KEY `EmployeeApprovals_type_element_status_level` (`type`,`element`,`status`,`level`),
  KEY `EmployeeApprovals_type_element` (`type`,`element`),
  KEY `EmployeeApprovals_type` (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employeeapprovals`
--

LOCK TABLES `employeeapprovals` WRITE;
/*!40000 ALTER TABLE `employeeapprovals` DISABLE KEYS */;
/*!40000 ALTER TABLE `employeeapprovals` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employeeattendancesheets`
--

DROP TABLE IF EXISTS `employeeattendancesheets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employeeattendancesheets` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `employee` bigint NOT NULL,
  `date_start` date NOT NULL,
  `date_end` date NOT NULL,
  `status` enum('Approved','Pending','Rejected','Submitted') DEFAULT 'Pending',
  PRIMARY KEY (`id`),
  UNIQUE KEY `EmployeeAttendanceSheetsKey` (`employee`,`date_start`,`date_end`),
  KEY `EmployeeAttendanceSheets_date_end` (`date_end`),
  CONSTRAINT `Fk_EmployeeAttendanceSheets_Employee` FOREIGN KEY (`employee`) REFERENCES `employees` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employeeattendancesheets`
--

LOCK TABLES `employeeattendancesheets` WRITE;
/*!40000 ALTER TABLE `employeeattendancesheets` DISABLE KEYS */;
/*!40000 ALTER TABLE `employeeattendancesheets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employeecertifications`
--

DROP TABLE IF EXISTS `employeecertifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employeecertifications` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `certification_id` bigint DEFAULT NULL,
  `employee` bigint NOT NULL,
  `institute` varchar(400) DEFAULT NULL,
  `date_start` date DEFAULT NULL,
  `date_end` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `employee` (`employee`,`certification_id`),
  KEY `Fk_EmployeeCertifications_Certifications` (`certification_id`),
  CONSTRAINT `Fk_EmployeeCertifications_Certifications` FOREIGN KEY (`certification_id`) REFERENCES `certifications` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `Fk_EmployeeCertifications_Employee` FOREIGN KEY (`employee`) REFERENCES `employees` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employeecertifications`
--

LOCK TABLES `employeecertifications` WRITE;
/*!40000 ALTER TABLE `employeecertifications` DISABLE KEYS */;
/*!40000 ALTER TABLE `employeecertifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employeecompanyloans`
--

DROP TABLE IF EXISTS `employeecompanyloans`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employeecompanyloans` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `employee` bigint NOT NULL,
  `loan` bigint DEFAULT NULL,
  `start_date` date NOT NULL,
  `last_installment_date` date NOT NULL,
  `period_months` bigint DEFAULT NULL,
  `currency` bigint DEFAULT NULL,
  `amount` decimal(10,2) NOT NULL,
  `monthly_installment` decimal(10,2) NOT NULL,
  `status` enum('Approved','Repayment','Paid','Suspended') DEFAULT 'Approved',
  `details` text,
  PRIMARY KEY (`id`),
  KEY `Fk_EmployeeCompanyLoans_CompanyLoans` (`loan`),
  KEY `Fk_EmployeeCompanyLoans_Employee` (`employee`),
  CONSTRAINT `Fk_EmployeeCompanyLoans_CompanyLoans` FOREIGN KEY (`loan`) REFERENCES `companyloans` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `Fk_EmployeeCompanyLoans_Employee` FOREIGN KEY (`employee`) REFERENCES `employees` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employeecompanyloans`
--

LOCK TABLES `employeecompanyloans` WRITE;
/*!40000 ALTER TABLE `employeecompanyloans` DISABLE KEYS */;
/*!40000 ALTER TABLE `employeecompanyloans` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employeedatahistory`
--

DROP TABLE IF EXISTS `employeedatahistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employeedatahistory` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `type` varchar(100) NOT NULL,
  `employee` bigint NOT NULL,
  `field` varchar(100) NOT NULL,
  `old_value` varchar(500) DEFAULT NULL,
  `new_value` varchar(500) DEFAULT NULL,
  `description` varchar(800) DEFAULT NULL,
  `user` bigint DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `Fk_EmployeeDataHistory_Employee` (`employee`),
  KEY `Fk_EmployeeDataHistory_Users` (`user`),
  CONSTRAINT `Fk_EmployeeDataHistory_Employee` FOREIGN KEY (`employee`) REFERENCES `employees` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `Fk_EmployeeDataHistory_Users` FOREIGN KEY (`user`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employeedatahistory`
--

LOCK TABLES `employeedatahistory` WRITE;
/*!40000 ALTER TABLE `employeedatahistory` DISABLE KEYS */;
/*!40000 ALTER TABLE `employeedatahistory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employeedependents`
--

DROP TABLE IF EXISTS `employeedependents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employeedependents` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `employee` bigint NOT NULL,
  `name` varchar(100) NOT NULL,
  `relationship` enum('Child','Spouse','Parent','Other') DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `id_number` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `Fk_EmployeeDependents_Employee` (`employee`),
  CONSTRAINT `Fk_EmployeeDependents_Employee` FOREIGN KEY (`employee`) REFERENCES `employees` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employeedependents`
--

LOCK TABLES `employeedependents` WRITE;
/*!40000 ALTER TABLE `employeedependents` DISABLE KEYS */;
/*!40000 ALTER TABLE `employeedependents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employeedocuments`
--

DROP TABLE IF EXISTS `employeedocuments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employeedocuments` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `employee` bigint NOT NULL,
  `document` bigint DEFAULT NULL,
  `date_added` date NOT NULL,
  `valid_until` date NOT NULL,
  `status` enum('Active','Inactive','Draft') DEFAULT 'Active',
  `details` text,
  `attachment` varchar(100) DEFAULT NULL,
  `signature` text,
  `expire_notification_last` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `Fk_EmployeeDocuments_Documents` (`document`),
  KEY `Fk_EmployeeDocuments_Employee` (`employee`),
  KEY `KEY_EmployeeDocuments_valid_until` (`valid_until`),
  KEY `KEY_EmployeeDocuments_valid_until_status` (`valid_until`,`status`,`expire_notification_last`),
  CONSTRAINT `Fk_EmployeeDocuments_Documents` FOREIGN KEY (`document`) REFERENCES `documents` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `Fk_EmployeeDocuments_Employee` FOREIGN KEY (`employee`) REFERENCES `employees` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employeedocuments`
--

LOCK TABLES `employeedocuments` WRITE;
/*!40000 ALTER TABLE `employeedocuments` DISABLE KEYS */;
/*!40000 ALTER TABLE `employeedocuments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employeeeducations`
--

DROP TABLE IF EXISTS `employeeeducations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employeeeducations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `education_id` bigint DEFAULT NULL,
  `employee` bigint NOT NULL,
  `institute` varchar(400) DEFAULT NULL,
  `date_start` date DEFAULT NULL,
  `date_end` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `Fk_EmployeeEducations_Educations` (`education_id`),
  KEY `Fk_EmployeeEducations_Employee` (`employee`),
  CONSTRAINT `Fk_EmployeeEducations_Educations` FOREIGN KEY (`education_id`) REFERENCES `educations` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `Fk_EmployeeEducations_Employee` FOREIGN KEY (`employee`) REFERENCES `employees` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employeeeducations`
--

LOCK TABLES `employeeeducations` WRITE;
/*!40000 ALTER TABLE `employeeeducations` DISABLE KEYS */;
/*!40000 ALTER TABLE `employeeeducations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employeeethnicity`
--

DROP TABLE IF EXISTS `employeeethnicity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employeeethnicity` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `employee` bigint NOT NULL,
  `ethnicity` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `Fk_EmployeeEthnicity_Employee` (`employee`),
  KEY `Fk_EmployeeEthnicity_Ethnicity` (`ethnicity`),
  CONSTRAINT `Fk_EmployeeEthnicity_Employee` FOREIGN KEY (`employee`) REFERENCES `employees` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `Fk_EmployeeEthnicity_Ethnicity` FOREIGN KEY (`ethnicity`) REFERENCES `ethnicity` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employeeethnicity`
--

LOCK TABLES `employeeethnicity` WRITE;
/*!40000 ALTER TABLE `employeeethnicity` DISABLE KEYS */;
/*!40000 ALTER TABLE `employeeethnicity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employeeexpenses`
--

DROP TABLE IF EXISTS `employeeexpenses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employeeexpenses` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `employee` bigint NOT NULL,
  `expense_date` date DEFAULT NULL,
  `payment_method` bigint NOT NULL,
  `transaction_no` varchar(300) NOT NULL,
  `payee` varchar(500) NOT NULL,
  `category` bigint NOT NULL,
  `notes` text,
  `amount` decimal(10,3) DEFAULT NULL,
  `currency` bigint DEFAULT NULL,
  `attachment1` varchar(100) DEFAULT NULL,
  `attachment2` varchar(100) DEFAULT NULL,
  `attachment3` varchar(100) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  `status` enum('Approved','Pending','Rejected','Cancellation Requested','Cancelled','Processing') DEFAULT 'Pending',
  PRIMARY KEY (`id`),
  KEY `Fk_EmployeeExpenses_Employee` (`employee`),
  KEY `Fk_EmployeeExpenses_pm` (`payment_method`),
  KEY `Fk_EmployeeExpenses_category` (`category`),
  CONSTRAINT `Fk_EmployeeExpenses_category` FOREIGN KEY (`category`) REFERENCES `expensescategories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `Fk_EmployeeExpenses_Employee` FOREIGN KEY (`employee`) REFERENCES `employees` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `Fk_EmployeeExpenses_pm` FOREIGN KEY (`payment_method`) REFERENCES `expensespaymentmethods` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employeeexpenses`
--

LOCK TABLES `employeeexpenses` WRITE;
/*!40000 ALTER TABLE `employeeexpenses` DISABLE KEYS */;
/*!40000 ALTER TABLE `employeeexpenses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employeeforms`
--

DROP TABLE IF EXISTS `employeeforms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employeeforms` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `employee` bigint NOT NULL,
  `form` bigint NOT NULL,
  `status` enum('Pending','Completed') DEFAULT 'Pending',
  `created` datetime DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `Fk_EmployeeForms_Employee` (`employee`),
  KEY `Fk_EmployeeForms_Forms` (`form`),
  CONSTRAINT `Fk_EmployeeForms_Employee` FOREIGN KEY (`employee`) REFERENCES `employees` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `Fk_EmployeeForms_Forms` FOREIGN KEY (`form`) REFERENCES `forms` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employeeforms`
--

LOCK TABLES `employeeforms` WRITE;
/*!40000 ALTER TABLE `employeeforms` DISABLE KEYS */;
/*!40000 ALTER TABLE `employeeforms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employeeimmigrations`
--

DROP TABLE IF EXISTS `employeeimmigrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employeeimmigrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `employee` bigint NOT NULL,
  `document` bigint DEFAULT NULL,
  `documentname` varchar(150) NOT NULL,
  `valid_until` date NOT NULL,
  `status` enum('Active','Inactive','Draft') DEFAULT 'Active',
  `details` text,
  `attachment1` varchar(100) DEFAULT NULL,
  `attachment2` varchar(100) DEFAULT NULL,
  `attachment3` varchar(100) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `Fk_EmployeeImmigrations_Employee` (`employee`),
  KEY `Fk_EmployeeImmigrations_ImmigrationDocuments` (`document`),
  CONSTRAINT `Fk_EmployeeImmigrations_Employee` FOREIGN KEY (`employee`) REFERENCES `employees` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `Fk_EmployeeImmigrations_ImmigrationDocuments` FOREIGN KEY (`document`) REFERENCES `immigrationdocuments` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employeeimmigrations`
--

LOCK TABLES `employeeimmigrations` WRITE;
/*!40000 ALTER TABLE `employeeimmigrations` DISABLE KEYS */;
/*!40000 ALTER TABLE `employeeimmigrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employeeimmigrationstatus`
--

DROP TABLE IF EXISTS `employeeimmigrationstatus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employeeimmigrationstatus` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `employee` bigint NOT NULL,
  `status` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `Fk_EmployeeImmigrationStatus_Employee` (`employee`),
  KEY `Fk_EmployeeImmigrationStatus_Type` (`status`),
  CONSTRAINT `Fk_EmployeeImmigrationStatus_Employee` FOREIGN KEY (`employee`) REFERENCES `employees` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `Fk_EmployeeImmigrationStatus_Type` FOREIGN KEY (`status`) REFERENCES `immigrationstatus` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employeeimmigrationstatus`
--

LOCK TABLES `employeeimmigrationstatus` WRITE;
/*!40000 ALTER TABLE `employeeimmigrationstatus` DISABLE KEYS */;
/*!40000 ALTER TABLE `employeeimmigrationstatus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employeelanguages`
--

DROP TABLE IF EXISTS `employeelanguages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employeelanguages` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `language_id` bigint DEFAULT NULL,
  `employee` bigint NOT NULL,
  `reading` enum('Elementary Proficiency','Limited Working Proficiency','Professional Working Proficiency','Full Professional Proficiency','Native or Bilingual Proficiency') DEFAULT NULL,
  `speaking` enum('Elementary Proficiency','Limited Working Proficiency','Professional Working Proficiency','Full Professional Proficiency','Native or Bilingual Proficiency') DEFAULT NULL,
  `writing` enum('Elementary Proficiency','Limited Working Proficiency','Professional Working Proficiency','Full Professional Proficiency','Native or Bilingual Proficiency') DEFAULT NULL,
  `understanding` enum('Elementary Proficiency','Limited Working Proficiency','Professional Working Proficiency','Full Professional Proficiency','Native or Bilingual Proficiency') DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `employee` (`employee`,`language_id`),
  KEY `Fk_EmployeeLanguages_Languages` (`language_id`),
  CONSTRAINT `Fk_EmployeeLanguages_Employee` FOREIGN KEY (`employee`) REFERENCES `employees` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `Fk_EmployeeLanguages_Languages` FOREIGN KEY (`language_id`) REFERENCES `languages` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employeelanguages`
--

LOCK TABLES `employeelanguages` WRITE;
/*!40000 ALTER TABLE `employeelanguages` DISABLE KEYS */;
/*!40000 ALTER TABLE `employeelanguages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employeeleavedays`
--

DROP TABLE IF EXISTS `employeeleavedays`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employeeleavedays` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `employee_leave` bigint NOT NULL,
  `leave_date` date DEFAULT NULL,
  `leave_type` enum('Full Day','Half Day - Morning','Half Day - Afternoon','1 Hour - Morning','2 Hours - Morning','3 Hours - Morning','1 Hour - Afternoon','2 Hours - Afternoon','3 Hours - Afternoon') NOT NULL,
  PRIMARY KEY (`id`),
  KEY `Fk_EmployeeLeaveDays_EmployeeLeaves` (`employee_leave`),
  CONSTRAINT `Fk_EmployeeLeaveDays_EmployeeLeaves` FOREIGN KEY (`employee_leave`) REFERENCES `employeeleaves` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employeeleavedays`
--

LOCK TABLES `employeeleavedays` WRITE;
/*!40000 ALTER TABLE `employeeleavedays` DISABLE KEYS */;
/*!40000 ALTER TABLE `employeeleavedays` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employeeleavelog`
--

DROP TABLE IF EXISTS `employeeleavelog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employeeleavelog` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `employee_leave` bigint NOT NULL,
  `user_id` bigint DEFAULT NULL,
  `data` varchar(500) NOT NULL,
  `status_from` enum('Approved','Pending','Rejected','Cancellation Requested','Cancelled','Processing') DEFAULT 'Pending',
  `status_to` enum('Approved','Pending','Rejected','Cancellation Requested','Cancelled','Processing') DEFAULT 'Pending',
  `created` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `Fk_EmployeeLeaveLog_EmployeeLeaves` (`employee_leave`),
  KEY `Fk_EmployeeLeaveLog_Users` (`user_id`),
  CONSTRAINT `Fk_EmployeeLeaveLog_EmployeeLeaves` FOREIGN KEY (`employee_leave`) REFERENCES `employeeleaves` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `Fk_EmployeeLeaveLog_Users` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employeeleavelog`
--

LOCK TABLES `employeeleavelog` WRITE;
/*!40000 ALTER TABLE `employeeleavelog` DISABLE KEYS */;
/*!40000 ALTER TABLE `employeeleavelog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employeeleaves`
--

DROP TABLE IF EXISTS `employeeleaves`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employeeleaves` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `employee` bigint NOT NULL,
  `leave_type` bigint NOT NULL,
  `leave_period` bigint NOT NULL,
  `date_start` date DEFAULT NULL,
  `date_end` date DEFAULT NULL,
  `details` text,
  `status` enum('Approved','Pending','Rejected','Cancellation Requested','Cancelled','Processing') DEFAULT 'Pending',
  `attachment` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `Fk_EmployeeLeaves_Employee` (`employee`),
  KEY `Fk_EmployeeLeaves_LeaveTypes` (`leave_type`),
  KEY `Fk_EmployeeLeaves_LeavePeriods` (`leave_period`),
  CONSTRAINT `Fk_EmployeeLeaves_Employee` FOREIGN KEY (`employee`) REFERENCES `employees` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `Fk_EmployeeLeaves_LeavePeriods` FOREIGN KEY (`leave_period`) REFERENCES `leaveperiods` (`id`),
  CONSTRAINT `Fk_EmployeeLeaves_LeaveTypes` FOREIGN KEY (`leave_type`) REFERENCES `leavetypes` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employeeleaves`
--

LOCK TABLES `employeeleaves` WRITE;
/*!40000 ALTER TABLE `employeeleaves` DISABLE KEYS */;
/*!40000 ALTER TABLE `employeeleaves` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employeeovertime`
--

DROP TABLE IF EXISTS `employeeovertime`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employeeovertime` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `employee` bigint NOT NULL,
  `start_time` datetime DEFAULT NULL,
  `end_time` datetime DEFAULT NULL,
  `category` bigint NOT NULL,
  `project` bigint DEFAULT NULL,
  `notes` text,
  `created` datetime DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  `status` enum('Approved','Pending','Rejected','Cancellation Requested','Cancelled','Processing') DEFAULT 'Pending',
  PRIMARY KEY (`id`),
  KEY `Fk_EmployeeOvertime_Employee` (`employee`),
  KEY `Fk_EmployeeOvertime_Category` (`category`),
  CONSTRAINT `Fk_EmployeeOvertime_Category` FOREIGN KEY (`category`) REFERENCES `overtimecategories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `Fk_EmployeeOvertime_Employee` FOREIGN KEY (`employee`) REFERENCES `employees` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employeeovertime`
--

LOCK TABLES `employeeovertime` WRITE;
/*!40000 ALTER TABLE `employeeovertime` DISABLE KEYS */;
/*!40000 ALTER TABLE `employeeovertime` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employeeprojects`
--

DROP TABLE IF EXISTS `employeeprojects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employeeprojects` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `employee` bigint NOT NULL,
  `project` bigint DEFAULT NULL,
  `date_start` date DEFAULT NULL,
  `date_end` date DEFAULT NULL,
  `status` enum('Current','Inactive','Completed') DEFAULT 'Current',
  `details` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `EmployeeProjectsKey` (`employee`,`project`),
  KEY `Fk_EmployeeProjects_Projects` (`project`),
  CONSTRAINT `Fk_EmployeeProjects_Employee` FOREIGN KEY (`employee`) REFERENCES `employees` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `Fk_EmployeeProjects_Projects` FOREIGN KEY (`project`) REFERENCES `projects` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employeeprojects`
--

LOCK TABLES `employeeprojects` WRITE;
/*!40000 ALTER TABLE `employeeprojects` DISABLE KEYS */;
/*!40000 ALTER TABLE `employeeprojects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employees`
--

DROP TABLE IF EXISTS `employees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employees` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `employee_id` varchar(50) DEFAULT NULL,
  `first_name` varchar(100) NOT NULL DEFAULT '',
  `middle_name` varchar(100) DEFAULT NULL,
  `last_name` varchar(100) DEFAULT NULL,
  `nationality` bigint DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `gender` enum('Male','Female') DEFAULT NULL,
  `marital_status` enum('Married','Single','Divorced','Widowed','Other') DEFAULT NULL,
  `ssn_num` varchar(100) DEFAULT NULL,
  `nic_num` varchar(100) DEFAULT NULL,
  `other_id` varchar(100) DEFAULT NULL,
  `driving_license` varchar(100) DEFAULT NULL,
  `driving_license_exp_date` date DEFAULT NULL,
  `employment_status` bigint DEFAULT NULL,
  `job_title` bigint DEFAULT NULL,
  `pay_grade` bigint DEFAULT NULL,
  `work_station_id` varchar(100) DEFAULT NULL,
  `address1` varchar(100) DEFAULT NULL,
  `address2` varchar(100) DEFAULT NULL,
  `city` varchar(150) DEFAULT NULL,
  `country` char(2) DEFAULT NULL,
  `province` bigint DEFAULT NULL,
  `postal_code` varchar(20) DEFAULT NULL,
  `home_phone` varchar(50) DEFAULT NULL,
  `mobile_phone` varchar(50) DEFAULT NULL,
  `work_phone` varchar(50) DEFAULT NULL,
  `work_email` varchar(100) DEFAULT NULL,
  `private_email` varchar(100) DEFAULT NULL,
  `joined_date` date DEFAULT NULL,
  `confirmation_date` date DEFAULT NULL,
  `supervisor` bigint DEFAULT NULL,
  `indirect_supervisors` varchar(250) DEFAULT NULL,
  `department` bigint DEFAULT NULL,
  `custom1` varchar(250) DEFAULT NULL,
  `custom2` varchar(250) DEFAULT NULL,
  `custom3` varchar(250) DEFAULT NULL,
  `custom4` varchar(250) DEFAULT NULL,
  `custom5` varchar(250) DEFAULT NULL,
  `custom6` varchar(250) DEFAULT NULL,
  `custom7` varchar(250) DEFAULT NULL,
  `custom8` varchar(250) DEFAULT NULL,
  `custom9` varchar(250) DEFAULT NULL,
  `custom10` varchar(250) DEFAULT NULL,
  `termination_date` date DEFAULT NULL,
  `notes` text,
  `status` enum('Active','Terminated') DEFAULT 'Active',
  `ethnicity` bigint DEFAULT NULL,
  `immigration_status` bigint DEFAULT NULL,
  `approver1` bigint DEFAULT NULL,
  `approver2` bigint DEFAULT NULL,
  `approver3` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `employee_id` (`employee_id`),
  KEY `Fk_Employee_Nationality` (`nationality`),
  KEY `Fk_Employee_JobTitle` (`job_title`),
  KEY `Fk_Employee_EmploymentStatus` (`employment_status`),
  KEY `Fk_Employee_Country` (`country`),
  KEY `Fk_Employee_Province` (`province`),
  KEY `Fk_Employee_Supervisor` (`supervisor`),
  KEY `Fk_Employee_CompanyStructures` (`department`),
  KEY `Fk_Employee_PayGrades` (`pay_grade`),
  CONSTRAINT `Fk_Employee_CompanyStructures` FOREIGN KEY (`department`) REFERENCES `companystructures` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `Fk_Employee_Country` FOREIGN KEY (`country`) REFERENCES `country` (`code`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `Fk_Employee_EmploymentStatus` FOREIGN KEY (`employment_status`) REFERENCES `employmentstatus` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `Fk_Employee_JobTitle` FOREIGN KEY (`job_title`) REFERENCES `jobtitles` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `Fk_Employee_Nationality` FOREIGN KEY (`nationality`) REFERENCES `nationality` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `Fk_Employee_PayGrades` FOREIGN KEY (`pay_grade`) REFERENCES `paygrades` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `Fk_Employee_Province` FOREIGN KEY (`province`) REFERENCES `province` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `Fk_Employee_Supervisor` FOREIGN KEY (`supervisor`) REFERENCES `employees` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employees`
--

LOCK TABLES `employees` WRITE;
/*!40000 ALTER TABLE `employees` DISABLE KEYS */;
INSERT INTO `employees` VALUES (1,'EMP001','IceHrm','Sample','Employee',35,'1984-03-17','Male','Married','','294-38-3535','294-38-3535','',NULL,3,11,2,'','2772 Flynn Street','Willoughby','Willoughby','US',41,'44094','440-953-4578','440-953-4578','440-953-4578','icehrm+admin@web-stalk.com','icehrm+admin@web-stalk.com','2005-08-03',NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Active',NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `employees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employeesalary`
--

DROP TABLE IF EXISTS `employeesalary`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employeesalary` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `employee` bigint NOT NULL,
  `component` bigint NOT NULL,
  `pay_frequency` enum('Hourly','Daily','Bi Weekly','Weekly','Semi Monthly','Monthly') DEFAULT NULL,
  `currency` bigint DEFAULT NULL,
  `amount` decimal(10,2) NOT NULL,
  `details` text,
  PRIMARY KEY (`id`),
  KEY `Fk_EmployeeSalary_Employee` (`employee`),
  KEY `Fk_EmployeeSalary_Currency` (`currency`),
  CONSTRAINT `Fk_EmployeeSalary_Currency` FOREIGN KEY (`currency`) REFERENCES `currencytypes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `Fk_EmployeeSalary_Employee` FOREIGN KEY (`employee`) REFERENCES `employees` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employeesalary`
--

LOCK TABLES `employeesalary` WRITE;
/*!40000 ALTER TABLE `employeesalary` DISABLE KEYS */;
/*!40000 ALTER TABLE `employeesalary` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employeeskills`
--

DROP TABLE IF EXISTS `employeeskills`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employeeskills` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `skill_id` bigint DEFAULT NULL,
  `employee` bigint NOT NULL,
  `details` varchar(400) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `employee` (`employee`,`skill_id`),
  KEY `Fk_EmployeeSkills_Skills` (`skill_id`),
  CONSTRAINT `Fk_EmployeeSkills_Employee` FOREIGN KEY (`employee`) REFERENCES `employees` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `Fk_EmployeeSkills_Skills` FOREIGN KEY (`skill_id`) REFERENCES `skills` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employeeskills`
--

LOCK TABLES `employeeskills` WRITE;
/*!40000 ALTER TABLE `employeeskills` DISABLE KEYS */;
/*!40000 ALTER TABLE `employeeskills` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employeetimeentry`
--

DROP TABLE IF EXISTS `employeetimeentry`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employeetimeentry` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `project` bigint DEFAULT NULL,
  `employee` bigint NOT NULL,
  `timesheet` bigint NOT NULL,
  `details` text,
  `created` datetime DEFAULT NULL,
  `date_start` datetime DEFAULT NULL,
  `time_start` varchar(10) NOT NULL,
  `date_end` datetime DEFAULT NULL,
  `time_end` varchar(10) NOT NULL,
  `status` enum('Active','Inactive') DEFAULT 'Active',
  PRIMARY KEY (`id`),
  KEY `Fk_EmployeeTimeEntry_Projects` (`project`),
  KEY `Fk_EmployeeTimeEntry_EmployeeTimeSheets` (`timesheet`),
  KEY `employee_project` (`employee`,`project`),
  KEY `employee_project_date_start` (`employee`,`project`,`date_start`),
  CONSTRAINT `Fk_EmployeeTimeEntry_Employee` FOREIGN KEY (`employee`) REFERENCES `employees` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `Fk_EmployeeTimeEntry_EmployeeTimeSheets` FOREIGN KEY (`timesheet`) REFERENCES `employeetimesheets` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `Fk_EmployeeTimeEntry_Projects` FOREIGN KEY (`project`) REFERENCES `projects` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employeetimeentry`
--

LOCK TABLES `employeetimeentry` WRITE;
/*!40000 ALTER TABLE `employeetimeentry` DISABLE KEYS */;
/*!40000 ALTER TABLE `employeetimeentry` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employeetimesheets`
--

DROP TABLE IF EXISTS `employeetimesheets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employeetimesheets` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `employee` bigint NOT NULL,
  `date_start` date NOT NULL,
  `date_end` date NOT NULL,
  `status` enum('Approved','Pending','Rejected','Submitted') DEFAULT 'Pending',
  PRIMARY KEY (`id`),
  UNIQUE KEY `EmployeeTimeSheetsKey` (`employee`,`date_start`,`date_end`),
  KEY `EmployeeTimeSheets_date_end` (`date_end`),
  CONSTRAINT `Fk_EmployeeTimeSheets_Employee` FOREIGN KEY (`employee`) REFERENCES `employees` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employeetimesheets`
--

LOCK TABLES `employeetimesheets` WRITE;
/*!40000 ALTER TABLE `employeetimesheets` DISABLE KEYS */;
/*!40000 ALTER TABLE `employeetimesheets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employeetrainingsessions`
--

DROP TABLE IF EXISTS `employeetrainingsessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employeetrainingsessions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `employee` bigint NOT NULL,
  `trainingSession` bigint DEFAULT NULL,
  `feedBack` varchar(1500) DEFAULT NULL,
  `status` enum('Scheduled','Attended','Not-Attended','Completed') DEFAULT 'Scheduled',
  `proof` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `Fk_EmployeeTrainingSessions_TrainingSessions` (`trainingSession`),
  KEY `Fk_EmployeeTrainingSessions_Employee` (`employee`),
  CONSTRAINT `Fk_EmployeeTrainingSessions_Employee` FOREIGN KEY (`employee`) REFERENCES `employees` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `Fk_EmployeeTrainingSessions_TrainingSessions` FOREIGN KEY (`trainingSession`) REFERENCES `trainingsessions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employeetrainingsessions`
--

LOCK TABLES `employeetrainingsessions` WRITE;
/*!40000 ALTER TABLE `employeetrainingsessions` DISABLE KEYS */;
/*!40000 ALTER TABLE `employeetrainingsessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employeetravelrecords`
--

DROP TABLE IF EXISTS `employeetravelrecords`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employeetravelrecords` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `employee` bigint NOT NULL,
  `type` enum('Local','International') DEFAULT 'Local',
  `purpose` varchar(200) NOT NULL,
  `travel_from` varchar(200) NOT NULL,
  `travel_to` varchar(200) NOT NULL,
  `travel_date` datetime DEFAULT NULL,
  `return_date` datetime DEFAULT NULL,
  `details` varchar(500) DEFAULT NULL,
  `funding` decimal(10,3) DEFAULT NULL,
  `currency` bigint DEFAULT NULL,
  `attachment1` varchar(100) DEFAULT NULL,
  `attachment2` varchar(100) DEFAULT NULL,
  `attachment3` varchar(100) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  `status` enum('Approved','Pending','Rejected','Cancellation Requested','Cancelled','Processing') DEFAULT 'Pending',
  PRIMARY KEY (`id`),
  KEY `Fk_EmployeeTravelRecords_Employee` (`employee`),
  CONSTRAINT `Fk_EmployeeTravelRecords_Employee` FOREIGN KEY (`employee`) REFERENCES `employees` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employeetravelrecords`
--

LOCK TABLES `employeetravelrecords` WRITE;
/*!40000 ALTER TABLE `employeetravelrecords` DISABLE KEYS */;
/*!40000 ALTER TABLE `employeetravelrecords` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employementtype`
--

DROP TABLE IF EXISTS `employementtype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employementtype` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(250) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employementtype`
--

LOCK TABLES `employementtype` WRITE;
/*!40000 ALTER TABLE `employementtype` DISABLE KEYS */;
INSERT INTO `employementtype` VALUES (1,'Full-time'),(2,'Part-time'),(3,'Contract'),(4,'Temporary'),(5,'Other');
/*!40000 ALTER TABLE `employementtype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employmentstatus`
--

DROP TABLE IF EXISTS `employmentstatus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employmentstatus` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `description` varchar(400) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employmentstatus`
--

LOCK TABLES `employmentstatus` WRITE;
/*!40000 ALTER TABLE `employmentstatus` DISABLE KEYS */;
INSERT INTO `employmentstatus` VALUES (1,'Full Time Contract','Full Time Contract'),(2,'Full Time Internship','Full Time Internship'),(3,'Full Time Permanent','Full Time Permanent'),(4,'Part Time Contract','Part Time Contract'),(5,'Part Time Internship','Part Time Internship'),(6,'Part Time Permanent','Part Time Permanent');
/*!40000 ALTER TABLE `employmentstatus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ethnicity`
--

DROP TABLE IF EXISTS `ethnicity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ethnicity` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ethnicity`
--

LOCK TABLES `ethnicity` WRITE;
/*!40000 ALTER TABLE `ethnicity` DISABLE KEYS */;
INSERT INTO `ethnicity` VALUES (1,'White American'),(2,'Black or African American'),(3,'Native American'),(4,'Alaska Native'),(5,'Asian American'),(6,'Native Hawaiian'),(7,'Pacific Islander');
/*!40000 ALTER TABLE `ethnicity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `expensescategories`
--

DROP TABLE IF EXISTS `expensescategories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `expensescategories` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(500) NOT NULL,
  `created` datetime DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  `pre_approve` enum('Yes','No') DEFAULT 'Yes',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `expensescategories`
--

LOCK TABLES `expensescategories` WRITE;
/*!40000 ALTER TABLE `expensescategories` DISABLE KEYS */;
INSERT INTO `expensescategories` VALUES (1,'Auto - Gas',NULL,NULL,'Yes'),(2,'Auto - Insurance',NULL,NULL,'Yes'),(3,'Auto - Maintenance',NULL,NULL,'Yes'),(4,'Auto - Payment',NULL,NULL,'Yes'),(5,'Transportation',NULL,NULL,'Yes'),(6,'Bank Fees',NULL,NULL,'Yes'),(7,'Dining Out',NULL,NULL,'Yes'),(8,'Entertainment',NULL,NULL,'Yes'),(9,'Hotel / Motel',NULL,NULL,'Yes'),(10,'Insurance',NULL,NULL,'Yes'),(11,'Interest Charges',NULL,NULL,'Yes'),(12,'Loan Payment',NULL,NULL,'Yes'),(13,'Medical',NULL,NULL,'Yes'),(14,'Mileage',NULL,NULL,'Yes'),(15,'Rent',NULL,NULL,'Yes'),(16,'Rental Car',NULL,NULL,'Yes'),(17,'Utility',NULL,NULL,'Yes');
/*!40000 ALTER TABLE `expensescategories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `expensespaymentmethods`
--

DROP TABLE IF EXISTS `expensespaymentmethods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `expensespaymentmethods` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(500) NOT NULL,
  `created` datetime DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `expensespaymentmethods`
--

LOCK TABLES `expensespaymentmethods` WRITE;
/*!40000 ALTER TABLE `expensespaymentmethods` DISABLE KEYS */;
INSERT INTO `expensespaymentmethods` VALUES (1,'Cash',NULL,NULL),(2,'Check',NULL,NULL),(3,'Credit Card',NULL,NULL),(4,'Debit Card',NULL,NULL);
/*!40000 ALTER TABLE `expensespaymentmethods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `experiencelevel`
--

DROP TABLE IF EXISTS `experiencelevel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `experiencelevel` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(250) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `experiencelevel`
--

LOCK TABLES `experiencelevel` WRITE;
/*!40000 ALTER TABLE `experiencelevel` DISABLE KEYS */;
INSERT INTO `experiencelevel` VALUES (1,'Not Applicable'),(2,'Internship'),(3,'Entry level'),(4,'Associate'),(5,'Mid-Senior level'),(6,'Director'),(7,'Executive');
/*!40000 ALTER TABLE `experiencelevel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fieldnamemappings`
--

DROP TABLE IF EXISTS `fieldnamemappings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fieldnamemappings` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `type` varchar(20) NOT NULL,
  `name` varchar(20) NOT NULL,
  `textOrig` varchar(200) DEFAULT NULL,
  `textMapped` varchar(200) DEFAULT NULL,
  `display` enum('Form','Table and Form','Hidden') DEFAULT 'Form',
  `created` datetime DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fieldnamemappings`
--

LOCK TABLES `fieldnamemappings` WRITE;
/*!40000 ALTER TABLE `fieldnamemappings` DISABLE KEYS */;
INSERT INTO `fieldnamemappings` VALUES (1,'Employee','employee_id','Employee Number','Employee Number','Table and Form',NULL,NULL),(2,'Employee','first_name','First Name','First Name','Table and Form',NULL,NULL),(3,'Employee','middle_name','Middle Name','Middle Name','Form',NULL,NULL),(4,'Employee','last_name','Last Name','Last Name','Table and Form',NULL,NULL),(5,'Employee','nationality','Nationality','Nationality','Form',NULL,NULL),(6,'Employee','ethnicity','Ethnicity','Ethnicity','Form',NULL,NULL),(7,'Employee','immigration_status','Immigration Status','Immigration Status','Form',NULL,NULL),(8,'Employee','birthday','Date of Birth','Date of Birth','Form',NULL,NULL),(9,'Employee','gender','Gender','Gender','Form',NULL,NULL),(10,'Employee','marital_status','Marital Status','Marital Status','Form',NULL,NULL),(11,'Employee','ssn_num','SSN/NRIC','SSN/NRIC','Form',NULL,NULL),(12,'Employee','nic_num','NIC','NIC','Form',NULL,NULL),(13,'Employee','other_id','Other ID','Other ID','Form',NULL,NULL),(14,'Employee','driving_license','Driving License No','Driving License No','Form',NULL,NULL),(15,'Employee','employment_status','Employment Status','Employment Status','Form',NULL,NULL),(16,'Employee','job_title','Job Title','Job Title','Form',NULL,NULL),(17,'Employee','pay_grade','Pay Grade','Pay Grade','Form',NULL,NULL),(18,'Employee','work_station_id','Work Station Id','Work Station Id','Form',NULL,NULL),(19,'Employee','address1','Address Line 1','Address Line 1','Form',NULL,NULL),(20,'Employee','address2','Address Line 2','Address Line 2','Form',NULL,NULL),(21,'Employee','city','City','City','Form',NULL,NULL),(22,'Employee','country','Country','Country','Form',NULL,NULL),(23,'Employee','province','Province','Province','Form',NULL,NULL),(24,'Employee','postal_code','Postal/Zip Code','Postal/Zip Code','Form',NULL,NULL),(25,'Employee','home_phone','Home Phone','Home Phone','Form',NULL,NULL),(26,'Employee','mobile_phone','Mobile Phone','Mobile Phone','Table and Form',NULL,NULL),(27,'Employee','work_phone','Work Phone','Work Phone','Form',NULL,NULL),(28,'Employee','work_email','Work Email','Work Email','Form',NULL,NULL),(29,'Employee','private_email','Private Email','Private Email','Form',NULL,NULL),(30,'Employee','joined_date','Joined Date','Joined Date','Form',NULL,NULL),(31,'Employee','confirmation_date','Confirmation Date','Confirmation Date','Form',NULL,NULL),(32,'Employee','termination_date','Termination Date','Termination Date','Form',NULL,NULL),(33,'Employee','supervisor','Supervisor','Supervisor','Table and Form',NULL,NULL),(34,'Employee','department','Department','Department','Table and Form',NULL,NULL),(35,'Employee','indirect_supervisors','Indirect Supervisors','Indirect Supervisors','Form',NULL,NULL),(36,'Employee','notes','Notes','Notes','Form',NULL,NULL);
/*!40000 ALTER TABLE `fieldnamemappings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `files`
--

DROP TABLE IF EXISTS `files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `files` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `filename` varchar(100) NOT NULL,
  `employee` bigint DEFAULT NULL,
  `file_group` varchar(100) NOT NULL,
  `size` bigint DEFAULT NULL,
  `size_text` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `filename` (`filename`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `files`
--

LOCK TABLES `files` WRITE;
/*!40000 ALTER TABLE `files` DISABLE KEYS */;
/*!40000 ALTER TABLE `files` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `forms`
--

DROP TABLE IF EXISTS `forms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `forms` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `description` varchar(500) DEFAULT NULL,
  `items` text,
  `created` datetime DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `forms`
--

LOCK TABLES `forms` WRITE;
/*!40000 ALTER TABLE `forms` DISABLE KEYS */;
/*!40000 ALTER TABLE `forms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `holidays`
--

DROP TABLE IF EXISTS `holidays`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `holidays` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `dateh` date DEFAULT NULL,
  `status` enum('Full Day','Half Day') DEFAULT 'Full Day',
  `country` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `holidays_dateh_country` (`dateh`,`country`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `holidays`
--

LOCK TABLES `holidays` WRITE;
/*!40000 ALTER TABLE `holidays` DISABLE KEYS */;
INSERT INTO `holidays` VALUES (1,'New Year\'s Day','2015-01-01','Full Day',NULL),(2,'Christmas Day','2015-12-25','Full Day',NULL);
/*!40000 ALTER TABLE `holidays` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `immigrationdocuments`
--

DROP TABLE IF EXISTS `immigrationdocuments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `immigrationdocuments` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `details` text,
  `required` enum('Yes','No') DEFAULT 'Yes',
  `alert_on_missing` enum('Yes','No') DEFAULT 'Yes',
  `alert_before_expiry` enum('Yes','No') DEFAULT 'Yes',
  `alert_before_day_number` int NOT NULL,
  `created` datetime DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `immigrationdocuments`
--

LOCK TABLES `immigrationdocuments` WRITE;
/*!40000 ALTER TABLE `immigrationdocuments` DISABLE KEYS */;
/*!40000 ALTER TABLE `immigrationdocuments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `immigrationstatus`
--

DROP TABLE IF EXISTS `immigrationstatus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `immigrationstatus` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `immigrationstatus`
--

LOCK TABLES `immigrationstatus` WRITE;
/*!40000 ALTER TABLE `immigrationstatus` DISABLE KEYS */;
INSERT INTO `immigrationstatus` VALUES (1,'Citizen'),(2,'Permanent Resident'),(3,'Work Permit Holder'),(4,'Dependant Pass Holder');
/*!40000 ALTER TABLE `immigrationstatus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `industry`
--

DROP TABLE IF EXISTS `industry`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `industry` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(250) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `industry`
--

LOCK TABLES `industry` WRITE;
/*!40000 ALTER TABLE `industry` DISABLE KEYS */;
/*!40000 ALTER TABLE `industry` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `interviews`
--

DROP TABLE IF EXISTS `interviews`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `interviews` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `job` bigint NOT NULL,
  `candidate` bigint DEFAULT NULL,
  `level` varchar(100) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  `scheduled` datetime DEFAULT NULL,
  `location` varchar(500) DEFAULT NULL,
  `mapId` bigint DEFAULT NULL,
  `status` varchar(100) DEFAULT NULL,
  `notes` text,
  PRIMARY KEY (`id`),
  KEY `Fk_Interviews_Job` (`job`),
  KEY `Fk_Interviews_Candidates` (`candidate`),
  CONSTRAINT `Fk_Interviews_Candidates` FOREIGN KEY (`candidate`) REFERENCES `candidates` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `Fk_Interviews_Job` FOREIGN KEY (`job`) REFERENCES `job` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `interviews`
--

LOCK TABLES `interviews` WRITE;
/*!40000 ALTER TABLE `interviews` DISABLE KEYS */;
/*!40000 ALTER TABLE `interviews` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `job`
--

DROP TABLE IF EXISTS `job`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `job` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `title` varchar(200) NOT NULL,
  `shortDescription` text,
  `description` text,
  `requirements` text,
  `benefits` text,
  `country` bigint DEFAULT NULL,
  `company` bigint DEFAULT NULL,
  `department` varchar(100) DEFAULT NULL,
  `code` varchar(20) DEFAULT NULL,
  `employementType` bigint DEFAULT NULL,
  `industry` bigint DEFAULT NULL,
  `experienceLevel` bigint DEFAULT NULL,
  `jobFunction` bigint DEFAULT NULL,
  `educationLevel` bigint DEFAULT NULL,
  `currency` bigint DEFAULT NULL,
  `showSalary` enum('Yes','No') DEFAULT NULL,
  `salaryMin` bigint DEFAULT NULL,
  `salaryMax` bigint DEFAULT NULL,
  `keywords` text,
  `status` enum('Active','On hold','Closed') DEFAULT NULL,
  `closingDate` datetime DEFAULT NULL,
  `attachment` varchar(100) DEFAULT NULL,
  `display` varchar(200) NOT NULL,
  `postedBy` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `Job_status` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job`
--

LOCK TABLES `job` WRITE;
/*!40000 ALTER TABLE `job` DISABLE KEYS */;
/*!40000 ALTER TABLE `job` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jobfunction`
--

DROP TABLE IF EXISTS `jobfunction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jobfunction` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(250) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jobfunction`
--

LOCK TABLES `jobfunction` WRITE;
/*!40000 ALTER TABLE `jobfunction` DISABLE KEYS */;
INSERT INTO `jobfunction` VALUES (1,'Accounting/Auditing'),(2,'Administrative'),(3,'Advertising'),(4,'Business Analyst'),(5,'Financial Analyst'),(6,'Data Analyst'),(7,'Art/Creative'),(8,'Business Development'),(9,'Consulting'),(10,'Customer Service'),(11,'Distribution'),(12,'Design'),(13,'Education'),(14,'Engineering'),(15,'Finance'),(16,'General Business'),(17,'Health Care Provider'),(18,'Human Resources'),(19,'Information Technology'),(20,'Legal'),(21,'Management'),(22,'Manufacturing'),(23,'Marketing'),(24,'Other'),(25,'Public Relations'),(26,'Purchasing'),(27,'Product Management'),(28,'Project Management'),(29,'Production'),(30,'Quality Assurance'),(31,'Research'),(32,'Sales'),(33,'Science'),(34,'Strategy/Planning'),(35,'Supply Chain'),(36,'Training'),(37,'Writing/Editing');
/*!40000 ALTER TABLE `jobfunction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jobtitles`
--

DROP TABLE IF EXISTS `jobtitles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jobtitles` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `code` varchar(10) NOT NULL DEFAULT '',
  `name` varchar(100) DEFAULT NULL,
  `description` varchar(200) DEFAULT NULL,
  `specification` varchar(400) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jobtitles`
--

LOCK TABLES `jobtitles` WRITE;
/*!40000 ALTER TABLE `jobtitles` DISABLE KEYS */;
INSERT INTO `jobtitles` VALUES (1,'SE','Software Engineer','The work of a software engineer typically includes designing and programming system-level software: operating systems, database systems, embedded systems and so on. They understand how both software a','Software Engineer'),(2,'ASE','Assistant Software Engineer','Assistant Software Engineer','Assistant Software Engineer'),(3,'PM','Project Manager','Project Manager','Project Manager'),(4,'QAE','QA Engineer','Quality Assurance Engineer ','Quality Assurance Engineer '),(5,'PRM','Product Manager','Product Manager','Product Manager'),(6,'AQAE','Assistant QA Engineer ','Assistant QA Engineer ','Assistant QA Engineer '),(7,'TPM','Technical Project Manager','Technical Project Manager','Technical Project Manager'),(8,'PRS','Pre-Sales Executive','Pre-Sales Executive','Pre-Sales Executive'),(9,'ME','Marketing Executive','Marketing Executive','Marketing Executive'),(10,'DH','Department Head','Department Head','Department Head'),(11,'CEO','Chief Executive Officer','Chief Executive Officer','Chief Executive Officer'),(12,'DBE','Database Engineer','Database Engineer','Database Engineer'),(13,'SA','Server Admin','Server Admin','Server Admin');
/*!40000 ALTER TABLE `jobtitles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `languages`
--

DROP TABLE IF EXISTS `languages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `languages` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `description` varchar(400) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=185 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `languages`
--

LOCK TABLES `languages` WRITE;
/*!40000 ALTER TABLE `languages` DISABLE KEYS */;
INSERT INTO `languages` VALUES (1,'en','English'),(2,'fr','French'),(3,'de','German'),(4,'zh','Chinese'),(5,'aa','Afar'),(6,'ab','Abkhaz'),(7,'ae','Avestan'),(8,'af','Afrikaans'),(9,'ak','Akan'),(10,'am','Amharic'),(11,'an','Aragonese'),(12,'ar','Arabic'),(13,'as','Assamese'),(14,'av','Avaric'),(15,'ay','Aymara'),(16,'az','Azerbaijani'),(17,'ba','Bashkir'),(18,'be','Belarusian'),(19,'bg','Bulgarian'),(20,'bh','Bihari'),(21,'bi','Bislama'),(22,'bm','Bambara'),(23,'bn','Bengali'),(24,'bo','Tibetan Standard, Tibetan, Central'),(25,'br','Breton'),(26,'bs','Bosnian'),(27,'ca','Catalan; Valencian'),(28,'ce','Chechen'),(29,'ch','Chamorro'),(30,'co','Corsican'),(31,'cr','Cree'),(32,'cs','Czech'),(33,'cu','Old Church Slavonic, Church Slavic, Church Slavonic, Old Bulgarian, Old Slavonic'),(34,'cv','Chuvash'),(35,'cy','Welsh'),(36,'da','Danish'),(37,'dv','Divehi; Dhivehi; Maldivian;'),(38,'dz','Dzongkha'),(39,'ee','Ewe'),(40,'el','Greek, Modern'),(41,'eo','Esperanto'),(42,'es','Spanish; Castilian'),(43,'et','Estonian'),(44,'eu','Basque'),(45,'fa','Persian'),(46,'ff','Fula; Fulah; Pulaar; Pular'),(47,'fi','Finnish'),(48,'fj','Fijian'),(49,'fo','Faroese'),(50,'fy','Western Frisian'),(51,'ga','Irish'),(52,'gd','Scottish Gaelic; Gaelic'),(53,'gl','Galician'),(54,'gn','GuaranÃ­'),(55,'gu','Gujarati'),(56,'gv','Manx'),(57,'ha','Hausa'),(58,'he','Hebrew (modern)'),(59,'hi','Hindi'),(60,'ho','Hiri Motu'),(61,'hr','Croatian'),(62,'ht','Haitian; Haitian Creole'),(63,'hu','Hungarian'),(64,'hy','Armenian'),(65,'hz','Herero'),(66,'ia','Interlingua'),(67,'id','Indonesian'),(68,'ie','Interlingue'),(69,'ig','Igbo'),(70,'ii','Nuosu'),(71,'ik','Inupiaq'),(72,'io','Ido'),(73,'is','Icelandic'),(74,'it','Italian'),(75,'iu','Inuktitut'),(76,'ja','Japanese (ja)'),(77,'jv','Javanese (jv)'),(78,'ka','Georgian'),(79,'kg','Kongo'),(80,'ki','Kikuyu, Gikuyu'),(81,'kj','Kwanyama, Kuanyama'),(82,'kk','Kazakh'),(83,'kl','Kalaallisut, Greenlandic'),(84,'km','Khmer'),(85,'kn','Kannada'),(86,'ko','Korean'),(87,'kr','Kanuri'),(88,'ks','Kashmiri'),(89,'ku','Kurdish'),(90,'kv','Komi'),(91,'kw','Cornish'),(92,'ky','Kirghiz, Kyrgyz'),(93,'la','Latin'),(94,'lb','Luxembourgish, Letzeburgesch'),(95,'lg','Luganda'),(96,'li','Limburgish, Limburgan, Limburger'),(97,'ln','Lingala'),(98,'lo','Lao'),(99,'lt','Lithuanian'),(100,'lu','Luba-Katanga'),(101,'lv','Latvian'),(102,'mg','Malagasy'),(103,'mh','Marshallese'),(104,'mi','Maori'),(105,'mk','Macedonian'),(106,'ml','Malayalam'),(107,'mn','Mongolian'),(108,'mr','Marathi (Mara?hi)'),(109,'ms','Malay'),(110,'mt','Maltese'),(111,'my','Burmese'),(112,'na','Nauru'),(113,'nb','Norwegian BokmÃ¥l'),(114,'nd','North Ndebele'),(115,'ne','Nepali'),(116,'ng','Ndonga'),(117,'nl','Dutch'),(118,'nn','Norwegian Nynorsk'),(119,'no','Norwegian'),(120,'nr','South Ndebele'),(121,'nv','Navajo, Navaho'),(122,'ny','Chichewa; Chewa; Nyanja'),(123,'oc','Occitan'),(124,'oj','Ojibwe, Ojibwa'),(125,'om','Oromo'),(126,'or','Oriya'),(127,'os','Ossetian, Ossetic'),(128,'pa','Panjabi, Punjabi'),(129,'pi','Pali'),(130,'pl','Polish'),(131,'ps','Pashto, Pushto'),(132,'pt','Portuguese'),(133,'qu','Quechua'),(134,'rm','Romansh'),(135,'rn','Kirundi'),(136,'ro','Romanian, Moldavian, Moldovan'),(137,'ru','Russian'),(138,'rw','Kinyarwanda'),(139,'sa','Sanskrit (Sa?sk?ta)'),(140,'sc','Sardinian'),(141,'sd','Sindhi'),(142,'se','Northern Sami'),(143,'sg','Sango'),(144,'si','Sinhala, Sinhalese'),(145,'sk','Slovak'),(146,'sl','Slovene'),(147,'sm','Samoan'),(148,'sn','Shona'),(149,'so','Somali'),(150,'sq','Albanian'),(151,'sr','Serbian'),(152,'ss','Swati'),(153,'st','Southern Sotho'),(154,'su','Sundanese'),(155,'sv','Swedish'),(156,'sw','Swahili'),(157,'ta','Tamil'),(158,'te','Telugu'),(159,'tg','Tajik'),(160,'th','Thai'),(161,'ti','Tigrinya'),(162,'tk','Turkmen'),(163,'tl','Tagalog'),(164,'tn','Tswana'),(165,'to','Tonga (Tonga Islands)'),(166,'tr','Turkish'),(167,'ts','Tsonga'),(168,'tt','Tatar'),(169,'tw','Twi'),(170,'ty','Tahitian'),(171,'ug','Uighur, Uyghur'),(172,'uk','Ukrainian'),(173,'ur','Urdu'),(174,'uz','Uzbek'),(175,'ve','Venda'),(176,'vi','Vietnamese'),(177,'vo','VolapÃ¼k'),(178,'wa','Walloon'),(179,'wo','Wolof'),(180,'xh','Xhosa'),(181,'yi','Yiddish'),(182,'yo','Yoruba'),(183,'za','Zhuang, Chuang'),(184,'zu','Zulu');
/*!40000 ALTER TABLE `languages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `leavegroupemployees`
--

DROP TABLE IF EXISTS `leavegroupemployees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `leavegroupemployees` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `employee` bigint NOT NULL,
  `leave_group` bigint NOT NULL,
  `created` datetime DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `LeaveGroupEmployees_employee` (`employee`),
  KEY `Fk_LeaveGroupEmployees_LeaveGroups` (`leave_group`),
  CONSTRAINT `Fk_LeaveGroupEmployees_Employee` FOREIGN KEY (`employee`) REFERENCES `employees` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `Fk_LeaveGroupEmployees_LeaveGroups` FOREIGN KEY (`leave_group`) REFERENCES `leavegroups` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `leavegroupemployees`
--

LOCK TABLES `leavegroupemployees` WRITE;
/*!40000 ALTER TABLE `leavegroupemployees` DISABLE KEYS */;
/*!40000 ALTER TABLE `leavegroupemployees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `leavegroups`
--

DROP TABLE IF EXISTS `leavegroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `leavegroups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `details` text,
  `created` datetime DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `leavegroups`
--

LOCK TABLES `leavegroups` WRITE;
/*!40000 ALTER TABLE `leavegroups` DISABLE KEYS */;
/*!40000 ALTER TABLE `leavegroups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `leaveperiods`
--

DROP TABLE IF EXISTS `leaveperiods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `leaveperiods` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `date_start` date DEFAULT NULL,
  `date_end` date DEFAULT NULL,
  `status` enum('Active','Inactive') DEFAULT 'Inactive',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `leaveperiods`
--

LOCK TABLES `leaveperiods` WRITE;
/*!40000 ALTER TABLE `leaveperiods` DISABLE KEYS */;
INSERT INTO `leaveperiods` VALUES (3,'Year 2015','2015-01-01','2015-12-31','Active'),(4,'Year 2016','2016-01-01','2016-12-31','Active'),(5,'Year 2017','2017-01-01','2017-12-31','Active');
/*!40000 ALTER TABLE `leaveperiods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `leaverules`
--

DROP TABLE IF EXISTS `leaverules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `leaverules` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `leave_type` bigint NOT NULL,
  `job_title` bigint DEFAULT NULL,
  `employment_status` bigint DEFAULT NULL,
  `employee` bigint DEFAULT NULL,
  `supervisor_leave_assign` enum('Yes','No') DEFAULT 'Yes',
  `employee_can_apply` enum('Yes','No') DEFAULT 'Yes',
  `apply_beyond_current` enum('Yes','No') DEFAULT 'Yes',
  `leave_accrue` enum('No','Yes') DEFAULT 'No',
  `carried_forward` enum('No','Yes') DEFAULT 'No',
  `default_per_year` decimal(10,3) NOT NULL,
  `carried_forward_percentage` int DEFAULT '0',
  `carried_forward_leave_availability` int DEFAULT '365',
  `propotionate_on_joined_date` enum('No','Yes') DEFAULT 'No',
  `leave_group` bigint DEFAULT NULL,
  `max_carried_forward_amount` int DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `leaverules`
--

LOCK TABLES `leaverules` WRITE;
/*!40000 ALTER TABLE `leaverules` DISABLE KEYS */;
/*!40000 ALTER TABLE `leaverules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `leavestartingbalance`
--

DROP TABLE IF EXISTS `leavestartingbalance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `leavestartingbalance` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `leave_type` bigint NOT NULL,
  `employee` bigint DEFAULT NULL,
  `leave_period` bigint NOT NULL,
  `amount` decimal(10,3) NOT NULL,
  `note` text,
  `created` datetime DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `leavestartingbalance`
--

LOCK TABLES `leavestartingbalance` WRITE;
/*!40000 ALTER TABLE `leavestartingbalance` DISABLE KEYS */;
/*!40000 ALTER TABLE `leavestartingbalance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `leavetypes`
--

DROP TABLE IF EXISTS `leavetypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `leavetypes` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `supervisor_leave_assign` enum('Yes','No') DEFAULT 'Yes',
  `employee_can_apply` enum('Yes','No') DEFAULT 'Yes',
  `apply_beyond_current` enum('Yes','No') DEFAULT 'Yes',
  `leave_accrue` enum('No','Yes') DEFAULT 'No',
  `carried_forward` enum('No','Yes') DEFAULT 'No',
  `default_per_year` decimal(10,3) NOT NULL,
  `carried_forward_percentage` int DEFAULT '0',
  `carried_forward_leave_availability` int DEFAULT '365',
  `propotionate_on_joined_date` enum('No','Yes') DEFAULT 'No',
  `send_notification_emails` enum('Yes','No') DEFAULT 'Yes',
  `leave_group` bigint DEFAULT NULL,
  `leave_color` varchar(10) DEFAULT NULL,
  `max_carried_forward_amount` int DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `leavetypes`
--

LOCK TABLES `leavetypes` WRITE;
/*!40000 ALTER TABLE `leavetypes` DISABLE KEYS */;
INSERT INTO `leavetypes` VALUES (1,'Annual leave','No','Yes','No','No','No',14.000,0,365,'No','Yes',NULL,NULL,0),(2,'Casual leave','Yes','Yes','No','No','No',7.000,0,365,'No','Yes',NULL,NULL,0),(3,'Medical leave','Yes','Yes','Yes','No','No',7.000,0,365,'No','Yes',NULL,NULL,0);
/*!40000 ALTER TABLE `leavetypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `file` varchar(50) NOT NULL,
  `version` int NOT NULL,
  `created` datetime DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  `status` enum('Pending','Up','Down','UpError','DownError') DEFAULT 'Pending',
  `last_error` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `KEY_Migrations_file` (`file`),
  KEY `KEY_Migrations_status` (`status`),
  KEY `KEY_Migrations_version` (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `modules`
--

DROP TABLE IF EXISTS `modules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `modules` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `menu` varchar(30) NOT NULL,
  `name` varchar(100) NOT NULL,
  `label` varchar(100) NOT NULL,
  `icon` varchar(50) DEFAULT NULL,
  `mod_group` varchar(30) NOT NULL,
  `mod_order` int DEFAULT NULL,
  `status` enum('Enabled','Disabled') DEFAULT 'Enabled',
  `version` varchar(10) DEFAULT '',
  `update_path` varchar(500) DEFAULT '',
  `user_levels` varchar(500) NOT NULL,
  `user_roles` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `Modules_name_modgroup` (`name`,`mod_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `modules`
--

LOCK TABLES `modules` WRITE;
/*!40000 ALTER TABLE `modules` DISABLE KEYS */;
/*!40000 ALTER TABLE `modules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nationality`
--

DROP TABLE IF EXISTS `nationality`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `nationality` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=194 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nationality`
--

LOCK TABLES `nationality` WRITE;
/*!40000 ALTER TABLE `nationality` DISABLE KEYS */;
INSERT INTO `nationality` VALUES (1,'Afghan'),(2,'Albanian'),(3,'Algerian'),(4,'American'),(5,'Andorran'),(6,'Angolan'),(7,'Antiguans'),(8,'Argentinean'),(9,'Armenian'),(10,'Australian'),(11,'Austrian'),(12,'Azerbaijani'),(13,'Bahamian'),(14,'Bahraini'),(15,'Bangladeshi'),(16,'Barbadian'),(17,'Barbudans'),(18,'Batswana'),(19,'Belarusian'),(20,'Belgian'),(21,'Belizean'),(22,'Beninese'),(23,'Bhutanese'),(24,'Bolivian'),(25,'Bosnian'),(26,'Brazilian'),(27,'British'),(28,'Bruneian'),(29,'Bulgarian'),(30,'Burkinabe'),(31,'Burmese'),(32,'Burundian'),(33,'Cambodian'),(34,'Cameroonian'),(35,'Canadian'),(36,'Cape Verdean'),(37,'Central African'),(38,'Chadian'),(39,'Chilean'),(40,'Chinese'),(41,'Colombian'),(42,'Comoran'),(43,'Congolese'),(44,'Costa Rican'),(45,'Croatian'),(46,'Cuban'),(47,'Cypriot'),(48,'Czech'),(49,'Danish'),(50,'Djibouti'),(51,'Dominican'),(52,'Dutch'),(53,'East Timorese'),(54,'Ecuadorean'),(55,'Egyptian'),(56,'Emirian'),(57,'Equatorial Guinean'),(58,'Eritrean'),(59,'Estonian'),(60,'Ethiopian'),(61,'Fijian'),(62,'Filipino'),(63,'Finnish'),(64,'French'),(65,'Gabonese'),(66,'Gambian'),(67,'Georgian'),(68,'German'),(69,'Ghanaian'),(70,'Greek'),(71,'Grenadian'),(72,'Guatemalan'),(73,'Guinea-Bissauan'),(74,'Guinean'),(75,'Guyanese'),(76,'Haitian'),(77,'Herzegovinian'),(78,'Honduran'),(79,'Hungarian'),(80,'I-Kiribati'),(81,'Icelander'),(82,'Indian'),(83,'Indonesian'),(84,'Iranian'),(85,'Iraqi'),(86,'Irish'),(87,'Israeli'),(88,'Italian'),(89,'Ivorian'),(90,'Jamaican'),(91,'Japanese'),(92,'Jordanian'),(93,'Kazakhstani'),(94,'Kenyan'),(95,'Kittian and Nevisian'),(96,'Kuwaiti'),(97,'Kyrgyz'),(98,'Laotian'),(99,'Latvian'),(100,'Lebanese'),(101,'Liberian'),(102,'Libyan'),(103,'Liechtensteiner'),(104,'Lithuanian'),(105,'Luxembourger'),(106,'Macedonian'),(107,'Malagasy'),(108,'Malawian'),(109,'Malaysian'),(110,'Maldivan'),(111,'Malian'),(112,'Maltese'),(113,'Marshallese'),(114,'Mauritanian'),(115,'Mauritian'),(116,'Mexican'),(117,'Micronesian'),(118,'Moldovan'),(119,'Monacan'),(120,'Mongolian'),(121,'Moroccan'),(122,'Mosotho'),(123,'Motswana'),(124,'Mozambican'),(125,'Namibian'),(126,'Nauruan'),(127,'Nepalese'),(128,'New Zealander'),(129,'Nicaraguan'),(130,'Nigerian'),(131,'Nigerien'),(132,'North Korean'),(133,'Northern Irish'),(134,'Norwegian'),(135,'Omani'),(136,'Pakistani'),(137,'Palauan'),(138,'Panamanian'),(139,'Papua New Guinean'),(140,'Paraguayan'),(141,'Peruvian'),(142,'Polish'),(143,'Portuguese'),(144,'Qatari'),(145,'Romanian'),(146,'Russian'),(147,'Rwandan'),(148,'Saint Lucian'),(149,'Salvadoran'),(150,'Samoan'),(151,'San Marinese'),(152,'Sao Tomean'),(153,'Saudi'),(154,'Scottish'),(155,'Senegalese'),(156,'Serbian'),(157,'Seychellois'),(158,'Sierra Leonean'),(159,'Singaporean'),(160,'Slovakian'),(161,'Slovenian'),(162,'Solomon Islander'),(163,'Somali'),(164,'South African'),(165,'South Korean'),(166,'Spanish'),(167,'Sri Lankan'),(168,'Sudanese'),(169,'Surinamer'),(170,'Swazi'),(171,'Swedish'),(172,'Swiss'),(173,'Syrian'),(174,'Taiwanese'),(175,'Tajik'),(176,'Tanzanian'),(177,'Thai'),(178,'Togolese'),(179,'Tongan'),(180,'Trinidadian or Tobagonian'),(181,'Tunisian'),(182,'Turkish'),(183,'Tuvaluan'),(184,'Ugandan'),(185,'Ukrainian'),(186,'Uruguayan'),(187,'Uzbekistani'),(188,'Venezuelan'),(189,'Vietnamese'),(190,'Welsh'),(191,'Yemenite'),(192,'Zambian'),(193,'Zimbabwean');
/*!40000 ALTER TABLE `nationality` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notifications`
--

DROP TABLE IF EXISTS `notifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notifications` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `time` datetime DEFAULT NULL,
  `fromUser` bigint DEFAULT NULL,
  `fromEmployee` bigint DEFAULT NULL,
  `toUser` bigint NOT NULL,
  `image` varchar(500) DEFAULT NULL,
  `message` text,
  `action` text,
  `type` varchar(100) DEFAULT NULL,
  `status` enum('Unread','Read') DEFAULT 'Unread',
  `employee` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `toUser_time` (`toUser`,`time`),
  KEY `toUser_status_time` (`toUser`,`status`,`time`),
  CONSTRAINT `Fk_Notifications_Users` FOREIGN KEY (`toUser`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notifications`
--

LOCK TABLES `notifications` WRITE;
/*!40000 ALTER TABLE `notifications` DISABLE KEYS */;
/*!40000 ALTER TABLE `notifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `overtimecategories`
--

DROP TABLE IF EXISTS `overtimecategories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `overtimecategories` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(500) NOT NULL,
  `created` datetime DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `overtimecategories`
--

LOCK TABLES `overtimecategories` WRITE;
/*!40000 ALTER TABLE `overtimecategories` DISABLE KEYS */;
/*!40000 ALTER TABLE `overtimecategories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payfrequency`
--

DROP TABLE IF EXISTS `payfrequency`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payfrequency` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payfrequency`
--

LOCK TABLES `payfrequency` WRITE;
/*!40000 ALTER TABLE `payfrequency` DISABLE KEYS */;
INSERT INTO `payfrequency` VALUES (1,'Bi Weekly'),(2,'Weekly'),(3,'Semi Monthly'),(4,'Monthly'),(5,'Yearly');
/*!40000 ALTER TABLE `payfrequency` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `paygrades`
--

DROP TABLE IF EXISTS `paygrades`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `paygrades` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `currency` varchar(3) NOT NULL,
  `min_salary` decimal(12,2) DEFAULT '0.00',
  `max_salary` decimal(12,2) DEFAULT '0.00',
  PRIMARY KEY (`id`),
  KEY `Fk_PayGrades_CurrencyTypes` (`currency`),
  CONSTRAINT `Fk_PayGrades_CurrencyTypes` FOREIGN KEY (`currency`) REFERENCES `currencytypes` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paygrades`
--

LOCK TABLES `paygrades` WRITE;
/*!40000 ALTER TABLE `paygrades` DISABLE KEYS */;
INSERT INTO `paygrades` VALUES (1,'Manager','SGD',5000.00,15000.00),(2,'Executive','SGD',3500.00,7000.00),(3,'Assistant ','SGD',2000.00,4000.00),(4,'Administrator','SGD',2000.00,6000.00);
/*!40000 ALTER TABLE `paygrades` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payroll`
--

DROP TABLE IF EXISTS `payroll`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payroll` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(200) DEFAULT NULL,
  `pay_period` bigint NOT NULL,
  `department` bigint NOT NULL,
  `column_template` bigint DEFAULT NULL,
  `columns` varchar(500) DEFAULT NULL,
  `date_start` date DEFAULT NULL,
  `date_end` date DEFAULT NULL,
  `status` enum('Draft','Completed','Processing') DEFAULT 'Draft',
  `payslipTemplate` bigint DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payroll`
--

LOCK TABLES `payroll` WRITE;
/*!40000 ALTER TABLE `payroll` DISABLE KEYS */;
/*!40000 ALTER TABLE `payroll` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payrollcolumns`
--

DROP TABLE IF EXISTS `payrollcolumns`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payrollcolumns` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `calculation_hook` varchar(200) DEFAULT NULL,
  `salary_components` varchar(500) DEFAULT NULL,
  `deductions` varchar(500) DEFAULT NULL,
  `add_columns` varchar(500) DEFAULT NULL,
  `sub_columns` varchar(500) DEFAULT NULL,
  `colorder` int DEFAULT NULL,
  `editable` enum('Yes','No') DEFAULT 'Yes',
  `enabled` enum('Yes','No') DEFAULT 'Yes',
  `default_value` varchar(25) DEFAULT NULL,
  `calculation_columns` varchar(500) DEFAULT NULL,
  `calculation_function` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payrollcolumns`
--

LOCK TABLES `payrollcolumns` WRITE;
/*!40000 ALTER TABLE `payrollcolumns` DISABLE KEYS */;
/*!40000 ALTER TABLE `payrollcolumns` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payrollcolumntemplates`
--

DROP TABLE IF EXISTS `payrollcolumntemplates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payrollcolumntemplates` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `columns` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payrollcolumntemplates`
--

LOCK TABLES `payrollcolumntemplates` WRITE;
/*!40000 ALTER TABLE `payrollcolumntemplates` DISABLE KEYS */;
/*!40000 ALTER TABLE `payrollcolumntemplates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payrolldata`
--

DROP TABLE IF EXISTS `payrolldata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payrolldata` (
  `id` int NOT NULL AUTO_INCREMENT,
  `payroll` bigint NOT NULL,
  `employee` bigint NOT NULL,
  `payroll_item` int NOT NULL,
  `amount` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `PayrollDataUniqueKey` (`payroll`,`employee`,`payroll_item`),
  CONSTRAINT `Fk_PayrollData_Payroll` FOREIGN KEY (`payroll`) REFERENCES `payroll` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payrolldata`
--

LOCK TABLES `payrolldata` WRITE;
/*!40000 ALTER TABLE `payrolldata` DISABLE KEYS */;
/*!40000 ALTER TABLE `payrolldata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payrollemployees`
--

DROP TABLE IF EXISTS `payrollemployees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payrollemployees` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `employee` bigint NOT NULL,
  `pay_frequency` int DEFAULT NULL,
  `currency` bigint DEFAULT NULL,
  `deduction_exemptions` varchar(250) DEFAULT NULL,
  `deduction_allowed` varchar(250) DEFAULT NULL,
  `deduction_group` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `PayrollEmployees_employee` (`employee`),
  KEY `Fk_PayrollEmployees_DeductionGroup` (`deduction_group`),
  CONSTRAINT `Fk_PayrollEmployee_Employee` FOREIGN KEY (`employee`) REFERENCES `employees` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `Fk_PayrollEmployees_DeductionGroup` FOREIGN KEY (`deduction_group`) REFERENCES `deductiongroup` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payrollemployees`
--

LOCK TABLES `payrollemployees` WRITE;
/*!40000 ALTER TABLE `payrollemployees` DISABLE KEYS */;
/*!40000 ALTER TABLE `payrollemployees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `paysliptemplates`
--

DROP TABLE IF EXISTS `paysliptemplates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `paysliptemplates` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `data` longtext,
  `status` enum('Show','Hide') DEFAULT 'Show',
  `created` datetime DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paysliptemplates`
--

LOCK TABLES `paysliptemplates` WRITE;
/*!40000 ALTER TABLE `paysliptemplates` DISABLE KEYS */;
/*!40000 ALTER TABLE `paysliptemplates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permissions`
--

DROP TABLE IF EXISTS `permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_level` enum('Admin','Employee','Manager') DEFAULT NULL,
  `module_id` bigint NOT NULL,
  `permission` varchar(200) DEFAULT NULL,
  `meta` varchar(500) DEFAULT NULL,
  `value` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `Module_Permission` (`user_level`,`module_id`,`permission`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permissions`
--

LOCK TABLES `permissions` WRITE;
/*!40000 ALTER TABLE `permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `projects`
--

DROP TABLE IF EXISTS `projects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `projects` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `client` bigint DEFAULT NULL,
  `details` text,
  `created` datetime DEFAULT NULL,
  `status` enum('Active','On Hold','Completed','Dropped') DEFAULT 'Active',
  PRIMARY KEY (`id`),
  KEY `Fk_Projects_Client` (`client`),
  CONSTRAINT `Fk_Projects_Client` FOREIGN KEY (`client`) REFERENCES `clients` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `projects`
--

LOCK TABLES `projects` WRITE;
/*!40000 ALTER TABLE `projects` DISABLE KEYS */;
INSERT INTO `projects` VALUES (1,'Project 1',3,NULL,'2013-01-03 05:53:38','Active'),(2,'Project 2',3,NULL,'2013-01-03 05:54:22','Active'),(3,'Project 3',1,NULL,'2013-01-03 05:55:02','Active'),(4,'Project 4',2,NULL,'2013-01-03 05:56:16','Active');
/*!40000 ALTER TABLE `projects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `province`
--

DROP TABLE IF EXISTS `province`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `province` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(40) NOT NULL DEFAULT '',
  `code` char(2) NOT NULL DEFAULT '',
  `country` char(2) NOT NULL DEFAULT 'US',
  PRIMARY KEY (`id`),
  KEY `Fk_Province_Country` (`country`),
  CONSTRAINT `Fk_Province_Country` FOREIGN KEY (`country`) REFERENCES `country` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=66 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `province`
--

LOCK TABLES `province` WRITE;
/*!40000 ALTER TABLE `province` DISABLE KEYS */;
INSERT INTO `province` VALUES (1,'Alaska','AK','US'),(2,'Alabama','AL','US'),(3,'American Samoa','AS','US'),(4,'Arizona','AZ','US'),(5,'Arkansas','AR','US'),(6,'California','CA','US'),(7,'Colorado','CO','US'),(8,'Connecticut','CT','US'),(9,'Delaware','DE','US'),(10,'District of Columbia','DC','US'),(11,'Federated States of Micronesia','FM','US'),(12,'Florida','FL','US'),(13,'Georgia','GA','US'),(14,'Guam','GU','US'),(15,'Hawaii','HI','US'),(16,'Idaho','ID','US'),(17,'Illinois','IL','US'),(18,'Indiana','IN','US'),(19,'Iowa','IA','US'),(20,'Kansas','KS','US'),(21,'Kentucky','KY','US'),(22,'Louisiana','LA','US'),(23,'Maine','ME','US'),(24,'Marshall Islands','MH','US'),(25,'Maryland','MD','US'),(26,'Massachusetts','MA','US'),(27,'Michigan','MI','US'),(28,'Minnesota','MN','US'),(29,'Mississippi','MS','US'),(30,'Missouri','MO','US'),(31,'Montana','MT','US'),(32,'Nebraska','NE','US'),(33,'Nevada','NV','US'),(34,'New Hampshire','NH','US'),(35,'New Jersey','NJ','US'),(36,'New Mexico','NM','US'),(37,'New York','NY','US'),(38,'North Carolina','NC','US'),(39,'North Dakota','ND','US'),(40,'Northern Mariana Islands','MP','US'),(41,'Ohio','OH','US'),(42,'Oklahoma','OK','US'),(43,'Oregon','OR','US'),(44,'Palau','PW','US'),(45,'Pennsylvania','PA','US'),(46,'Puerto Rico','PR','US'),(47,'Rhode Island','RI','US'),(48,'South Carolina','SC','US'),(49,'South Dakota','SD','US'),(50,'Tennessee','TN','US'),(51,'Texas','TX','US'),(52,'Utah','UT','US'),(53,'Vermont','VT','US'),(54,'Virgin Islands','VI','US'),(55,'Virginia','VA','US'),(56,'Washington','WA','US'),(57,'West Virginia','WV','US'),(58,'Wisconsin','WI','US'),(59,'Wyoming','WY','US'),(60,'Armed Forces Africa','AE','US'),(61,'Armed Forces Americas (except Canada)','AA','US'),(62,'Armed Forces Canada','AE','US'),(63,'Armed Forces Europe','AE','US'),(64,'Armed Forces Middle East','AE','US'),(65,'Armed Forces Pacific','AP','US');
/*!40000 ALTER TABLE `province` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reportfiles`
--

DROP TABLE IF EXISTS `reportfiles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reportfiles` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `employee` bigint DEFAULT NULL,
  `name` varchar(100) NOT NULL,
  `attachment` varchar(100) NOT NULL,
  `created` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ReportFiles_attachment` (`attachment`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reportfiles`
--

LOCK TABLES `reportfiles` WRITE;
/*!40000 ALTER TABLE `reportfiles` DISABLE KEYS */;
/*!40000 ALTER TABLE `reportfiles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reports`
--

DROP TABLE IF EXISTS `reports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reports` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `details` text,
  `parameters` text,
  `query` text,
  `paramOrder` varchar(500) NOT NULL,
  `type` enum('Query','Class') DEFAULT 'Query',
  `report_group` varchar(500) DEFAULT NULL,
  `output` varchar(15) NOT NULL DEFAULT 'CSV',
  PRIMARY KEY (`id`),
  UNIQUE KEY `Reports_Name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reports`
--

LOCK TABLES `reports` WRITE;
/*!40000 ALTER TABLE `reports` DISABLE KEYS */;
INSERT INTO `reports` VALUES (1,'Employee Details Report','This report list all employee details and you can filter employees by department, employment status or job title','[\r\n[ \"department\", {\"label\":\"Department\",\"type\":\"select2\",\"remote-source\":[\"CompanyStructure\",\"id\",\"title\"],\"allow-null\":true}],\r\n[ \"employment_status\", {\"label\":\"Employment Status\",\"type\":\"select2\",\"remote-source\":[\"EmploymentStatus\",\"id\",\"name\"],\"allow-null\":true}],\r\n[ \"job_title\", {\"label\":\"Job Title\",\"type\":\"select2\",\"remote-source\":[\"JobTitle\",\"id\",\"name\"],\"allow-null\":true}]\r\n]','Select id, employee_id as \'Employee ID\',\r\nconcat(`first_name`,\' \',`middle_name`,\' \', `last_name`) as \'Name\',\r\n(SELECT name from Nationality where id = nationality) as \'Nationality\',\r\nbirthday as \'Birthday\',\r\ngender as \'Gender\',\r\nmarital_status as \'Marital Status\',\r\nssn_num as \'SSN Number\',\r\nnic_num as \'NIC Number\',\r\nother_id as \'Other IDs\',\r\ndriving_license as \'Driving License Number\',\r\n(SELECT name from EmploymentStatus where id = employment_status) as \'Employment Status\',\r\n(SELECT name from JobTitles where id = job_title) as \'Job Title\',\r\n(SELECT name from PayGrades where id = pay_grade) as \'Pay Grade\',\r\nwork_station_id as \'Work Station ID\',\r\naddress1 as \'Address 1\',\r\naddress2 as \'Address 2\',\r\ncity as \'City\',\r\n(SELECT name from Country where code = country) as \'Country\',\r\n(SELECT name from Province where id = province) as \'Province\',\r\npostal_code as \'Postal Code\',\r\nhome_phone as \'Home Phone\',\r\nmobile_phone as \'Mobile Phone\',\r\nwork_phone as \'Work Phone\',\r\nwork_email as \'Work Email\',\r\nprivate_email as \'Private Email\',\r\njoined_date as \'Joined Date\',\r\nconfirmation_date as \'Confirmation Date\',\r\n(SELECT title from CompanyStructures where id = department) as \'Department\',\r\n(SELECT concat(`first_name`,\' \',`middle_name`,\' \', `last_name`,\' [Employee ID:\',`employee_id`,\']\') from Employees e1 where e1.id = e.supervisor) as \'Supervisor\' \r\nFROM Employees e _where_','[\"department\",\"employment_status\",\"job_title\"]','Query','Employee Information','CSV'),(2,'Employee Attendance Report','This report list all employee attendance entries by employee and date range','[\r\n[ \"employee\", {\"label\":\"Employee\",\"type\":\"select2multi\",\"allow-null\":true,\"null-label\":\"All Employees\",\"remote-source\":[\"Employee\",\"id\",\"first_name+last_name\"]}],\r\n[ \"date_start\", {\"label\":\"Start Date\",\"type\":\"date\"}],\r\n[ \"date_end\", {\"label\":\"End Date\",\"type\":\"date\"}]\r\n]','EmployeeAttendanceReport','[\"employee\",\"date_start\",\"date_end\"]','Class','Time Management','CSV'),(3,'Employee Time Tracking Report','This report list employee working hours and attendance details for each day for a given period ','[\r\n[ \"employee\", {\"label\":\"Employee\",\"type\":\"select2\",\"allow-null\":false,\"remote-source\":[\"Employee\",\"id\",\"first_name+last_name\"]}],\r\n[ \"date_start\", {\"label\":\"Start Date\",\"type\":\"date\"}],\r\n[ \"date_end\", {\"label\":\"End Date\",\"type\":\"date\"}]\r\n]','EmployeeTimeTrackReport','[\"employee\",\"date_start\",\"date_end\"]','Class','Time Management','CSV'),(4,'Employee Time Entry Report','View employee time entries by date range and project','[\r\n[ \"employee\", {\"label\":\"Employee\",\"type\":\"select2multi\",\"allow-null\":true,\"null-label\":\"All Employees\",\"remote-source\":[\"Employee\",\"id\",\"first_name+last_name\"]}],\r\n[ \"client\", {\"label\":\"Select Client\",\"type\":\"select\",\"allow-null\":true,\"null-label\":\"Not Selected\",\"remote-source\":[\"Client\",\"id\",\"name\"]}],\r\n[ \"project\", {\"label\":\"Or Project\",\"type\":\"select\",\"allow-null\":true,\"null-label\":\"All Projects\",\"remote-source\":[\"Project\",\"id\",\"name\",\"getAllProjects\"]}],\r\n[ \"date_start\", {\"label\":\"Start Date\",\"type\":\"date\"}],\r\n[ \"date_end\", {\"label\":\"End Date\",\"type\":\"date\"}]\r\n]','EmployeeTimesheetReport','[\"employee\",\"client\",\"project\",\"date_start\",\"date_end\",\"status\"]','Class','Time Management','CSV'),(5,'Active Employee Report','This report list employees who are currently active based on joined date and termination date ','[\r\n[ \"department\", {\"label\":\"Department\",\"type\":\"select2\",\"remote-source\":[\"CompanyStructure\",\"id\",\"title\"],\"allow-null\":true}]\r\n]','ActiveEmployeeReport','[\"department\"]','Class','Employee Information','CSV'),(6,'New Hires Employee Report','This report list employees who are joined between given two dates ','[[ \"department\", {\"label\":\"Department\",\"type\":\"select2\",\"remote-source\":[\"CompanyStructure\",\"id\",\"title\"],\"allow-null\":true}],\r\n[ \"date_start\", {\"label\":\"Start Date\",\"type\":\"date\"}],\r\n[ \"date_end\", {\"label\":\"End Date\",\"type\":\"date\"}]\r\n]','NewHiresEmployeeReport','[\"department\",\"date_start\",\"date_end\"]','Class','Employee Information','CSV'),(7,'Terminated Employee Report','This report list employees who are terminated between given two dates ','[[ \"department\", {\"label\":\"Department\",\"type\":\"select2\",\"remote-source\":[\"CompanyStructure\",\"id\",\"title\"],\"allow-null\":true}],\r\n[ \"date_start\", {\"label\":\"Start Date\",\"type\":\"date\"}],\r\n[ \"date_end\", {\"label\":\"End Date\",\"type\":\"date\"}]\r\n]','TerminatedEmployeeReport','[\"department\",\"date_start\",\"date_end\"]','Class','Employee Information','CSV'),(8,'Travel Request Report','This report list employees travel requests for a specified period','[\r\n[ \"employee\", {\"label\":\"Employee\",\"type\":\"select2multi\",\"allow-null\":true,\"null-label\":\"All Employees\",\"remote-source\":[\"Employee\",\"id\",\"first_name+last_name\"]}],\r\n[ \"date_start\", {\"label\":\"Start Date\",\"type\":\"date\"}],\r\n[ \"date_end\", {\"label\":\"End Date\",\"type\":\"date\"}],\r\n[ \"status\", {\"label\":\"Status\",\"type\":\"select\",\"source\":[[\"NULL\",\"All Statuses\"],[\"Approved\",\"Approved\"],[\"Pending\",\"Pending\"],[\"Rejected\",\"Rejected\"],[\"Cancellation Requested\",\"Cancellation Requested\"],[\"Cancelled\",\"Cancelled\"]]}]\r\n]','TravelRequestReport','[\"employee\",\"date_start\",\"date_end\",\"status\"]','Class','Travel and Expense Management','CSV'),(9,'Employee Time Sheet Report','This report list all employee time sheets by employee and date range','[\r\n[ \"employee\", {\"label\":\"Employee\",\"type\":\"select2multi\",\"allow-null\":true,\"null-label\":\"All Employees\",\"remote-source\":[\"Employee\",\"id\",\"first_name+last_name\"]}],\r\n[ \"date_start\", {\"label\":\"Start Date\",\"type\":\"date\"}],\r\n[ \"date_end\", {\"label\":\"End Date\",\"type\":\"date\"}],\r\n[ \"status\", {\"label\":\"Status\",\"allow-null\":true,\"null-label\":\"All Status\",\"type\":\"select\",\"source\":[[\"Approved\",\"Approved\"],[\"Pending\",\"Pending\"],[\"Rejected\",\"Rejected\"]]}]\r\n]','EmployeeTimeSheetData','[\"employee\",\"date_start\",\"date_end\",\"status\"]','Class','Time Management','CSV');
/*!40000 ALTER TABLE `reports` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `restaccesstokens`
--

DROP TABLE IF EXISTS `restaccesstokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `restaccesstokens` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `userId` bigint NOT NULL,
  `hash` varchar(32) DEFAULT NULL,
  `token` varchar(500) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `userId` (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `restaccesstokens`
--

LOCK TABLES `restaccesstokens` WRITE;
/*!40000 ALTER TABLE `restaccesstokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `restaccesstokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `salarycomponent`
--

DROP TABLE IF EXISTS `salarycomponent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `salarycomponent` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `componentType` bigint DEFAULT NULL,
  `details` text,
  PRIMARY KEY (`id`),
  KEY `Fk_SalaryComponent_SalaryComponentType` (`componentType`),
  CONSTRAINT `Fk_SalaryComponent_SalaryComponentType` FOREIGN KEY (`componentType`) REFERENCES `salarycomponenttype` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `salarycomponent`
--

LOCK TABLES `salarycomponent` WRITE;
/*!40000 ALTER TABLE `salarycomponent` DISABLE KEYS */;
INSERT INTO `salarycomponent` VALUES (1,'Basic Salary',1,NULL),(2,'Fixed Allowance',1,NULL),(3,'Car Allowance',2,NULL),(4,'Telephone Allowance',2,NULL),(5,'Regular Hourly Pay',3,NULL),(6,'Overtime Hourly Pay',3,NULL),(7,'Double Time Hourly Pay',3,NULL);
/*!40000 ALTER TABLE `salarycomponent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `salarycomponenttype`
--

DROP TABLE IF EXISTS `salarycomponenttype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `salarycomponenttype` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `code` varchar(10) NOT NULL,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `salarycomponenttype`
--

LOCK TABLES `salarycomponenttype` WRITE;
/*!40000 ALTER TABLE `salarycomponenttype` DISABLE KEYS */;
INSERT INTO `salarycomponenttype` VALUES (1,'B001','Basic'),(2,'B002','Allowance'),(3,'B003','Hourly');
/*!40000 ALTER TABLE `salarycomponenttype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `settings`
--

DROP TABLE IF EXISTS `settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `settings` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `value` text,
  `description` text,
  `meta` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `settings`
--

LOCK TABLES `settings` WRITE;
/*!40000 ALTER TABLE `settings` DISABLE KEYS */;
INSERT INTO `settings` VALUES (1,'Company: Logo','','','[ \"value\", {\"label\":\"Logo\",\"type\":\"fileupload\",\"validation\":\"none\"}]'),(2,'Company: Name','Sample Company Pvt Ltd','Update your company name - For updating company logo copy a file named logo.png to /app/data/ folder',''),(3,'Company: Description','This is a company using icehrm.com','',''),(4,'Email: Enable','1','0 will disable all outgoing emails from modules. Value 1 will enable outgoing emails','[\"value\", {\"label\":\"Value\",\"type\":\"select\",\"source\":[[\"1\",\"Yes\"],[\"0\",\"No\"]]}]'),(5,'Email: Mode','SMTP','SMTP, PHP Mailer or Amazon SES. SMTP = send emails using local or a remote smtp server. PHP Mailer = send emails using mail function provided by php. Amazon SES = send emails trough amazon Simple Email Service.','[\"value\", {\"label\":\"Value\",\"type\":\"select\",\"source\":[[\"SMTP\",\"SMTP\"],[\"PHP Mailer\",\"PHP Mailer\"],[\"SES\",\"Amazon SES\"]]}]'),(6,'Email: SMTP Host','localhost','SMTP host IP',''),(7,'Email: SMTP Authentication Required','0','Is authentication required by this SMTP server','[\"value\", {\"label\":\"Value\",\"type\":\"select\",\"source\":[[\"1\",\"Yes\"],[\"0\",\"No\"]]}]'),(8,'Email: SMTP User','none','SMTP user',''),(9,'Email: SMTP Password','none','SMTP password',''),(10,'Email: SMTP Port','none','25',''),(11,'Email: Amazon Access Key ID','','If email mode is Amazon SNS please provide SNS Key',''),(12,'Email: Amazon Secret Access Key','','If email mode is Amazon SNS please provide SNS Secret',''),(13,'Email: Email From','icehrm@mydomain.com','',''),(14,'System: Do not pass JSON in request','0','Select Yes if you are having trouble loading data for some tables','[\"value\", {\"label\":\"Value\",\"type\":\"select\",\"source\":[[\"1\",\"Yes\"],[\"0\",\"No\"]]}]'),(15,'System: Reset Modules and Permissions','0','Select this to reset module and permission information in Database (If you have done any changes to meta files)','[\"value\", {\"label\":\"Value\",\"type\":\"select\",\"source\":[[\"1\",\"Yes\"],[\"0\",\"No\"]]}]'),(16,'System: Reset Module Names','0','Select this to reset module names in Database','[\"value\", {\"label\":\"Value\",\"type\":\"select\",\"source\":[[\"1\",\"Yes\"],[\"0\",\"No\"]]}]'),(17,'System: Add New Permissions','0','Select this to add new permission changes done to meta.json file of any module','[\"value\", {\"label\":\"Value\",\"type\":\"select\",\"source\":[[\"1\",\"Yes\"],[\"0\",\"No\"]]}]'),(18,'System: Debug Mode','0','','[\"value\", {\"label\":\"Value\",\"type\":\"select\",\"source\":[[\"1\",\"Yes\"],[\"0\",\"No\"]]}]'),(19,'Projects: Make All Projects Available to Employees','1','','[\"value\", {\"label\":\"Value\",\"type\":\"select\",\"source\":[[\"1\",\"Yes\"],[\"0\",\"No\"]]}]'),(20,'Leave: Share Calendar to Whole Company','1','','[\"value\", {\"label\":\"Value\",\"type\":\"select\",\"source\":[[\"1\",\"Yes\"],[\"0\",\"No\"]]}]'),(21,'Leave: CC Emails','','Every email sent though leave module will be CC to these comma seperated list of emails addresses',''),(22,'Leave: BCC Emails','','Every email sent though leave module will be BCC to these comma seperated list of emails addresses',''),(23,'Attendance: Time-sheet Cross Check','0','Only allow users to add an entry to a timesheet only if they have marked atteandance for the selected period','[\"value\", {\"label\":\"Value\",\"type\":\"select\",\"source\":[[\"1\",\"Yes\"],[\"0\",\"No\"]]}]'),(24,'Api: REST Api Enabled','1','','[\"value\", {\"label\":\"Value\",\"type\":\"select\",\"source\":[[\"0\",\"No\"],[\"1\",\"Yes\"]]}]'),(25,'Api: REST Api Token','Click on edit icon','','[\"value\", {\"label\":\"Value\",\"type\":\"placeholder\"}]'),(26,'LDAP: Enabled','0','','[\"value\", {\"label\":\"Value\",\"type\":\"select\",\"source\":[[\"0\",\"No\"],[\"1\",\"Yes\"]]}]'),(27,'LDAP: Server','','LDAP Server IP or DNS',''),(28,'LDAP: Port','389','LDAP Server Port',''),(29,'LDAP: Root DN','','e.g: dc=mycompany,dc=net',''),(30,'LDAP: Manager DN','','e.g: cn=admin,dc=mycompany,dc=net',''),(31,'LDAP: Manager Password','','Password of the manager user',''),(32,'LDAP: Version 3','1','Are you using LDAP v3','[\"value\", {\"label\":\"Value\",\"type\":\"select\",\"source\":[[\"1\",\"Yes\"],[\"0\",\"No\"]]}]'),(33,'LDAP: User Filter','','e.g: uid={}, we will replace {} with actual username provided by the user at the time of login',''),(34,'Recruitment: Show Quick Apply','1','Show quick apply button when candidates are applying for jobs. Quick apply allow candidates to apply with minimum amount of information','[\"value\", {\"label\":\"Value\",\"type\":\"select\",\"source\":[[\"1\",\"Yes\"],[\"0\",\"No\"]]}]'),(35,'Recruitment: Show Apply','1','Show apply button when candidates are applying for jobs','[\"value\", {\"label\":\"Value\",\"type\":\"select\",\"source\":[[\"1\",\"Yes\"],[\"0\",\"No\"]]}]'),(36,'Notifications: Send Document Expiry Emails','1','','[\"value\", {\"label\":\"Value\",\"type\":\"select\",\"source\":[[\"1\",\"Yes\"],[\"0\",\"No\"]]}]'),(37,'Notifications: Copy Document Expiry Emails to Manager','1','','[\"value\", {\"label\":\"Value\",\"type\":\"select\",\"source\":[[\"1\",\"Yes\"],[\"0\",\"No\"]]}]'),(38,'Expense: Pre-Approve Expenses','0','','[\"value\", {\"label\":\"Value\",\"type\":\"select\",\"source\":[[\"1\",\"Yes\"],[\"0\",\"No\"]]}]'),(39,'Travel: Pre-Approve Travel Request','0','','[\"value\", {\"label\":\"Value\",\"type\":\"select\",\"source\":[[\"1\",\"Yes\"],[\"0\",\"No\"]]}]'),(40,'Attendance: Use Department Time Zone','0','','[\"value\", {\"label\":\"Value\",\"type\":\"select\",\"source\":[[\"1\",\"Yes\"],[\"0\",\"No\"]]}]'),(41,'Travel: Allow Indirect Admins to Approve','0','Allow indirect admins to approve travel requests','[\"value\", {\"label\":\"Value\",\"type\":\"select\",\"source\":[[\"1\",\"Yes\"],[\"0\",\"No\"]]}]'),(42,'Attendance: Overtime Calculation Class','BasicOvertimeCalculator','Set the method used to calculate overtime','[\"value\", {\"label\":\"Value\",\"type\":\"select\",\"source\":[[\"BasicOvertimeCalculator\",\"BasicOvertimeCalculator\"],[\"CaliforniaOvertimeCalculator\",\"CaliforniaOvertimeCalculator\"]]}]'),(43,'Attendance: Overtime Calculation Period','Daily','Set the period for overtime calculation. (Affects attendance sheets)','[\"value\", {\"label\":\"Value\",\"type\":\"select\",\"source\":[[\"Daily\",\"Daily\"],[\"Weekly\",\"Weekly\"]]}]'),(44,'Attendance: Overtime Start Hour','8','Overtime calculation will start after an employee work this number of hours per day, 0 to indicate no overtime',''),(45,'Attendance: Double time Start Hour','12','Double time calculation will start after an employee work this number of hours per day, 0 to indicate no double time',''),(46,'Attendance: Work Week Start Day','0','Set the starting day of the work week','[\"value\", {\"label\":\"Value\",\"type\":\"select\",\"source\":[[\"0\",\"Sunday\"],[\"1\",\"Monday\"],[\"2\",\"Tuesday\"],[\"3\",\"Wednesday\"],[\"4\",\"Thursday\"],[\"5\",\"Friday\"],[\"6\",\"Saturday\"]]}]'),(47,'System: Allowed Countries','','Only these countries will be allowed in select boxes','[\"value\", {\"label\":\"Value\",\"type\":\"select2multi\",\"remote-source\":[\"Country\",\"id\",\"name\"]}]'),(48,'System: Allowed Currencies','','Only these currencies will be allowed in select boxes','[\"value\", {\"label\":\"Value\",\"type\":\"select2multi\",\"remote-source\":[\"CurrencyType\",\"id\",\"code+name\"]}]'),(49,'System: Allowed Nationality','','Only these nationalities will be allowed in select boxes','[\"value\", {\"label\":\"Value\",\"type\":\"select2multi\",\"remote-source\":[\"Nationality\",\"id\",\"name\"]}]'),(50,'System: Language','en','Current Language','[\"value\", {\"label\":\"Value\",\"type\":\"select2\",\"allow-null\":false,\"remote-source\":[\"SupportedLanguage\",\"name\",\"description\"]}]');
/*!40000 ALTER TABLE `settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `skills`
--

DROP TABLE IF EXISTS `skills`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `skills` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `description` varchar(400) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `skills`
--

LOCK TABLES `skills` WRITE;
/*!40000 ALTER TABLE `skills` DISABLE KEYS */;
INSERT INTO `skills` VALUES (1,'Programming and Application Development','Programming and Application Development'),(2,'Project Management','Project Management'),(3,'Help Desk/Technical Support','Help Desk/Technical Support'),(4,'Networking','Networking'),(5,'Databases','Databases'),(6,'Business Intelligence','Business Intelligence'),(7,'Cloud Computing','Cloud Computing'),(8,'Information Security','Information Security'),(9,'HTML Skills','HTML Skills'),(10,'Graphic Designing','Graphic Designing');
/*!40000 ALTER TABLE `skills` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `statuschangelogs`
--

DROP TABLE IF EXISTS `statuschangelogs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `statuschangelogs` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `type` varchar(100) NOT NULL,
  `element` bigint NOT NULL,
  `user_id` bigint DEFAULT NULL,
  `data` varchar(500) NOT NULL,
  `status_from` enum('Approved','Pending','Rejected','Cancellation Requested','Cancelled','Processing') DEFAULT 'Pending',
  `status_to` enum('Approved','Pending','Rejected','Cancellation Requested','Cancelled','Processing') DEFAULT 'Pending',
  `created` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `EmployeeApprovals_type_element` (`type`,`element`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `statuschangelogs`
--

LOCK TABLES `statuschangelogs` WRITE;
/*!40000 ALTER TABLE `statuschangelogs` DISABLE KEYS */;
/*!40000 ALTER TABLE `statuschangelogs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `supportedlanguages`
--

DROP TABLE IF EXISTS `supportedlanguages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `supportedlanguages` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `description` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `supportedlanguages`
--

LOCK TABLES `supportedlanguages` WRITE;
/*!40000 ALTER TABLE `supportedlanguages` DISABLE KEYS */;
INSERT INTO `supportedlanguages` VALUES (1,'en','English'),(2,'de','German'),(3,'fr','French'),(4,'pl','Polish'),(5,'it','Italian'),(6,'si','Sinhala'),(7,'zh','Chinese'),(8,'ja','Japanese'),(9,'hi','Hindi'),(10,'es','Spanish');
/*!40000 ALTER TABLE `supportedlanguages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tags`
--

DROP TABLE IF EXISTS `tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tags` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(250) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tags`
--

LOCK TABLES `tags` WRITE;
/*!40000 ALTER TABLE `tags` DISABLE KEYS */;
/*!40000 ALTER TABLE `tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `timezones`
--

DROP TABLE IF EXISTS `timezones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `timezones` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL DEFAULT '',
  `details` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=113 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `timezones`
--

LOCK TABLES `timezones` WRITE;
/*!40000 ALTER TABLE `timezones` DISABLE KEYS */;
INSERT INTO `timezones` VALUES (1,'Pacific/Midway','(GMT-11:00) Midway Island'),(2,'US/Samoa','(GMT-11:00) Samoa'),(3,'US/Hawaii','(GMT-10:00) Hawaii'),(4,'US/Alaska','(GMT-09:00) Alaska'),(5,'US/Pacific','(GMT-08:00) Pacific Time (US, Canada)'),(6,'America/Tijuana','(GMT-08:00) Tijuana'),(7,'US/Arizona','(GMT-07:00) Arizona'),(8,'US/Mountain','(GMT-07:00) Mountain Time (US, Canada)'),(9,'America/Chihuahua','(GMT-07:00) Chihuahua'),(10,'America/Mazatlan','(GMT-07:00) Mazatlan'),(11,'America/Mexico_City','(GMT-06:00) Mexico City'),(12,'America/Monterrey','(GMT-06:00) Monterrey'),(13,'Canada/Saskatchewan','(GMT-06:00) Saskatchewan'),(14,'US/Central','(GMT-06:00) Central Time (US , Canada)'),(15,'US/Eastern','(GMT-05:00) Eastern Time (US , Canada)'),(16,'US/East-Indiana','(GMT-05:00) Indiana (East)'),(17,'America/Bogota','(GMT-05:00) Bogota'),(18,'America/Lima','(GMT-05:00) Lima'),(19,'America/Caracas','(GMT-04:30) Caracas'),(20,'Canada/Atlantic','(GMT-04:00) Atlantic Time (Canada)'),(21,'America/La_Paz','(GMT-04:00) La Paz'),(22,'America/Santiago','(GMT-04:00) Santiago'),(23,'Canada/Newfoundland','(GMT-03:30) Newfoundland'),(24,'America/Buenos_Aires','(GMT-03:00) Buenos Aires'),(25,'Greenland','(GMT-03:00) Greenland'),(26,'Atlantic/Stanley','(GMT-02:00) Stanley'),(27,'Atlantic/Azores','(GMT-01:00) Azores'),(28,'Atlantic/Cape_Verde','(GMT-01:00) Cape Verde Is.'),(29,'Africa/Casablanca','(GMT) Casablanca'),(30,'Europe/Dublin','(GMT) Dublin'),(31,'Europe/Lisbon','(GMT) Lisbon'),(32,'Europe/London','(GMT) London'),(33,'Africa/Monrovia','(GMT) Monrovia'),(34,'Europe/Amsterdam','(GMT+01:00) Amsterdam'),(35,'Europe/Belgrade','(GMT+01:00) Belgrade'),(36,'Europe/Berlin','(GMT+01:00) Berlin'),(37,'Europe/Bratislava','(GMT+01:00) Bratislava'),(38,'Europe/Brussels','(GMT+01:00) Brussels'),(39,'Europe/Budapest','(GMT+01:00) Budapest'),(40,'Europe/Copenhagen','(GMT+01:00) Copenhagen'),(41,'Europe/Ljubljana','(GMT+01:00) Ljubljana'),(42,'Europe/Madrid','(GMT+01:00) Madrid'),(43,'Europe/Paris','(GMT+01:00) Paris'),(44,'Europe/Prague','(GMT+01:00) Prague'),(45,'Europe/Rome','(GMT+01:00) Rome'),(46,'Europe/Sarajevo','(GMT+01:00) Sarajevo'),(47,'Europe/Skopje','(GMT+01:00) Skopje'),(48,'Europe/Stockholm','(GMT+01:00) Stockholm'),(49,'Europe/Vienna','(GMT+01:00) Vienna'),(50,'Europe/Warsaw','(GMT+01:00) Warsaw'),(51,'Europe/Zagreb','(GMT+01:00) Zagreb'),(52,'Europe/Athens','(GMT+02:00) Athens'),(53,'Europe/Bucharest','(GMT+02:00) Bucharest'),(54,'Africa/Cairo','(GMT+02:00) Cairo'),(55,'Africa/Harare','(GMT+02:00) Harare'),(56,'Europe/Helsinki','(GMT+02:00) Helsinki'),(57,'Europe/Istanbul','(GMT+02:00) Istanbul'),(58,'Asia/Jerusalem','(GMT+02:00) Jerusalem'),(59,'Europe/Kiev','(GMT+02:00) Kyiv'),(60,'Europe/Minsk','(GMT+02:00) Minsk'),(61,'Europe/Riga','(GMT+02:00) Riga'),(62,'Europe/Sofia','(GMT+02:00) Sofia'),(63,'Europe/Tallinn','(GMT+02:00) Tallinn'),(64,'Europe/Vilnius','(GMT+02:00) Vilnius'),(65,'Asia/Baghdad','(GMT+03:00) Baghdad'),(66,'Asia/Kuwait','(GMT+03:00) Kuwait'),(67,'Africa/Nairobi','(GMT+03:00) Nairobi'),(68,'Asia/Riyadh','(GMT+03:00) Riyadh'),(69,'Europe/Moscow','(GMT+03:00) Moscow'),(70,'Asia/Tehran','(GMT+03:30) Tehran'),(71,'Asia/Baku','(GMT+04:00) Baku'),(72,'Europe/Volgograd','(GMT+04:00) Volgograd'),(73,'Asia/Muscat','(GMT+04:00) Muscat'),(74,'Asia/Tbilisi','(GMT+04:00) Tbilisi'),(75,'Asia/Yerevan','(GMT+04:00) Yerevan'),(76,'Asia/Kabul','(GMT+04:30) Kabul'),(77,'Asia/Karachi','(GMT+05:00) Karachi'),(78,'Asia/Tashkent','(GMT+05:00) Tashkent'),(79,'Asia/Kolkata','(GMT+05:30) Kolkata'),(80,'Asia/Kathmandu','(GMT+05:45) Kathmandu'),(81,'Asia/Yekaterinburg','(GMT+06:00) Ekaterinburg'),(82,'Asia/Almaty','(GMT+06:00) Almaty'),(83,'Asia/Dhaka','(GMT+06:00) Dhaka'),(84,'Asia/Novosibirsk','(GMT+07:00) Novosibirsk'),(85,'Asia/Bangkok','(GMT+07:00) Bangkok'),(86,'Asia/Jakarta','(GMT+07:00) Jakarta'),(87,'Asia/Krasnoyarsk','(GMT+08:00) Krasnoyarsk'),(88,'Asia/Chongqing','(GMT+08:00) Chongqing'),(89,'Asia/Hong_Kong','(GMT+08:00) Hong Kong'),(90,'Asia/Kuala_Lumpur','(GMT+08:00) Kuala Lumpur'),(91,'Australia/Perth','(GMT+08:00) Perth'),(92,'Asia/Singapore','(GMT+08:00) Singapore'),(93,'Asia/Taipei','(GMT+08:00) Taipei'),(94,'Asia/Ulaanbaatar','(GMT+08:00) Ulaan Bataar'),(95,'Asia/Urumqi','(GMT+08:00) Urumqi'),(96,'Asia/Irkutsk','(GMT+09:00) Irkutsk'),(97,'Asia/Seoul','(GMT+09:00) Seoul'),(98,'Asia/Tokyo','(GMT+09:00) Tokyo'),(99,'Australia/Adelaide','(GMT+09:30) Adelaide'),(100,'Australia/Darwin','(GMT+09:30) Darwin'),(101,'Asia/Yakutsk','(GMT+10:00) Yakutsk'),(102,'Australia/Brisbane','(GMT+10:00) Brisbane'),(103,'Australia/Canberra','(GMT+10:00) Canberra'),(104,'Pacific/Guam','(GMT+10:00) Guam'),(105,'Australia/Hobart','(GMT+10:00) Hobart'),(106,'Australia/Melbourne','(GMT+10:00) Melbourne'),(107,'Pacific/Port_Moresby','(GMT+10:00) Port Moresby'),(108,'Australia/Sydney','(GMT+10:00) Sydney'),(109,'Asia/Vladivostok','(GMT+11:00) Vladivostok'),(110,'Asia/Magadan','(GMT+12:00) Magadan'),(111,'Pacific/Auckland','(GMT+12:00) Auckland'),(112,'Pacific/Fiji','(GMT+12:00) Fiji');
/*!40000 ALTER TABLE `timezones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trainingsessions`
--

DROP TABLE IF EXISTS `trainingsessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `trainingsessions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(300) NOT NULL,
  `course` bigint NOT NULL,
  `description` text,
  `scheduled` datetime DEFAULT NULL,
  `dueDate` datetime DEFAULT NULL,
  `deliveryMethod` enum('Classroom','Self Study','Online') DEFAULT 'Classroom',
  `deliveryLocation` varchar(500) DEFAULT NULL,
  `status` enum('Pending','Approved','Completed','Cancelled') DEFAULT 'Pending',
  `attendanceType` enum('Sign Up','Assign') DEFAULT 'Sign Up',
  `attachment` varchar(300) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  `requireProof` enum('Yes','No') DEFAULT 'Yes',
  PRIMARY KEY (`id`),
  KEY `Fk_TrainingSessions_Courses` (`course`),
  CONSTRAINT `Fk_TrainingSessions_Courses` FOREIGN KEY (`course`) REFERENCES `courses` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trainingsessions`
--

LOCK TABLES `trainingsessions` WRITE;
/*!40000 ALTER TABLE `trainingsessions` DISABLE KEYS */;
/*!40000 ALTER TABLE `trainingsessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userreports`
--

DROP TABLE IF EXISTS `userreports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `userreports` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `details` text,
  `parameters` text,
  `query` text,
  `paramOrder` varchar(500) NOT NULL,
  `type` enum('Query','Class') DEFAULT 'Query',
  `report_group` varchar(500) DEFAULT NULL,
  `output` varchar(15) NOT NULL DEFAULT 'CSV',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UserReports_Name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userreports`
--

LOCK TABLES `userreports` WRITE;
/*!40000 ALTER TABLE `userreports` DISABLE KEYS */;
INSERT INTO `userreports` VALUES (1,'Time Entry Report','View your time entries by date range and project','[\r\n[ \"client\", {\"label\":\"Select Client\",\"type\":\"select\",\"allow-null\":true,\"null-label\":\"Not Selected\",\"remote-source\":[\"Client\",\"id\",\"name\"]}],\r\n[ \"project\", {\"label\":\"Or Project\",\"type\":\"select\",\"allow-null\":true,\"null-label\":\"All Projects\",\"remote-source\":[\"Project\",\"id\",\"name\",\"getAllProjects\"]}],\r\n[ \"date_start\", {\"label\":\"Start Date\",\"type\":\"date\"}],\r\n[ \"date_end\", {\"label\":\"End Date\",\"type\":\"date\"}]\r\n]','EmployeeTimesheetReport','[\"client\",\"project\",\"date_start\",\"date_end\",\"status\"]','Class','Time Management','CSV'),(2,'Attendance Report','View your attendance entries by date range','[\r\n[ \"date_start\", {\"label\":\"Start Date\",\"type\":\"date\"}],\r\n[ \"date_end\", {\"label\":\"End Date\",\"type\":\"date\"}]\r\n]','EmployeeAttendanceReport','[\"date_start\",\"date_end\"]','Class','Time Management','CSV'),(3,'Time Tracking Report','View your working hours and attendance details for each day for a given period ','[\r\n[ \"date_start\", {\"label\":\"Start Date\",\"type\":\"date\"}],\r\n[ \"date_end\", {\"label\":\"End Date\",\"type\":\"date\"}]\r\n]','EmployeeTimeTrackReport','[\"date_start\",\"date_end\"]','Class','Time Management','CSV'),(4,'Travel Request Report','View travel requests for a specified period','[\r\n[ \"date_start\", {\"label\":\"Start Date\",\"type\":\"date\"}],\r\n[ \"date_end\", {\"label\":\"End Date\",\"type\":\"date\"}],\r\n[ \"status\", {\"label\":\"Status\",\"type\":\"select\",\"source\":[[\"NULL\",\"All Statuses\"],[\"Approved\",\"Approved\"],[\"Pending\",\"Pending\"],[\"Rejected\",\"Rejected\"],[\"Cancellation Requested\",\"Cancellation Requested\"],[\"Cancelled\",\"Cancelled\"]]}]\r\n]','TravelRequestReport','[\"date_start\",\"date_end\",\"status\"]','Class','Travel and Expense Management','CSV'),(5,'Time Sheet Report','This report list all employee time sheets by employee and date range','[\r\n[ \"date_start\", {\"label\":\"Start Date\",\"type\":\"date\"}],\r\n[ \"date_end\", {\"label\":\"End Date\",\"type\":\"date\"}],\r\n[ \"status\", {\"label\":\"Status\",\"allow-null\":true,\"null-label\":\"All Status\",\"type\":\"select\",\"source\":[[\"Approved\",\"Approved\"],[\"Pending\",\"Pending\"],[\"Rejected\",\"Rejected\"]]}]\r\n]','EmployeeTimeSheetData','[\"date_start\",\"date_end\",\"status\"]','Class','Time Management','CSV'),(6,'Client Project Time Report','View your time entries for projects under a given client','[\r\n[ \"client\", {\"label\":\"Select Client\",\"type\":\"select\",\"allow-null\":false,\"remote-source\":[\"Client\",\"id\",\"name\"]}],\r\n[ \"date_start\", {\"label\":\"Start Date\",\"type\":\"date\"}],\r\n[ \"date_end\", {\"label\":\"End Date\",\"type\":\"date\"}]\r\n]','ClientProjectTimeReport','[\"client\",\"date_start\",\"date_end\",\"status\"]','Class','Time Management','PDF'),(7,'Download Payslips','Download your payslips','[\r\n[ \"payroll\", {\"label\":\"Select Payroll\",\"type\":\"select\",\"allow-null\":false,\"remote-source\":[\"Payroll\",\"id\",\"name\",\"getEmployeePayrolls\"]}]]','PayslipReport','[\"payroll\"]','Class','Finance','PDF');
/*!40000 ALTER TABLE `userreports` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userroles`
--

DROP TABLE IF EXISTS `userroles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `userroles` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userroles`
--

LOCK TABLES `userroles` WRITE;
/*!40000 ALTER TABLE `userroles` DISABLE KEYS */;
INSERT INTO `userroles` VALUES (2,'Attendance Manager'),(1,'Report Manager');
/*!40000 ALTER TABLE `userroles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `username` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `employee` bigint DEFAULT NULL,
  `default_module` bigint DEFAULT NULL,
  `user_level` enum('Admin','Employee','Manager','Other') DEFAULT NULL,
  `user_roles` text,
  `last_login` datetime DEFAULT NULL,
  `last_update` datetime DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `login_hash` varchar(64) DEFAULT NULL,
  `lang` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  KEY `Fk_User_Employee` (`employee`),
  KEY `Fk_User_SupportedLanguages` (`lang`),
  KEY `login_hash_index` (`login_hash`),
  CONSTRAINT `Fk_User_Employee` FOREIGN KEY (`employee`) REFERENCES `employees` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `Fk_User_SupportedLanguages` FOREIGN KEY (`lang`) REFERENCES `supportedlanguages` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'admin','icehrm+admin@web-stalk.com','21232f297a57a5a743894a0e4a801fc3',1,NULL,'Admin','',NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workdays`
--

DROP TABLE IF EXISTS `workdays`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `workdays` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `status` enum('Full Day','Half Day','Non-working Day') DEFAULT 'Full Day',
  `country` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `workdays_name_country` (`name`,`country`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workdays`
--

LOCK TABLES `workdays` WRITE;
/*!40000 ALTER TABLE `workdays` DISABLE KEYS */;
INSERT INTO `workdays` VALUES (1,'Monday','Full Day',NULL),(2,'Tuesday','Full Day',NULL),(3,'Wednesday','Full Day',NULL),(4,'Thursday','Full Day',NULL),(5,'Friday','Full Day',NULL),(6,'Saturday','Non-working Day',NULL),(7,'Sunday','Non-working Day',NULL);
/*!40000 ALTER TABLE `workdays` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'icehrm'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-09-04 13:13:13
