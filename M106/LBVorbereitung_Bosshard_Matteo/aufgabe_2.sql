-- Aufgabe 2: Spalte created_at in category_course so ändern, dass sie immer den aktuellen Zeitpunkt speichert

ALTER TABLE category_course
MODIFY created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP;