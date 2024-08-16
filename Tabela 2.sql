SELECT c.Nome, Pedidos.DataPedido
FROM Clientes as c
JOIN Pedidos as p ON c.ClienteID = p.ClienteID_FK;

select count(ClienteID_FK) from Pedidos where ClienteID_FK=1;