-- MySQL dump 10.13  Distrib 8.0.18, for Win64 (x86_64)
--
-- Host: localhost    Database: tracker
-- ------------------------------------------------------
-- Server version	8.0.13

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
-- Table structure for table `drive`
--

DROP TABLE IF EXISTS `drive`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `drive` (
  `d_id` int(11) NOT NULL AUTO_INCREMENT,
  `company_name` varchar(45) DEFAULT NULL,
  `no_of_rsrcs` int(11) DEFAULT NULL,
  `exp_req` tinyint(5) DEFAULT NULL,
  `ctc` float DEFAULT NULL,
  `join_crt` tinyint(2) DEFAULT NULL,
  `bond` float DEFAULT NULL,
  `position` tinyint(4) DEFAULT NULL,
  `follow_up` date DEFAULT NULL,
  `edu_crt` tinyint(3) DEFAULT NULL,
  `cur_status` tinyint(6) DEFAULT NULL,
  `nxt_act` tinyint(5) DEFAULT NULL,
  `nxt_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `ps_yr_req` int(11) DEFAULT NULL,
  `gap_req` tinyint(2) DEFAULT NULL,
  `creation_date` date DEFAULT NULL,
  `tpoid` int(11) DEFAULT NULL,
  PRIMARY KEY (`d_id`),
  KEY `frk1_idx` (`tpoid`),
  CONSTRAINT `frk1` FOREIGN KEY (`tpoid`) REFERENCES `tpo` (`tpo_id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `drive`
--

LOCK TABLES `drive` WRITE;
/*!40000 ALTER TABLE `drive` DISABLE KEYS */;
INSERT INTO `drive` VALUES (1,'infosys',4,2,50000,0,2,0,'2003-04-05',2,NULL,NULL,'2020-01-17 19:52:10',NULL,NULL,NULL,NULL),(5,'cognizant',2,3,34000,1,2,3,'2001-04-04',2,NULL,NULL,'2020-01-20 20:52:55',NULL,NULL,NULL,NULL),(6,'zensar',3,0,34900,0,2,1,'2008-02-03',1,NULL,NULL,'2020-01-20 20:53:58',NULL,NULL,NULL,NULL),(10,'capgemini',3,1,30000,0,3,3,'2007-04-05',1,NULL,NULL,'2020-01-21 18:08:08',NULL,NULL,NULL,NULL),(13,'tcs',1,3,40000,1,0,2,'2009-03-04',0,NULL,NULL,'2020-01-22 18:51:54',NULL,NULL,NULL,NULL),(14,'L&T',1,2,45000,1,1,1,'2001-03-04',1,NULL,NULL,'2020-01-22 20:55:50',NULL,NULL,NULL,NULL),(15,'greenlight',1,1,25000,0,0,0,'2009-04-05',1,NULL,NULL,'2020-01-22 21:58:36',NULL,NULL,NULL,NULL),(17,'synechron',1,1,45000,1,0,3,'2009-03-04',1,NULL,NULL,'2020-01-23 20:22:40',NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `drive` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `drive_stud`
--

DROP TABLE IF EXISTS `drive_stud`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `drive_stud` (
  `ds_id` int(11) NOT NULL,
  `did` int(11) DEFAULT NULL,
  `st_id` int(11) NOT NULL AUTO_INCREMENT,
  `creation_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `tpid` int(11) DEFAULT NULL,
  PRIMARY KEY (`st_id`),
  UNIQUE KEY `ds_id_UNIQUE` (`ds_id`),
  KEY `drive_frk_idx` (`did`),
  KEY `tpo_frk_idx` (`tpid`),
  CONSTRAINT `drive_frk` FOREIGN KEY (`did`) REFERENCES `drive` (`d_id`),
  CONSTRAINT `tpo_frk` FOREIGN KEY (`tpid`) REFERENCES `tpo` (`tpo_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `drive_stud`
--

LOCK TABLES `drive_stud` WRITE;
/*!40000 ALTER TABLE `drive_stud` DISABLE KEYS */;
/*!40000 ALTER TABLE `drive_stud` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `drive_stud_track`
--

DROP TABLE IF EXISTS `drive_stud_track`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `drive_stud_track` (
  `dsr_id` int(11) NOT NULL AUTO_INCREMENT,
  `did1` int(11) DEFAULT NULL,
  `stid` int(11) DEFAULT NULL,
  `tpoid1` int(11) DEFAULT NULL,
  `survived_status` tinyint(4) DEFAULT NULL,
  `creation_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`dsr_id`),
  KEY `dd_frk_idx` (`did1`),
  KEY `tp_frk_idx` (`tpoid1`),
  KEY `stud_frk_idx` (`stid`),
  CONSTRAINT `dd_frk` FOREIGN KEY (`did1`) REFERENCES `drive` (`d_id`),
  CONSTRAINT `stud_frk` FOREIGN KEY (`stid`) REFERENCES `drive_stud` (`st_id`),
  CONSTRAINT `tp_frk` FOREIGN KEY (`tpoid1`) REFERENCES `tpo` (`tpo_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `drive_stud_track`
--

LOCK TABLES `drive_stud_track` WRITE;
/*!40000 ALTER TABLE `drive_stud_track` DISABLE KEYS */;
/*!40000 ALTER TABLE `drive_stud_track` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `drive_track`
--

DROP TABLE IF EXISTS `drive_track`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `drive_track` (
  `tr_id` int(11) NOT NULL AUTO_INCREMENT,
  `did_` int(11) DEFAULT NULL,
  `status` tinyint(6) DEFAULT NULL,
  `tpoid_` int(11) DEFAULT NULL,
  `remark` varchar(45) DEFAULT NULL,
  `no_of_student` int(11) DEFAULT NULL,
  PRIMARY KEY (`tr_id`),
  KEY `d_frk_idx` (`did_`),
  KEY `t_frk_idx` (`tpoid_`),
  CONSTRAINT `d_frk` FOREIGN KEY (`did_`) REFERENCES `drive` (`d_id`),
  CONSTRAINT `t_frk` FOREIGN KEY (`tpoid_`) REFERENCES `tpo` (`tpo_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `drive_track`
--

LOCK TABLES `drive_track` WRITE;
/*!40000 ALTER TABLE `drive_track` DISABLE KEYS */;
/*!40000 ALTER TABLE `drive_track` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stud`
--

DROP TABLE IF EXISTS `stud`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stud` (
  `name` varchar(10) DEFAULT NULL,
  `pass` varchar(40) DEFAULT NULL,
  `mail` varchar(40) DEFAULT NULL,
  `gender` varchar(15) DEFAULT NULL,
  `country` varchar(10) DEFAULT NULL,
  `mobile` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stud`
--

LOCK TABLES `stud` WRITE;
/*!40000 ALTER TABLE `stud` DISABLE KEYS */;
INSERT INTO `stud` VALUES ('priti','87654321','pritu@gmail.com','female','Germany','9865345678'),('anjali','09876543234','a@gmail.com','female','USA','9865567890'),('anjali','09876543234','a@gmail.com','female','USA','9865567890');
/*!40000 ALTER TABLE `stud` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tpo`
--

DROP TABLE IF EXISTS `tpo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tpo` (
  `tpo_id` int(11) NOT NULL AUTO_INCREMENT,
  `tpo_name` varchar(40) DEFAULT NULL,
  `tpo_email` varchar(40) DEFAULT NULL,
  `tpo_username` varchar(15) DEFAULT NULL,
  `tpo_password` varchar(16) DEFAULT NULL,
  `creation_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `role` tinyint(2) DEFAULT NULL,
  PRIMARY KEY (`tpo_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tpo`
--

LOCK TABLES `tpo` WRITE;
/*!40000 ALTER TABLE `tpo` DISABLE KEYS */;
/*!40000 ALTER TABLE `tpo` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-01-29 14:56:52
