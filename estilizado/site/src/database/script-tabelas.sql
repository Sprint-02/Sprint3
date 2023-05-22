create database GTech;
use Gtech;

create table Empresa(
 idEmpresa int primary key auto_increment,
 nomeEmpresa varchar(80),
 CNPJ char(14) not null,
 email varchar(80) not null,
 telefone char(14) not null,
  -- validação com @ posteriormente
 senha varchar(30) not null,
 constraint chkEmail check(email like('%@%'))
 ) auto_increment = 1000 ;
 -- 10:45:37	create table Empresa(  idEmpresa int primary key auto_increment,  nomeEmpresa varchar(80),  CNPJ char(14) not null,  email varchar(80) not null,  telefone char(14) not null,   -- validação com @ posteriormente  senha varchar(30) not null,  constraint chkEmail check(email like('%@%'))  ) auto_increment = 1000	0 row(s) affected	0.028 sec
insert into Empresa (nomeEmpresa, CNPJ, email, telefone, senha) values ('Pedro Uvas', '12345678901234','uvasmaneirasP@gmail.com', '11975403497', '123');
 select*from Empresa;
 
  create table Empregado (
 Token varchar(20),
 CredEmp int ,
 constraint CredEmp foreign key (CredEmp) references Empresa (idEmpresa),
 nome varchar(80),
 cpf char(11) primary key,
 email varchar(80),
 senha varchar(80)
 );
 insert into empregado values(1,1000,'aa', '49147963840', 'pedro@gmial.com', '123' );
 insert into empregado values(1,1000,'Pedro', '49143933140', 'pedro.pinto@gmail.com.com', '123' );
  insert into empregado values(1,1000,'Pedro', '41143933140', 'pedro.pinto@gmail.com.com', '123' );
 update empregado set token = 'b7134e8d4' where cpf = '49143933140';
  -- alter table Empregado modify column cpf char(11) not primary key ;
  -- alter table Empregado MODIFY COLUMN token varchar(20) primary key;
 desc empregado;
 select*from empregado;
 create table Unidade
 (idSede int  auto_increment,
 endereco varchar(60),
 numero int,
 cep char(11),
 hectar int,
 fkEmpresa int, constraint fkEmpresa foreign key (fkEmpresa) references empresa(idEmpresa),
 constraint pkComposta primary key (idSede, fkEmpresa)
 );
 
 create table local_s(
 idlocal int primary key auto_increment,
 Especificacao varchar(45),
 fkSede int, constraint fkSede foreign key (fkSede) references Unidade(idsede)
 );
 
 create table Denuncias (
 idDenuncia int primary key auto_increment,
 tipo varchar(45),
 Descricao varchar(100),
 Fk_p_u int, constraint Fk_p_u foreign key(fk_p_u) references Empregado(idEmpregado));
 
 create table Escala(
 idEscala int primary key auto_increment,
 minimo float,
 maximo float
 );
 
 desc escala;
 
 create table Tipo_ (
 idTipagem int primary key auto_increment,
 modelo varchar(40),
 funcao varchar(40),
 fkEscala int, constraint fkEscala foreign key (fkEscala) references Escala(idEscala)
 );
 desc tipo_;
 
 create table sensores (
 idSensor int primary key auto_increment,
 status_s varchar(20)
 );
 
alter table sensores add column fkLocal int, add constraint fkLocal foreign key(fkLocal) references local_s (idlocal);
alter table sensores add column fkTipagem int, add constraint fkTipagem foreign key (fkTipagem) references Tipo_ (idTipagem);
alter table sensores add column fkEscala_ int,add constraint fkEscala_ foreign key (fkEscala_) references Escala(idEscala);
 
 
 drop table sensores;
 desc sensores;

 
 

 
 create table Dados(
 nLeitura int auto_increment,
 horario datetime default current_timestamp,
 fkSensord int, constraint fkSensord foreign key (fkSensord) references sensores (idSensor),
	constraint fkCompS primary key (nLeitura, fkSensord),
 DUmidade float,
 DTemperatura float
 );
 
 select*from Dados join sensores on idsensor = fksensord;
 select*from empresa join empregado on CredEmp = idempresa;
 
 select*from sensores join local_s on fklocal = idlocal
join tipo_ on fkTipagem = idTipagem
join escala on fkEscala_ = idescala;
 
-- Error Code: 1052. Column 'fkEscala' in on clause is ambiguous	0.00039 sec

insert into empresa (nomeEmpresa, cpnj,email,telefone, senha) values('uvas uvas', '12345678901234', 'uvauva@gmail.com', '12345678901234', '123');
select*from empresa;
select*from empregado;