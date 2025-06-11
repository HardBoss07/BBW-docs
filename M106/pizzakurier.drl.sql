USE pizza_express;

-- Liste aller Produkte
SELECT * FROM produkte;

-- Liste aller Kategorien
SELECT * FROM kategorien;

-- Liste aller Kunden: nur Vorname, Nachname, Email
SELECT vorname, nachname, email FROM kunden;

-- Liste aller Bestellungen sortiert nach Bestelldatum
SELECT * FROM bestellungen ORDER BY bestelldatum;

-- Liste aller Produkte absteigend sortiert nach Preis
SELECT * FROM produkte ORDER BY preis DESC;

-- Liste der teuersten 3 Produkte
SELECT * FROM produkte ORDER BY preis DESC LIMIT 3;

-- Liste der günstigsten 3 Produkte
SELECT * FROM produkte ORDER BY preis ASC LIMIT 3;

-- Quadratwurzel aller Produktpreise
SELECT id, name, preis, SQRT(preis) AS wurzel_preis FROM produkte;

-- Namen des Monats aus Bestelldatum
SELECT id, bestelldatum, MONTHNAME(bestelldatum) AS monat FROM bestellungen;

-- Anzahl Buchstaben im Vornamen der Kunden
SELECT id, vorname, LENGTH(vorname) AS buchstaben_vorname FROM kunden;

-- Email-Adressen getrennt in Account und Domain
SELECT 
  email,
  LEFT(email, LOCATE('@', email) - 1) AS account,
  RIGHT(email, LENGTH(email) - LOCATE('@', email)) AS domain
FROM kunden;

-- Initialen der Kunden in einer Spalte
SELECT 
  vorname,
  nachname,
  CONCAT(LEFT(vorname,1), LEFT(nachname,1)) AS initialen
FROM kunden;

-- 8% Mehrwertsteuer, auf 5 Rappen gerundet
SELECT 
  id,
  name,
  preis,
  ROUND(preis * 0.08, 2) AS mwst
FROM produkte;

-- Anzahl Datensätze in Produkttabelle
SELECT COUNT(*) AS anzahl_produkte FROM produkte;

-- Mindest-, Höchst- und Durchschnittspreis aller Produkte
SELECT 
  MIN(preis) AS min_preis,
  MAX(preis) AS max_preis,
  ROUND(AVG(preis), 2) AS avg_preis
FROM produkte;

-- Produkt mit Primärschlüssel 5
SELECT * FROM produkte WHERE id = 5;

-- Kunden deren Primärschlüssel < 3
SELECT * FROM kunden WHERE id < 3;

-- Kunden deren Primärschlüssel < 3 oder > 8
SELECT * FROM kunden WHERE id < 3 OR id > 8;

-- Bestellungen mit Primärschlüssel zwischen 3 und 7
SELECT * FROM bestellungen WHERE id BETWEEN 3 AND 7;

-- Kunden mit den Primärschlüsseln 1, 3, 5, 6
SELECT * FROM kunden WHERE id IN (1, 3, 5, 6);

-- Bestellungen deren Lieferdatum NULL ist
SELECT * FROM bestellungen WHERE lieferdatum IS NULL;

-- Produkte die mehr kosten als der Durchschnitt
SELECT * FROM produkte
WHERE preis > (SELECT AVG(preis) FROM produkte);

-- Kunden deren Vorname mit "f" beginnt
SELECT * FROM kunden WHERE vorname LIKE 'f%';

-- Kunden deren Nachname mit "r" endet
SELECT * FROM kunden WHERE nachname LIKE '%r';

-- Kunden deren Nachname ein "e" enthält
SELECT * FROM kunden WHERE nachname LIKE '%e%';

-- Kunden deren Vorname aus 5 Buchstaben besteht
SELECT * FROM kunden WHERE vorname LIKE '_____';

-- Kunden deren Nachname an der zweitletzten Stelle ein "e" hat
SELECT * FROM kunden WHERE nachname LIKE '%e_';
