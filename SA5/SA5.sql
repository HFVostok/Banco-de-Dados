-- Criar banco de dados
CREATE DATABASE hiago_fernando_de_jesus;

-- Usar o banco de dados criado
USE hiago_fernando_de_jesus;

-- Tabela "Clientes"
CREATE TABLE Clientes (
    ID INT PRIMARY KEY,
    Nome VARCHAR(50) NOT NULL,
    Sobrenome VARCHAR(50) NOT NULL,
    Email VARCHAR(100) UNIQUE NOT NULL,
    Telefone VARCHAR(20)
);

-- Tabela "Pedidos"
CREATE TABLE Pedidos (
    ID INT PRIMARY KEY,
    ID_Cliente INT,
    Data_Pedido DATE,
    Total DECIMAL(10, 2),
    FOREIGN KEY (ID_Cliente) REFERENCES Clientes(ID)
);

-- Tabela "Produtos"
CREATE TABLE Produtos (
    ID INT PRIMARY KEY,
    Nome VARCHAR(100) NOT NULL,
    Descrição TEXT,
    Preço DECIMAL(10, 2) CHECK (Preço >= 0)
);

-- Tabela "Categorias"
CREATE TABLE Categorias (
    ID INT PRIMARY KEY,
    Nome VARCHAR(100) NOT NULL
);

-- Tabela "Pedidos_Produtos" (Tabela de junção)
CREATE TABLE Pedidos_Produtos (
    ID_Pedido INT,
    ID_Produto INT,
    PRIMARY KEY (ID_Pedido, ID_Produto),
    FOREIGN KEY (ID_Pedido) REFERENCES Pedidos(ID),
    FOREIGN KEY (ID_Produto) REFERENCES Produtos(ID)
);

-- Tabela "Produtos_Categorias" (Tabela de junção)
CREATE TABLE Produtos_Categorias (
    ID_Produto INT,
    ID_Categoria INT,
    PRIMARY KEY (ID_Produto, ID_Categoria),
    FOREIGN KEY (ID_Produto) REFERENCES Produtos(ID),
    FOREIGN KEY (ID_Categoria) REFERENCES Categorias(ID)
);

-- Tabela "Funcionários" (anteriormente "Empregados")
CREATE TABLE Funcionários (
    ID INT PRIMARY KEY,
    Nome VARCHAR(50) NOT NULL,
    Sobrenome VARCHAR(50) NOT NULL,
    Cargo VARCHAR(50) CHECK (Cargo IN ('Gerente', 'Vendedor', 'Atendente'))
);

-- Tabela "Vendas"
CREATE TABLE Vendas (
    ID INT PRIMARY KEY,
    ID_Produto INT,
    ID_Cliente INT,
    Data_Venda DATE,
    Quantidade INT,
    FOREIGN KEY (ID_Produto) REFERENCES Produtos(ID),
    FOREIGN KEY (ID_Cliente) REFERENCES Clientes(ID)
);

-- Alterações de Tabelas
ALTER TABLE Clientes ADD Telefone VARCHAR(20);

ALTER TABLE Produtos MODIFY Descrição TEXT NULL;

ALTER TABLE Pedidos DROP FOREIGN KEY FK_Pedidos_Clientes;

-- Renomear a tabela "Empregados" para "Funcionários"
ALTER TABLE Empregados RENAME TO Funcionários;


INSERT INTO Clientes (ID, Nome, Sobrenome, Email, Telefone)
VALUES
    (1, 'João', 'Silva', 'joao.silva@email.com', '123456789'),
    (2, 'Maria', 'Souza', 'maria.souza@email.com', '987654321'),
    (3, 'Pedro', 'Almeida', 'pedro.almeida@email.com', '555123456'),
    (4, 'Ana', 'Santos', 'ana.santos@email.com', '999888777'),
    (5, 'Luiza', 'Ferreira', 'luiza.ferreira@email.com', '777888999');

INSERT INTO Pedidos (ID, ID_Cliente, Data_Pedido, Total)
VALUES
    (1, 1, '2024-04-10', 150.00),
    (2, 2, '2024-04-11', 200.00),
    (3, 3, '2024-04-12', 80.00),
    (4, 4, '2024-04-13', 300.00),
    (5, 5, '2024-04-14', 120.00),
    (6, 1, '2024-04-15', 250.00),
    (7, 2, '2024-04-16', 180.00),
    (8, 3, '2024-04-17', 90.00),
    (9, 4, '2024-04-18', 210.00),
    (10, 5, '2024-04-19', 100.00);

INSERT INTO Produtos (ID, Nome, Descrição, Preço)
VALUES
    (1, 'Camiseta', 'Camiseta de algodão branca', 29.99),
    (2, 'Calça Jeans', 'Calça jeans azul clara', 49.99),
    (3, 'Tênis Esportivo', 'Tênis para corrida preto', 79.99),
    (4, 'Mochila', 'Mochila escolar resistente', 39.99),
    (5, 'Relógio Analógico', 'Relógio de pulso dourado', 99.99),
    (6, 'Caneca Personalizada', 'Caneca de porcelana com foto', 9.99),
    (7, 'Fone de Ouvido Bluetooth', 'Fone de ouvido sem fio preto', 59.99),
    (8, 'Notebook', 'Notebook com processador Intel', 899.99),
    (9, 'Smartphone', 'Smartphone Android com câmera dupla', 399.99),
    (10, 'Mesa de Escritório', 'Mesa de escritório com gavetas', 149.99),
    (11, 'Ventilador', 'Ventilador de torre silencioso', 69.99),
    (12, 'Batedeira', 'Batedeira elétrica com várias velocidades', 49.99),
    (13, 'Panela de Pressão', 'Panela de pressão em inox', 29.99),
    (14, 'Tapete Decorativo', 'Tapete felpudo para sala', 19.99),
    (15, 'Cadeira Gamer', 'Cadeira ergonômica para jogos', 199.99);

INSERT INTO Pedidos_Produtos (ID_Pedido, ID_Produto)
VALUES
    (1, 2),
    (1, 5),
    (2, 8);

INSERT INTO Produtos_Categorias (ID_Produto, ID_Categoria)
VALUES
    (1, 1),
    (2, 1),
    (3, 2);

INSERT INTO Funcionários (ID, Nome, Sobrenome, Cargo)
VALUES
    (1, 'Carlos', 'Silveira', 'Gerente'),
    (2, 'Fernanda', 'Costa', 'Vendedor'),
    (3, 'Ricardo', 'Lima', 'Atendente'),
    (4, 'Patrícia', 'Santos', 'Vendedor'),
    (5, 'Laura', 'Ferreira', 'Atendente');

UPDATE Produtos
SET Preço = 59.99
WHERE ID = 3;

UPDATE Funcionários
SET Cargo = 'Supervisor'
WHERE ID = 1;

DELETE FROM Clientes
WHERE ID = 5;

DELETE FROM Pedidos
WHERE ID_Cliente = 5;

DELETE FROM Produtos
WHERE ID = 14;

DELETE FROM Pedidos_Produtos
WHERE ID_Produto = 14;

DELETE FROM Funcionários
WHERE ID = 3;

SELECT *
FROM Pedidos
WHERE Status = 'Em andamento';

SELECT c.Nome, p.Data_Pedido, p.Total
FROM Pedidos p
JOIN Clientes c ON p.ID_Cliente = c.ID
WHERE p.Data_Pedido >= DATE_SUB(CURDATE(), INTERVAL 30 DAY);

SELECT p

