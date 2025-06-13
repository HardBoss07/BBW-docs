INSERT INTO category (name) 
VALUES ('Fantasy');
INSERT INTO film_category (film_id, category_id)
SELECT f.film_id, c.category_id
FROM film f
JOIN category c ON c.name = 'Fantasy'
WHERE f.title = 'UNBREAKABLE KARATE';
