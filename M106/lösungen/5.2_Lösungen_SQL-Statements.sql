-- Anzahl Datensätze in der Tabelle payment
SELECT
 count(*)
FROM
 payment
;

-- Anzahl Schauspieler mit dem Namen Julia
SELECT
 count(*)
FROM
 actor
WHERE
 first_name = 'Julia'
;

-- Anzahl inaktive Kunden
SELECT
 count(*)
FROM
 customer
WHERE
 NOT active
;

-- Durchschnittliche Länge der Filme mit Rating "PG"
SELECT
 avg(length)
FROM
 film
WHERE
 rating = 'PG'
;

-- Ausleihen, die noch nicht zurück gebracht wurden, sortiert nach Ausleihdatum
SELECT
 rental_id,
 date_format(rental_date, "%d.%m.%Y") Ausleihdatum
FROM
 rental
WHERE
 return_date IS NULL
ORDER BY
 rental_date
;

-- Berechnen Sie die durchschnittliche Ausleihdauer in Tagen
SELECT
 avg(datediff(return_date, rental_date))
FROM
 rental
;

-- Vor- und Nachnamen der Schauspieler, deren Vorname nur 3 Buchstaben lang ist. Zeigen Sie keine doppelten Namen an
SELECT distinct
 first_name,
 last_name
FROM
 actor
WHERE
 first_name LIKE '___'
;

-- Erstellen Sie eine Liste der Schauspieler, deren Nachname mit 'B' beginnt und an zweitletzter Stelle ein 'e' haben. Zeigen Sie keine doppelten Namen an
SELECT distinct
 first_name,
 last_name
FROM
 actor
WHERE
 last_name LIKE 'b%e_'
;

-- Zählen Sie bei allen Datensätzen der Tabelle "rental" 12 Jahre zu Ausleih- und Rückgabedatum dazu
UPDATE
 rental
SET
 rental_date = rental_date + INTERVAL 12 YEAR,
 return_date = return_date + INTERVAL 12 YEAR
;

-- Erstellen Sie eine neue Kategorie namens "Art"
INSERT INTO category(name) VALUES ("Art");
