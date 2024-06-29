-- mostrar bancos de dados
show databases;

-- Remover a base de dados se existir
DROP DATABASE if EXISTS aulaseg;

-- Criar a nova base de dados
create database if not EXISTS aulaSEG;
show databases;
-- usar a base de dados
USE aulaseg;
-- Mostrar tabelas
show tables;

-- Criar tabela Pai
CREATE TABLE Pai (
    Cod_Pai INT NOT NULL PRIMARY KEY AUTO_INCREMENT, 
    Nome_Pai VARCHAR(50) NOT NULL, 
    Idade_Pai TINYINT NOT NULL
);

show tables;

CREATE TABLE IF NOT EXISTS Pai (
    Cod_Pai INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    Nome_Pai VARCHAR(50) NOT NULL,
    Idade_Pai TINYINT NOT NULL
);

desc pai;

-- Criar tabela Filho
CREATE TABLE IF NOT EXISTS Filho (
    Cod_Filho INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    Cod_Pai INT NOT NULL,
    Nome_Filho VARCHAR(30) NOT NULL,
    Sexo_Filho CHAR(1) NOT NULL CHECK (Sexo_Filho IN ('F', 'M')),
    FOREIGN KEY (Cod_Pai) REFERENCES Pai (Cod_Pai)
);
desc filho;

-- Inserir dados na tabela Pai
INSERT INTO Pai (Nome_Pai, Idade_Pai) VALUES 
    ("Daniel de Souza Leão Sobrinho", 62),
    ("João Carlos da Silva", 38),
    ("Fernando de Oliveira", 36),
    ("Homi Seu Mininu", 29)
;

-- Inserir dados na tabela Filho
INSERT INTO Filho VaLUES 
    (NULL, 1, "Renata de Oliveira Leão", "F"),
    (NULL, 1, "Fernando de Oliveira Leão", "M"),
    (NULL, 1, "Roberta de Oliveira Leão", "F"),
    (NULL, 1, "Jairo de Oliveira Leão", "M"),
    (NULL, 2, "Giovanna da Silva", "F"),
    (NULL, 3, "Lucas Ribeiro Oliveira", "M"),
    (NULL, 3, "Helder Ribeiro Oliveira", "M")
;

select * from pai;
select * from filho;


-- Selecionar Pai e Filho com INNER JOIN
SELECT 
    Pai.Nome_Pai AS 'Nome do Pai',
    Filho.Nome_Filho AS 'Nome do Filho',
    Filho.Sexo_Filho AS Sexo
FROM Pai 
    INNER JOIN Filho ON Pai.Cod_Pai = Filho.Cod_Pai
;
    
-- Selecionar tudo de Pai e Filho com INNER JOIN
SELECT * FROM Pai 
    INNER JOIN Filho ON Pai.Cod_Pai = Filho.Cod_Pai
;

-- Selecionar Pai e Filho com LEFT JOIN
SELECT 
    Pai.Nome_Pai AS 'Nome do Pai',
    Filho.Nome_Filho AS 'Nome do Filho',
    Filho.Sexo_Filho AS Sexo
FROM Pai 
    LEFT OUTER JOIN Filho
    ON (Pai.Cod_Pai = Filho.Cod_Pai)
;

-- Selecionar Pai sem filho
SELECT 
    Pai.Nome_Pai AS 'Nome do Pai',
    Filho.Nome_Filho AS 'Nome do Filho',
    Filho.Sexo_Filho AS Sexo 
FROM Pai 
LEFT OUTER JOIN Filho ON (Pai.Cod_Pai = Filho.Cod_Pai)
where filho.nome_filho is null
;


