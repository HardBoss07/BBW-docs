-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: localhost    Database: Aquarium
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
-- Table structure for table `Aquarium`
--

DROP TABLE IF EXISTS `Aquarium`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Aquarium` (
  `AquariumID` int(11) NOT NULL AUTO_INCREMENT,
  `Volumen` int(11) DEFAULT NULL,
  PRIMARY KEY (`AquariumID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Aquarium`
--

LOCK TABLES `Aquarium` WRITE;
/*!40000 ALTER TABLE `Aquarium` DISABLE KEYS */;
/*!40000 ALTER TABLE `Aquarium` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Besucher`
--

DROP TABLE IF EXISTS `Besucher`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Besucher` (
  `BesucherID` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(30) DEFAULT NULL,
  `Vorname` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`BesucherID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Besucher`
--

LOCK TABLES `Besucher` WRITE;
/*!40000 ALTER TABLE `Besucher` DISABLE KEYS */;
/*!40000 ALTER TABLE `Besucher` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Eintrittskarte`
--

DROP TABLE IF EXISTS `Eintrittskarte`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Eintrittskarte` (
  `EintrittskarteID` int(11) NOT NULL AUTO_INCREMENT,
  `AquariumIDFS` int(11) DEFAULT NULL,
  `Preis` decimal(10,0) DEFAULT NULL,
  PRIMARY KEY (`EintrittskarteID`),
  KEY `Eintrittskarte_Aquarium_FK` (`AquariumIDFS`),
  CONSTRAINT `Eintrittskarte_Aquarium_FK` FOREIGN KEY (`AquariumIDFS`) REFERENCES `Aquarium` (`AquariumID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Eintrittskarte`
--

LOCK TABLES `Eintrittskarte` WRITE;
/*!40000 ALTER TABLE `Eintrittskarte` DISABLE KEYS */;
/*!40000 ALTER TABLE `Eintrittskarte` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `EintrittskarteBesucher`
--

DROP TABLE IF EXISTS `EintrittskarteBesucher`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `EintrittskarteBesucher` (
  `EintrittskarteIDFS` int(11) NOT NULL,
  `BesucherIDFS` int(11) NOT NULL,
  PRIMARY KEY (`EintrittskarteIDFS`,`BesucherIDFS`),
  KEY `EintrittskarteBesucher_Besucher_FK` (`BesucherIDFS`),
  CONSTRAINT `EintrittskarteBesucher_Besucher_FK` FOREIGN KEY (`BesucherIDFS`) REFERENCES `Besucher` (`BesucherID`),
  CONSTRAINT `EintrittskarteBesucher_Eintrittskarte_FK` FOREIGN KEY (`EintrittskarteIDFS`) REFERENCES `Eintrittskarte` (`EintrittskarteID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `EintrittskarteBesucher`
--

LOCK TABLES `EintrittskarteBesucher` WRITE;
/*!40000 ALTER TABLE `EintrittskarteBesucher` DISABLE KEYS */;
/*!40000 ALTER TABLE `EintrittskarteBesucher` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Fisch`
--

DROP TABLE IF EXISTS `Fisch`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Fisch` (
  `FischID` int(11) NOT NULL AUTO_INCREMENT,
  `FutterArtIDFS` int(11) NOT NULL,
  `Bezeichnung` varchar(50) DEFAULT NULL,
  `Grösse` int(11) DEFAULT NULL,
  PRIMARY KEY (`FischID`),
  KEY `Fisch_Futterart_FK` (`FutterArtIDFS`),
  CONSTRAINT `Fisch_Futterart_FK` FOREIGN KEY (`FutterArtIDFS`) REFERENCES `Futterart` (`FutterArtID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Fisch`
--

LOCK TABLES `Fisch` WRITE;
/*!40000 ALTER TABLE `Fisch` DISABLE KEYS */;
/*!40000 ALTER TABLE `Fisch` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FischAquarium`
--

DROP TABLE IF EXISTS `FischAquarium`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `FischAquarium` (
  `FischIDFS` int(11) NOT NULL,
  `AquariumIDFS` int(11) NOT NULL,
  PRIMARY KEY (`FischIDFS`,`AquariumIDFS`),
  KEY `FischAquarium_Aquarium_FK` (`AquariumIDFS`),
  CONSTRAINT `FischAquarium_Aquarium_FK` FOREIGN KEY (`AquariumIDFS`) REFERENCES `Aquarium` (`AquariumID`),
  CONSTRAINT `FischAquarium_Fisch_FK` FOREIGN KEY (`FischIDFS`) REFERENCES `Fisch` (`FischID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FischAquarium`
--

LOCK TABLES `FischAquarium` WRITE;
/*!40000 ALTER TABLE `FischAquarium` DISABLE KEYS */;
/*!40000 ALTER TABLE `FischAquarium` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Futterart`
--

DROP TABLE IF EXISTS `Futterart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Futterart` (
  `FutterArtID` int(11) NOT NULL AUTO_INCREMENT,
  `Futterart` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`FutterArtID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Futterart`
--

LOCK TABLES `Futterart` WRITE;
/*!40000 ALTER TABLE `Futterart` DISABLE KEYS */;
/*!40000 ALTER TABLE `Futterart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'Aquarium'
--

--
-- Dumping routines for database 'Aquarium'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-03-26 14:00:44
