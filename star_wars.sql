-- This is the database I created for the Codecademy "Designing a Database from Scratch" off-platform project in the "Design Databases with PostgreSQL" path.
-- Credit to IMDB (imdb.com) and Wookiepedia (starwars.fandom.com) for the data. All mistakes my own!
-- MTFBWY :)

CREATE TABLE directors (
    id integer PRIMARY KEY,
    first_name varchar(10),
    last_name varchar(10),
    name varchar(20),
    awards integer,
    date_of_birth date,
    age integer
);

CREATE TABLE movies (
    id integer PRIMARY KEY,
    name varchar(50),
    released date,
    bby integer,
    quote varchar(100),
    type varchar(10),
    director_id integer REFERENCES directors(id)
);

CREATE TABLE movie_stats (
	id integer PRIMARY KEY,
    movie_id integer REFERENCES movies(id) UNIQUE,
    runtime integer,
    rating real,
    gross integer
);

CREATE TABLE characters (
	id integer PRIMARY KEY,
    first_name varchar(10),
    last_name varchar(10),
    name varchar(20),
    affiliation varchar(15),
    species varchar(15)
);

CREATE TABLE movie_characters (
	character_id integer REFERENCES characters(id),
    movie_id integer REFERENCES movies(id),
    PRIMARY KEY (character_id, movie_id)
);

INSERT INTO directors
VALUES
	(1, 'George', 'Lucas', 'George Lucas', 61, '1944-05-14', 77),
    (2, 'Dave', 'Filoni', 'Dave Filoni', 3, '1964-06-07', 57),
    (3, 'Brad', 'Rau', 'Brad Rau', 0, '1975-01-01', 47),
    (4, 'Ron', 'Howard', 'Ron Howard', 0, '1954-03-01', 67),
    (5, 'Deborah', 'Chow', 'Deborah Chow', 1, '1980-01-01', 42),
    (6, 'Ben', 'Caron', 'Ben Caron', 0, '1976-07-02', 45),
    (7, 'Gareth', 'Edwards', 'Gareth Edwards', 14, '1975-06-01', 46),
    (8, 'Irvin', 'Kershner', 'Irvin Kershner', 5, '1923-04-29', 98),
    (9, 'Richard', 'Marquand', 'Richard Marquand', 2, '1937-09-22', 84),
    (10, 'Rick', 'Famuyiwa', 'Rick Famuyiwa', 5, '1973-06-18', 48),
    (11, 'Robert', 'Rodriguez', 'Robert Rodriguez', 42, '1968-06-20', 53), 
    (12, 'Justin', 'Ridge', 'Justin Ridge', 0, '1980-01-01', 42),
    (13, 'Jeffrey', 'Abrams', 'Jeffrey Abrams', 28, '1966-06-27', 55),
    (14, 'Rian', 'Johnson', 'Rian Johnson', 36, '1973-12-17', 48);

