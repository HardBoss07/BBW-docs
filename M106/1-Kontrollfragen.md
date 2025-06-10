## Kontrollfragen

###  Was bedeuten die Programmparameter "-u root" und "-p"?
* `-u root`: Verbindet sich mit dem Benutzer root (meist Administrator der Datenbank).
* `-p`: Fordert zur Passworteingabe auf (das Passwort wird nicht im Klartext eingegeben).
Beispiel:
```bash
mysql -u root -p
```

### Welche Rechte und Aufgaben hat der Benutzer "root"?
Der Benutzer `root` hat volle Administratorrechte in MariaDB/MySQL:
* Er kann alle Datenbanken erstellen, ändern und löschen.
* Er kann Benutzerkonten verwalten (anlegen, löschen, Rechte vergeben).
* Er hat uneingeschränkten Zugriff auf alle Daten und Befehle.

### Wozu dient die Umgebungsvariable PATH?
Die Umgebungsvariable `PATH` enthält Ordnerpfade, in denen das Betriebssystem nach Programmen sucht.
Wenn MariaDBs `bin`-Ordner im `PATH` steht, kannst du `mysql.exe` von überall in der Konsole starten, ohne den vollständigen Pfad einzugeben.

###  Warum heißt das Konsolen-Programm von MariaDB `mysql.exe`?
Weil MariaDB ein Fork von MySQL ist und kompatibel bleiben will.
Das Kommandozeilenprogramm behält daher den Namen `mysql.exe` zur Kompatibilität mit Scripts, Tools und Gewohnheit.

###  Was bringt der Befehl `\?` in der MariaDB-Konsole?
`\?` zeigt eine Hilfeübersicht aller internen Kommandos der MariaDB-Konsole, z.B.:
* `\q` zum Beenden
* `\d` zum Anzeigen von Tabellen
* `\T` für Ausgabedateien usw.

###  Mit welchem Befehl können Sie eine Liste aller Datenbanken anzeigen?
```sql
SHOW DATABASES;
```

###  Mit welchem Befehl können Sie sich mit einer Datenbank verbinden?
```sql
USE datenbankname;
```

###  Mit welchem Befehl können Sie eine Liste aller Tabellen in einer Datenbank anzeigen?
```sql
SHOW TABLES;
```

###  Mit welchem Befehl können Sie die Struktur einer Tabelle anzeigen?
```sql
DESCRIBE tabellenname;
```
oder
```sql
SHOW COLUMNS FROM tabellenname;
```

###  Welche Bedeutung hat das `;` in einem SQL Statement?
Das `;` markiert das Ende eines SQL-Befehls.
Es teilt dem SQL-Interpreter mit: „Jetzt ausführen“.
Ohne `;` wartet das System weiter auf Eingabe.