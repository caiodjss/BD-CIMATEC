CREATE DATABASE aulaTrigger;
use aulaTrigger;

CREATE TABLE Produtos (
	Referencia VARCHAR (3) PRIMARY KEY,
    Descricao VARCHAR(50) UNIQUE,
    Estoque INT NOT NULL DEFAULT 0
);

INSERT INTO Produtos VALUES ("001", "Feijão", 10);
INSERT INTO Produtos VALUES ("002", "Arroz", 5);
INSERT INTO Produtos VALUES ("003", "Farinha", 15);

CREATE TABLE ItensVenda (
	Venda INT,
    Produto VARCHAR (3),
    Quantidade INT
);

INSERT INTO ItensVenda VALUES (1, "001", 3);
INSERT INTO ItensVenda VALUES (1, "002", 1);
INSERT INTO ItensVenda VALUES (1, "003", 5);

select * from ItensVenda;
select * from Produtos;