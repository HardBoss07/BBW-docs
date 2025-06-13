-- Aufgabe 1: Kategorien-Tabellen ergänzen

-- Tabelle category
CREATE TABLE category (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(25) NOT NULL
);

-- Zwischentabelle für m:n-Beziehung zwischen category und course
CREATE TABLE category_course (
    fk_category_id INT NOT NULL,
    fk_course_id INT UNSIGNED NOT NULL,
    created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (fk_category_id, fk_course_id),
    FOREIGN KEY (fk_category_id) REFERENCES category(id) ON DELETE CASCADE,
    FOREIGN KEY (fk_course_id) REFERENCES course(id) ON DELETE CASCADE
);