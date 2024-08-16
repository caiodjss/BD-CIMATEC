create database auladb;
use auladb;

CREATE TABLE Clientes (
	ClienteID INT PRIMARY KEY auto_increment,
    Nome VARCHAR(100) not null,
    Email VARCHAR(100) not null
);

CREATE TABLE Pedidos (
	PedidoID INT PRIMARY KEY,
    DataPedido DATE,
    ClienteID_FK INT,
    FOREIGN KEY (ClienteID_FK) REFERENCES Clientes(ClienteID)
);