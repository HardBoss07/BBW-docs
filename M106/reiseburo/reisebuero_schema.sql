DROP SCHEMA IF EXISTS reisebuero;
CREATE SCHEMA reisebuero;
USE reisebuero;

-- Kunden
CREATE TABLE Kunden (
    kunden_id INT AUTO_INCREMENT PRIMARY KEY,
    vorname VARCHAR(50) NOT NULL,
    nachname VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    telefon VARCHAR(20),
    geburtsdatum DATE
);

-- Reisearten
CREATE TABLE Reisearten (
    reiseart_id INT AUTO_INCREMENT PRIMARY KEY,
    bezeichnung VARCHAR(50) NOT NULL
);

-- Unterkünfte
CREATE TABLE Unterkuenfte (
    unterkunft_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    typ VARCHAR(50),
    sterne INT CHECK (sterne BETWEEN 1 AND 5),
    adresse VARCHAR(255)
);

-- Transportmittel
CREATE TABLE Transportmittel (
    transportmittel_id INT AUTO_INCREMENT PRIMARY KEY,
    typ VARCHAR(50) NOT NULL,
    beschreibung TEXT
);

-- Reiseleiter:innen
CREATE TABLE Reiseleiter (
    reiseleiter_id INT AUTO_INCREMENT PRIMARY KEY,
    vorname VARCHAR(50) NOT NULL,
    nachname VARCHAR(50) NOT NULL,
    sprache VARCHAR(50)
);

-- Reiseangebote
CREATE TABLE Reiseangebote (
    reise_id INT AUTO_INCREMENT PRIMARY KEY,
    titel VARCHAR(100) NOT NULL,
    destination VARCHAR(100) NOT NULL,
    preis DECIMAL(10,2) NOT NULL CHECK (preis > 0),
    reiseart_id INT,
    beschreibung TEXT,
    FOREIGN KEY (reiseart_id) REFERENCES Reisearten(reiseart_id)
);

-- Verknüpfung: Reise → Unterkunft
CREATE TABLE Reise_Unterkuenfte (
    reise_id INT,
    unterkunft_id INT,
    PRIMARY KEY (reise_id, unterkunft_id),
    FOREIGN KEY (reise_id) REFERENCES Reiseangebote(reise_id),
    FOREIGN KEY (unterkunft_id) REFERENCES Unterkuenfte(unterkunft_id)
);

-- Verknüpfung: Reise → Transportmittel
CREATE TABLE Reise_Transport (
    reise_id INT,
    transportmittel_id INT,
    PRIMARY KEY (reise_id, transportmittel_id),
    FOREIGN KEY (reise_id) REFERENCES Reiseangebote(reise_id),
    FOREIGN KEY (transportmittel_id) REFERENCES Transportmittel(transportmittel_id)
);

-- Verknüpfung: Reise → Reiseleiter
CREATE TABLE Reise_Reiseleiter (
    reise_id INT,
    reiseleiter_id INT,
    PRIMARY KEY (reise_id, reiseleiter_id),
    FOREIGN KEY (reise_id) REFERENCES Reiseangebote(reise_id),
    FOREIGN KEY (reiseleiter_id) REFERENCES Reiseleiter(reiseleiter_id)
);

-- Verfügbarkeit
CREATE TABLE Reiseverfuegbarkeit (
    verf_id INT AUTO_INCREMENT PRIMARY KEY,
    reise_id INT,
    datum DATE NOT NULL,
    freie_plaetze INT NOT NULL CHECK (freie_plaetze >= 0),
    FOREIGN KEY (reise_id) REFERENCES Reiseangebote(reise_id)
);

-- Buchungen
CREATE TABLE Reisebuchungen (
    buchung_id INT AUTO_INCREMENT PRIMARY KEY,
    kunden_id INT,
    verf_id INT,
    buchungsdatum DATE NOT NULL,
    anzahl_personen INT NOT NULL CHECK (anzahl_personen > 0),
    FOREIGN KEY (kunden_id) REFERENCES Kunden(kunden_id),
    FOREIGN KEY (verf_id) REFERENCES Reiseverfuegbarkeit(verf_id)
);

-- Zahlungen
CREATE TABLE Zahlungen (
    zahlung_id INT AUTO_INCREMENT PRIMARY KEY,
    buchung_id INT,
    betrag DECIMAL(10,2) NOT NULL CHECK (betrag > 0),
    zahlungsdatum DATE NOT NULL,
    zahlungsart VARCHAR(50) NOT NULL,
    FOREIGN KEY (buchung_id) REFERENCES Reisebuchungen(buchung_id)
);

-- Bewertungen
CREATE TABLE Bewertungen (
    bewertung_id INT AUTO_INCREMENT PRIMARY KEY,
    buchung_id INT,
    sterne INT CHECK (sterne BETWEEN 1 AND 5),
    kommentar TEXT,
    bewertungsdatum DATE,
    FOREIGN KEY (buchung_id) REFERENCES Reisebuchungen(buchung_id)
);

