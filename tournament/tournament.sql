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
  ID serial primary key,
  name text--,
  --wins int,
  --matches int
);

-- create matches table
CREATE TABLE matches
(
  --ID serial primary key,
  winner int REFERENCES players(ID),
  loser int REFERENCES players(ID)
);

-- create views for wins and losses
CREATE VIEW wins AS
SELECT ID, name, COUNT(winner) AS wins
FROM players LEFT JOIN matches
ON winner = ID
GROUP BY ID;

CREATE VIEW losses AS
SELECT ID, name, COUNT(loser) AS losses
FROM players LEFT JOIN matches
ON loser = ID
GROUP BY ID;

-- create standings view
CREATE VIEW standings AS
SELECT p.ID, p.name, wins, (select wins + losses) as matches
FROM players p, wins w, losses l
WHERE w.ID = p.ID AND l.ID = p.ID
ORDER BY wins DESC;