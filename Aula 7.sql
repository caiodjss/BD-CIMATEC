ALTER TABLE clientes
MODIFY nome varchar(70);

ALTER TABLE clientes
RENAME COLUMN nome TO NomeDoCliente;

ALTER TABLE clientes
ADD telefone varchar(16) not null;

ALTER TABLE clientes
DROP COLUMN Telefone;