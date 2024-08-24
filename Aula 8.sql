create database exercicio;
use exercicio;

CREATE TABLE Produtos(
	produto_id INT PRIMARY KEY AUTO_INCREMENT,
	nome VARCHAR(100) not null,
	preco DECIMAL(10, 2) not null,
	estoque INT
);

CREATE TABLE Clientes(
	cliente_id INT PRIMARY KEY AUTO_INCREMENT,
	nome VARCHAR(100),
	email VARCHAR(100),
	telefone VARCHAR(15)
);

CREATE TABLE Pedidos (
	pedido_id INT PRIMARY KEY AUTO_INCREMENT,
	data_pedido DATE,
	clienteID_FK INT,
    FOREIGN KEY (clienteID_FK) REFERENCES Clientes(cliente_id)
);

CREATE TABLE DetalhesPedidos (
	detalhe_id INT PRIMARY KEY AUTO_INCREMENT,
	quantidade INT not null,
	preco_unitario DECIMAL(10, 2),
	pedidoID_FK INT not null,
    produtoID_FK INT not null, 
    FOREIGN KEY (pedidoID_FK) REFERENCES Pedidos(pedido_id),
	FOREIGN KEY (produtoID_FK) REFERENCES Produtos(produto_id)
);