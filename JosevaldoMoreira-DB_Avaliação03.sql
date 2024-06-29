-- UNEMAT – Universidade Estadual do Mato Grosso
-- Josevaldo Moreira
-- Prof. Esp. Elton Ricelli Ferreira de Rezende
-- Disciplina de Introdução a Banco de Dados (4º Semestre)
-- DB_Avaliação03
-- Show existing databases
SHOW DATABASES;

-- Elimine o banco de dados existente, se existir
DROP DATABASE IF EXISTS Companhia;
-- Criação do banco de dados
CREATE DATABASE IF NOT EXISTS Companhia;
USE Companhia;

-- -------------------------- CRIAÇÃO DAS ESTRUTURAS ------------------------
-- Tabela Departmento
CREATE TABLE IF NOT EXISTS Departamento (
    DeptID INT AUTO_INCREMENT PRIMARY KEY,
    DeptName VARCHAR(50) NOT NULL UNIQUE,
    GerenteID INT,
    DataInicio DATE
);
desc Departamento;


-- Tabela DepLoc
CREATE TABLE IF NOT EXISTS DepLoc (
    DeptID INT,
    Localizacao VARCHAR(50) NOT NULL,
    PRIMARY KEY (DeptID,    Localizacao),
    FOREIGN KEY (DeptID) REFERENCES Departamento(DeptID)
);

DESC Deploc;

-- Tabela Projeto
CREATE TABLE IF NOT EXISTS Projeto (
    ProjID INT AUTO_INCREMENT PRIMARY KEY,
    ProjName VARCHAR(50) NOT NULL UNIQUE,
    DeptID INT,
    Localizacao VARCHAR(50) NOT NULL,
    FOREIGN KEY (DeptID) REFERENCES Departamento(DeptID)
);

describe Projeto;


-- funcionário 
-- Tabela funcionaro
CREATE TABLE IF NOT EXISTS Funcionario (
    EmpID INT AUTO_INCREMENT PRIMARY KEY,
    EmpName VARCHAR(50) NOT NULL,
    SSN CHAR(9) NOT NULL UNIQUE,
    Address VARCHAR(100),
    Salary DECIMAL(10, 2),
    Sexo CHAR(1) not null check (sexo in ('M','F')),
    BirthDate DATE,
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
    DependenteName VARCHAR(50),
    Sex CHAR(1),
    BirthDate DATE,
    Relationship VARCHAR(25),
    PRIMARY KEY (EmpID, DependenteName),
    FOREIGN KEY (EmpID) REFERENCES Funcionario(EmpID)
);

-- Inserir dados de exemplo
-- Inserir dados na tabela Department
INSERT INTO Departamento (DeptName, GerenteID, DataInicio) VALUES
('HR', NULL, '2020-01-01'),
('Engineering', NULL, '2020-01-01'),
('Marketing', NULL, '2020-01-01');

-- Inserir dados na tabela DepLoc
INSERT INTO DepLoc (DeptID, Localizacao) VALUES
(1, 'Rondonópolis'),
(2, 'San Francisco'),
(3, 'Pedra Preta');

-- Inserir dados na tabela Funcionario
INSERT INTO Funcionario (EmpName, SSN, Address, Salary, Sexo, BirthDate, DeptID, SupervisorID) VALUES
('John Doe', '123456789', '123 Elm St', 60000, 'M', '1980-01-01', 1, NULL),
('Jane Smith', '987654321', '456 Oak St', 65000, 'F', '1985-02-02', 2, 1),
('Alice Johnson', '555555555', '789 Pine St', 70000, 'F', '1990-03-03', 3, 1);

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
INSERT INTO Dependente (EmpID, DependenteName, Sex, BirthDate, Relationship) VALUES
(1, 'Anna Doe', 'F', '2010-04-04', 'Daughter'),
(2, 'Tom Smith', 'M', '2012-05-05', 'Son'),
(3, 'Sam Johnson', 'M', '2014-06-06', 'Son');

-- Consultar dados para verificar
SELECT * FROM Departamento;
SELECT * FROM DepLoc;
SELECT * FROM Funcionario;
SELECT * FROM Projeto;
SELECT * FROM Trabalhador;
SELECT * FROM Dependente;
