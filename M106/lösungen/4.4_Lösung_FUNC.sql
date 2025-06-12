-- Berechnen Sie die Quadratwurzel aller Produktpreise.
SELECT
 sqrt(price)
FROM
 product
;

-- Geben Sie den Namen des Monats aus dem Datum der Bestellungen aus.
SELECT
 ordered_at,
 month(ordered_at),
 monthname(ordered_at)
FROM
 order_entry
;

-- Zählen Sie die Anzahl Buchstaben in den Vornamen der Kunden.
SELECT
 vorname,
 length(vorname)
FROM
 kunde
;

-- Liste der Email Adressen aller Kunden. Teilen Sie die Adresse in zwei Spalten auf Account und Domain.
SELECT
 email,
 substring_index(email, '@', 1) as Account,
 substring_index(email, '@', -1) as Domain
FROM
 customer
;

-- Geben Sie die Initialen der Kunden in einer Spalte aus.
SELECT
 firstname,
 lastname,
 concat(left(firstname, 1), left(lastname, 1)) as Initialen
FROM
 customer
;

-- Berechnen Sie die 8% Mehrwertsteuer, die in den Preisen inbegriffen ist (Optional: Runden Sie die MwSt auf 5 Rappen)
SELECT
 price,
 round(price / 108 * 8, 2)
FROM
 product
;

-- Auf 5 Rappen genau
SELECT
 price,
 round(round(price / 108 * 8 * 2, 1) / 2, 2)
FROM
 product
;

-- Geben Sie die Anzahl Datensätze ihrer Produkttabelle aus.
SELECT
 count(*)
FROM
 product
;

-- Berechnen Sie Mindest-, Höchst- und Durchschnittspreis aller Produkte
SELECT
 min(price),
 max(price),
 avg(price)
FROM
 product
;