INSERT INTO movies
VALUES
    (1, 'Star Wars Episode I - The Phantom Menace', '1999-07-15', -32, 'Finding him was the will of the Force, I have no doubt of that.', 'Movie', 1),
    (2, 'Star Wars Episode II - Attack of the Clones', '2002-05-16', -22, 'Begun, the Clone War has.', 'Movie', 1),
    (3, 'Star Wars The Clone Wars Movie', '2008-08-15', -22, 'You`re reckless, little one. ', 'Movie', 2),
    (4, 'Star Wars The Clone Wars', '2008-10-25', -22, 'Clones you may be, but the Force resides in all living things.', 'TV Series', 2),
    (5, 'Star Wars Episode III - Revenge of the Sith', '2005-05-15', -19, 'You were the chosen one! It was said that you would destroy the Sith, not join them!', 'Movie', 1),
    (6, 'Star Wars The Bad Batch', '2021-05-04', -19, 'You all appear to be genetically defective clones.', 'TV Series', 3),
    (7, 'Solo A Star Wars Story', '2018-05-24', -13, 'Never tell him the odds.', 'Movie', 4),
    (8, 'Obi-Wan Kenobi', '2022-09-01', -9, 'Of course I know him, he`s me!', 'TV Series', 5),
    (9, 'Star Wars Rebels', '2014-10-16', -5, 'A spark of rebellion ignites...', 'TV Series', 2),
    (10, 'Andor', '2022-09-01', -5, 'Congratulations, you are being rescured.', 'TV Series', 6),
    (11, 'Rogue One', '2016-12-15', 0, 'Rebellions are built on hope.', 'Movie', 7),
    (12, 'Star Wars Episode IV - A New Hope', '1978-01-29', 0, 'A long time ago in a galaxy far, far away...', 'Movie', 1),
    (13, 'Star Wars Episode V - The Empire Strikes Back', '1980-05-21', 3, 'Do... or do not. There is no try.', 'Movie', 8),
    (14, 'Star Wars Episode VI - Return of the Jedi', '1983-06-02', 4, 'And now, young Skywalker... you will die.', 'Movie', 9),
    (15, 'The Mandalorian', '2020-03-24', 9, 'This is the Way.', 'TV Series', 10),
    (16, 'The Book of Boba Fett', '2021-12-29', 9, 'I intend to rule with respect.', 'TV Series', 11),
    (17, 'Star Wars Resistance', '2018-10-13', 34, 'Some heroes stick to the plan. Others just wing it.', 'TV Series', 12),
    (18, 'Star Wars Episode VII - The Force Awakens', '2015-12-17', 34, 'Every generation has a story.', 'Movie', 13),
    (19, 'Star Wars Episode VIII - The Last Jedi', '2017-12-14', 34, 'Let the past die.', 'Movie', 14),
    (20, 'Star Wars Episode IX - The Rise of Skywalker', '2019-12-19', 35, 'I know what I have to do, but I don`t know if I have the strength to do it.', 'Movie', 13);

INSERT into movie_stats
VALUES
    (1, 1, 136, 6.5, 474540000),
    (2, 2, 142, 6.5, 310680000),
    (3, 3, 98, 6, 35160000),
    (4, 5, 140, 7.5, 380260000),
    (5, 7, 135, 6.9, 213770000),
    (6, 11, 133, 7.8, 532180000),
    (7, 12, 121, 8.6, 322740000),
    (8, 13, 124, 8.7, 290480000),
    (9, 14, 131, 8.3, 309130000),
    (10, 18, 138, 7.8, 936660000),
    (11, 19, 152, 6.9, 620180000),
    (12, 20, 141, 6.5, 515200000);

