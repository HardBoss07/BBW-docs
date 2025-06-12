-- Liste aller Produkte
SELECT * FROM product;

-- Liste aller Kategorien
SELECT * FROM category;

-- Liste aller Kunden. Geben Sie nur Vorname, Nachname und Emailadresse aus
SELECT
 firstname,
 lastname,
 email
FROM
 customer
;

-- Liste aller Bestellungen sortiert nach Bestelldatum
SELECT
 *
FROM
 order_entry
ORDER BY
 ordered_at
;

-- Liste aller Produkte absteigend sortiert nach Preis
SELECT
 *
FROM
 product
ORDER BY
 price DESC
;

-- Liste der teuersten 3 Produkte
SELECT
 *
FROM
 product
ORDER BY
 price DESC
LIMIT
 3
;

-- Liste der günstigsten 3 Produkte
SELECT
 *
FROM
 product
ORDER BY
 price
LIMIT
 3
;
