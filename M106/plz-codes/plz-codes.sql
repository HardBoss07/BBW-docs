DROP DATABASE IF EXISTS postcodes;
CREATE DATABASE IF NOT EXISTS postcodes;
USE postcodes;

CREATE TABLE zip_codes_light (
    onrp INT(5) NOT NULL PRIMARY KEY,
    plz_type INT(2) NOT NULL,
    zip_code INT(4) NOT NULL,
    zusatzziffern INT(2) NOT NULL,
    ortsbezeichnung_kurz VARCHAR(18) NOT NULL,
    ortsbezeichnung_lang VARCHAR(27) NOT NULL,
    canton CHAR(2) NOT NULL
);

LOAD DATA INFILE 'C:/Schule/BBW-docs/M106/plz-codes/plz_l_20130819.txt'
INTO TABLE zip_codes_light
CHARACTER SET 'latin1'
FIELDS TERMINATED BY '\t'
LINES TERMINATED BY '\r\n';