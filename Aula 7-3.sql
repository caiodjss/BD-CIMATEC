select * from clientes;
select * from pedidos;
select * from clientes join pedidos;
select * from pedidos, clientes 
where ClienteID_FK = ClienteID
order by nome;