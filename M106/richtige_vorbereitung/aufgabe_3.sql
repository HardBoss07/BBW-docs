-- Sicherstellen, dass Kurs 106 existiert
INSERT IGNORE INTO course (id, name, description, price, created_at)
VALUES (106, 'Datenbanken mit SQL bearbeiten', 'Beschreibung für Kurs 106', 500.00, NOW());

-- Kategorien einfügen
INSERT IGNORE INTO category (id, name) VALUES
(1, 'Applikationsentwicklung'),
(2, 'Datenbanken'),
(3, 'MANAGEMENT'),
(4, 'Netzwerk');

-- Kurs 106 der Kategorie "Datenbanken" (id = 2) zuweisen
INSERT IGNORE INTO category_course (fk_category_id, fk_course_id)
VALUES (2, 106);