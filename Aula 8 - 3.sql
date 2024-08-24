select nome, preco, estoque from produtos;

select c.nome, c.email, c.telefone, p.pedido_id, data_pedido 
from clientes as c join pedidos as p 
where p.clienteID_FK = c.cliente_id;

select * from detalhespedidos as dt 
join produtos as pr
join pedido as ped
on produtoID_FK = produto_id;

select pr.nome as 'Nome do Produto',
dt.quantidade, dt.preco_unitario
from DetalhesPedidos as dt join Produtos as pr
on dt.produtoID_FK = pr.produto_id
where dt.pedidoID_FK = 1;

select sum(preco*estoque) from produtos;

select dt.pedidoID_FK,
sum(dt.quantidade * dt.preco_unitario)
from DetalhesPedidos as dt
where dt.pedidoID_FK = 2
group by dt.pedidoID_FK;

select pedidos.pedido_id, pedidos.data_pedido
from pedidos
Join clientes on pedidos.clienteID_FK = clientes.cliente_id
where clientes.nome = 'Glaucia';