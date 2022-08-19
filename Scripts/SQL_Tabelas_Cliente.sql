create table cliente(
	id integer identity primary key,
	nome varchar(100),
	nomeMae varchar(100),
	nomePai varchar(100),
	cpf char(11),
	rg char(20)
)