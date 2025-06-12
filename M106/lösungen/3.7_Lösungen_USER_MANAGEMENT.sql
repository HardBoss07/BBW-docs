-- Erzeugen Sie einen neuen lokalen Datenbankbenutzer namens backup
CREATE USER backup@'localhost';

-- Benutzer mit Passort
CREATE USER backup@'localhost' IDENTIFIED BY 'passwort';

-- Geben Sie dem neuen Benutzer das Recht aus allen Tabellen ihrer Datenbank zu lesen.
GRANT SELECT ON pizza_express.* TO backup@'localhost';

-- Ändern Sie das Passwort des neuen Benutzers.
SET PASSWORD FOR backup@'localhost' = PASSWORD('B4ckU9u3er');

-- Testen Sie die Rechte des neuen Benutzers mit der MariaDB Konsole.
mysql -u backup -p
> SELECT * FROM zip; -- Funktioniert
> DELETE FROM zip WHERE id = 1; -- Permission denied


-- Erzeugen Sie einen neuen globalen Benutzer namens backoffice.
CREATE USER backoffice@'%' IDENTIFIED BY 'passwort';

-- Geben Sie dem neuen Benutzer das Recht aus allen Tabellen ihrer Datenbank zu lesen.
GRANT SELECT ON pizza_express.* TO backoffice@'%';

-- Geben Sie dem neuen Benutzer das Recht Kunden, Produkte und Kategorien zu erfassen, zu ändern und zu löschen.
GRANT INSERT,UPDATE,DELETE ON pizza_express.customer TO backoffice@'%';
GRANT INSERT,UPDATE,DELETE ON pizza_express.product TO backoffice@'%';
GRANT INSERT,UPDATE,DELETE ON pizza_express.category TO backoffice@'%';

-- Testen Sie die Rechte des neuen Benutzers mit der MariaDB Konsole.
mysql -u backoffice -p
> SELECT * FROM zip; -- Funktioniert
> DELETE FROM zip WHERE id = 1; -- Permission denied
> DELETE FROM order_entry WHERE id = 1; -- Permission denied
> DELETE FROM product WHERE id = 1; -- Funktioniert

-- Erzeugen Sie einen neuen globalen Benutzer namens sales.
CREATE USER sales@'%' IDENTIFIED BY 'passwort';

-- Geben Sie dem neuen Benutzer das Recht aus allen Tabellen ihrer Datenbank zu lesen.
GRANT SELECT ON pizza_express.* TO sales@'%';

-- Geben Sie dem neuen Benutzer das Recht Bestellungen zu erfassen, zu ändern und zu löschen.
GRANT INSERT,UPDATE,DELETE ON pizza_express.order_entry TO sales@'%';
GRANT INSERT,UPDATE,DELETE ON pizza_express.product_order_entry TO sales@'%';

-- Testen Sie die Rechte des neuen Benutzers mit der MariaDB Konsole.
mysql -u sales -p
> SELECT * FROM zip; -- Funktioniert
> DELETE FROM zip WHERE id = 1; -- Permission denied
> DELETE FROM order_entry WHERE id = 1; -- Funktioniert
> UPDATE customer SET firstname = 'Martin' WHERE = 1; -- Permission denied

-- Löschen der Benutzer
DROP USER backup@'localhost';
DROP USER backoffice@'%';
DROP USER sales@'%';
