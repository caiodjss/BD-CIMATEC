CREATE DATABASE estoque;
USE estoque;

CREATE TABLE produto (
	codProduto INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR (30),
    categoria VARCHAR (30),
    unidadeMedida VARCHAR (2),
    fornecedorFK INT,
    FOREIGN KEY (fornecedorFK) REFERENCES fornecedor(codFOrnecedor)
);

CREATE TABLE detalheProduto (
	codDetalhe INT PRIMARY KEY AUTO_INCREMENT,
    estoque INT,
    codBarras VARCHAR (13),
    descricao VARCHAR (100),
    precoVenda DECIMAL (10, 2),
    produtoFK INT,
	FOREIGN KEY (produtoFK) REFERENCES produto(codProduto)
);

CREATE TABLE mapeamentoEstoque (
	codMapeamento INT PRIMARY KEY AUTO_INCREMENT,
    setor INT,
    categoriaFK INT,
    FOREIGN KEY (categoriaFK) REFERENCES produto(categoria),
    estoqueFK INT,
    FOREIGN KEY (estoqueFK) REFERENCES detalheProduto(estoque)
);

CREATE TABLE venda (
	codVenda INT PRIMARY KEY AUTO_INCREMENT,
	desconto DECIMAL (10,2),
    produtoFK INT,
	FOREIGN KEY (produtoFK) REFERENCES produto(codProduto)
);

CREATE TABLE transferencia (
	codTransferencia INT PRIMARY KEY AUTO_INCREMENT,
	produtoFK INT,
	FOREIGN KEY (produtoFK) REFERENCES produto(codProduto)
);

CREATE TABLE devolucao (
	codDevolucao INT PRIMARY KEY AUTO_INCREMENT,
    contador INT,
    vendaFK INT,
    FOREIGN KEY (vendaFK) REFERENCES venda(codVenda)
);

CREATE TABLE fornecedor (
	codFornecedor INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR (30),
    contato INT
);

CREATE TABLE pedidoFornecedor (
	codPedidoFornecedor INT PRIMARY KEY AUTO_INCREMENT,
	produto INT,
	quantidade INT,
	valor INT,
	validade DATE,
	precoCompra INT
);