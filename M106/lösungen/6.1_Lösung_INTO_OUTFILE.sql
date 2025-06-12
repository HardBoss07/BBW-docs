-- Erstellen Sie eine Adressliste aller Kunden und speichern Sie sie als CSV Datei ab.
SELECT
 first_name,
 last_name,
 address,
 postal_code,
 city,
 country
FROM
 customer
JOIN address USING (address_id)
JOIN city USING(city_id)
JOIN country USING(country_id)
INTO OUTFILE
 'c:/temp/address.csv'
;

-- Wiederholen Sie den Vorgang. Nehmen Sie diesmal den ; als Feldtrenner und " als Feld-Enclosing.
SELECT
 first_name,
 last_name,
 address,
 postal_code,
 city,
 country
FROM
 customer
JOIN address USING (address_id)
JOIN city USING(city_id)
JOIN country USING(country_id)
INTO OUTFILE
 'c:/temp/address-excel.csv'
FIELDS TERMINATED BY
 ';'
ENCLOSED BY
 '"'
;
