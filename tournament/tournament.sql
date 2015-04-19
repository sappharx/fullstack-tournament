-- Table definitions for the tournament project.
--
-- Put your SQL 'create table' statements in this file; also 'create view'
-- statements if you choose to use it.
--
-- You can write comments in this file by starting them with two dashes, like
-- these lines here.


-- create tournament database
CREATE DATABASE tournament;

-- create players table
CREATE TABLE players
(
  id serial PRIMARY KEY,
  name TEXT
);

-- create matches table
CREATE TABLE matches
(
  winner INT REFERENCES players(id),
  loser INT REFERENCES players(id)
);

-- create views for wins and losses
CREATE VIEW wins AS
SELECT id, name, COUNT(winner) AS wins
FROM players LEFT JOIN matches
ON winner = id
GROUP BY id;

CREATE VIEW losses AS
SELECT id, name, COUNT(loser) AS losses
FROM players LEFT JOIN matches
ON loser = id
GROUP BY id;

-- create standings view
CREATE VIEW standings AS
SELECT p.id, p.name, wins, (SELECT wins + losses) AS matches
FROM players p, wins w, losses l
WHERE w.id = p.id AND l.id = p.id
ORDER BY wins DESC;