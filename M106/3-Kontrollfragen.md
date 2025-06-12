## Kontrollfragen

**Mit welchem SQL Befehl erzeugt man einen neuen Benutzer?**  
```sql
CREATE USER 'benutzername'@'host' IDENTIFIED BY 'passwort';
```

**Mit welchem SQL Befehl wird ein Benutzer gelöscht?**
```sql
DROP USER 'benutzername'@'host';
```

**Mit welchem SQL Befehl werden Zugriffsrechte auf eine Datenbank erteilt?**
```sql
GRANT rechte ON datenbank.* TO 'benutzername'@'host';
```

**Mit welchem SQL Befehl werden Zugriffsrechte auf eine Datenbank entzogen?**
```sql
REVOKE rechte ON datenbank.* FROM 'benutzername'@'host';
```

**Wie können Sie die Zugriffsrechte eines Benutzers testen?**
```sql
SHOW GRANTS FOR 'benutzername'@'host';
```

**Mit welchem SQL Befehl können Sie einen neuen Datensatz erzeugen?**
```sql
INSERT INTO tabelle (spalte1, spalte2) VALUES (wert1, wert2);
```

**Wie können Sie mit einem einzigen SQL Statement mehrere Datensätze anlegen?**
```sql
INSERT INTO tabelle (spalte1, spalte2) VALUES (wert1, wert2), (wert3, wert4), (wert5, wert6);
```

**Mit welchem Befehl können Sie einen bestehenden Datensatz ändern?**
```sql
UPDATE tabelle SET spalte1 = wert1 WHERE bedingung;
```

**Mit welchem Befehl können Sie einen bestehenden Datensatz löschen?**
```sql
DELETE FROM tabelle WHERE bedingung;
```

**Was passiert, wenn Sie beim Ändern oder Löschen keine WHERE Bedingung angeben?**
Alle Datensätze der Tabelle werden geändert oder gelöscht.

**Wozu dienen Datenbank Transaktionen?**
Sie gewährleisten, dass mehrere SQL-Befehle als eine atomare, konsistente, isolierte und dauerhafte Einheit ausgeführt werden (ACID-Prinzip).

**Mit welchem SQL Befehl startet man eine neue Transaktion?**
```sql
START TRANSACTION;
```

**Mit welchem SQL Befehl wird eine Transaktion erfolgreich abgeschlossen?**
```sql
COMMIT;
```

**Mit welchem SQL Befehl werden alle Änderungen einer Transaktion verworfen?**
```sql
ROLLBACK;
```