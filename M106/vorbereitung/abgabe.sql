-- ====================================================================
-- Abgabeskript – LBc_Nachname_Vorname
-- Enthält komplette Aufgabenlösung als lauffähiges SQL-Skript
-- ====================================================================

-- Datenbank neu anlegen ------------------------------------------------
DROP DATABASE IF EXISTS vorbereitung;
CREATE DATABASE vorbereitung;
USE vorbereitung;

-- --------------------------------------------------------------------
-- 1) ERD-Teil: Kategorien, Kurse, Zuordnungstabelle
-- --------------------------------------------------------------------
CREATE TABLE category (
    id   INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(25) NOT NULL
);

CREATE TABLE course (
    id   INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL
);

CREATE TABLE category_course (
    fk_category_id INT NOT NULL,
    fk_course_id   INT NOT NULL,
    created_at     DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (fk_category_id, fk_course_id),
    FOREIGN KEY (fk_category_id) REFERENCES category(id),
    FOREIGN KEY (fk_course_id)  REFERENCES course(id)
);

-- Kategorien einfügen --------------------------------------------------
INSERT INTO category (name) VALUES
('Applikationsentwicklung'),
('Datenbanken'),
('MANAGEMENT'),
('Netzwerk');

-- Kurs 106 anlegen & der Kategorie "Datenbanken" (id = 2) zuordnen -----
INSERT INTO course (id, name) VALUES (106, 'Datenbanken');
INSERT INTO category_course (fk_category_id, fk_course_id)
VALUES (2, 106);

-- --------------------------------------------------------------------
-- 2) Weitere Tabellen für Kursbetrieb
-- --------------------------------------------------------------------
CREATE TABLE kursraum (
    id   INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL
);

CREATE TABLE kurs (
    id           INT AUTO_INCREMENT PRIMARY KEY,
    name         VARCHAR(100) NOT NULL,
    kursraum_id  INT,
    FOREIGN KEY (kursraum_id) REFERENCES kursraum(id)
);

CREATE TABLE kursleiter (
    id       INT AUTO_INCREMENT PRIMARY KEY,
    vorname  VARCHAR(50),
    nachname VARCHAR(50)
);

CREATE TABLE schueler (
    id       INT AUTO_INCREMENT PRIMARY KEY,
    vorname  VARCHAR(50),
    nachname VARCHAR(50)
);

CREATE TABLE anmeldung (
    id           INT AUTO_INCREMENT PRIMARY KEY,
    schueler_id  INT,
    kurs_id      INT,
    FOREIGN KEY (schueler_id) REFERENCES schueler(id) ON DELETE CASCADE,
    FOREIGN KEY (kurs_id)     REFERENCES kurs(id) ON DELETE CASCADE
);

-- --------------------------------------------------------------------
-- 3) Beispieldaten einfügen
-- --------------------------------------------------------------------
-- Kursraum
INSERT INTO kursraum (name) VALUES ('Red');               -- id = 1

-- Kurs 106 in Tabelle kurs (Raum Red)
INSERT INTO kurs (id, name, kursraum_id)
VALUES (106, 'Datenbanken', 1);

-- Kursleiter
INSERT INTO kursleiter (vorname, nachname)
VALUES ('Patrick', 'Wirz');

-- Schüler
INSERT INTO schueler (vorname, nachname) VALUES
('Ernst', 'Eiger'),   -- id = 1
('Lisa',  'Lorbeer'), -- id = 2
('Heinz', 'Heeb');    -- id = 3

-- Anmeldungen (Ernst = 2x, Lisa = 1x, Heinz = 1x)
INSERT INTO anmeldung (schueler_id, kurs_id) VALUES
(1, 106),
(1, 106),
(2, 106),
(3, 106);

-- --------------------------------------------------------------------
-- 4) Namensänderung Kursleiter
-- --------------------------------------------------------------------
UPDATE kursleiter
SET nachname = 'Nuesch'
WHERE vorname = 'Patrick' AND nachname = 'Wirz';

-- --------------------------------------------------------------------
-- 5) Abfragen laut Aufgabenstellung
-- --------------------------------------------------------------------
-- 5a) Alle Schüler + Anzahl ihrer Anmeldungen (Ergebnis siehe Screenshot)
SELECT  s.vorname  AS Vorname,
        s.nachname AS Nachname,
        COUNT(a.id) AS `Anzahl Anmeldungen`
FROM    schueler  s
LEFT JOIN anmeldung a ON a.schueler_id = s.id
GROUP BY s.id
ORDER BY `Anzahl Anmeldungen` DESC, Nachname, Vorname;

-- 5b) Schüler (Vorname, Nachname, Kursname), die sich für die Durchführung
--     im Kursraum "Red" angemeldet haben
SELECT s.vorname, s.nachname, k.name AS kursname
FROM   schueler s
JOIN   anmeldung a ON a.schueler_id = s.id
JOIN   kurs      k ON k.id          = a.kurs_id
JOIN   kursraum  kr ON kr.id        = k.kursraum_id
WHERE  kr.name = 'Red';

-- --------------------------------------------------------------------
-- 6) Schüler Heinz Heeb löschen
-- --------------------------------------------------------------------
DELETE FROM schueler
WHERE vorname = 'Heinz' AND nachname = 'Heeb';

-- --------------------------------------------------------------------
-- Skript Ende ----------------------------------------------------------
