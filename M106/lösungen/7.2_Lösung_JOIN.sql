-- Adressliste aller Kunden mit Postleitzahl und Ort
SELECT
 firstname,
 lastname,
 address,
 zip,
 city
FROM
 customer
JOIN zip z ON fk_zip_id = z.id
;

-- Alle Produkte mit Bezeichnung und Name der Kategorie
SELECT
 c.category,
 p.name,
 p.price
FROM
 product p
JOIN category c ON p.fk_category_id = c.id
;

-- Alle Bestellungen mit Adresse, Postleitzahl, Bestell- und Lieferdatum
SELECT
 c.firstname,
 c.lastname,
 c.address,
 z.zip,
 z.city,
 o.ordered_at,
 o.delivered_at
FROM
 zip z
JOIN customer c ON c.fk_zip_id = z.id
JOIN order_entry o ON o.fk_customer_id = c.id
;

-- Alle Bestellungen mit Email des Kunden, Bestelldatum, Produktbezeichnung, Anzahl, Preis und Summe
SELECT
 c.email,
 o.ordered_at,
 p.name,
 po.price,
 po.amount,
 po.price * po.amount
FROM
 customer c
JOIN order_entry o ON o.fk_customer_id = c.id
JOIN product_order_entry po ON po.fk_order_entry_id = o.id
JOIN product p ON po.fk_product_id = p.id
;

-- Kategorienamen mit Anzahl darin enthaltener Produkte
SELECT
 c.category,
 count(*)
FROM
 category c
JOIN product p ON p.fk_category_id = c.id
GROUP BY
 c.category
;

-- Kundennamen mit Anzahl Bestellungen
SELECT
 c.firstname,
 c.lastname,
 count(*)
FROM
 customer c
JOIN order_entry o ON o.fk_customer_id = c.id
GROUP BY
 c.id
;

-- Erhöhen Sie den Preis aller Produkte, die einer bestimmten Kategorie zugeordnet sind. Verwenden Sie einen JOIN im UPDATE Statement.
UPDATE
 product
JOIN category ON product.fk_category_id = category.id
SET
 product.price = product.price * 1.1
WHERE
 category.category = 'Salate'
;

-- Löschen Sie alle Bestellungen, die von Kunden an einer bestimmten Postleitzahl getätigt wurden. Verwenden Sie einen JOIN im DELETE Statement.
DELETE
 order_entry
FROM
 order_entry
JOIN customer ON order_entry.fk_customer_id = customer.id
JOIN zip ON customer.fk_zip_id = zip.id
WHERE
 zip.zip = 8051
;