INSERT INTO characters
VALUES
    (1, 'Gial', 'Ackbar', 'Gial Ackbar', 'Rebellion', 'Mon Calamari'),
    (2, 'Padmé', 'Amidala', 'Padmé Amidala', 'Republic', 'Human'),
    (3, 'Cassian', 'Andor', 'Cassian Andor', 'Rebellion', 'Human'),
    (4, 'Cad', 'Bane', 'Cad Bane', 'Neutral', 'Duros'),
    (5, 'Jar Jar', 'Binks', 'Jar Jar Binks', 'Republic', 'Gungan'),
    (6, 'Lando', 'Calrissian', 'Lando Calrissian', 'Rebellion', 'Human'),
    (7, 'Commander', 'Cody', 'Commander Cody', 'Republic', 'Human'),
    (8, 'Poe', 'Dameron', 'Poe Dameron', 'Resistance', 'Human'),
    (9, 'Din', 'Djarin', 'Din Djarin', 'Mandalorian', 'Human'),
    (10, 'Count', 'Dooku', 'Count Dooku', 'Sith', 'Human'),
    (11, 'Jyn', 'Erso', 'Jyn Erso', 'Rebellion', 'Human'),
    (12, 'Boba', 'Fett', 'Boba Fett', 'Neutral', 'Human'),
    (13, 'Saw', 'Gerrera', 'Saw Gerrera', 'Rebellion', 'Human'),
    (14, 'Moff', 'Gideon', 'Moff Gideon', 'Remnant', 'Human'),
    (15, 'General', 'Grievous', 'General Grievous', 'Separatist', 'Cyborg'),
    (16, 'Armitage', 'Hux', 'Armitage Hux', 'First Order', 'Human'),
    (17, 'Chirrut', 'Îmwe', 'Chirrut Îmwe', 'Rebellion', 'Human'),
    (18, 'Qui-Gon', 'Jinn', 'Qui-Gon Jinn', 'Jedi', 'Human'),
    (19, 'Obi-Wan', 'Kenobi', 'Obi-Wan Kenobi', 'Jedi', 'Human'),
    (20, 'Plo', 'Koon', 'Plo Koon', 'Jedi', 'Kel Dor'),
    (21, 'Bo-Katan', 'Kryze', 'Bo-Katan Kryze', 'Mandalorian', 'Human'),
    (22, 'Darth', 'Maul', 'Darth Maul', 'Sith', 'Dathomirian'),
    (23, 'Bail', 'Organa', 'Bail Organa', 'Republic', 'Human'),
    (24, 'Leia', 'Organa', 'Leia Organa', 'Rebellion', 'Human'),
    (25, 'Sheev', 'Palpatine', 'Sheev Palpatine', 'Sith', 'Human'),
    (26, 'Captain', 'Rex', 'Captain Rex', 'Republic', 'Human'),
    (27, 'Fennec', 'Shand', 'Fennec Shand', 'Neutral', 'Human'),
    (28, 'Anakin', 'Skywalker', 'Anakin Skywalker', 'Jedi', 'Human'),
    (29, 'Luke', 'Skywalker', 'Luke Skywalker', 'Jedi', 'Human'),
    (30, 'Rey', 'Skywalker', 'Rey Skywalker', 'Jedi', 'Human'),
    (31, 'Ben', 'Solo', 'Ben Solo', 'Sith', 'Human'),
    (32, 'Han', 'Solo', 'Han Solo', 'Rebellion', 'Human'),
    (33, 'Ahsoka', 'Tano', 'Ahsoka Tano', 'Jedi', 'Togruta'),
    (34, 'Wilhuff', 'Tarkin', 'Wilhuff Tarkin', 'Empire', 'Human'),
    (35, 'Shaak', 'Ti', 'Shaak Ti', 'Jedi', 'Togruta'),
    (36, 'Jabba', 'Tiure', 'Jabba Tiure', 'Neutral', 'Hutt'),
    (37, 'Asajj', 'Ventress', 'Asajj Ventress', 'Sith', 'Dathomirian'),
    (38, 'Mace', 'Windu', 'Mace Windu', 'Jedi', 'Human'),
    (39, 'BB-8', '', 'BB-8', 'Resistance', 'Droid'),
    (40, 'C-3PO', '', 'C-3PO', 'Rebellion', 'Droid'),
    (41, 'Chewbacca', '', 'Chewbacca', 'Rebellion', 'Wookie'),
    (42, 'Crosshair', '', 'Crosshair', 'Empire', 'Human'),
    (43, 'Echo', '', 'Echo', 'Bad Batch', 'Cyborg'),
    (44, 'Finn', '', 'Finn', 'Resistance', 'Human'),
    (45, 'Fives', '', 'Fives', 'Republic', 'Human'),
    (46, 'Grogu', '', 'Grogu', 'Jedi', '???'),
    (47, 'K-2SO', '', 'K-2SO', 'Rebellion', 'Droid'),
    (48, 'Omega', '', 'Omega', 'Bad Batch', 'Human'),
    (49, 'R2-D2', '', 'R2-D2', 'Rebellion', 'Droid'),
    (50, 'Yoda', '', 'Yoda', 'Jedi', '???');

