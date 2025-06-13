-- Aufgabe 6: Alle Schüler mit Anzahl ihrer Anmeldungen (Kursdurchführungen)

SELECT
    p.firstname AS Vorname,
    p.lastname  AS Nachname,
    COUNT(pce.id) AS 'Anzahl Anmeldungen'
FROM
    person p
    JOIN person_course_execution pce ON p.id = pce.fk_participant_id
GROUP BY
    p.id
ORDER BY
    `Anzahl Anmeldungen` DESC,
    Nachname,
    Vorname;
