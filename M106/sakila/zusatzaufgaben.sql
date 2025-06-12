USE sakila;

-- Aufgabe 1: Finde die 5 Kunden, die am meisten Filme ausgeliehen haben.
SELECT c.first_name, c.last_name, COUNT(r.rental_id) AS rentals
FROM customer c
JOIN rental r ON c.customer_id = r.customer_id
GROUP BY c.customer_id
ORDER BY rentals DESC
LIMIT 5;

-- Aufgabe 2: Welche 10 Filme wurden am häufigsten ausgeliehen?
SELECT f.title, COUNT(r.rental_id) AS rentals
FROM film f
JOIN inventory i ON f.film_id = i.film_id
JOIN rental r ON i.inventory_id = r.inventory_id
GROUP BY f.film_id
ORDER BY rentals DESC
LIMIT 10;

-- Aufgabe 3: In welchen Ländern wohnen Kunden, die mehr als 10 Filme ausgeliehen haben?
SELECT DISTINCT co.country
FROM customer c
JOIN address a ON c.address_id = a.address_id
JOIN city ci ON a.city_id = ci.city_id
JOIN country co ON ci.country_id = co.country_id
JOIN rental r ON c.customer_id = r.customer_id
GROUP BY c.customer_id
HAVING COUNT(r.rental_id) > 10;


-- Aufgabe 4: Wie viele Filme gibt es in jeder Kategorie? Sortiere nach Anzahl absteigend.
SELECT cat.name AS category, COUNT(fc.film_id) AS film_count
FROM category cat
JOIN film_category fc ON cat.category_id = fc.category_id
GROUP BY cat.category_id
ORDER BY film_count DESC;

-- Aufgabe 5: Ermittle den Gesamtumsatz (payment.amount) pro Stadt.
SELECT ci.city, SUM(p.amount) AS total_revenue
FROM payment p
JOIN customer c ON p.customer_id = c.customer_id
JOIN address a ON c.address_id = a.address_id
JOIN city ci ON a.city_id = ci.city_id
GROUP BY ci.city;

-- Aufgabe 6: Welche Kunden haben durchschnittlich mehr als 3 Tage nach Ausleihdatum zurückgegeben?
SELECT c.first_name, c.last_name, AVG(DATEDIFF(r.return_date, r.rental_date)) AS avg_days
FROM customer c
JOIN rental r ON c.customer_id = r.customer_id
WHERE r.return_date IS NOT NULL
GROUP BY c.customer_id
HAVING avg_days > 3;

-- Aufgabe 7: Welche Filmkategorie hat den höchsten Gesamtumsatz erzeugt?
SELECT cat.name AS category, SUM(p.amount) AS total_revenue
FROM payment p
JOIN rental r ON p.rental_id = r.rental_id
JOIN inventory i ON r.inventory_id = i.inventory_id
JOIN film f ON i.film_id = f.film_id
JOIN film_category fc ON f.film_id = fc.film_id
JOIN category cat ON fc.category_id = cat.category_id
GROUP BY cat.category_id
ORDER BY total_revenue DESC
LIMIT 1;

-- Aufgabe 8: Welche Kunden haben denselben Film mehr als einmal ausgeliehen?
SELECT c.first_name, c.last_name, f.title, COUNT(*) AS times_rented
FROM customer c
JOIN rental r ON c.customer_id = r.customer_id
JOIN inventory i ON r.inventory_id = i.inventory_id
JOIN film f ON i.film_id = f.film_id
GROUP BY c.customer_id, f.film_id
HAVING times_rented > 1;

-- Aufgabe 9: Berechne für jeden Film die durchschnittliche Dauer zwischen Ausleihe und Rückgabe.
SELECT f.title, AVG(DATEDIFF(r.return_date, r.rental_date)) AS avg_rental_duration
FROM film f
JOIN inventory i ON f.film_id = i.film_id
JOIN rental r ON i.inventory_id = r.inventory_id
WHERE r.return_date IS NOT NULL
GROUP BY f.film_id;

-- Aufgabe 10: Welche Kunden haben seit mehr als einem Jahr nichts mehr ausgeliehen?
SELECT c.first_name, c.last_name, MAX(r.rental_date) AS last_rental
FROM customer c
JOIN rental r ON c.customer_id = r.customer_id
GROUP BY c.customer_id
HAVING last_rental < DATE_SUB(CURDATE(), INTERVAL 1 YEAR);

-- Aufgabe 11: Gibt es Kunden, die zwei Filme gleichzeitig ausgeliehen hatten?
SELECT c.first_name, c.last_name, COUNT(*) AS overlapping_rentals
FROM customer c
JOIN rental r1 ON c.customer_id = r1.customer_id
JOIN rental r2 ON c.customer_id = r2.customer_id
WHERE r1.rental_id <> r2.rental_id
  AND r1.rental_date BETWEEN r2.rental_date AND r2.return_date
GROUP BY c.customer_id
HAVING overlapping_rentals > 0;

-- Aufgabe 12: Gibt es Ausleihen ohne Rückgabedatum?
SELECT r.rental_id, c.first_name, c.last_name, f.title
FROM rental r
JOIN customer c ON r.customer_id = c.customer_id
JOIN inventory i ON r.inventory_id = i.inventory_id
JOIN film f ON i.film_id = f.film_id
WHERE r.return_date IS NULL;

-- Aufgabe 13: Welcher Mitarbeiter hat den höchsten Umsatz erzielt?
SELECT s.first_name, s.last_name, SUM(p.amount) AS total_revenue
FROM staff s
JOIN payment p ON s.staff_id = p.staff_id
GROUP BY s.staff_id
ORDER BY total_revenue DESC
LIMIT 1;

-- Aufgabe 14: Wie viele unterschiedliche Filmkategorien hat jeder Schauspieler gespielt?
SELECT a.first_name, a.last_name, COUNT(DISTINCT fc.category_id) AS categories_played
FROM actor a
JOIN film_actor fa ON a.actor_id = fa.actor_id
JOIN film_category fc ON fa.film_id = fc.film_id
GROUP BY a.actor_id;

-- Aufgabe 15: Welche Kunden hatten Filme am längsten ausgeliehen (Einzelausleihe)?
SELECT c.first_name, c.last_name, f.title,
       DATEDIFF(r.return_date, r.rental_date) AS duration
FROM customer c
JOIN rental r ON c.customer_id = r.customer_id
JOIN inventory i ON r.inventory_id = i.inventory_id
JOIN film f ON i.film_id = f.film_id
WHERE r.return_date IS NOT NULL
ORDER BY duration DESC
LIMIT 10;

-- Aufgabe 16: Zeige für jeden Kunden, wie sich der Umsatz über die Zeit kumuliert.
SELECT c.customer_id, c.first_name, c.last_name,
       p.payment_date,
       SUM(p.amount) OVER (PARTITION BY c.customer_id ORDER BY p.payment_date) AS cumulative_revenue
FROM customer c
JOIN payment p ON c.customer_id = p.customer_id;

-- Aufgabe 17: Welche Filme in der Datenbank wurden nie ausgeliehen?
SELECT f.title
FROM film f
WHERE f.film_id NOT IN (
    SELECT DISTINCT i.film_id
    FROM inventory i
    JOIN rental r ON i.inventory_id = r.inventory_id
);