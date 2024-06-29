-- UNEMAT – Universidade Estadual do Mato Grosso
-- Josevaldo Moreira
-- Prof. Esp. Elton Ricelli Ferreira de Rezende
-- Disciplina de Introdução a Banco de Dados (4º Semestre)
-- DB_Avaliação03
-- Mostrar bancos de dados existentes
SHOW DATABASES;

-- Elimine o banco de dados existente, se existir
DROP DATABASE IF EXISTS Companhia;
-- Criação do banco de dados
CREATE DATABASE IF NOT EXISTS Companhia;
USE Companhia;

-- -------------------------- CRIAÇÃO DAS ESTRUTURAS ------------------------
-- Criar Tabela Departmento
CREATE TABLE IF NOT EXISTS Departamento (
    DeptID INT AUTO_INCREMENT PRIMARY KEY,
    DeptName VARCHAR(50) NOT NULL UNIQUE,
    GerenteID INT,
    DataInicio DATE
);
desc Departamento;


-- Criar Tabela DepLoc
CREATE TABLE IF NOT EXISTS DepLoc (
    DeptID INT,
    Localizacao VARCHAR(50) NOT NULL,
    PRIMARY KEY (DeptID,    Localizacao),
    FOREIGN KEY (DeptID) REFERENCES Departamento(DeptID)
);

DESC Deploc;

-- Criar Tabela Projeto
CREATE TABLE IF NOT EXISTS Projeto (
    ProjID INT AUTO_INCREMENT PRIMARY KEY,
    ProjName VARCHAR(50) NOT NULL UNIQUE,
    DeptID INT,
    Localizacao VARCHAR(50) NOT NULL,
    FOREIGN KEY (DeptID) REFERENCES Departamento(DeptID)
);

describe Projeto;

-- Criar Tabela funcionaro
CREATE TABLE IF NOT EXISTS Funcionario (
    EmpID INT AUTO_INCREMENT PRIMARY KEY,
    EmpName VARCHAR(50) NOT NULL,
    RG CHAR(9) NOT NULL UNIQUE,
    Endereco VARCHAR(100),
    Salario DECIMAL(10, 2),
    Sexo CHAR(1) not null check (sexo in ('M','F')),
    DataNasc DATE,
    DeptID INT,
    SupervisorID INT,
    FOREIGN KEY (DeptID) REFERENCES Departamento(DeptID),
    FOREIGN KEY (SupervisorID) REFERENCES Funcionario(EmpID)
);

desc Funcionario;
-- Adicionar chave estrangeira na tabela departamento
ALTER TABLE departamento 
    ADD FOREIGN KEY (GerenteID) REFERENCES Funcionario(EmpID);

-- Tabela Trabalhador
CREATE TABLE IF NOT EXISTS Trabalhador (
    EmpID INT,
    ProjID INT,
    Hours DECIMAL(3, 1),
    PRIMARY KEY (EmpID, ProjID),
    FOREIGN KEY (EmpID) REFERENCES Funcionario(EmpID),
    FOREIGN KEY (ProjID) REFERENCES Projeto(ProjID)
);

-- Tabela Dependente
CREATE TABLE IF NOT EXISTS Dependente (
    EmpID INT,
    DependenteNome VARCHAR(50),
    Sexo CHAR(1),
    DataNasc DATE,
    Relacao VARCHAR(25),
    PRIMARY KEY (EmpID, DependenteNome),
    FOREIGN KEY (EmpID) REFERENCES Funcionario(EmpID)
);

-- Inserir dados de exemplo
-- Inserir dados na tabela Department
INSERT INTO Departamento (DeptName, GerenteID, DataInicio) VALUES
('Recursos Humanos', NULL, '2020-01-01'),
('Engenharia', NULL, '2020-01-01'),
('Marketing', NULL, '2020-01-01');

-- Inserir dados na tabela DepLoc
INSERT INTO DepLoc (DeptID, Localizacao) VALUES
(1, 'Rondonópolis'),
(2, 'Alto Araguaia'),
(3, 'Pedra Preta');

-- Inserir dados na tabela Funcionario
INSERT INTO Funcionario (EmpName, RG, Endereco, Salario, Sexo, DataNasc, DeptID, SupervisorID) VALUES
('Jose Santos', '123456789', 'Rondonópolis', 60000, 'M', '1980-01-01', 1, NULL),
('Janaina Pereira', '987654321', 'Alto Araguaia', 65000, 'F', '1985-02-02', 2, 1),
('Alice Souza', '555555555', 'Pedra Preta', 70000, 'F', '1990-03-03', 3, 1);

-- Atualizar ManagerID na tabela Department
UPDATE Departamento SET GerenteID = 1 WHERE DeptID = 1;
UPDATE Departamento SET GerenteID = 2 WHERE DeptID = 2;
UPDATE Departamento SET GerenteID = 3 WHERE DeptID = 3;

-- Inserir dados na tabela Projeto
INSERT INTO Projeto (ProjName, DeptID,  Localizacao) VALUES
('Projeto A', 1, 'Rondonópolis'),
('Projeto B', 2, 'Alto Araguaia'),
('Projeto C', 3, 'Pedra Preta');

-- Inserir dados na tabela Trabalhador
INSERT INTO Trabalhador (EmpID, ProjID, Hours) VALUES
(1, 1, 10.5),
(2, 2, 20.0),
(3, 3, 30.0),
(1, 2, 5.0),
(2, 3, 10.0);

-- Inserir dados na tabela Dependente
INSERT INTO Dependente (EmpID, DependenteNome, Sexo, DataNasc, Relacao) VALUES
(1, 'Anna da Silva', 'F', '2010-04-04', 'Filha'),
(2, 'Tom Jerry', 'M', '2012-05-05', 'Filho'),
(3, 'Joao macedo', 'M', '2014-06-06', 'Filho');

-- Consultar dados para verificar
SELECT * FROM Departamento;
SELECT * FROM DepLoc;
SELECT * FROM Funcionario;
SELECT * FROM Projeto;
SELECT * FROM Trabalhador;
SELECT * FROM Dependente;
