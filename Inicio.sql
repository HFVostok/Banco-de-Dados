CREATE DATABASE AUALA_SQL;

DROP DATABASE AUALA_SQL;

CREATE DATABASE DB_AULA25MAR24;

-- USE DB_AULA25MAR24; 

CREATE TABLE fornecedor(

Fcodigo INT NOT NULL,
Fnome VARCHAR (30) NOT NULL,
Status INT,
Cidade VARCHAR (30)
);

-- seleciona dados da tabela
SELECT * FROM fornecedor;

CREATE TABLE IF NOT EXISTS fornecedor(

Fcodigo INT NOT NULL,
Fnome VARCHAR (30) NOT NULL,
Status INT,
Cidade VARCHAR (30)
);

CREATE TABLE IF NOT EXISTS Departamento(

Dcodigo INT NOT NULL,
Dnome VARCHAR (30) NOT NULL,
Cidade VARCHAR (30),
PRIMARY KEY (Dcodigo)
);

CREATE TABLE Empregado(

Ecodigo INT NOT NULL,
Enome VARCHAR (40) NOT NULL,
CPF VARCHAR (15) NOT NULL,
Salario DECIMAL (7,2),
Dcodigo INT NOT NULL,
PRIMARY KEY (Ecodigo,Enome)
);


-- seleciona dados da tabela
SELECT * FROM Empregado;

DROP DATABASE Empregado;

CREATE TABLE IF NOT EXISTS Empregado(

Ecodigo INT NOT NULL,
Enome VARCHAR (40) NOT NULL,
CPF VARCHAR (15) NOT NULL,
Salario DECIMAL (7,2),
Dcodigo INT NOT NULL,
PRIMARY KEY (Ecodigo,Enome)
FOREIGN KEY (Decodigo) REFERENCES Departamento
);

ALTER TABLE Empregado ADD sexo CHAR(1);

ALTER TABLE Empregado DROP sexo;

SELECT * FROM Empregado;

ALTER TABLE Empregado RENAME TO Funcionario;

ALTER TABLE fornecedor ALTER COLUMN Status TYPE INT ativo TYPE BOOLEAN;