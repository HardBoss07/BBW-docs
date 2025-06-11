## Kontrollfragen

**Mit welchem SQL Befehl erzeugt man eine neue Datenbank?**  
```sql
CREATE DATABASE datenbankname;
```

**Mit welchem SQL Befehl löscht man eine Datenbank?**

```sql
DROP DATABASE datenbankname;
```

**Mit welchem SQL Befehl erzeugt man eine neue Tabelle?**

```sql
CREATE TABLE tabellenname (
    spalte1 DATENTYP,
    spalte2 DATENTYP
    -- usw.
);
```

**Mit welchem Befehl löscht man eine Tabelle?**

```sql
DROP TABLE tabellenname;
```

**Was bedeutet der Modifier IF (NOT) EXISTS?**
Er verhindert Fehlermeldungen, wenn eine Datenbank oder Tabelle bereits existiert bzw. nicht existiert.
Beispiele:

```sql
CREATE DATABASE IF NOT EXISTS datenbankname;
DROP TABLE IF EXISTS tabellenname;
```

**Mit welchem SQL Befehl kann man die Struktur einer Tabelle ändern?**

```sql
ALTER TABLE tabellenname ...;
```

**Welche Integer-Typen stehen in MariaDB zur Verfügung und wie unterscheiden sich diese?**

* `TINYINT` (1 Byte)
* `SMALLINT` (2 Byte)
* `MEDIUMINT` (3 Byte)
* `INT` oder `INTEGER` (4 Byte)
* `BIGINT` (8 Byte)
  Unterschied: Speichergröße und Wertebereich (je größer der Typ, desto größer der Wertebereich).

**Welchen Datentyp nimmt man für einen Primärschlüssel?**
In der Regel `INT` oder `BIGINT` mit `AUTO_INCREMENT`.

**Welchen Datentyp nimmt man für einen Fremdschlüssel?**
Den gleichen Datentyp wie der referenzierte Primärschlüssel (z. B. `INT`).

**Was versteht man unter Naming-Conventions?**
Vereinbarte Regeln zur Benennung von Datenbankobjekten (z. B. Tabellen, Spalten), um Einheitlichkeit, Lesbarkeit und Wartbarkeit zu fördern.

**Welche Eigenschaften setzt man in MariaDB für einen automatischen Integer Primärschlüssel?**

```sql
id INT PRIMARY KEY AUTO_INCREMENT
```

**Wie wird ein Fremdschlüssel definiert?**

```sql
FOREIGN KEY (spaltenname) REFERENCES andere_tabelle(spaltenname)
```

**Wie können Sie verhindern, dass in einem Feld NULL-Werte gespeichert werden?**
Durch die Verwendung von `NOT NULL` beim Spaltendefinitionsbefehl.

**Wie können Sie einen Standard-Wert für ein Feld definieren?**

```sql
spaltenname DATENTYP DEFAULT wert
```

**Wie legen Sie fest, dass in einem Feld ein bestimmter Wert nur einmal vorkommen darf?**
Durch die Verwendung von `UNIQUE`:

```sql
spaltenname DATENTYP UNIQUE
```