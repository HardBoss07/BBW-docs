-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: localhost    Database: Zug
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
-- Table structure for table `Fahrgast`
--

DROP TABLE IF EXISTS `Fahrgast`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Fahrgast` (
  `FahrgastID` int(11) NOT NULL,
  `Name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`FahrgastID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Fahrgast`
--

LOCK TABLES `Fahrgast` WRITE;
/*!40000 ALTER TABLE `Fahrgast` DISABLE KEYS */;
/*!40000 ALTER TABLE `Fahrgast` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FahrgastZug`
--

DROP TABLE IF EXISTS `FahrgastZug`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `FahrgastZug` (
  `FahrgastID` int(11) NOT NULL,
  `ZugID` int(11) NOT NULL,
  PRIMARY KEY (`FahrgastID`,`ZugID`),
  KEY `ZugID` (`ZugID`),
  CONSTRAINT `FahrgastZug_ibfk_1` FOREIGN KEY (`FahrgastID`) REFERENCES `Fahrgast` (`FahrgastID`),
  CONSTRAINT `FahrgastZug_ibfk_2` FOREIGN KEY (`ZugID`) REFERENCES `Zug` (`ZugID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FahrgastZug`
--

LOCK TABLES `FahrgastZug` WRITE;
/*!40000 ALTER TABLE `FahrgastZug` DISABLE KEYS */;
/*!40000 ALTER TABLE `FahrgastZug` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Lokfuehrer`
--

DROP TABLE IF EXISTS `Lokfuehrer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Lokfuehrer` (
  `LokfuehrerID` int(11) NOT NULL,
  `Jahrgang` int(11) DEFAULT NULL,
  `ZugID` int(11) DEFAULT NULL,
  PRIMARY KEY (`LokfuehrerID`),
  KEY `ZugID` (`ZugID`),
  CONSTRAINT `Lokfuehrer_ibfk_1` FOREIGN KEY (`ZugID`) REFERENCES `Zug` (`ZugID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Lokfuehrer`
--

LOCK TABLES `Lokfuehrer` WRITE;
/*!40000 ALTER TABLE `Lokfuehrer` DISABLE KEYS */;
/*!40000 ALTER TABLE `Lokfuehrer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Ticket`
--

DROP TABLE IF EXISTS `Ticket`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Ticket` (
  `TicketID` int(11) NOT NULL,
  `Preis` decimal(10,2) DEFAULT NULL,
  `FahrgastID` int(11) DEFAULT NULL,
  PRIMARY KEY (`TicketID`),
  KEY `FahrgastID` (`FahrgastID`),
  CONSTRAINT `Ticket_ibfk_1` FOREIGN KEY (`FahrgastID`) REFERENCES `Fahrgast` (`FahrgastID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Ticket`
--

LOCK TABLES `Ticket` WRITE;
/*!40000 ALTER TABLE `Ticket` DISABLE KEYS */;
/*!40000 ALTER TABLE `Ticket` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Wagen`
--

DROP TABLE IF EXISTS `Wagen`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Wagen` (
  `WagenID` int(11) NOT NULL,
  `Typ` varchar(50) DEFAULT NULL,
  `ZugID` int(11) DEFAULT NULL,
  PRIMARY KEY (`WagenID`),
  KEY `ZugID` (`ZugID`),
  CONSTRAINT `Wagen_ibfk_1` FOREIGN KEY (`ZugID`) REFERENCES `Zug` (`ZugID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Wagen`
--

LOCK TABLES `Wagen` WRITE;
/*!40000 ALTER TABLE `Wagen` DISABLE KEYS */;
/*!40000 ALTER TABLE `Wagen` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Zug`
--

DROP TABLE IF EXISTS `Zug`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Zug` (
  `ZugID` int(11) NOT NULL,
  `Zugsnummer` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ZugID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Zug`
--

LOCK TABLES `Zug` WRITE;
/*!40000 ALTER TABLE `Zug` DISABLE KEYS */;
/*!40000 ALTER TABLE `Zug` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'Zug'
--

--
-- Dumping routines for database 'Zug'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-04-04  8:38:26
