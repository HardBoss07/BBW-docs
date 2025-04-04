-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: localhost    Database: Hersteller
-- ------------------------------------------------------
-- Server version	11.6.2-MariaDB-ubu2404

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
-- Table structure for table `Hersteller`
--

DROP TABLE IF EXISTS `Hersteller`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Hersteller` (
  `HerstellerID` int(11) NOT NULL AUTO_INCREMENT,
  `Matteo` varchar(100) DEFAULT NULL,
  `Bosshard` varchar(100) DEFAULT NULL,
  `HerstellerProduktIDFS` int(11) NOT NULL,
  `HerstellerPersonIDFS` int(11) NOT NULL,
  PRIMARY KEY (`HerstellerID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Hersteller`
--

LOCK TABLES `Hersteller` WRITE;
/*!40000 ALTER TABLE `Hersteller` DISABLE KEYS */;
/*!40000 ALTER TABLE `Hersteller` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `HerstellerPerson`
--

DROP TABLE IF EXISTS `HerstellerPerson`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `HerstellerPerson` (
  `HerstellerIDFS` int(11) NOT NULL,
  `PersonIDFS` int(11) NOT NULL,
  PRIMARY KEY (`HerstellerIDFS`,`PersonIDFS`),
  KEY `HerstellerPerson_Person_FK` (`PersonIDFS`),
  CONSTRAINT `HerstellerPerson_Hersteller_FK` FOREIGN KEY (`HerstellerIDFS`) REFERENCES `Hersteller` (`HerstellerID`),
  CONSTRAINT `HerstellerPerson_Person_FK` FOREIGN KEY (`PersonIDFS`) REFERENCES `Person` (`PersonID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `HerstellerPerson`
--

LOCK TABLES `HerstellerPerson` WRITE;
/*!40000 ALTER TABLE `HerstellerPerson` DISABLE KEYS */;
/*!40000 ALTER TABLE `HerstellerPerson` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `HerstellerProdukt`
--

DROP TABLE IF EXISTS `HerstellerProdukt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `HerstellerProdukt` (
  `HerstellerIDFS` int(11) NOT NULL,
  `ProduktIDFS` int(11) NOT NULL,
  PRIMARY KEY (`HerstellerIDFS`,`ProduktIDFS`),
  KEY `HerstellerProdukt_Produkt_FK` (`ProduktIDFS`),
  CONSTRAINT `HerstellerProdukt_Hersteller_FK` FOREIGN KEY (`HerstellerIDFS`) REFERENCES `Hersteller` (`HerstellerID`),
  CONSTRAINT `HerstellerProdukt_Produkt_FK` FOREIGN KEY (`ProduktIDFS`) REFERENCES `Produkt` (`ProduktID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `HerstellerProdukt`
--

LOCK TABLES `HerstellerProdukt` WRITE;
/*!40000 ALTER TABLE `HerstellerProdukt` DISABLE KEYS */;
/*!40000 ALTER TABLE `HerstellerProdukt` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Person`
--

DROP TABLE IF EXISTS `Person`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Person` (
  `PersonID` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(100) DEFAULT NULL,
  `Jahrgang` int(11) DEFAULT NULL,
  `ProduktIDFS` int(11) NOT NULL,
  PRIMARY KEY (`PersonID`),
  KEY `Person_Produkt_FK` (`ProduktIDFS`),
  CONSTRAINT `Person_Produkt_FK` FOREIGN KEY (`ProduktIDFS`) REFERENCES `Produkt` (`ProduktID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Person`
--

LOCK TABLES `Person` WRITE;
/*!40000 ALTER TABLE `Person` DISABLE KEYS */;
/*!40000 ALTER TABLE `Person` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Produkt`
--

DROP TABLE IF EXISTS `Produkt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Produkt` (
  `ProduktID` int(11) NOT NULL AUTO_INCREMENT,
  `Gewicht` int(11) DEFAULT NULL,
  `Preis` decimal(10,0) DEFAULT NULL,
  PRIMARY KEY (`ProduktID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Produkt`
--

LOCK TABLES `Produkt` WRITE;
/*!40000 ALTER TABLE `Produkt` DISABLE KEYS */;
/*!40000 ALTER TABLE `Produkt` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Zertifikat`
--

DROP TABLE IF EXISTS `Zertifikat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Zertifikat` (
  `Datum` datetime DEFAULT NULL,
  `ZertifikatID` int(11) NOT NULL AUTO_INCREMENT,
  `ProduktIDFS` int(11) NOT NULL,
  PRIMARY KEY (`ZertifikatID`),
  KEY `Zertifikat_Produkt_FK` (`ProduktIDFS`),
  CONSTRAINT `Zertifikat_Produkt_FK` FOREIGN KEY (`ProduktIDFS`) REFERENCES `Produkt` (`ProduktID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Zertifikat`
--

LOCK TABLES `Zertifikat` WRITE;
/*!40000 ALTER TABLE `Zertifikat` DISABLE KEYS */;
/*!40000 ALTER TABLE `Zertifikat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'Hersteller'
--

--
-- Dumping routines for database 'Hersteller'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-03-26 15:14:01
