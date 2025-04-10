# 09.04.2025

```sql
    CREATE DATABASE Zug;
    USE Zug;

    CREATE TABLE Zug (
        ZugID INT PRIMARY KEY,
        Zugsnummer VARCHAR(50)
    );

    CREATE TABLE Lokfuehrer (
        LokfuehrerID INT PRIMARY KEY,
        Jahrgang INT,
        ZugID INT,
        FOREIGN KEY (ZugID) REFERENCES Zug(ZugID)
    );

    CREATE TABLE Wagen (
        WagenID INT PRIMARY KEY,
        Typ VARCHAR(50),
        ZugID INT,
        FOREIGN KEY (ZugID) REFERENCES Zug(ZugID)
    );

    CREATE TABLE Fahrgast (
        FahrgastID INT PRIMARY KEY,
        Name VARCHAR(100)
    );

    CREATE TABLE FahrgastZug (
        FahrgastID INT,
        ZugID INT,
        PRIMARY KEY (FahrgastID, ZugID),
        FOREIGN KEY (FahrgastID) REFERENCES Fahrgast(FahrgastID),
        FOREIGN KEY (ZugID) REFERENCES Zug(ZugID)
    );

    CREATE TABLE Ticket (
        TicketID INT PRIMARY KEY,
        Preis DECIMAL(10,2),
        FahrgastID INT,
        FOREIGN KEY (FahrgastID) REFERENCES Fahrgast(FahrgastID)
    );
```