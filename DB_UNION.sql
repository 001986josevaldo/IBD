show databases;
create database aulaSEG;
show databases;
USE aulaseg;
show tables;

create table pai(
cod_Pai int not null primary key auto_increment, 
nome_pai char(50) not null, 
idade_pai tinyint not null);

show tables;

DROP DATABASE IF EXISTS BD_UNION;
CREATE DATABASE BD_UNION;
USE BD_UNION;

CREATE TABLE IF NOT EXISTS Pai (
    Cod_Pai INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    Nome_Pai VARCHAR(50) NOT NULL,
    Idade_Pai TINYINT NOT NULL
);

desc pai;

CREATE TABLE IF NOT EXISTS Filho (
    Cod_Filho INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    Cod_Pai INT NOT NULL REFERENCES Pai (Cod_pai),
    Nome_Filho VARCHAR(30) NOT NULL,
    Sexo_Filho CHAR(01) NOT NULL CHECK (Sexo_Filho IN ('F' , 'M'))
);
desc filho;

INSERT INTO Pai (Nome_Pai, Idade_Pai) VALUES 
("Daniel de Souza Leão Sobrinho", 62),
("João Carlos da Silva", 38),
("Fernando de Oliveira", 36),
("Homi Seu Mininu", 29);

INSERT INTO Filho VaLUES 
(NULL, 1, "Renata de Oliveira Leão", "F"),
(NULL, 1, "Fernando de Oliveira Leão", "M"),
(NULL, 1, "ROberta de Oliveira Leão", "F"),
(NULL, 1, "JAIro de Oliveira Leão", "M"),
(NULL, 2, "GiOVanna da Silva", "F"),
(NULL, 3, "LuCAs Ribeiro Oliveira", "M"),
(NULL, 3, "HeLDer Ribeiro Oliveira", "M");

select * from pai;
select * from filho;


SELECT Pai.Nome_Pai as 'Nome do Pai',
                Filho.Nome_Filho  as 'Nome do Filho',
                Filho.Sexo_Filho AS SexoFROM Pai INNER 
		JOIN Filho ON (Pai.Cod_Pai = Filho.Cod_Pai);

    
SELECT *
FROM Pai INNER JOIN Filho
ON Pai.Cod_Pai = Filho.Cod_Pai;

SELECT Pai.Nome_Pai AS 'Nome do Pai',
Filho.Nome_Filho AS 'Nome do Filho',
Filho.Sexo_Filho AS Sexo
FROM Pai LEFT OUTER JOIN Filho
ON (Pai.Cod_Pai = Filho.Cod_Pai);

SELECT Pai.Nome_Pai AS 'Nome do Pai',
Filho.Nome_Filho AS 'Nome do Filho',
Filho.Sexo_Filho AS Sexo 
FROM Pai LEFT OUTER JOIN Filho 
ON (Pai.Cod_Pai = Filho.Cod_Pai)
where filho.nome_filho is null;


