INSERT INTO produtos (nome, preco, estoque)
	values ("caneta", "2.5", 50),
    ("lapis", "1.5", 50),
    ("borracha", "2.5", 50),
    ("lapiseira", "5.5", 40),
    ("apontador", "3.5", 20);
    
INSERT INTO clientes (nome, email, telefone)
	values ("Caio", "cdj@outlook.com.br", "71991806158"),
    ("Glaucia", "gau110@gmail.com", "71996597942"),
    ("Jorge", "jorge@jorge.com", "71991913232"),
    ("Chico", "chico@chico.com", "71981812121"),
    ("Bimo", "bimo@bimo.com", "71971711111");
    
INSERT INTO pedidos (data_pedido, clienteID_FK)
	values ("2024/01/01", 1),
    ("2024/02/02", 2),
    ("2024/03/03", 3),
    ("2024/04/04", 4),
    ("2024/05/05", 5);
    
INSERT INTO DetalhesPedidos (quantidade, preco_unitario)
	values (3, "3.5"),
    (7, "2.5"),
    (4, "5.5"),
    (3, "3.5"),
    (3, "1.5");