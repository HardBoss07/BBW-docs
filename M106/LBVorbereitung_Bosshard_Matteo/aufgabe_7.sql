-- Aufgabe 7: Schüler Heinz Heeb aus der Datenbank löschen

DELETE FROM person
WHERE firstname = 'Heinz'
  AND lastname = 'Heeb';