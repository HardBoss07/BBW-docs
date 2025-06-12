-- Überfliegen Sie das post-match-zip-factsheet.pdf.
-- Schauen Sie sich den Inhalt der 4 Datenfiles an.
-- Studieren Sie das Datenfile PLZ Light / plz_l_20130901.zip sowie deren Referenz im post-match-zip-factsheet.pdf im Detail

-- Erstellen Sie eine neue Datenbank und realisieren eine Tabelle für das Datenfile gemäss Factsheet.
DROP DATABASE IF EXISTS zip;
CREATE DATABASE zip;
USE zip;

CREATE TABLE light (
 onrp	SMALLINT UNSIGNED NOT NULL,
 typ TINYINT UNSIGNED NOT NULL,
 plz SMALLINT UNSIGNED NOT NULL,
 zz TINYINT UNSIGNED NOT NULL,
 ort18 VARCHAR(18) NOT NULL,
 ort27 VARCHAR(27) NOT NULL,
 kt CHAR(2) NOT NULL,

 PRIMARY KEY(onrp)
);

-- Laden Sie den Inhalt des Datenfiles in die Tabelle.
LOAD DATA INFILE
 'c:/temp/plz_l_20130819.txt'
INTO TABLE
 light
CHARACTER SET
 'latin1'
;

-- Kontrollieren Sie, ob alle Datensätze vorhanden sind.
SELECT
 count(*)
FROM
 light
;
