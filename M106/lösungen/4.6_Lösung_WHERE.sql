-- Produkt mit dem Primärschlüssel 5
SELECT
 *
FROM
 product
WHERE
 id = 5
;

-- Kunden deren Primärschlüssel kleiner ist als 3
SELECT
 *
FROM
 customer
WHERE
 id < 3
;

-- Kunden deren Primärschlüssel kleiner ist als 3 oder grösser als 8
SELECT
 *
FROM
 customer
WHERE
 id < 3 OR id > 8
;

-- Bestellungen mit Primärschlüssel zwischen 3 und 7
SELECT
 *
FROM
 customer
WHERE
 id > 3 AND id < 7
;

-- Alternative mit BETWEEN
SELECT
 *
FROM
 customer
WHERE
 id BETWEEN 3 AND 7 -- ACHTUNG BETWEEN: id >= 3 and id <= 7
;

-- Kunden mit den Primärschlüsseln 1,3,5 und 6
SELECT
 *
FROM
 customer
WHERE
 id = 1 OR
 id = 3 OR
 id = 5 OR
 id = 6
;

SELECT
 *
FROM
 customer
WHERE
 id IN (1, 3, 5, 6)
;

-- Bestellungen deren Lieferdatum NULL ist
SELECT
 *
FROM
 order_entry
WHERE
 delivered_at IS NULL -- ACHTUNG: IS Operator!
;

-- Produkte die mehr kosten als der Durchschnitt
SELECT
 avg(price)
FROM
 product
;

-- Durchschnitts preis = 13.04
SELECT
 name,
 price
FROM
 product
WHERE
 price > 13.04
;

-- Alternative mit Subquery
SELECT
 name,
 price
FROM
 product
WHERE
 price > (SELECT avg(price) FROM product)
;
