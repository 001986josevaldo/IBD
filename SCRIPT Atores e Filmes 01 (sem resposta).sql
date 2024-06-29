show databases;
DROP DATABASE IF EXISTS AtoresFilmes1;
CREATE DATABASE AtoresFilmes1;
show DATABASES;
USE AtoresFilmes1;

-- -------------------------- CRIAÇÃO DAS ESTRUTURAS ------------------------


show tables;
CREATE TABLE if not EXISTS Actors(
	ActorsID INT(6) AUTO_INCREMENT PRIMARY KEY,
	ActorsName VARCHAR(50) NOT NULL
);

CREATE TABLE IF not EXISTS  MoviesData(
	MoviesID INT(6) AUTO_INCREMENT PRIMARY KEY,
	MoviesName VARCHAR(50) NOT NULL,
	ActorsFK INT(6)
);

ALTER TABLE MoviesData -- ALTERAR TABELA INSERINDO CHAVE ESTRANGEIRA
ADD FOREIGN KEY (ActorsFK) REFERENCES Actors(ActorsID);

Create  table if not EXISTS SeriesData(
	SeriesID INT(6) AUTO_INCREMENT PRIMARY KEY,
	SeriesData VARCHAR(50) NOT NULL,
	ActorsFK INT(6),
	FOREIGN KEY (ActorsFK) REFERENCES Actors(ActorsID)
);
show tables;

-- ---------- inserções DO DAODS -------------
-- Inserções de Atores:
INSERT INTO Actors (ActorsName) VALUES
("Denzel Washington"),
("Keanu Reeves"),
("Nicole Kidman"),
("Viola Davis"),
("Saoirse Ronan"),
("Juliane Moore"),
("Joaquin Phoenix"),
("Tilda Swinton");

-- Inserções de Atores em Filmes:
INSERT INTO MoviesData VALUES
(NULL, "Matrix", 2),
(NULL, "Advogado do Diabo", 2),
(NULL, "Constantine", 8),
(NULL, "Constantine", 2),
(NULL, "A Mulher Rei", 4);

-- -- Inserções de Atores em Séries:
INSERT INTO SeriesData VALUES
(NULL, "Knuckles", 2),
(NULL, "Adoráveis Mulheres", 5),
(NULL, "Duas Rainhas", 5),
(NULL, "Foe", 4);

select * from moviesData; 
select * from seriesData; 
select * from Actors;
-- --------------- tarefa -----------------------------------------------
-- ALTER USER 'root'@'localhost' IDENTIFIED WITH 'mysql_native_password' BY 'admin';
-- FLUSH PRIVILEGES;
-- funçaõ para a tabela moviesdata
-- comando para visualizar as chaves estrangeiras
SELECT 
    constraint_name 
FROM 
    information_schema.table_constraints 
WHERE 
    table_name = 'moviesData' 
    AND constraint_type = 'FOREIGN KEY';
-- --------------------------------
select * from moviesdata;
-- após, excluir 1 por 1
ALTER TABLE MoviesData   
DROP FOREIGN KEY moviesdata_ibfk_1;
-- ALTER TABLE Moviesdata
-- DROP FOREIGN KEY moviesdata_ibfk_2;
-- apos apagar a coluna
ALTER TABLE MoviesData
DROP COLUMN ActorsFK;
-- verificar novamente se a colunafoi apagada
select * from moviesdata;
-- ----------------------------------------------------------------
-- funçaõ para a tabela seriesdata
-- comando para visualizar as chaves estrangeiras
SELECT 
    constraint_name 
FROM 
    information_schema.table_constraints 
WHERE 
    table_name = 'seriesData' 
    AND constraint_type = 'FOREIGN KEY';
-- --------------------------------
select * from seriesdata;
-- após, excluir 1 por 1
ALTER TABLE seriesData   
DROP FOREIGN KEY seriesdata_ibfk_1;
-- ALTER TABLE Moviesdata
-- DROP FOREIGN KEY moviesdata_ibfk_2;
-- apos apagar a coluna
ALTER TABLE seriesData
DROP COLUMN ActorsFK;
-- verificar novamente se a colunafoi apagada
select * from seriesdata;
-- CHAVES ESTRANGEIRAS APAGADAS --------------------------------

-- -----------------
CREATE TABLE if not exists ActorMovies( 
	actorMovieId INTEGER AUTO_INCREMENT PRIMARY KEY,
	ActorsID INT(6), 
	MoviesID INT(6), 
	FOREIGN KEY (ActorsID) REFERENCES Actors(ActorsID), 
	FOREIGN KEY (MoviesID) REFERENCES MoviesData(MoviesID));
SHOW TABLES;
-- INSERIR OS DADOS --------------------------------------------
INSERT INTO ActorMovies (ActorsID, MoviesID)
VALUES
    (2, 1), -- Keanu Reeves em Matrix
    (2, 2), -- Keanu Reeves em Advogado do Diabo
    (8, 3), -- Joaquin Phoenix em Constantine
    (2, 4), -- Keanu Reeves em Constantine
    (4, 5); -- Viola Davis em A Mulher Rei

select * from actormovies;

-- CRIAR A TABELA ACTORSERIES ------------------------
-- drop TABLE actorseries;
CREATE TABLE if not exists ActorSeries(
	actorSeriesId INTEGER AUTO_INCREMENT PRIMARY KEY,
ActorsID INT(6), 
seriesID INT(6), 
FOREIGN KEY (ActorsID) REFERENCES Actors(ActorsID), 
FOREIGN KEY (seriesID) REFERENCES seriesData(seriesID));
SHOW create TABLE actormovies;

-- INSERIR OS DADOS NA TABELA ActorSeries
INSERT INTO ActorSeries (ActorsID, SeriesID)
VALUES
    (2, 1), -- Keanu Reeves em Knuckles
    (2, 2), -- Keanu Reeves em Adoráveis Mulheres
    (2, 3), -- Keanu Reeves em Duas Rainhas
    (4, 4); -- Viola Davis em Foe

-- Verificar os dados inseridos na tabela ActorSeries
SELECT * FROM ActorSeries;








-- ---------- seleções -------------
SELECT * FROM MoviesData M JOIN Actors A on A.ActorsID = M.ActorsFK;

SELECT * FROM SeriesData S JOIN Actors A on A.ActorsID = S.ActorsFK;

SELECT * FROM MoviesData M JOIN Actors A ON A.ActorsID = M.ActorsFK, 
	            SeriesData S JOIN Actors Ac on Ac.ActorsID = S.ActorsFK;

SELECT * FROM MoviesData M JOIN Actors A ON A.ActorsID = M.ActorsFK
	JOIN 
	            SeriesData S JOIN Actors Ac on Ac.ActorsID = S.ActorsFK;

SELECT A.ActorsName, MoviesName, SeriesData FROM MoviesData M JOIN Actors A ON A.ActorsID = M.ActorsFK
	JOIN 
	            SeriesData S JOIN Actors Ac on Ac.ActorsID = S.ActorsFK;


-- UNION para MOSTRAR TODAS AS OBRAS (Tanto Filmes quanto Séries)

SELECT * FROM MoviesData M JOIN Actors A on A.ActorsID = M.ActorsFK
UNION
SELECT * FROM SeriesData S JOIN Actors A on A.ActorsID = S.ActorsFK;
----------------------------------------
-- Caso a sua estrutura Movies e Seires possam ter mais de um Actor então sua estrutura é de N:N, muitos para muitos. Então deve ser criado 2 tabelas de ralacionamento para MoviesData e SeriesData:

