create table endereco (
	id integer identity primary key,
	idCliente integer,
	endereco varchar(100),
	num varchar(10),
	cidade varchar(50),
	estado char(2),
	cep varchar(8)
)