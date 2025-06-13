DROP DATABASE IF EXISTS zli;
CREATE DATABASE zli;
USE zli;

CREATE TABLE course (
 id INT UNSIGNED AUTO_INCREMENT,
 name VARCHAR(255) NOT NULL,
 description TEXT NOT NULL,
 price DECIMAL(7,2) NOT NULL,
 created_at DATETIME NOT NULL,
 PRIMARY KEY(id)
);

ALTER TABLE course MODIFY created_at DATETIME NOT NULL DEFAULT NOW();

CREATE TABLE person (
 id INT AUTO_INCREMENT,
 firstname VARCHAR(255) NOT NULL,
 lastname VARCHAR(255) NOT NULL,
 email VARCHAR(255) NOT NULL,
 PRIMARY KEY(id)
);

CREATE TABLE course_execution (
 id INT AUTO_INCREMENT,
 fk_course_id INT UNSIGNED NOT NULL,
 fk_teacher_id INT NOT NULL,
 room ENUM("Pink", "Red", "Orange", "Gold", "Purple") NOT NULL,
 start_date DATETIME NOT NULL,
 end_date DATETIME NOT NULL,
 PRIMARY KEY(id),
 FOREIGN KEY (fk_course_id) REFERENCES course(id),
 FOREIGN KEY (fk_teacher_id) REFERENCES person(id)
);

CREATE TABLE person_course_execution (
 id INT AUTO_INCREMENT,
 fk_participant_id INT NOT NULL,
 fk_course_execution_id INT NOT NULL,
 confirmed BOOL NOT NULL DEFAULT 0,
 PRIMARY KEY(id),
 FOREIGN KEY(fk_participant_id) REFERENCES person(id) ON DELETE CASCADE,
 FOREIGN KEY(fk_course_execution_id) REFERENCES course_execution(id)
);

------------------------ DML ------------------------

INSERT INTO person (firstname, lastname, email) VALUES ('Damien', 'Vouillamoz', 'dv@digio.ch');
INSERT INTO person (firstname, lastname, email) VALUES ('Patrick', 'Wirz', 'l1@lehrer.ch');
INSERT INTO person (firstname, lastname, email) VALUES ('Thomas', 'Poldi', 'l2@lehrer.ch');
INSERT INTO person (firstname, lastname, email) VALUES ('Michelle', 'Mai', 'l3@lehrer.ch');
INSERT INTO person (firstname, lastname, email) VALUES ('Sandra', 'Lauber', 'l4@lehrer.ch');
INSERT INTO person (firstname, lastname, email) VALUES ('Felix', 'Horw', 'l5@lehrer.ch');

INSERT INTO person (firstname, lastname, email) VALUES
 ('Armin', 'Alba', 's1@schueler.ch'),
 ('Björn', 'Bodmer', 's2@schueler.ch'),
 ('Christina', 'Corba', 's3@schueler.ch'),
 ('Dietmar', 'Dunn', 's4@schueler.ch'),
 ('Ernst', 'Eiger', 's5@schueler.ch'),
 ('Fritz', 'Fleischli', 's6@schueler.ch'),
 ('Gabriela', 'Grossmann', 's7@schueler.ch'),
 ('Heinz', 'Heeb', 's8@schueler.ch'),
 ('Iris', 'Imker', 's9@schueler.ch'),
 ('Jonas', 'Joop', 's10@schueler.ch'),
 ('Kevin', 'Klaun', 's11@schueler.ch'),
 ('Lisa', 'Lorbeer', 's12@schueler.ch'),
 ('Martin', 'Menz', 's13@schueler.ch'),
 ('Nina', 'Noff', 's14@schueler.ch'),
 ('Ottmar', 'Obst', 's15@schueler.ch'),
 ('Patrik', 'Pfeiffer', 's16@schueler.ch'),
 ('Rafael', 'Quadri', 's17@schueler.ch');

INSERT INTO course (name, description, price) VALUES
 ('101', 'Webseite erstellen und veröffentlichen', 300.00),
 ('106', 'Datenbanken mit SQL bearbeiten', 500.00),
 ('114', 'Codierungs-Kompression-Verschlüsselungsverfahr', 700.00),
 ('183', 'Applikationssicherheit implementieren', 600.00),
 ('307', 'Interaktive Webseite mit Formular erstellen', 200.00);

INSERT INTO course_execution (fk_course_id, fk_teacher_id, room, start_date, end_date) VALUES
 (1, 2, 'Pink', '2019-01-01 00:00:00', '2019-01-05 00:00:00'),
 (2, 1, 'Red', '2019-09-10 00:00:00', '2019-09-24 00:00:00'),
 (3, 3, 'Orange', '2019-10-10 00:00:00', '2019-10-30 00:00:00'),
 (4, 4, 'Gold', '2019-12-08 00:00:00', '2019-12-13 00:00:00'),
 (2, 1, "Purple", "2022-03-07 08:15:00", "2022-03-16 16:46:00");

INSERT INTO person_course_execution (fk_participant_id, fk_course_execution_id) VALUES
 (7,1), (7,2), (7,3),
 (8,1), (8,2), (8,3),
 (9,1), (9,2), (9,3),
 (10,1), (10,2), (10,3),
 (11,2), (11,3),
 (12,2), (12,3), (12,4),
 (13,2), (13,3), (13,4), (13,1),
 (14,2),
 (15,1), (15,4), (15,3),
 (16,1), (16,4), (16,3), (16,2), (16,5),
 (17,1), (17,4), (17,3),
 (18,1),
 (19,1), (19,2), (19,4), (19,5),
 (20,1), (20,2), (20,4),
 (21,1), (21,2), (21,4),
 (22,1), (22,2), (22,4), (22,3), (22,5),
 (23,1), (23,2), (23,4);