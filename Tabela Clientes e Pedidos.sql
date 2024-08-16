insert into clientes (nome, email) 
values ("José","josemail@gmail.com"),
("Marcio","marioemail@gmail.com"),
("Acer","aceremail@outlook.com.br"),
("Intel","intel@intel.com");

insert into pedidos (PedidoID, DataPedido, ClienteID_FK) 
values (2, "2024/08/10", 7),
(3, "2024/08/10", 6),
(4, "2024/08/10", 1),
(5, "2024/08/10", 2),
(6, "2024/08/10", 8),
(7, "2024/08/10", 3);

select * from pedidos;
select * from clientes;
select * from clientes, pedidos where ClienteID=ClienteID_FK;