DROP DATABASE IF EXISTS SpotifyClone;

CREATE DATABASE SpotifyClone;

CREATE TABLE SpotifyClone.plan(
  plan_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  plan_title VARCHAR(20) NOT NULL,
  price DECIMAL(5, 2) NOT NULL
) ENGINE = InnoDB;

CREATE TABLE SpotifyClone.user(
  user_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  user_name VARCHAR(100) NOT NULL,
  age INT(3) NOT NULL,
  subscription_date DATE NOT NULL,
  plan_id INT NOT NULL,
  FOREIGN KEY (plan_id) REFERENCES plan (plan_id)
) ENGINE = InnoDB;

CREATE TABLE SpotifyClone.artist(
  artist_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  artist_name VARCHAR(100) NOT NULL
) ENGINE = InnoDB;

CREATE TABLE SpotifyClone.album(
  album_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  album_title VARCHAR(100) NOT NULL,
  release_year YEAR NOT NULL,
  artist_id INT NOT NULL,
  FOREIGN KEY (artist_id) REFERENCES artist (artist_id)
) ENGINE = InnoDB;

CREATE TABLE SpotifyClone.song(
  song_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  song_title VARCHAR(100) NOT NULL,
  duration INT(3) NOT NULL,
  album_id INT NOT NULL,
  artist_id INT NOT NULL,
  FOREIGN KEY (album_id) REFERENCES album (album_id),
  FOREIGN KEY (artist_id) REFERENCES artist (artist_id)
) ENGINE = InnoDB;

CREATE TABLE SpotifyClone.history(
  user_id INT NOT NULL,
  song_id INT NOT NULL,
  CONSTRAINT PRIMARY KEY (user_id, song_id),
  FOREIGN KEY (user_id) REFERENCES user (user_id),
  FOREIGN KEY (song_id) REFERENCES song (song_id),
  playback_date DATETIME NOT NULL
) ENGINE = InnoDB;

CREATE TABLE SpotifyClone.following(
  user_id INT NOT NULL,
  artist_id INT NOT NULL,
  CONSTRAINT PRIMARY KEY (user_id, artist_id),
  FOREIGN KEY (user_id) REFERENCES user (user_id),
  FOREIGN KEY (artist_id) REFERENCES artist (artist_id)
) ENGINE = InnoDB;

INSERT INTO SpotifyClone.plan (plan_title, price)
VALUES
  ('gratuito', 0.00),
  ('universitário', 5.99),
  ('pessoal', 6.99),
  ('familiar', 7.99);

INSERT INTO SpotifyClone.user (user_name, age, subscription_date, plan_id)
VALUES
  ('Barbara Liskov', 82, '2019-10-20', 1),
  ('Robert Cecil Martin', 58, '2017-01-06', 1),
  ('Ada Lovelace', 37, '2017-12-30', 4),
  ('Martin Fowler', 46, '2017-01-17', 4),
  ('Sandi Metz', 58, '2018-04-29', 4),
  ('Paulo Freire', 19, '2018-02-14', 2),
  ('Bell Hooks', 26, '2018-01-05', 2),
  ('Christopher Alexander', 85, '2019-06-05', 3),
  ('Judith Butler', 45, '2020-05-13', 3),
  ('Jorge Amado', 58, '2017-02-17', 3);

INSERT INTO SpotifyClone.artist (artist_name)
VALUES
  ('Baco Exu do Blues'),
  ('Beyoncé'),
  ('Blind Guardian'),
  ('Elis Regina'),
  ('Nina Simone'),
  ('Queen');

INSERT INTO SpotifyClone.album (album_title, release_year, artist_id)
VALUES
  ('Renaissance', 2022, 2),
  ('Jazz', 1978, 6),
  ('Hot Space', 1982, 6),
  ('Falso Brilhante', 1998, 4),
  ('Vento de Maio', 2001, 4),
  ('QVVJFA?', 2003, 1),
  ('Somewhere Far Beyond', 2007, 3),
  ('I Put A Spell On You', 2012, 5);

INSERT INTO SpotifyClone.song (song_title, duration, album_id, artist_id)
VALUES
  ('BREAK MY SOUL', 279, 1, 2),
  ('VIRGO’S GROOVE', 369, 1, 2),
  ('ALIEN SUPERSTAR', 116, 1, 2),
  ('Don’t Stop Me Now', 203, 2, 6),
  ('Under Pressure', 152, 3, 6),
  ('Como Nossos Pais', 105, 4, 4),
  ('O Medo de Amar é o Medo de Ser Livre', 207, 5, 4),
  ('Samba em Paris', 267, 6, 1),
  ('The Bard’s Song', 244, 7, 3),
  ('Feeling Good', 100, 8, 5);

INSERT INTO SpotifyClone.history (user_id, song_id, playback_date)
VALUES
  (1, 2, '2022-02-28 10:45:55'),
  (1, 8, '2020-05-02 05:30:35'),
  (1, 10, '2020-03-06 11:22:33'),
  (2, 7, '2022-08-05 08:05:17'),
  (2, 10, '2020-01-02 07:40:33'),
  (3, 2, '2020-11-13 16:55:13'),
  (3, 10, '2020-12-05 18:38:30'),
  (4, 8, '2021-08-15 17:10:10'),
  (5, 5, '2022-01-09 01:44:33'),
  (5, 8, '2020-08-06 15:23:43'),
  (6, 1, '2017-01-24 00:31:17'),
  (6, 7, '2017-10-12 12:35:20'),
  (7, 4, '2011-12-15 22:30:49'),
  (8, 4, '2012-03-17 14:56:41'),
  (9, 9, '2022-02-24 21:14:22'),
  (10, 3, '2015-12-13 08:30:22');

INSERT INTO SpotifyClone.following (user_id, artist_id)
VALUES
  (1, 2),
  (1, 4),
  (1, 6),
  (2, 2),
  (2, 4),
  (3, 6),
  (4, 1),
  (5, 3),
  (5, 5),
  (6, 2),
  (6, 5),
  (7, 5),
  (9, 4),
  (10, 6);
