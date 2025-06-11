## Kontrollfragen

**1. Wie gibt man den gesamten Inhalt einer Tabelle aus?**  
```sql
SELECT * FROM tabellenname;
```

**2. Wie kann man nur bestimmte Spalten einer Tabelle ausgeben?**

```sql
SELECT spalte1, spalte2 FROM tabellenname;
```

**3. Wozu verwendet man die SQL-Schlüsselwörter AND und OR?**
Mit `AND` und `OR` verbindet man mehrere Bedingungen in einer `WHERE`-Klausel:

* `AND`: Alle Bedingungen müssen zutreffen
* `OR`: Mindestens eine Bedingung muss zutreffen

```sql
SELECT * FROM kunden WHERE stadt = 'Zürich' AND land = 'Schweiz';
SELECT * FROM kunden WHERE land = 'Schweiz' OR land = 'Deutschland';
```

**4. Wie kann man den IN Operator verwenden?**
`IN` prüft, ob ein Wert in einer Liste von Werten enthalten ist:

```sql
SELECT * FROM kunden WHERE id IN (1, 3, 5);
```

**5. Wozu braucht man den IS Operator?**
`IS` wird vor allem für Vergleiche mit `NULL` verwendet, da `= NULL` nicht funktioniert:

```sql
SELECT * FROM bestellungen WHERE lieferdatum IS NULL;
```

**6. Wie unterscheiden sich die Funktionen SQRT() und AVG()?**

* `SQRT()` berechnet die Quadratwurzel eines einzelnen Werts
* `AVG()` berechnet den Durchschnitt einer ganzen Spalte

```sql
SELECT SQRT(preis) FROM produkte;
SELECT AVG(preis) FROM produkte;
```

**7. Welche zwei Wildcard-Zeichen können Sie in LIKE-Patterns einsetzen?**

* `%`: Beliebig viele Zeichen
* `_`: Genau ein beliebiges Zeichen

```sql
-- Beginnt mit 'A':
SELECT * FROM kunden WHERE vorname LIKE 'A%';

-- Genau 5 Buchstaben:
SELECT * FROM kunden WHERE vorname LIKE '_____';
```

**8. Wann verwendet man BETWEEN?**
`BETWEEN` prüft, ob ein Wert innerhalb eines Bereichs liegt (inklusive Grenzen):

```sql
SELECT * FROM bestellungen WHERE id BETWEEN 3 AND 7;
```