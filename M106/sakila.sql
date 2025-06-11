USE sakila;

-- 1. Alle Tabellen anzeigen
SHOW TABLES;

-- 2. Tabellenstruktur beispielhaft
DESCRIBE actor;
DESCRIBE film;
DESCRIBE rental;

-- 3. Datenumfang checken
SELECT COUNT(*) FROM actor;       -- ~200 Schauspieler
SELECT COUNT(*) FROM film;       -- ~1000 Filme
SELECT COUNT(*) FROM rental;     -- ~16000 Verleihvorgänge

-- 4. Beispielabfragen
-- Aktive Kunden
SELECT COUNT(*) FROM customer WHERE active = 1;

-- Verfügbare Filme
SELECT COUNT(*) FROM inventory WHERE NOT EXISTS (
  SELECT 1 FROM rental 
  WHERE rental.inventory_id = inventory.inventory_id 
  AND return_date IS NULL
);

-- 1. Anzahl Datensätze in der Tabelle payment
SELECT COUNT(*) AS 'Anzahl Zahlungen' FROM payment;

-- 2. Anzahl Schauspieler mit dem Namen Julia
SELECT COUNT(*) AS 'Schauspieler namens Julia' 
FROM actor 
WHERE first_name = 'Julia';

-- 3. Anzahl inaktive Kunden
SELECT COUNT(*) AS 'Inaktive Kunden' 
FROM customer 
WHERE active = 0;

-- 4. Durchschnittliche Länge der Filme mit Rating "PG"
SELECT AVG(length) AS 'Durchschnittliche Länge (PG-Filme in Minuten)' 
FROM film 
WHERE rating = 'PG';

-- 5. Ausleihen, die noch nicht zurückgebracht wurden
SELECT 
  rental_id,
  inventory_id,
  customer_id,
  DATE_FORMAT(rental_date, '%d.%m.%Y') AS 'Ausleihdatum'
FROM rental 
WHERE return_date IS NULL
ORDER BY rental_date;

-- 6. Durchschnittliche Ausleihdauer in Tagen
SELECT AVG(DATEDIFF(return_date, rental_date)) AS 'Durchschnittliche Ausleihdauer (Tage)'
FROM rental
WHERE return_date IS NOT NULL;

-- 7. Vornamen von Schauspielern mit genau 3 Buchstaben
SELECT DISTINCT first_name AS '3-Buchstaben Vornamen'
FROM actor
WHERE LENGTH(first_name) = 3;

-- 8. Schauspieler mit Nachnamen, die mit 'B' beginnen und vorletzter Buchstabe 'e'
SELECT DISTINCT 
  CONCAT(first_name, ' ', last_name) AS 'Schauspielername'
FROM actor
WHERE last_name LIKE 'B%e_';

-- 9. 12 Jahre zu Ausleih- und Rückgabedatum dazu zählen
SELECT 
  rental_id,
  DATE_ADD(rental_date, INTERVAL 12 YEAR) AS 'Ausleihdatum +12 Jahre',
  DATE_ADD(return_date, INTERVAL 12 YEAR) AS 'Rückgabedatum +12 Jahre'
FROM rental;

-- 10. Neue Kategorie "Art" erstellen
INSERT INTO category (name) VALUES ('Art');
SELECT * FROM category WHERE name = 'Art';