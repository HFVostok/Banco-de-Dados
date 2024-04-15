CREATE DATABASE AULA_SQL;

DROP DATABASE AULA_SQL;

CREATE DATABASE DB_AULA25MAR24;

-- comando sql para criar tabela

CREATE TABLE Fornecedor(
    Fcodigo INT NOT NULL,
    Fnome VARCHAR(30) NOT NULL,
    Status INT,
    Cidade VARCHAR (30)
);

-- selecionar dados da tabela
SELECT * FROM Fornecedor;

-- CRIA A TABELA SE ELA NÃO EXISTIR
-- E SE EXISTIR NÃO ACONTECE NADA INCLUSIVE ERRO

CREATE TABLE IF NOT EXISTS Fornecedor(
    Fcodigo INT NOT NULL,
    Fnome VARCHAR(30) NOT NULL,
    Status INT,
    Cidade VARCHAR (30)
);

CREATE TABLE IF NOT EXISTS Departamento (
    Dcodigo INT NOT NULL,
    Dnome VARCHAR(30) NOT NULL,
    Cidade VARCHAR(30),
    PRIMARY KEY (Dcodigo)
);

SELECT * FROM Departamento;

CREATE TABLE IF NOT EXISTS Empregado(
    Ecodigo INT NOT NULL,
    Enome VARCHAR(40) NOT NULL,
    CPF VARCHAR(15) NOT NULL,
    Salario DECIMAL(7,2),
    Dcodigo INT NOT NULL,
    PRIMARY KEY(Ecodigo,Enome)
);

SELECT * FROM Empregado;

-- apagar a tabela Empregado

DROP TABLE Empregado;

-- criação de tabela com Foreing Key

CREATE TABLE IF NOT EXISTS Empregado(
    Ecodigo INT NOT NULL,
    Enome VARCHAR(40) NOT NULL,
    CPF VARCHAR(15) NOT NULL,
    Salario DECIMAL(7,2),
    Dcodigo INT NOT NULL,
    PRIMARY KEY(Ecodigo,Enome),
    FOREIGN KEY(Dcodigo) REFERENCES Departamento   
);

--Alterar Tabelas com o ALTER TABLE 

--Add coluna (adicionar)
ALTER TABLE Empregado ADD sexo CHAR(1);

--Drop Coluna (remover)
ALTER TABLE Empregado DROP sexo;

--Renomear Tabela 
ALTER TABLE Empregado RENAME TO Funcionario;

--ALTER TABLE tabela ALTER COLUMN campo nome tipo_dado;
ALTER TABLE Fornecedor ALTER COLUMN status TYPE INT ativo TYPE BOOLEAN;
