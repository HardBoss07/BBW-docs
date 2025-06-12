USE pizza_express;

-- 1. Durchschnittspreis aller Produkte (ohne GROUP BY)
SELECT AVG(price) AS durchschnittspreis_alle_produkte
FROM product;

-- 2. Anzahl Produkte pro Produktkategorie
SELECT fk_category_id, COUNT(*) AS anzahl_produkte
FROM product
GROUP BY fk_category_id; 

-- 3. Anzahl Kunden pro Postleitzahl-ID
SELECT fk_zip_id, COUNT(*) AS anzahl_kunden
FROM customer
GROUP BY fk_zip_id;

-- 4. Höchst-, Mindest- und Durchschnittspreis aller Produktkategorien
SELECT
    fk_category_id,
    MAX(price) AS max_preis,
    MIN(price) AS min_preis,
    AVG(price) AS durchschnittspreis
FROM product
GROUP BY fk_category_id;

-- 5. Durchschnittspreis der Produktkategorie mit Fremdschlüssel 2
SELECT AVG(price) AS durchschnittspreis_kategorie_2
FROM product
WHERE fk_category_id = 2;

-- 6. Produktkategorien mit einem Durchschnittspreis größer als das Gesamtdurchschnittspreis
SELECT fk_category_id, AVG(price) AS high_durchschnittspreis
FROM product
GROUP BY fk_category_id
HAVING AVG(price) > (
    SELECT AVG(price) FROM product
);

-- 1. Adressliste aller Kunden mit Postleitzahl und Ort
SELECT 
    customer.firstname,
    customer.lastname,
    customer.address,
    zip.zip,
    zip.city
FROM customer
JOIN zip ON customer.fk_zip_id = zip.id;

-- 2. Alle Produkte mit Beschreibung und Name der Kategorie
SELECT
    product.name AS produktname,
    product.description AS produktbeschreibung,
    category.category AS kategorie
FROM product
JOIN category ON product.fk_category_id  = category.id;

-- 3. Alle Bestellungen mit Adresse, Postleitzahl, Bestell- und Lieferdatum
SELECT
    customer.firstname,
    customer.lastname,
    customer.address,
    zip.zip,
    order_entry.ordered_at,
    order_entry.delivered_at
FROM order_entry
JOIN customer ON order_entry.fk_customer_id = customer.id
JOIN zip ON customer.fk_zip_id = zip.id;

-- 4. Alle Bestellungen mit Email des Kunden, Bestelldatum, Produktbezeichnung, Anzahl, Preis und Summe
SELECT
    customer.email,
    order_entry.ordered_at,
    product.name AS produktname,
    product_order_entry.amount,
    product_order_entry.price,
    product_order_entry.amount * product_order_entry.price AS summe
FROM order_entry
JOIN customer ON order_entry.fk_customer_id = customer.id
JOIN product_order_entry ON product_order_entry.fk_order_entry_id = order_entry.id
JOIN product ON product.id = product_order_entry.fk_product_id;

-- 5. Kategorienamen mit Anzahl darin enthaltener Produkte
SELECT
    category.category AS kategorie,
    COUNT(product.id) AS anzahl_produkte
FROM category
JOIN product ON product.fk_category_id = category.id
GROUP BY category.id;

-- 6. Kundennamen mit Anzahl Bestellungen
SELECT
    customer.firstname,
    customer.lastname,
    COUNT(order_entry.id) AS anzahl_bestellungen
FROM customer
JOIN order_entry ON order_entry.fk_customer_id = customer.id
GROUP BY customer.id;

START TRANSACTION;

-- 7. Preise einer Kategorie um 10% erhöhen
UPDATE product
JOIN category ON product.fk_category_id = category.id
SET product.price = product.price * 1.10
WHERE category.id = 1;

-- 8. Bestellungen einer Postleitzahl löschen
DELETE order_entry
FROM order_entry
JOIN customer ON order_entry.fk_customer_id = customer.id
JOIN zip ON customer.fk_zip_id = zip.id
WHERE zip.zip = 8048;

ROLLBACK;

-- 1. Liste aller Produkte mit Produktkategorien (inkl. Kategorien ohne Produkte)
SELECT
  category.category AS kategorie,
  product.name AS produkt
FROM category
LEFT JOIN product ON category.id = product.fk_category_id;

-- 2. Liste aller Produktkategorien und Anzahl enthaltener Produkte (auch leere Kategorien)
SELECT
  category.category AS kategorie,
  COUNT(product.id) AS produktanzahl
FROM category
LEFT JOIN product ON category.id = product.fk_category_id
GROUP BY category.id;

-- 3. Namen aller Kunden und Anzahl ihrer Bestellungen
SELECT
  customer.firstname,
  customer.lastname,
  COUNT(order_entry.id) AS bestellungen
FROM customer
LEFT JOIN order_entry ON customer.id = order_entry.fk_customer_id
GROUP BY customer.id;

-- 4. Produktkategorien ohne Produkte
SELECT
  category.category
FROM category
LEFT JOIN product ON category.id = product.fk_category_id
WHERE product.id IS NULL;

-- 5. Produkte, die noch nie bestellt wurden
SELECT
  product.name
FROM product
LEFT JOIN product_order_entry ON product.id = product_order_entry.fk_product_id
WHERE product_order_entry.id IS NULL;

-- 1. Produkte, die mehr kosten als der Durchschnitt
SELECT name, price
FROM product
WHERE price > (
  SELECT AVG(price) FROM product
);

-- 2. Produkte, die weniger kosten als der Durchschnitt
SELECT name, price
FROM product
WHERE price < (
  SELECT AVG(price) FROM product
);

-- 3. Bezeichnung und Preis des teuersten Produkts
SELECT name, price
FROM product
WHERE price = (
  SELECT MAX(price) FROM product
);

-- 4. Durchschnittliche Anzahl der Bestellungen pro Kunde
SELECT AVG(bestellanzahl) AS durchschnittliche_bestellungen
FROM (
  SELECT customer.id, COUNT(order_entry.id) AS bestellanzahl
  FROM customer
  LEFT JOIN order_entry ON customer.id = order_entry.fk_customer_id
  GROUP BY customer.id
) AS kunden_bestellungen;
