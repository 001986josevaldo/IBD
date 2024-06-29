-- Ciência da Computação
-- Introdução a Banco de Dados
-- Josevaldo moriera 

show databases;

DROP DATABASE IF EXISTS ATIVIDADE_02; -- apaga o banco, CASO ELE JÁ EXISTA.
CREATE DATABASE IF NOT EXISTS ATIVIDADE_02;

USE ATIVIDADE_02;
SHOW TABLES;

 -- -------------------------- CRIAÇÃO DA ESTRUTURA --------------------------------------
-- criação da tabela Estados
CREATE TABLE IF NOT EXISTS Estados(
    lCidade char(20),
    lEstado char(2) PRIMARY KEY
    );

-- Confirmação da tabela Estados
desc Estados;

-- Criação da tabela de Cadastros
CREATE TABLE IF NOT EXISTS Cadastros(
	pCPF varchar(11) PRIMARY KEY NOT NULL DEFAULT '99999999999',
    pNome_Cliente VarChar(32) NOT NULL,
	pDtNasc Date,
    lEstado char(2) NOT NULL,
    CONSTRAINT fkCadEst FOREIGN KEY (lEstado) REFERENCES Estados(lEstado)
    );

-- Confirmação da Estrutura Cadastros
desc Cadastros;

-- criação da tabela telefone 
CREATE TABLE IF NOT EXISTS Telefone(
    pCPF varchar(11),
    tDDD int(3),
    tNumero varchar(10) NOT NULL,
    CONSTRAINT fk_PesTelefone FOREIGN KEY (pCPF) REFERENCES Cadastros (pCPF)
    );

-- Confirmação da tabela telefone
desc telefone;

SHOW TABLES;

-- ------------------------ INSERÇÃO DOS DADOS ----------------------------

-- inserir os dados
INSERT INTO Estados (lCidade, lEstado) values
    ('Cuiaba','MT'),
    ('Campo Grande','MS'),
    ('Goiânia','GO');
INSERT INTO Estados (lCidade, lEstado) values
    ('Rio Branco','AC'),
    ('Maceió','AL'),
    ('Macapá','AP');
INSERT INTO Estados (lCidade, lEstado) values
    ('Manaus','AM'),
    ('Salvador', 'BA'),
    ('Fortaleza','CE'),
    ('Brasilia','DF'),
    ('Vitória','ES'),
    ('Belém','PA'),
    ('João Pessoa','PB'),
    ('Curitiba','PR'),
    ('Recife','PE'),
    ('Teresina','PI'),
    ('Rio de Janeiro','RJ'),
    ('Natal','RN'),
    ('Porto Alegre','RS'),
    ('Porto Velho','RO'),
    ('Boa Vista','RR'),
    ('Florianópolis', 'SC'),
    ('São Paulo','SP'),
    ('Palmas','TO');
INSERT INTO Estados (lCidade, lEstado) values
    ('Aracaju','SE'),
    ('Belo Horizonte','MG');

-- Confirmação dos Estados
select *from estados;

-- inserir os dados
INSERT INTO Cadastros (pCPF, pNome_Cliente, pDtNasc,lEstado) values
    ('01234567800', 'Josevaldo Moreira', '1986-06-12','MT'),
    ('98765432100','Italo Ruan','1990-09-02','MS'),
    ('98765432101','Joao gabriel','1990-09-02','GO');

-- Confirmação dos cadastros
select *from cadastros;

-- criação da tabela telefone 
CREATE TABLE IF NOT EXISTS Telefone(
    pCPF varchar(11),
    tDDD int(2),
    tNumero varchar(10) NOT NULL,
    CONSTRAINT fk_PesTelefone FOREIGN KEY (pCPF) REFERENCES Cadastros (pCPF)
    );

-- Confirmação da tabela telefone
desc telefone;

-- inserir os dados
INSERT INTO Telefone (pCPF, tDDD, tNumero) values
    ('01234567800',66,'99874540'),
    ('98765432100',65,'99644512'),
    ('98765432101',64,'99874561');
INSERT INTO Telefone (pCPF, tDDD, tNumero) values
    ('01234567800',66,'99874512'),
    ('98765432100',65,'99644513'),
    ('98765432101',64,'998745611'),
    ('98765432101',64,'9874501');

-- Confirmação da tabela telefone
select * from Telefone;

-- ----------------------------- VISUALIZAÇÃO -----------------------------
-- exibir todas as informações de um cadastro específico
SELECT * FROM Cadastros WHERE pCPF = '01234567800';

-- exibir todas os dados das 3 tabelas
SELECT c.pCPF, c.pNome_Cliente, c.pDtNasc,t.tddd, t.tnumero, e.lCidade, e.lEstado 
	FROM Cadastros c INNER JOIN Telefone t ON c.pCPF = t.pCPF 
	INNER JOIN Estados e ON c.lEstado = e.lEstado
;

-- DROP VIEW IF EXISTS vw_CadastrosCompletos; -- para apagara uma view
-- criação de view
CREATE VIEW vw_CadastrosCompletos 
	AS SELECT c.pCPF, c.pNome_Cliente, c.pDtNasc, t.tddd, t.tnumero, e.lCidade, e.lEstado 
	FROM Cadastros c LEFT JOIN Telefone t ON c.pCPF = t.pCPF 
	LEFT JOIN Estados e ON c.lEstado = e.lEstado
;
-- visualização
SELECT * FROM vw_CadastrosCompletos;
-- PARABÉNS...
