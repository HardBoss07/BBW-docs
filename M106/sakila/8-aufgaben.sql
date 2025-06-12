USE sakila;

-- 1. Adressliste der Kunden mit Adresse, Stadt und Land
SELECT 
    c.first_name, c.last_name,
    a.address, ci.city, co.country
FROM customer c
JOIN address a ON c.address_id = a.address_id
JOIN city ci ON a.city_id = ci.city_id
JOIN country co ON ci.country_id = co.country_id;

-- 2. Vorname und Nachname aller Schauspieler des Films "HARRY IDAHO"
SELECT 
    a.first_name, a.last_name
FROM actor a
JOIN film_actor fa ON a.actor_id = fa.actor_id
JOIN film f ON fa.film_id = f.film_id
WHERE f.title = 'HARRY IDAHO';

-- 3. Namen aller Kategorien und Anzahl Filme
SELECT 
    c.name AS category_name, COUNT(fc.film_id) AS film_count
FROM category c
JOIN film_category fc ON c.category_id = fc.category_id
GROUP BY c.name;

-- 4. Namen der Kategorien die weniger als 60 Filme enthalten
SELECT 
    c.name AS category_name
FROM category c
JOIN film_category fc ON c.category_id = fc.category_id
GROUP BY c.name
HAVING COUNT(fc.film_id) < 60;

-- 5. Länder mit mehr als 30 Städten
SELECT 
    co.country, COUNT(ci.city_id) AS city_count
FROM country co
JOIN city ci ON co.country_id = city_id
GROUP BY co.country
HAVING COUNT(ci.city_id) > 30;

-- 6. Durchschnittliche Länge der Filme in der Kategorie "Comedy", welche "PG-13" geratet sind
SELECT
    AVG(f.length) AS avg_length
FROM film f
JOIN film_category fc ON f.film_id = fc.film_id
JOIN category c ON fc.category_id = c.category_id
WHERE c.name = 'Comedy' AND f.rating = 'PG-13';

-- 7. Umsatz des Unternehmens (Payments) mit Filmen, die als "NC-17" geratet wurden
SELECT
    SUM(p.amount) AS total_revenue
FROM payment p
JOIN rental r ON p.rental_id = r.rental_id
JOIN inventory i ON r.inventory_id = i.inventory_id
JOIN film f ON i.film_id = f.film_id
WHERE f.rating = 'NC-17';

-- 8. Tammy Sanders aus Changhwa hat alle Filme zurückgebracht. Erfassen Sie alle notwendigen Änderungen in der Datenbank
UPDATE rental r
JOIN customer c ON r.customer_id = c.customer_id
JOIN address a ON c.address_id = a.address_id
JOIN city ci ON a.city_id = ci.city_id
SET r.return_date = NOW()
WHERE
    c.first_name = 'Tammy' AND
    c.last_name = 'Sanders' AND
    ci.city = 'Changhwa' AND
    r.return_date IS NULL;

-- 9. Entfernen Sie alle Filme, in welchen "Dan Torn" mitspielt, aus der Kategorie Drama
START TRANSACTION;

DELETE FROM film_category
WHERE film_id IN (
    SELECT f.film_id
    FROM film f
    JOIN film_actor fa ON f.film_id = fa.film_id
    JOIN actor a ON fa.actor_id = a.actor_id
    WHERE a.first_name = 'Dan' AND a.last_name = 'Torn'
)
AND category_id = (
    SELECT category_id FROM category WHERE name = 'Drama'
);
ROLLBACK;

-- 10. Titel der Filme mit der längsten Spieldauer
SELECT title
FROM film
WHERE length = (SELECT MAX(length) FROM film);

-- 1. Name und Adresse des Mitarbeiters der im August des letzten Jahres den höchsten Umsatz erzielt hat
SELECT 
    s.first_name, s.last_name,
    a.address
FROM staff s
JOIN address a ON s.address_id = a.address_id
JOIN payment p ON s.staff_id = p.staff_id
WHERE YEAR(p.payment_date) = YEAR(CURRENT_DATE - INTERVAL 1 YEAR)
  AND MONTH(p.payment_date) = 8
GROUP BY s.staff_id
ORDER BY SUM(p.amount) DESC
LIMIT 1;

-- 2. Umsätze der beiden Filialen mit Adresse und dem Namen des verantwortlichen Managers
SELECT 
    s.store_id,
    a.address,
    m.first_name AS manager_first_name,
    m.last_name AS manager_last_name,
    SUM(p.amount) AS revenue
