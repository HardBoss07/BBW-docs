-- Kunden deren Vorname mit "m" beginnt
SELECT
 firstname,
 lastname
FROM
 customer
WHERE
 firstname LIKE 'm%'
;

-- Kunden deren Nachname mit dem Buchstaben "r" endet
SELECT
 firstname,
 lastname
FROM
 customer
WHERE
 lastname LIKE '%r'
;

-- Kunden deren Nachname ein "e" enthält
SELECT
 firstname,
 lastname
FROM
 customer
WHERE
 lastname LIKE '%e%'
;

-- Kunden deren Vorname aus 5 Buchstaben besteht
SELECT
 firstname,
 lastname
FROM
 customer
WHERE
 firstname LIKE '_____'
;

-- Kunden deren Nachname an der zweitletzter Stelle ein "e" haben
SELECT
 firstname,
 lastname
FROM
 customer
WHERE
 lastname LIKE '%e_'
;
