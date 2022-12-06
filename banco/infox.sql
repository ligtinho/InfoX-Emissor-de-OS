-- Comentários
-- A linha abaixo cria um banco de dados
create database dbinfox;
--  Linha abaixo escolhe o banco de dados a ser utilizado
use dbinfox;
-- O bloco de instruções abaixo cria uma tabela
create table tbusuarios(
iduser int primary key,
usuario varchar(50) not null,
fone varchar(15),
login varchar(15) not null unique,
senha varchar(15) not null
);
-- O comando abaixo descreve a tabela
describe tbusuarios;
-- A linha abaixo insere dados na tabela (CRUD)
-- create ->insert
insert into tbusuarios(iduser,usuario,fone,login,senha)
values (1,'José de Assis','9999-9999','joseassis','123456');
-- A linha abaixo exibe os dados da tabela (CRUD)
-- read ->select
select * from tbusuarios;

insert into tbusuarios(iduser,usuario,fone,login,senha)
values (2,'Administrador','9999-9999','admin','admin');
insert into tbusuarios(iduser,usuario,fone,login,senha)
values (3,'Bill Gates','9999-9999','Bill','123456');

-- A linha abaixo modifica dados na tabela (CRUD)
-- update -> update
update tbusuarios set fone='8888-8888' where iduser=2;

-- A linha abaixo apaga um registro da tabela (CRUD)
-- delete -> delete
delete from tbusuarios where iduser=3;

select * from tbusuarios

create table tbclientes(
idcli int primary key auto_increment,
nomecli varchar(50) not null,
endcli varchar(100),
fonecli varchar(50) not null,
email varchar(50),
bairro varchar(50),
cidade varchar(50),
estado varchar(2),
cep int(10)
);

insert into tbclientes(nomecli,endcli,fonecli,email,bairro,cidade,estado,cep)
values('Linus Torvalds','Rua Tux, 2015','9999-9999','linus@linux.com','Itaquera','São Paulo','Sp','08512312');

select * from tbclientes;

create table tbos(
os int primary key auto_increment,
data_os timestamp default current_timestamp,
equipamento varchar(150) not null,
defeito varchar(150) not null,
servico varchar(150),
tecnico varchar(30),
valor decimal(10,2),
idcli int not null,
foreign key(idcli) references tbclientes(idcli)
);

describe tbos;

insert into tbos (equipamento,defeito,servico,tecnico,valor,idcli)
values ('Notebook','Não liga','Troca da fonte','Zé',87.50,1);

select * from tbos;

-- O código abaixo traz informações de duas tabelas
select
O.os,equipamento,defeito,servico,valor,
C.nomecli,fonecli
from tbos as O
inner join tbclientes as C
on (O.idcli = C.idcli); 

-- a linha abaixo altera a tabela adicionando um campo em uma determinada posição
alter table tbos add situacao varchar(20) not null after tipo;
alter table tbos drop column situacao;