-- Kunden
INSERT INTO Kunden (vorname, nachname, email, telefon, geburtsdatum) VALUES
('Max', 'Muster', 'max@muster.de', '0123456789', '1980-05-10'),
('Anna', 'Schmidt', 'anna@mail.de', '0987654321', '1990-08-20'),
('John', 'Doe', 'john@doe.com', '1234567890', '1975-03-15');

-- Reisearten
INSERT INTO Reisearten (bezeichnung) VALUES
('Abenteuer'), ('Wellness'), ('Kultur');

-- Unterkünfte
INSERT INTO Unterkuenfte (name, typ, sterne, adresse) VALUES
('Alpenhotel', 'Hotel', 4, 'Bergweg 5, 87654 Alpen'),
('Oasenresort', 'Resort', 5, 'Wüstenstraße 9, 11223 Sahara'),
('City Inn', 'Hostel', 3, 'Zentralplatz 1, 99887 Metropole');

-- Transportmittel
INSERT INTO Transportmittel (typ, beschreibung) VALUES
('Flugzeug', 'Direktflug mit Komfort'),
('Bus', 'Langstreckenreisebus'),
('Zug', 'Schneller ICE');

-- Reiseleiter
INSERT INTO Reiseleiter (vorname, nachname, sprache) VALUES
('Laura', 'Keller', 'Deutsch'),
('Peter', 'Lang', 'Englisch');

-- Reiseangebote
INSERT INTO Reiseangebote (titel, destination, preis, reiseart_id, beschreibung) VALUES
('Wüstensafari Marokko', 'Marokko', 1500.00, 1, 'Abenteuer in der Sahara'),
('Wellness Alpen', 'Österreich', 1200.00, 2, 'Entspannung in den Bergen');

-- Zuweisungen
INSERT INTO Reise_Unterkuenfte VALUES (1, 2), (2, 1);
INSERT INTO Reise_Transport VALUES (1, 1), (2, 3);
INSERT INTO Reise_Reiseleiter VALUES (1, 1), (2, 2);

-- Verfügbarkeit
INSERT INTO Reiseverfuegbarkeit (reise_id, datum, freie_plaetze) VALUES
(1, '2025-07-01', 10),
(1, '2025-07-15', 5),
(2, '2025-08-01', 8);

-- Buchungen
INSERT INTO Reisebuchungen (kunden_id, verf_id, buchungsdatum, anzahl_personen) VALUES
(1, 1, '2025-06-01', 2),
(2, 2, '2025-06-10', 1);

-- Zahlungen
INSERT INTO Zahlungen (buchung_id, betrag, zahlungsdatum, zahlungsart) VALUES
(1, 3000.00, '2025-06-01', 'Kreditkarte'),
(2, 1500.00, '2025-06-10', 'PayPal');

-- Bewertungen
INSERT INTO Bewertungen (buchung_id, sterne, kommentar, bewertungsdatum) VALUES
(1, 5, 'Super Erlebnis!', '2025-07-20'),
(2, 4, 'Tolle Umgebung', '2025-07-30');

-- 1. Beliebteste Reisen (nach Buchungen)
SELECT r.titel, COUNT(rb.buchung_id) AS anzahl_buchungen
FROM Reisebuchungen rb
JOIN Reiseverfuegbarkeit rv ON rb.verf_id = rv.verf_id
JOIN Reiseangebote r ON rv.reise_id = r.reise_id
GROUP BY r.reise_id
ORDER BY anzahl_buchungen DESC;

-- 2. Gesamtumsatz pro Monat
SELECT DATE_FORMAT(z.zahlungsdatum, '%Y-%m') AS monat, SUM(z.betrag) AS umsatz
FROM Zahlungen z
GROUP BY monat
ORDER BY monat;

-- 3. Reiseleiter mit meisten Reisen
SELECT rl.vorname, rl.nachname, COUNT(rr.reise_id) AS anzahl_reisen
FROM Reise_Reiseleiter rr
JOIN Reiseleiter rl ON rr.reiseleiter_id = rl.reiseleiter_id
GROUP BY rr.reiseleiter_id
ORDER BY anzahl_reisen DESC;

-- 4. Freie Plätze auf den nächsten 5 Reisen
SELECT r.titel, rv.datum, rv.freie_plaetze
FROM Reiseverfuegbarkeit rv
JOIN Reiseangebote r ON rv.reise_id = r.reise_id
WHERE rv.datum >= CURDATE()
ORDER BY rv.datum
LIMIT 5;

-- 5. Beste Unterkünfte laut Bewertung
SELECT u.name, ROUND(AVG(b.sterne), 2) AS schnitt
FROM Bewertungen b
JOIN Reisebuchungen rb ON b.buchung_id = rb.buchung_id
JOIN Reiseverfuegbarkeit rv ON rb.verf_id = rv.verf_id
JOIN Reise_Unterkuenfte ru ON rv.reise_id = ru.reise_id
JOIN Unterkuenfte u ON ru.unterkunft_id = u.unterkunft_id
GROUP BY u.unterkunft_id
ORDER BY schnitt DESC
LIMIT 5;
