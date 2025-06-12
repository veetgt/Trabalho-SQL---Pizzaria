CREATE DATABASE IF NOT EXISTS PizzariaDoMessi;
USE PizzariaDoMessi;
DROP TABLE IF EXISTS Entrega;
DROP TABLE IF EXISTS ItemPedido;
DROP TABLE IF EXISTS Pedido;
DROP TABLE IF EXISTS Produto;
DROP TABLE IF EXISTS Entregador;
DROP TABLE IF EXISTS Cliente;
CREATE TABLE Cliente (
    idCliente INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(45),
    telefone VARCHAR(15),
    endereco VARCHAR(60)
);
CREATE TABLE Produto (
    idProduto INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(45),
    preco DECIMAL(10,2)
);
CREATE TABLE Pedido (
    idPedido INT PRIMARY KEY AUTO_INCREMENT,
    idCliente INT,
    total DECIMAL(10,2),
    FOREIGN KEY (idCliente) REFERENCES Cliente(idCliente)
);
CREATE TABLE ItemPedido (
    idItem INT PRIMARY KEY AUTO_INCREMENT,
    quantidade INT,
    Pedido_idPedido INT,
    Produto_idProduto INT,
    FOREIGN KEY (Pedido_idPedido) REFERENCES Pedido(idPedido),
    FOREIGN KEY (Produto_idProduto) REFERENCES Produto(idProduto)
);
CREATE TABLE Entregador (
    idEntregador INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(45)
);
CREATE TABLE Entrega (
    idEntrega INT PRIMARY KEY AUTO_INCREMENT,
    idPedido INT,
    Entregador_idEntregador INT,
    FOREIGN KEY (idPedido) REFERENCES Pedido(idPedido),
    FOREIGN KEY (Entregador_idEntregador) REFERENCES Entregador(idEntregador)
);
INSERT INTO Cliente (nome, telefone, endereco) VALUES
('Cliente1', '11999990000', 'Casa1'),
('Cliente2', '11888887777', 'Casa2'),
('Cliente3', '11777777777', 'Casa3');
INSERT INTO Produto (nome, preco) VALUES
('Calabresa', 30.00),
('Frango com Catupiry', 30.00),
('Banana', 30.00),
('Quatro Queijos', 30.00);
INSERT INTO Pedido (idCliente, total) VALUES
(1, 60.00),
(2, 60.00),
(3, 90.00);
INSERT INTO ItemPedido (Pedido_idPedido, Produto_idProduto, quantidade) VALUES
(1, 1, 1),  -- 1 Calabresa
(1, 2, 2),  -- 2 Frango com Catupiry
(2, 4, 3);  -- 3 Quatro Queijos
INSERT INTO Entregador (nome) VALUES
('Motoboy1'),
('Motoboy2'),
('Motoboy3');
INSERT INTO Entrega (idPedido, Entregador_idEntregador) VALUES
(1, 1),
(2, 2),
(3, 3);
SELECT DISTINCT
    Pedido.idPedido,
    Cliente.nome AS cliente,
    Pedido.total,
    Entregador.nome AS entregador
FROM Pedido
JOIN Cliente ON Pedido.idCliente = Cliente.idCliente
LEFT JOIN Entrega ON Pedido.idPedido = Entrega.idPedido
LEFT JOIN Entregador ON Entrega.Entregador_idEntregador = Entregador.idEntregador;