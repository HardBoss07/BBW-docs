-- Liste aller Produkte mit Produktkategorien
SELECT
 c.category,
 p.name
FROM
 category c
LEFT JOIN product p ON p.fk_category_id = c.id
;

-- Liste aller Produktkategorien und Anzahl darin enthaltener Produkte. Zeigen Sie alle Kategorien an und verwenden Sie COUNT().
SELECT
 c.category,
 count(p.name)
FROM
 category c
LEFT JOIN product p ON p.fk_category_id = c.id
GROUP BY
 c.category
;

-- Liste der Namen aller Kunden und Anzahl Bestellungen aller Kunden.
SELECT
 c.firstname,
 c.lastname,
 count(o.id)
FROM
 order_entry o
RIGHT JOIN customer c ON o.fk_customer_id = c.id
GROUP BY
 c.id
;

-- Liste der Produktkategorien, die keine Produkte enthalten
SELECT
 c.category
FROM
 category c
LEFT JOIN product p ON p.fk_category_id = c.id
WHERE
 p.fk_category_id IS NULL
;

-- Alternative mit count()
SELECT
 c.category,
 count(p.name)
FROM
 category c
LEFT JOIN product p ON p.fk_category_id = c.id
GROUP BY
 c.id
HAVING
 count(p.name) = 0
;

-- Liste der Produkte, die noch nie bestellt wurden
SELECT
 p.name,
 p.price
FROM
 product p
LEFT JOIN product_order_entry po ON po.fk_product_id = p.id
WHERE
 po.fk_order_entry_id IS NULL
;
