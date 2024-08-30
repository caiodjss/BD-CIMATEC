create database exercicio;
use exercicio; 

CREATE TABLE Clientes(
	clienteID INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR (100) NOT NULL
);

CREATE TABLE Pedidos(
	pedidoID INT PRIMARY KEY AUTO_INCREMENT,
    dataPedido DATE NOT NULL,
	clienteID_FK INT NOT NULL,
    FOREIGN KEY (clienteID_FK) REFERENCES Clientes(clienteID)
);

CREATE TABLE Produto(
	produtoID INT PRIMARY KEY AUTO_INCREMENT,
    nomeProduto VARCHAR (40) NOT NULL,
    precoProduto DECIMAL (10, 2) NOT NULL,
    quantidade INT NOT NULL
);

CREATE TABLE DetalhePedido(
	DetalheID INT PRIMARY KEY AUTO_INCREMENT,
    produtoID_FK INT,
	pedidoID_FK INT,
    FOREIGN KEY (produtoID_FK) REFERENCES Produto(produtoID),
    FOREIGN KEY (pedidoID_FK) REFERENCES Pedidos(pedidoID)
);

CREATE TABLE Endereco(
	enderecoID INT PRIMARY KEY AUTO_INCREMENT,
	complemento VARCHAR (100),
    cidade VARCHAR (40),
    clienteID_FK INT NOT NULL,
    FOREIGN KEY (clienteID_FK) REFERENCES Clientes(clienteID)
);

