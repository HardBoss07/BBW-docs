-- Adressliste der Kunden mit Adresse, Stadt und LAND
SELECT
 first_name,
 last_name,
 address,
 city,
 COUNTry
FROM
 customer
JOIN address USING(address_id)
JOIN city USING(city_id)
JOIN COUNTry USING(COUNTry_id)
;

-- Vorname und Nachname aller Schauspieler des Films "HARRY IDAHO"
SELECT
 first_name,
 last_name
FROM
 actor
JOIN film_actor USING(actor_id)
JOIN film USING(film_id)
WHERE
 title = "HARRY IDAHO"
;

-- Namen aller Kategorien und Anzahl Filme
SELECT
 name,
 COUNT(film_id)
FROM
 film
JOIN film_category USING(film_id)
RIGHT JOIN category USING(category_id)
GROUP BY
 category_id
;

-- Namen der Kategorien die weniger als 60 Filme enthalten
SELECT
 name,
 COUNT(film_id)
FROM
 film
JOIN film_category USING(film_id)
RIGHT JOIN category USING(category_id)
GROUP BY
 category_id
HAVING
 COUNT(film_id) < 60
;

-- Länder mit mehr als 30 Städten
SELECT
 COUNTry,
 COUNT(*)
FROM
 city
JOIN COUNTry USING(COUNTry_id)
GROUP BY
 COUNTry
HAVING
 COUNT(*) > 30
;

-- Durchschnittliche Länge der Filme in der Kategorie "Comedy", welche "PG-13" geratet sind
SELECT
 avg(length)
FROM
 film
JOIN film_category USING(film_id)
JOIN category USING(category_id)
WHERE
 name = "Comedy" AND
 rating = "PG-13"
;

-- Umsatz des Unternehmens mit Filmen, die als "NC-17" geratet wurden
SELECT
 SUM(amount)
FROM
 payment
JOIN rental USING(rental_id)
JOIN inventory USING(inventory_id)
JOIN film USING(film_id)
WHERE
 rating = "NC-17"
;

-- Tammy SANDers aus Changhwa hat alle Filme zurückgebracht. Erfassen Sie alle notwendigen Änderungen in der Datenbank
UPDATE
 customer
JOIN address USING(address_id)
JOIN city USING(city_id)
JOIN rental USING(customer_id)
SET
 return_date = current_timestamp
WHERE
 first_name = "Tammy" AND
 last_name = "SANDers" AND
 city = "Changhwa" AND
 return_date IS NULL
;

-- Entfernen Sie alle Filme in welchen "Dan Torn" mitspielt aus der Kategorie Drama
DELETE
 film_category
FROM
 film
JOIN film_actor USING(film_id)
JOIN actor USING(actor_id)
JOIN film_category USING(film_id)
JOIN category USING (category_id)
WHERE
 name = 'Drama' AND
 first_name = 'DAN' AND
 last_name = 'TORN'
;

-- Titel der Filme mit der längsten Spieldauer
SELECT
 title,
 length
FROM
 film
WHERE
 length = (SELECT max(length) FROM film)
;
