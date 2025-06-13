-- Anzahl Produkte pro Produktkategorie
SELECT
 fk_category_id,
 count(*)
FROM
 product
GROUP BY
 fk_category_id
;

-- Anzahl Kunden pro Postleitzahl-ID
SELECT
 fk_zip_id,
 count(*)
FROM
 customer
GROUP BY
 fk_zip_id
;

-- Höchst-, Mindest- und Durchschnittspreis aller Produktkategorien
SELECT
 fk_category_id,
 MAX(price),
 MIN(price),
 AVG(price)
FROM
 product
GROUP BY
 fk_category_id
;

-- Durchschnittspreis der Produktkategorie mit Fremdschlüssel 2
SELECT
 AVG(price)
FROM
 product
WHERE
 fk_category_id = 2
;

-- Produktkategorien mit einem Durchschnittspreis grösser als das Resultat von Aufgabe 1
SELECT
 fk_category_id,
 AVG(price)
FROM
 product
GROUP BY
 fk_category_id
HAVING
 AVG(price) > 13.04
;

-- Alternative mit Subquery
SELECT
 fk_category_id,
 AVG(price)
FROM
 product
GROUP BY
 fk_category_id
HAVING
 AVG(price) > (SELECT AVG(price) FROM product)
;