INSERT INTO movie_characters
VALUES
    (2, 1),
    (5, 1),
    (18, 1),
    (19, 1),
    (20, 1),
    (22, 1),
    (25, 1),
    (28, 1),
    (38, 1),
    (40, 1),
    (49, 1),
    (50, 1),
    (36, 1),
    (2, 2),
    (5, 2),
    (10, 2),
    (12, 2),
    (19, 2),
    (20, 2),
    (23, 2),
    (25, 2),
    (28, 2),
    (35, 2),
    (38, 2),
    (40, 2),
    (49, 2),
    (50, 2),
    (36, 2),
    (2, 3),
    (7, 3),
    (10, 3),
    (15, 3),
    (19, 3),
    (20, 3),
    (25, 3),
    (26, 3),
    (28, 3),
    (33, 3),
    (37, 3),
    (38, 3),
    (40, 3),
    (49, 3),
    (50, 3),
    (36, 3),
    (1, 4),
    (2, 4),
    (4, 4),
    (5, 4),
    (7, 4),
    (10, 4),
    (12, 4),
    (13, 4),
    (15, 4),
    (19, 4),
    (20, 4),
    (21, 4),
    (22, 4),
    (23, 4),
    (25, 4),
    (26, 4),
    (28, 4),
    (33, 4),
    (34, 4),
    (35, 4),
    (37, 4),
    (38, 4),
    (40, 4),
    (49, 4),
    (50, 4),
    (45, 4),
    (43, 4),
    (42, 4),
    (41, 4),
    (36, 4),
    (5, 5),
    (7, 5),
    (10, 5),
    (15, 5),
    (19, 5),
    (20, 5),
    (24, 5),
    (23, 5),
    (25, 5),
    (29, 5),
    (28, 5),
    (34, 5),
    (38, 5),
    (40, 5),
    (49, 5),
    (50, 5),
    (13, 6),
    (26, 6),
    (27, 6),
    (34, 6),
    (43, 6),
    (42, 6),
    (48, 6),
    (6, 7),
    (32, 7),
    (41, 7),
    (19, 8),
    (6, 9),
    (13, 9),
    (19, 9),
    (22, 9),
    (24, 9),
    (23, 9),
    (25, 9),
    (26, 9),
    (29, 9),
    (28, 9),
    (33, 9),
    (34, 9),
    (40, 9),
    (49, 9),
    (3, 10),
    (47, 10),
    (3, 11),
    (11, 11),
    (13, 11),
    (17, 11),
    (24, 11),
    (23, 11),
    (28, 11),
    (34, 11),
    (40, 11),
    (49, 11),
    (47, 11),
    (12, 12),
    (19, 12),
    (24, 12),
    (29, 12),
    (28, 12),
    (32, 12),
    (34, 12),
    (40, 12),
    (49, 12),
    (50, 12),
    (41, 12),
    (36, 12),
    (6, 13),
    (12, 13),
    (24, 13),
    (25, 13),
    (29, 13),
    (28, 13),
    (32, 13),
    (40, 13),
    (49, 13),
    (50, 13),
    (41, 13),
    (36, 13),
    (1, 14),
    (6, 14),
    (12, 14),
    (24, 14),
    (25, 14),
    (29, 14),
    (28, 14),
    (32, 14),
    (40, 14),
    (49, 14),
    (50, 14),
    (41, 14),
    (36, 14),
    (9, 15),
    (12, 15),
    (14, 15),
    (21, 15),
    (27, 15),
    (29, 15),
    (33, 15),
    (49, 15),
    (46, 15),
    (9, 16),
    (12, 16),
    (27, 16),
    (8, 17),
    (24, 17),
    (39, 17),
    (8, 18),
    (16, 18),
    (24, 18),
    (30, 18),
    (29, 18),
    (31, 18),
    (32, 18),
    (40, 18),
    (39, 18),
    (49, 18),
    (41, 18),
    (44, 18),
    (8, 19),
    (16, 19),
    (24, 19),
    (25, 19),
    (30, 19),
    (29, 19),
    (31, 19),
    (40, 19),
    (39, 19),
    (49, 19),
    (41, 19),
    (44, 19),
    (7, 20),
    (8, 20),
    (16, 20),
    (24, 20),
    (25, 20),
    (30, 20),
    (29, 20),
    (31, 20),
    (40, 20),
    (39, 20),
    (49, 20),
    (41, 20),
    (44, 20);

ALTER TABLE movie_stats
ADD characters integer;

