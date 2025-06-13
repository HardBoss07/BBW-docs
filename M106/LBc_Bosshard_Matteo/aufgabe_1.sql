CREATE TABLE award (
  award_id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(100) NOT NULL,
  prize_money DECIMAL(10,2) NOT NULL
);

CREATE TABLE film_award (
  film_id SMALLINT UNSIGNED NOT NULL,
  award_id INT NOT NULL,
  year YEAR NOT NULL,
  PRIMARY KEY (film_id, award_id, year),
  FOREIGN KEY (film_id) REFERENCES film(film_id),
  FOREIGN KEY (award_id) REFERENCES award(award_id)
);