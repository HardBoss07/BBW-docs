SELECT c.active
    AS 'Ist aktiv',
    COUNT(*) AS 'Anzahl'
FROM customer c
GROUP BY c.active
ORDER BY c.active;
