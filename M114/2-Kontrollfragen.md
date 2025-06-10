# SQL Grundlagen - MariaDB/MySQL

## Datenbankoperationen

| Frage | Befehl |
|-------|--------|
| Mit welchem SQL Befehl erzeugt man eine neue Datenbank? | `CREATE DATABASE datenbankname;` |
| Mit welchem SQL Befehl löscht man eine Datenbank? | `DROP DATABASE datenbankname;` |
| Mit welchem SQL Befehl erzeugt man eine neue Tabelle? | ```sql<br>CREATE TABLE tabellenname (<br>    spalte1 datentyp,<br>    spalte2 datentyp<br>);``` |
| Mit welchem Befehl löscht man eine Tabelle? | `DROP TABLE tabellenname;` |

## Modifier und Struktur

| Frage | Antwort |
|-------|---------|
| Was bedeutet der Modifier IF (NOT) EXISTS? | `IF EXISTS`/`IF NOT EXISTS` verhindert Fehler, wenn die Datenbank/Tabelle bereits (nicht) existiert.<br>Beispiel: `CREATE DATABASE IF NOT EXISTS dbname;` |
| Mit welchem SQL Befehl kann man die Struktur einer Tabelle ändern? | `ALTER TABLE tabellenname ...` (z.B. `ADD`, `MODIFY`, `DROP` Spalten) |

## Datentypen

| Frage | Antwort |
|-------|---------|
| Welche Integer-Typen stehen in MariaDB zur Verfügung? | - `TINYINT` (1 Byte, -128 bis 127)<br>- `SMALLINT` (2 Byte)<br>- `MEDIUMINT` (3 Byte)<br>- `INT`/`INTEGER` (4 Byte)<br>- `BIGINT` (8 Byte)<br>Mit `UNSIGNED` für nur positive Werte |
| Welchen Datentyp nimmt man für einen Primärschlüssel? | Meist `INT AUTO_INCREMENT` oder `BIGINT AUTO_INCREMENT` |
| Welchen Datentyp nimmt man für einen Fremdschlüssel? | Sollte mit dem referenzierten Primärschlüssel identisch sein (meist `INT` oder `BIGINT`) |

## Constraints und Konventionen

| Frage | Antwort |
|-------|---------|
| Was versteht man unter Naming-Conventions? | Vereinheitlichte Namensregeln für Datenbankobjekte (z.B. `tabellenname`, `spalten_name`, `PK_tabelle`, `FK_tabelle_spalte`) |
| Eigenschaften für automatischen Integer Primärschlüssel? | ```sql<br>id INT AUTO_INCREMENT PRIMARY KEY``` |
| Wie wird ein Fremdschlüssel definiert? | ```sql<br>ALTER TABLE kind_tabelle<br>ADD CONSTRAINT fk_name<br>FOREIGN KEY (spalte) REFERENCES eltern_tabelle(primärschlüssel);``` |
| Wie verhindert man NULL-Werte? | Mit `NOT NULL` Constraint: ```sql<br>spaltenname datentyp NOT NULL``` |
| Wie definiert man Standard-Werte? | Mit `DEFAULT`: ```sql<br>spaltenname datentyp DEFAULT standardwert``` |
| Wie legt man Eindeutigkeit fest? | Mit `UNIQUE` Constraint: ```sql<br>spaltenname datentyp UNIQUE``` |