FROM store s
JOIN address a ON s.address_id = a.address_id
JOIN staff m ON s.manager_staff_id = m.staff_id
JOIN customer c ON s.store_id = c.store_id
JOIN payment p ON c.customer_id = p.customer_id
GROUP BY s.store_id, a.address, m.first_name, m.last_name;

-- 3. Die 10 Kunden mit dem höchsten Umsatz
SELECT 
    c.first_name, c.last_name,
    SUM(p.amount) AS total_spent
FROM customer c
JOIN payment p ON c.customer_id = p.customer_id
GROUP BY c.customer_id
ORDER BY total_spent DESC
LIMIT 10;

-- 4. Liste der Städte, in denen mehr als 1 Kunde wohnt
SELECT 
    ci.city, COUNT(c.customer_id) AS customer_count
FROM customer c
JOIN address a ON c.address_id = a.address_id
JOIN city ci ON a.city_id = ci.city_id
GROUP BY ci.city
HAVING COUNT(c.customer_id) > 1;

-- 5. Name des Schauspielers, der in den meisten Filmen mitgespielt hat
SELECT 
    a.first_name, a.last_name, COUNT(fa.film_id) AS film_count
FROM actor a
JOIN film_actor fa ON a.actor_id = fa.actor_id
GROUP BY a.actor_id
ORDER BY film_count DESC
LIMIT 1;

-- 6. Name des Filmes, in welchem die meisten Schauspieler mitspielen
SELECT 
    f.title, COUNT(fa.actor_id) AS actor_count
FROM film f
JOIN film_actor fa ON f.film_id = fa.film_id
GROUP BY f.film_id
ORDER BY actor_count DESC
LIMIT 1;

-- 7. Durchschnittliche Anzahl Schauspieler pro Film
SELECT 
    AVG(actor_count) AS avg_actors_per_film
FROM (
    SELECT COUNT(actor_id) AS actor_count
    FROM film_actor
    GROUP BY film_id
) AS actor_counts;

-- 8. Füllen Sie die Kategorie "Art" mit allen Filmen in denen "Matthew Carrey" oder "Jessica Bailey" mitspielen
START TRANSACTION;
INSERT INTO film_category (film_id, category_id)
SELECT DISTINCT fa.film_id, c.category_id
FROM film_actor fa
JOIN actor a ON fa.actor_id = a.actor_id
JOIN category c ON c.name = 'Art'
WHERE (a.first_name = 'Matthew' AND a.last_name = 'Carrey')
   OR (a.first_name = 'Jessica' AND a.last_name = 'Bailey');
ROLLBACK;

-- 9. Löschen Sie alle Filme in welchen "Warren Nolte" mitspielt
START TRANSACTION;

    -- Zuerst die Einträge in der Verknüpfungstabelle löschen
DELETE FROM film_actor
WHERE film_id IN (
    SELECT f.film_id
    FROM film f
    JOIN film_actor fa ON f.film_id = fa.film_id
    JOIN actor a ON fa.actor_id = a.actor_id
    WHERE a.first_name = 'Warren' AND a.last_name = 'Nolte'
);

    -- Dann die Filme löschen
DELETE FROM film
WHERE film_id IN (
    SELECT f.film_id
    FROM film f
    JOIN film_actor fa ON f.film_id = fa.film_id
    JOIN actor a ON fa.actor_id = a.actor_id
    WHERE a.first_name = 'Warren' AND a.last_name = 'Nolte'
);

ROLLBACK;

-- 10. Ein Kunde fragt, ob der Film "CREATURES SHAKESPEARE" im Store in Lethbridge verfügbar ist
SELECT 
    f.title AS film_title,
    c.city AS store_city,
    CONCAT('Kopie #', i.inventory_id) AS copy,
    CASE 
        WHEN r.rental_id IS NULL OR r.return_date IS NOT NULL THEN 'verfügbar'
        ELSE 'ausgeliehen'
    END AS status
FROM film f
JOIN inventory i ON f.film_id = i.film_id
JOIN store s ON i.store_id = s.store_id
JOIN address a ON s.address_id = a.address_id
JOIN city c ON a.city_id = c.city_id
LEFT JOIN rental r ON i.inventory_id = r.inventory_id AND r.return_date IS NULL
WHERE f.title = 'CREATURES SHAKESPEARE' AND c.city = 'Lethbridge';