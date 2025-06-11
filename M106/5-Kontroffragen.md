# Antworten auf die Kontrollfragen

## 1. Business Logic der Sakila-Datenbank
Es handelt sich um ein **DVD-Verleihsystem** (wie eine Videothek), das folgende Geschäftsprozesse abbildet:
- Filmlagerverwaltung (Filme, Kopien, Stores)
- Kundenverwaltung und Ausleihen
- Zahlungsabwicklung
- Mitarbeiterverwaltung

## 2. Anzahl der Tupel anzeigen
```sql
SELECT COUNT(*) FROM tabelle;
-- Oder für eine bestimmte Query:
SELECT COUNT(*) FROM (SELECT ... FROM ... WHERE ...) AS subquery;
```

## 3. Tupel filtern
```sql
SELECT * FROM tabelle WHERE bedingung;
-- Beispiel:
SELECT * FROM film WHERE length > 120;
```

## 4. Tage zwischen zwei Daten berechnen
```sql
SELECT DATEDIFF(end_datum, start_datum) FROM tabelle;
-- Beispiel (Ausleihdauer):
SELECT DATEDIFF(return_date, rental_date) FROM rental;
```

## 5. Jahre zu einem Datum addieren
```sql
SELECT DATE_ADD(datum, INTERVAL anzahl_jahr YEAR) FROM tabelle;
-- Beispiel:
SELECT DATE_ADD(rental_date, INTERVAL 12 YEAR) FROM rental;
```

## 6. Durchschnitt berechnen
```sql
SELECT AVG(spaltenname) FROM tabelle;
-- Beispiel:
SELECT AVG(length) FROM film;
```

## 7. Prüfen ob Wert gesetzt ist
```sql
-- Für NULL-Werte:
SELECT * FROM tabelle WHERE spalte IS NULL;
-- Für nicht-NULL-Werte:
SELECT * FROM tabelle WHERE spalte IS NOT NULL;
-- Beispiel:
SELECT * FROM rental WHERE return_date IS NULL;
```

## 8. Sortieren
```sql
SELECT * FROM tabelle ORDER BY spalte [ASC|DESC];
-- Beispiel:
SELECT * FROM film ORDER BY title ASC;
```

## 9. Filtern mit Suchmustern (LIKE)
```sql
SELECT * FROM tabelle WHERE spalte LIKE 'muster';
-- Platzhalter:
-- % = beliebig viele Zeichen
-- _ = genau ein Zeichen
-- Beispiel:
SELECT * FROM actor WHERE last_name LIKE 'B%e_';
```