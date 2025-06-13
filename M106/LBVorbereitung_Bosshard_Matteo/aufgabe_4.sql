-- Aufgabe 4: Nachnamen von Patrick Wirz auf Nuesch ändern

UPDATE person
SET lastname = 'Nuesch'
WHERE firstname = 'Patrick' AND lastname = 'Wirz';
