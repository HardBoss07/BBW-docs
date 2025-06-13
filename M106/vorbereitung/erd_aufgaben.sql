DROP DATABASE IF EXISTS vorbereitung;
CREATE DATABASE IF NOT EXISTS vorbereitung;
USE vorbereitung;

-- 1. ERD: Tabellen erstellen
CREATE TABLE category (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(25) NOT NULL
);

CREATE TABLE course (
    id INT AUTO_INCREMENT PRIMARY KEY
    -- weitere Spalten nach Bedarf
);

CREATE TABLE category_course (
    fk_category_id INT NOT NULL,
    fk_course_id INT NOT NULL,
    created_at DATETIME NOT NULL,
    PRIMARY KEY (fk_category_id, fk_course_id),
    FOREIGN KEY (fk_category_id) REFERENCES category(id),
    FOREIGN KEY (fk_course_id) REFERENCES course(id)
);

-- 2. Tabelle category_course anpassen: created_at speichert aktuellen Zeitpunkt
ALTER TABLE category_course
MODIFY created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP;

-- 3. Daten in category einfügen
INSERT INTO category (name) VALUES
('Applikationsentwicklung'),
('Datenbanken'),
('MANAGEMENT'),
('Netzwerk');

-- 3.1 Sicherstellen, dass der Kurs 106 bereits existiert, bevor er in category_course referenziert wird
INSERT INTO course (id) VALUES (106)
Kurs 106 der Kategorie "Datenbanken" zuweisen (angenommen, Kurs 106 existiert und Kategorie 2 ist "Datenbanken")
(vorherige Version auskommentiert und weiter unten erneut eingefügt)
INSERT INTO category_course (fk_category_id, fk_course_id)
VALUES (2, 106);
4. Nachnamen von Kursleiter Patrick Wirz auf Nuesch ändern (alte Position auskommentiert, wird unten erneut ausgeführt)
UPDATE kursleiter
SET nachname = 'Nuesch'
WHERE vorname = 'Patrick' AND nachname = 'Wirz';
5. Abfrage (alte Position auskommentiert)
SELECT s.vorname, s.nachname, k.name AS kursname
FROM schueler s
JOIN anmeldung a ON s.id = a.schueler_id
JOIN kurs k ON a.kurs_id = k.id
JOIN kursraum kr ON k.kursraum_id = kr.id
WHERE kr.name = 'Red'
-- Zusätzliche Tabellen für Aufgaben 4 und 5
CREATE TABLE kursleiter (
    id INT AUTO_INCREMENT PRIMARY KEY,
    vorname VARCHAR(50),
    nachname VARCHAR(50)
);

CREATE TABLE schueler (
    id INT AUTO_INCREMENT PRIMARY KEY,
    vorname VARCHAR(50),
    nachname VARCHAR(50)
);

CREATE TABLE kursraum (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50)
);

CREATE TABLE kurs (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    kursraum_id INT,
    FOREIGN KEY (kursraum_id) REFERENCES kursraum(id)
);

CREATE TABLE anmeldung (
    id INT AUTO_INCREMENT PRIMARY KEY,
    schueler_id INT,
    kurs_id INT,
    FOREIGN KEY (schueler_id) REFERENCES schueler(id),
    FOREIGN KEY (kurs_id) REFERENCES kurs(id)
);

-- Beispiel-Datensätze für Kursleiter und Kurs 106
INSERT INTO kursleiter (vorname, nachname) VALUES ('Patrick', 'Wirz');
INSERT INTO kursraum (name) VALUES ('Red');
INSERT INTO kurs (id, name, kursraum_id) VALUES (106, 'Datenbanken', 1);

-- Kurs 106 der Kategorie "Datenbanken" nun in category_course eintragen (jetzt, da course-Datensatz existiert)
INSERT INTO category_course (fk_category_id, fk_course_id) VALUES (2, 106);

-- Nachnamenänderung nach der Anlage von Patrick Wirz
UPDATE kursleiter SET nachname = 'Nuesch' WHERE vorname = 'Patrick' AND nachname = 'Wirz';

-- Abfrage aller Schüler im Kursraum Red
SELECT s.vorname, s.nachname, k.name AS kursname
FROM schueler s
JOIN anmeldung a ON s.id = a.schueler_id
JOIN kurs k ON a.kurs_id = k.id
JOIN kursraum kr ON k.kursraum_id = kr.id
WHERE kr.name = 'Red';

-- 6. Auswertung: Anzahl Anmeldungen je Schüler
SELECT s.vorname   AS Vorname,
       s.nachname  AS Nachname,
       COUNT(a.id) AS Anzahl_Anmeldungen
FROM   schueler s
LEFT JOIN anmeldung a ON a.schueler_id = s.id
GROUP  BY s.id
ORDER  BY Anzahl_Anmeldungen DESC,
          Nachname,
          Vorname;

-- 7. Schüler Heinz Heeb löschen
DELETE FROM schueler
WHERE vorname = 'Heinz'
  AND nachname = 'Heeb'; 