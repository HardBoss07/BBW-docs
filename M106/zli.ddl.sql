DROP DATABASE IF EXISTS zli;
CREATE DATABASE IF NOT EXISTS zli;

USE zli;

CREATE TABLE person (
    id INT AUTO_INCREMENT PRIMARY KEY,
    firstname VARCHAR(255) NOT NULL,
    lastname VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE
);

CREATE TABLE course (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    ict_number SMALLINT(3),
    description TEXT,
    price DECIMAL(7,2) NOT NULL,
    created_at DATETIME NOT NULL DEFAULT NOW()
);

CREATE TABLE course_execution (
    id INT AUTO_INCREMENT PRIMARY KEY,
    fk_course_id INT NOT NULL,
    fk_teacher_id INT NOT NULL,
    room ENUM('PINK', 'RED', 'ORANGE', 'GOLD'),
    start_date DATETIME NOT NULL,
    end_date DATETIME NOT NULL,

    FOREIGN KEY (fk_course_id) REFERENCES course(id),
    FOREIGN KEY (fk_teacher_id) REFERENCES person(id) ON DELETE CASCADE
);

CREATE TABLE person_course_execution (
    id INT AUTO_INCREMENT PRIMARY KEY,
    fk_participant_id INT NOT NULL,
    fk_course_execution_id INT NOT NULL,
    confirmed BOOLEAN NOT NULL DEFAULT FALSE,

    FOREIGN KEY (fk_participant_id) REFERENCES person(id),
    FOREIGN KEY (fk_course_execution_id) REFERENCES course_execution(id)
);