SELECT 
    i.store_id AS 'Store ID',
    COUNT(*) AS 'Anzahl Filme'
FROM inventory i
GROUP BY i.store_id
HAVING COUNT(*) > 2000
ORDER BY `Anzahl Filme` DESC;
