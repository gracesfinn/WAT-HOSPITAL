-- MySQL dump 10.13  Distrib 8.0.16, for Win64 (x86_64)
--
-- Host: localhost    Database: wat_hospital
-- ------------------------------------------------------
-- Server version	8.0.16

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
-- Table structure for table `bed`
--

DROP TABLE IF EXISTS `bed`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `bed` (
  `bedNumber` int(11) NOT NULL AUTO_INCREMENT,
  `bedType` varchar(20) DEFAULT NULL,
  `wardID` int(11) DEFAULT NULL,
  `patientID` int(11) DEFAULT NULL,
  PRIMARY KEY (`bedNumber`),
  KEY `FK_wardID` (`wardID`),
  KEY `FK_patientID` (`patientID`),
  CONSTRAINT `FK_patientID` FOREIGN KEY (`patientID`) REFERENCES `patient` (`patientID`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `FK_wardID` FOREIGN KEY (`wardID`) REFERENCES `ward` (`wardID`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2026 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bed`
--

LOCK TABLES `bed` WRITE;
/*!40000 ALTER TABLE `bed` DISABLE KEYS */;
INSERT INTO `bed` VALUES (1011,'Standard',101,1),(1012,'Standard',101,5),(1013,'Standard',101,16),(1014,'Standard',101,17),(1015,'Standard',101,NULL),(1021,'Orthopedic',102,3),(1022,'Orthopedic',102,NULL),(1023,'Orthopedic',102,9),(1024,'Orthopedic',102,NULL),(1025,'Orthopedic',102,NULL),(1031,'Orthopedic',103,12),(1032,'Orthopedic',103,NULL),(1033,'Orthopedic',103,11),(1034,'Orthopedic',103,NULL),(1035,'Orthopedic',103,15),(1041,'Standard',104,14),(1042,'Standard',104,NULL),(1043,'Standard',104,12),(1044,'Standard',104,NULL),(1045,'Standard',104,NULL),(2011,'Maternity',201,6),(2012,'Maternity',201,2),(2013,'Maternity',201,7),(2014,'Maternity',201,NULL),(2015,'Maternity',201,5),(2021,'Maternity',202,19),(2022,'Maternity',202,13),(2023,'Maternity',202,8),(2024,'Maternity',202,20),(2025,'Maternity',202,18);
/*!40000 ALTER TABLE `bed` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dischargedpatient`
--

DROP TABLE IF EXISTS `dischargedpatient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `dischargedpatient` (
  `dischargeDate` date NOT NULL,
  `patientID` int(11) NOT NULL,
  `fname` varchar(15) DEFAULT NULL,
  `lname` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`dischargeDate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dischargedpatient`
--

LOCK TABLES `dischargedpatient` WRITE;
/*!40000 ALTER TABLE `dischargedpatient` DISABLE KEYS */;
INSERT INTO `dischargedpatient` VALUES ('2019-10-26',2,'Jane','Smith');
/*!40000 ALTER TABLE `dischargedpatient` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `doctor`
--

DROP TABLE IF EXISTS `doctor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `doctor` (
  `PPS` varchar(10) DEFAULT NULL,
  `docFName` varchar(15) DEFAULT NULL,
  `docLName` varchar(15) DEFAULT NULL,
  `street` varchar(30) DEFAULT NULL,
  `town` varchar(15) DEFAULT NULL,
  `county` varchar(15) DEFAULT NULL,
  `contactNo` int(40) DEFAULT NULL,
  `hireDate` date DEFAULT NULL,
  `specialisation` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doctor`
--

LOCK TABLES `doctor` WRITE;
/*!40000 ALTER TABLE `doctor` DISABLE KEYS */;
INSERT INTO `doctor` VALUES ('12345678A','Aoife','Hurley','Dunmore Road','Dunmore','Waterford',51345677,'2019-01-03','Maternity'),('23456789B','Eanna','Lowney','Ardmore Road','Ardmore','Waterford',51456778,'2019-01-01','Oncology'),('34567891C','Phillipa','Walsh','Old Tramore Road','Tramore','Waterford',51987463,'2018-10-01','Cardiology'),('74836273E','William','Duggan','Doneraile Drive','Tramore','Waterford',51876576,'2019-01-03','Emergency Care'),('47362818F','Emer','Fine','New Town','Tramore','Waterford',51873622,'2019-01-03','Paediatrics'),('12345678D','Mary','Kelly','Main Street','Dungarvan','Waterford',51323456,'2019-10-23','Radiology');
/*!40000 ALTER TABLE `doctor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dosage_change`
--

DROP TABLE IF EXISTS `dosage_change`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `dosage_change` (
  `visitID` int(11) NOT NULL AUTO_INCREMENT,
  `drugID` int(11) NOT NULL,
  `dosageDetails` varchar(50) DEFAULT NULL,
  `changeDate` datetime DEFAULT NULL,
  `action` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`visitID`)
) ENGINE=InnoDB AUTO_INCREMENT=201902 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dosage_change`
--

LOCK TABLES `dosage_change` WRITE;
/*!40000 ALTER TABLE `dosage_change` DISABLE KEYS */;
INSERT INTO `dosage_change` VALUES (201901,201901,'Take three every hour with food and water','2019-10-31 10:30:40','changed');
/*!40000 ALTER TABLE `dosage_change` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `drug`
--

DROP TABLE IF EXISTS `drug`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `drug` (
  `drugID` int(11) NOT NULL AUTO_INCREMENT,
  `drugName` varchar(50) DEFAULT NULL,
  `manufacturer` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`drugID`)
) ENGINE=InnoDB AUTO_INCREMENT=4711505 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `drug`
--

LOCK TABLES `drug` WRITE;
/*!40000 ALTER TABLE `drug` DISABLE KEYS */;
INSERT INTO `drug` VALUES (4711501,'Ellence','Johnson&Johnson'),(4711502,'Propranolol','Pfizer'),(4711503,'Epidural','Bayer'),(4711504,'Paracetamol','Sanofi');
/*!40000 ALTER TABLE `drug` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patient`
--

DROP TABLE IF EXISTS `patient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `patient` (
  `patientID` int(11) NOT NULL AUTO_INCREMENT,
  `fName` varchar(15) DEFAULT NULL,
  `lName` varchar(15) DEFAULT NULL,
  `street` varchar(15) DEFAULT NULL,
  `town` varchar(15) DEFAULT NULL,
  `county` varchar(15) DEFAULT NULL,
  `contactNo` int(40) DEFAULT NULL,
  `arriveDate` datetime DEFAULT NULL,
  `dischargeDate` date DEFAULT NULL,
  PRIMARY KEY (`patientID`),
  KEY `idx_patName` (`fName`,`lName`),
  KEY `idx_addmissionDate` (`arriveDate` DESC)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patient`
--

LOCK TABLES `patient` WRITE;
/*!40000 ALTER TABLE `patient` DISABLE KEYS */;
INSERT INTO `patient` VALUES (1,'Jim','Smith','Church Road','Tramore','Waterford',51123456,'2019-10-01 00:00:00',NULL),(2,'Jane','Smith','Church Road','Tramore','Waterford',51123456,'2019-10-02 00:00:00','2019-10-26'),(3,'Ben','Power','Preist Road','Tramore','Waterford',51234567,'2019-10-03 00:00:00','2019-10-10'),(5,'Jessica','Cullen','Cliff Road','Tramore','Waterford',5114567,'2019-10-05 00:00:00',NULL),(6,'Sharon','Duggan','Main Street','Dunhill','Waterford',5156896,'2019-10-06 00:00:00',NULL),(7,'Rebecca','O\'Neill','New Road','Tramore','Waterford',51874653,'2019-10-10 00:00:00',NULL),(8,'Louise','Kilcommons','Fenor','Tramore','Waterford',51390568,'2019-10-12 00:00:00',NULL),(9,'Mark','Swift','Main Street','Woodstown','Waterford',51948573,'2019-10-02 00:00:00',NULL),(10,'Peter','Collins','Main Street','Kilmeadan','Waterford',51748564,'2019-10-05 00:00:00',NULL),(11,'Miriam','Nevin','Main Street','Kilmacthomas','Waterford',51857463,'2019-10-12 00:00:00',NULL),(12,'Tim','English','Main Street','Bunmahon','Waterford',51857463,'2019-10-05 00:00:00',NULL),(13,'Jan','Denton','Main Street','Dunmore East','Waterford',51657483,'2019-10-10 00:00:00',NULL),(14,'Larry','Peters','Main Street','Dungarvan','Waterford',51957483,'2019-10-20 00:00:00',NULL),(15,'Adam','Schalk','Main Street','Piltown','Waterford',51657483,'2019-10-20 00:00:00',NULL),(16,'Craig','McDonald','Main Street','Kill','Waterford',51765387,'2019-10-20 00:00:00',NULL),(17,'Dan','Cole','Main Street','Dungarvan','Waterford',51765387,'2019-10-20 00:00:00',NULL),(18,'Bianca','Chris','Main Street','Dungarvan','Waterford',51837282,'2019-10-20 00:00:00',NULL),(19,'Megan','Morgan','Main Street','Dunmore East','Waterford',51847382,'2019-10-20 00:00:00',NULL),(20,'Tiffany','Farrel','Main Street','Kilmeaden','Waterford',51938475,'2019-10-20 00:00:00',NULL),(21,'William','Egan','Monvoy','Tramore','Waterford',51789567,'2019-10-20 00:00:00',NULL);
/*!40000 ALTER TABLE `patient` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prescription`
--

DROP TABLE IF EXISTS `prescription`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `prescription` (
  `visitID` int(11) NOT NULL,
  `drugID` int(11) NOT NULL,
  `dosageDetails` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`visitID`,`drugID`),
  KEY `FK_drug` (`drugID`),
  CONSTRAINT `FK_drug` FOREIGN KEY (`drugID`) REFERENCES `drug` (`drugID`),
  CONSTRAINT `FK_vis` FOREIGN KEY (`visitID`) REFERENCES `visit` (`visitID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prescription`
--

LOCK TABLES `prescription` WRITE;
/*!40000 ALTER TABLE `prescription` DISABLE KEYS */;
INSERT INTO `prescription` VALUES (201901,4711504,'Take two every four hours with food and water'),(201902,4711503,'0.0625% to 0.1 % bupivacaine with 2-4 mcg/ml fentanyl or 0.4 mcg/ml\nsufentanil'),(201903,4711502,'Immediate-release: 40 mg orally 2 times a day'),(201905,4711501,'Epirubicin 100 mg/m² IV, AND 5-fluorouracil 500 mg/m² IV, AND cyclophosphamide 500 mg/m² IV'),(201906,4711503,'0.0625% to 0.1 % bupivacaine with 2-4 mcg/ml fentanyl or 0.4 mcg/ml\nsufentanil'),(201907,4711502,'Immediate-release: 40 mg orally 2 times a day');
/*!40000 ALTER TABLE `prescription` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `visit`
--

DROP TABLE IF EXISTS `visit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `visit` (
  `visitID` int(11) NOT NULL AUTO_INCREMENT,
  `patientID` int(11) DEFAULT NULL,
  `PPS` varchar(10) DEFAULT NULL,
  `visitDate` datetime DEFAULT NULL,
  PRIMARY KEY (`visitID`),
  KEY `FK_patient` (`patientID`),
  CONSTRAINT `FK_patient` FOREIGN KEY (`patientID`) REFERENCES `patient` (`patientID`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=201925 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `visit`
--

LOCK TABLES `visit` WRITE;
/*!40000 ALTER TABLE `visit` DISABLE KEYS */;
INSERT INTO `visit` VALUES (201901,1,'34567891C','2019-10-22 00:00:00'),(201902,2,'12345678A','2019-10-10 00:00:00'),(201903,3,'23456789B','2019-10-14 00:00:00'),(201905,8,'74836273E','2019-10-29 00:00:00'),(201906,18,'12345678A','2019-10-20 00:00:00'),(201907,6,'12345678A','2019-10-06 00:00:00'),(201909,20,'34567891C','2019-10-20 00:00:00'),(201910,16,'34567891C','2019-10-20 00:00:00'),(201911,9,'23456789B','2019-10-02 00:00:00'),(201912,13,'23456789B','2019-10-10 00:00:00'),(201913,12,'23456789B','2019-10-05 00:00:00'),(201914,11,'23456789B','2019-10-12 00:00:00'),(201915,10,'74836273E','2019-10-05 00:00:00'),(201916,14,'74836273E','2019-10-20 00:00:00'),(201917,15,'74836273E','2019-10-20 00:00:00'),(201918,19,'74836273E','2019-10-20 00:00:00'),(201919,5,'47362818F','2019-10-05 00:00:00'),(201920,7,'47362818F','2019-10-10 00:00:00'),(201922,17,'12345678D','2019-10-20 00:00:00'),(201923,21,'12345678D','2019-10-31 21:03:26');
/*!40000 ALTER TABLE `visit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ward`
--

DROP TABLE IF EXISTS `ward`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `ward` (
  `wardID` int(11) NOT NULL AUTO_INCREMENT,
  `wardName` varchar(20) DEFAULT NULL,
  `wardType` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`wardID`),
  KEY `idx_wardName` (`wardName`)
) ENGINE=InnoDB AUTO_INCREMENT=203 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ward`
--

LOCK TABLES `ward` WRITE;
/*!40000 ALTER TABLE `ward` DISABLE KEYS */;
INSERT INTO `ward` VALUES (101,'ER','Emergency Department'),(102,'ICU','Intensive Care'),(103,'Dialysis Suite','Acute Care'),(104,'Chemo Suite','Oncology'),(201,'Pre-Natal','Maternity'),(202,'Post-Natal','Maternity');
/*!40000 ALTER TABLE `ward` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-11-16 14:32:24
