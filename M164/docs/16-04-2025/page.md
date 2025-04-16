# 16.04.2025

# Formel 1 Datenbank erstellen
ERD ist im Teams unter 12.3.9_Formel1TeamUmsetzen.pdf.
Ziel der Aufgabe ist es das ERD in von Hand geschriebenen SQL Code zu übersetzten

```sql
CREATE DATABASE IF NOT EXISTS `Formel 1`;

USE `Formel 1`;

CREATE TABLE `Team` (
    `TeamID` INT NOT NULL UNIQUE AUTO_INCREMENT PRIMARY KEY,
    `Teamname` varchar(50)
)

CREATE TABLE `Besitzer` (
    `BesitzerID` INT NOT NULL UNIQUE AUTO_INCREMENT PRIMARY KEY,
    `TeamIDFS` INT,
    `Name` varchar(50)
)

CREATE TABLE `Fahrer` (
    `FahrerID` INT NOT NULL UNIQUE AUTO_INCREMENT PRIMARY KEY,
    `TeamIDFS` INT NOT NULL,
    `Name` varchar(50),
    `Vorname` varchar(50)
)

CREATE TABLE `Rennwagen` (
    `RennwagenID` INT NOT NULL UNIQUE AUTO_INCREMENT PRIMARY KEY,
    `FahrerIDFS` INT NOT NULL UNIQUE,
    `Marke` varchar(50),
)

CREATE TABLE `TeamSponsor` (
    `TeamIDFS` INT NOT NULL,
    `SponsorIDFS` INT NOT NULL,
    PRIMARY KEY (`TeamIDFS`, `SponsorIDFS`)
)

CREATE TABLE `Sponsor` (
    `SponsorID` INT NOT NULL UNIQUE AUTO_INCREMENT PRIMARY KEY,
    `Firmenbezeichnung` varchar(50)
)
```