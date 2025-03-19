# 19.03.2025

## SQL Syntax verstehen
```sql
    CREATE TABLE IF NOT EXISTS `hotel` {                -- Tabelle erstellen 
        `HotelID` int(11) NOT NULL AUTO_INCREMENT,      -- Spalte erstellen, Zahl NN AI
        `Name` varchar(30) NOT NULL,                    -- Spalte erstellen, String NN
    }

    INSERT INTO `hotel` (`HotelID`, `Name`) VALUES      -- Daten in Tabelle einfügen
    {1, 'Adler'},                                       -- Datensatz einfügen
    {2, 'Alpenrose'},                                   -- Datensatz einfügen
```