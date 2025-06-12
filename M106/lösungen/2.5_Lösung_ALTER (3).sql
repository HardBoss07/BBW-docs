-- Sie wollen in der Kundentabelle auch die mobile Telefonnummer speichern. Fügen Sie eine entsprechende Spalte hinzu
ALTER TABLE customer ADD mobile VARCHAR(255);

-- Ändern Sie den Namen der Spalte für die Produktbezeichung
ALTER TABLE product CHANGE name product_name VARCHAR(255) NOT NULL;
ALTER TABLE product CHANGE product_name name VARCHAR(255) NOT NULL;

-- Ändern Sie den Datentyp des Produktpreises auf DECIMAL(6,2) UNSIGNED
ALTER TABLE product MODIFY price DECIMAL(6,2) UNSIGNED;

-- Setzten Sie nachträglich NOT NULL für den Produktpreis
ALTER TABLE product MODIFY price DECIMAL(6,2) NOT NULL;

-- Fügen Sie ein neues Attribut (created_at, DATETIME) in die Produkttabelle ein und stellen Sie sicher, dass dieses Feld automatisch mit dem aktuellen Zeitpunkt bei einem INSERT befüllt wird.
ALTER TABLE product ADD created_at DATETIME NOT NULL DEFAULT NOW();

-- Entfernen Sie die Spalte für die mobile Telefonnummer wieder
ALTER TABLE customer DROP mobile;

-- Entfernen Sie den Foreign Key CONSTRAINT vom Postleitzahlen Fremdschlüssel aus der Kundentabelle
SHOW CREATE TABLE customer; -- Name des CONSTRAINTs herausfinden (z.B. customer_ibfk_1)
ALTER TABLE customer DROP CONSTRAINT customer_ibfk_1;

-- Fügen Sie den Foreign Key CONSTRAINT wieder hinzu
ALTER TABLE customer ADD foreign key(fk_zip_id) REFERENCES zip(id);
