# 07.05.25

Formel 1 SQL Fertig geschrieben

```sql
CREATE DATABASE IF NOT EXISTS `Formel1`;
USE `Formel1`;

CREATE TABLE `Team` (
    `TeamID` INT NOT NULL UNIQUE AUTO_INCREMENT PRIMARY KEY,
    `Teamname` VARCHAR(50)
);

CREATE TABLE `Besitzer` (
    `BesitzerID` INT NOT NULL UNIQUE AUTO_INCREMENT PRIMARY KEY,
    `TeamIDFS` INT,
    `Name` VARCHAR(50),
    FOREIGN KEY (`TeamIDFS`) REFERENCES `Team`(`TeamID`)
);

CREATE TABLE `Fahrer` (
    `FahrerID` INT NOT NULL UNIQUE AUTO_INCREMENT PRIMARY KEY,
    `TeamIDFS` INT NOT NULL,
    `Name` VARCHAR(50),
    `Vorname` VARCHAR(50),
    FOREIGN KEY (`TeamIDFS`) REFERENCES `Team`(`TeamID`)
);

CREATE TABLE `Rennwagen` (
    `RennwagenID` INT NOT NULL UNIQUE AUTO_INCREMENT PRIMARY KEY,
    `FahrerIDFS` INT NOT NULL UNIQUE,
    `Marke` VARCHAR(50),
    FOREIGN KEY (`FahrerIDFS`) REFERENCES `Fahrer`(`FahrerID`)
);

CREATE TABLE `Sponsor` (
    `SponsorID` INT NOT NULL UNIQUE AUTO_INCREMENT PRIMARY KEY,
    `Firmenbezeichnung` VARCHAR(50)
);

CREATE TABLE `TeamSponsor` (
    `TeamIDFS` INT NOT NULL,
    `SponsorIDFS` INT NOT NULL,
    PRIMARY KEY (`TeamIDFS`, `SponsorIDFS`),
    FOREIGN KEY (`TeamIDFS`) REFERENCES `Team`(`TeamID`),
    FOREIGN KEY (`SponsorIDFS`) REFERENCES `Sponsor`(`SponsorID`)
);
```