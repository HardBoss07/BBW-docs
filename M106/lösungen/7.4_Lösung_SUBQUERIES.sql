-- Produkte die mehr kosten als der Durchschnitt
SELECT
 p.name,
 p.price
FROM
 product p
WHERE
 p.price > (SELECT AVG(price) FROM product)
;

-- Produkte die weniger kosten als der Durchschnitt
SELECT
 p.name,
 p.price
FROM
 product p
WHERE
 p.price < (SELECT AVG(price) FROM product)
;

-- Bezeichnung und Preis des teuersten Produktes
SELECT
 p.name,
 p.price
FROM
 product p
WHERE
 p.price = (SELECT MAX(price) FROM product)
;

-- Durchschnittliche Anzahl der Bestellungen pro Kunde
SELECT
 AVG(Orders)
FROM
 (
  SELECT
   COUNT(o.id) AS Orders
  FROM
   customer c
  LEFT JOIN order_entry o ON o.fk_customer_id = c.id
  GROUP BY
   c.id
 ) AS temp
;