UPDATE movie_stats SET characters = 13 WHERE id = 1;
UPDATE movie_stats SET characters = 15 WHERE id = 2;
UPDATE movie_stats SET characters = 16 WHERE id = 3;
UPDATE movie_stats SET characters = 16 WHERE id = 4;
UPDATE movie_stats SET characters = 3 WHERE id = 5;
UPDATE movie_stats SET characters = 11 WHERE id = 6;
UPDATE movie_stats SET characters = 12 WHERE id = 7;
UPDATE movie_stats SET characters = 12 WHERE id = 8;
UPDATE movie_stats SET characters = 13 WHERE id = 9;
UPDATE movie_stats SET characters = 12 WHERE id = 10;
UPDATE movie_stats SET characters = 12 WHERE id = 11;
UPDATE movie_stats SET characters = 13 WHERE id = 12;

ALTER TABLE movies
ADD popularity integer;

UPDATE movies SET popularity = 388 WHERE id = 1;
UPDATE movies SET popularity = 383 WHERE id = 2;
UPDATE movies SET popularity = 750 WHERE id = 3;
UPDATE movies SET popularity = 289 WHERE id = 4;
UPDATE movies SET popularity = 654 WHERE id = 5;
UPDATE movies SET popularity = 465 WHERE id = 6;
UPDATE movies SET popularity = 481 WHERE id = 7;
UPDATE movies SET popularity = 308 WHERE id = 8;
UPDATE movies SET popularity = 595 WHERE id = 9;
UPDATE movies SET popularity = 1344 WHERE id = 10;
UPDATE movies SET popularity = 458 WHERE id = 11;
UPDATE movies SET popularity = 262 WHERE id = 12;
UPDATE movies SET popularity = 514 WHERE id = 13;
UPDATE movies SET popularity = 537 WHERE id = 14;
UPDATE movies SET popularity = 30 WHERE id = 15;
UPDATE movies SET popularity = 3 WHERE id = 16;
UPDATE movies SET popularity = 2865 WHERE id = 17;
UPDATE movies SET popularity = 355 WHERE id = 18;
UPDATE movies SET popularity = 558 WHERE id = 19;
UPDATE movies SET popularity = 204 WHERE id = 20;

ALTER TABLE movies
RENAME TO shows;

ALTER TABLE movie_stats
RENAME COLUMN movie_id TO show_id;

ALTER TABLE movie_characters
RENAME COLUMN movie_id TO show_id;

ALTER TABLE movie_characters
RENAME TO show_characters;

-- 01) Which director has directed the most shows, how many did they direct, and what is their total runtime? 

SELECT
	directors.name AS "director",
    COUNT(shows.id) AS "show count",
    SUM(movie_stats.runtime) AS "total runtime"
 FROM directors, shows, movie_stats
 WHERE
 	directors.id = shows.director_id AND
    movie_stats.show_id = shows.id
 GROUP BY 1
 ORDER BY 2 DESC
 LIMIT 1;

director     |  show count  |   total runtime
George Lucas |	4	        |   539

-- 02) Which director directed the highest-grossing movie before the sequels, what was its name and what did it gross? 

SELECT
	directors.name AS "director",
    shows.name AS "movie",
    movie_stats.gross AS "gross"
FROM directors, shows, movie_stats
WHERE
	directors.id = shows.director_id AND
    shows.id = movie_stats.show_id AND
    shows.type = 'Movie' AND
    shows.id < 18
GROUP BY 1, 2, 3
ORDER BY 3 DESC
LIMIT 1;

director        |   movie       |   gross
Gareth Edwards  |   Rogue One   |   532180000

-- 03) What is the top-rated show featuring Boba Fett, what was its rating and when was it released?

SELECT
	shows.name AS "show",
    movie_stats.rating AS "rating",
    shows.released AS "release year"
FROM shows, movie_stats, show_characters, characters
WHERE
	shows.id = show_characters.show_id AND
    shows.id = movie_stats.show_id AND
    show_characters.character_id = characters.id AND
    characters.name = 'Boba Fett'
GROUP BY 1, 2, 3
ORDER BY 2 DESC
LIMIT 1;

show	                                        |   rating  |   release year
Star Wars Episode V - The Empire Strikes Back   |   8.7     |   1980-05-21

-- 04) Which show has the most Sith characters in, how many were there and how old is its director?

SELECT
	shows.name AS "show",
    COUNT(show_characters.character_id) AS "sith characters",
    directors.name AS "director",
    directors.age AS "age"
