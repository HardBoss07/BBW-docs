### Kontrollfragen

1. **Wozu verwendet man `GROUP BY`?**  
   Zum Gruppieren von Datensätzen, um Aggregatfunktionen wie `SUM`, `COUNT`, `AVG` usw. auf Gruppen anzuwenden.

2. **Was ist der Unterschied zwischen `WHERE` und `HAVING`?**  
   - `WHERE`: Filtert Zeilen **vor** dem Gruppieren.  
   - `HAVING`: Filtert Gruppen **nach** dem Gruppieren (für Aggregatfunktionen).

3. **Was ist der Vorteil von `INNER JOIN` gegenüber Komma und `WHERE`-Bedingung?**  
   `INNER JOIN` ist **strukturierter**, **lesbarer** und vermeidet Fehler bei komplexen Abfragen mit mehreren Tabellen.

4. **Wie unterscheiden sich `LEFT JOIN` und `RIGHT JOIN`?**  
   - `LEFT JOIN`: Gibt **alle Zeilen** der linken Tabelle zurück, auch ohne passenden Eintrag rechts.  
   - `RIGHT JOIN`: Gibt **alle Zeilen** der rechten Tabelle zurück, auch ohne passenden Eintrag links.

5. **Was versteht man unter Subquery?**  
   Eine **geschachtelte SELECT-Abfrage**, die innerhalb einer anderen SQL-Anweisung verwendet wird (z. B. in `WHERE`, `FROM` oder `SELECT`).
