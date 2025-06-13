-- Aufgabe 5: Alle Schüler mit Vor- und Nachnamen sowie Kursnamen, die sich für die Kursdurchführung im Kursraum 'Red' angemeldet haben

SELECT
    p.firstname AS Vorname,
    p.lastname  AS Nachname,
    c.name      AS Kursname
FROM
    person_course_execution pce
    JOIN person p ON pce.fk_participant_id = p.id
    JOIN course_execution ce ON pce.fk_course_execution_id = ce.id
    JOIN course c ON ce.fk_course_id = c.id
WHERE
    ce.room = 'Red';