FROM shows, show_characters, characters, directors
WHERE
	shows.id = show_characters.show_id AND
    characters.id = show_characters.character_id AND
    shows.director_id = directors.id AND
    characters.affiliation = 'Sith'
GROUP BY 1, 3, 4
ORDER BY 2 DESC
LIMIT 1;

show                        |   sith characters |   director    |   age
Star Wars The Clone Wars    |   4               |   Dave Filoni |   57

-- 05) Which Jedi characters have appeared in more than 5 shows, and what is their name and species?

SELECT
	characters.name AS "name",
    characters.species AS "species",
    COUNT(characters.id) AS "shows"
FROM characters, show_characters, shows
WHERE
	characters.id = show_characters.character_id AND
    shows.id = show_characters.show_id AND
    characters.affiliation = 'Jedi'
GROUP BY 1, 2
HAVING
	COUNT(characters.id) > 5
ORDER BY 3 DESC;

name                |   species |   shows
Anakin Skywalker    |   Human   |   10
Luke Skywalker      |   Human   |   9
Obi-Wan Kenobi      |   Human   |   8
Yoda                |   ???     |   8

-- 06) What is the lowest-rated show that's over two hours long and set before the Battle of Yavin?

SELECT
	shows.name AS "show",
    shows.bby AS "bby",
    movie_stats.rating AS "rating",
    movie_stats.runtime AS "runtime"
FROM shows, movie_stats
WHERE
	shows.id = movie_stats.show_id AND
    shows.bby <= 0 AND
    movie_stats.runtime > 120
GROUP BY 1, 2, 3, 4
ORDER BY 3 ASC
LIMIT 1;

show                                        |   bby |   rating  |   runtime
Star Wars Episode I - The Phantom Menace    |   -32 |   6.5     |   136

-- 07) What is the most popular show featuring Anakin Skywalker, and how many characters are in it?

SELECT
	shows.name AS "show",
	shows.popularity AS "popularity",
    movie_stats.characters AS "characters"
FROM shows, show_characters, characters, movie_stats
WHERE
	movie_stats.show_id = shows.id AND
	shows.id = show_characters.show_id AND
    characters.id = show_characters.character_id AND
    characters.name = 'Anakin Skywalker'
GROUP BY 1, 2, 3
ORDER BY 2 ASC
LIMIT 1;

show	                            |   popularity  |   characters
Star Wars Episode IV - A New Hope   |   262         ow|   12

-- 08) Who directed the least popular TV series set after the Battle of Yavin?

SELECT
	directors.name AS "director",
    shows.name AS "show",
    shows.popularity AS "popularity"
FROM directors, shows
WHERE
	directors.id = shows.director_id AND
    shows.bby > 0
GROUP BY 1, 2, 3
ORDER BY 3 DESC
LIMIT 1;  

director        |   show                    |   popularity
Justin Ridge    |   Star Wars Resistance    |   2865

-- 09) Which Rebellion character has featured in the most shows, and what is the average rating of these shows?

SELECT
	characters.name AS "character",
    COUNT(show_characters.show_id) AS "shows",
    ROUND(AVG(movie_stats.rating)) AS "rating"
FROM characters, show_characters, shows, movie_stats
WHERE
	characters.id = show_characters.character_id AND
    shows.id = show_characters.show_id AND
    shows.id = movie_stats.show_id AND
    characters.affiliation = 'Rebellion'
GROUP BY 1
ORDER BY 2 DESC
LIMIT 1;

character   |   shows   |   rating
C-3PO       |   11      |   7

-- 10) Which show did Plo Koon and Ahsoka first feature in together (in release order), and what did it gross?

SELECT
	shows.name AS "show",
    shows.released AS "release date",
    movie_stats.gross AS "gross"
FROM shows, movie_stats, characters, show_characters
WHERE
	shows.id = movie_stats.show_id AND
    shows.id = show_characters.show_id AND
    characters.id = show_characters.character_id AND
    (characters.name = 'Ahsoka Tano' OR characters.name = 'Plo Koon')
GROUP BY 1, 2, 3
ORDER BY 2 DESC
LIMIT 1;

show                            |   release date    |   gross
Star Wars The Clone Wars Movie  |   2008-08-15      |   35160000