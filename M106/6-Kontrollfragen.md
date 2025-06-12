**1. Was ist eine CSV-Datei?**
Eine Textdatei mit durch Trennzeichen (z. B. Komma) getrennten Werten.

**2. Wie können Sie das Resultat eines Queries als CSV-Datei speichern?**
```bash
mysql -u benutzer -p -e "SELECT * FROM tabelle" datenbank > /dumps/output.csv
```

**3. Was versteht man unter SQL-Dump?**
Eine Textdatei mit SQL-Befehlen zum Wiederherstellen einer Datenbank.

**4. Mit welchem Programm können Sie bei MariaDB einen SQL-Dump einer Datenbank erzeugen?**
Mit dem Tool `mysqldump.exe (mysqldump)`.

**5. Mit welchem Befehl können Sie Daten aus einer CSV-Datei in eine Tabelle laden?**

```sql
LOAD DATA INFILE '/data/datei.csv' INTO TABLE tabelle FIELDS TERMINATED BY ',' LINES TERMINATED BY '\r\n';
```

**6. Worauf müssen Sie aufpassen, wenn Sie eine Textdatei, die LATIN-1 kodiert ist, in eine Datenbank laden wollen?**
Die korrekte Zeichencodierung (`CHARACTER SET latin1`) angeben.
