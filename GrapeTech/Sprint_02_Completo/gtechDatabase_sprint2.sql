create database GTech;
use Gtech;

create table Empresa(
 idEmpresa int primary key auto_increment,
 nomeEmpresa varchar(80),
 CPNJ char(14) not null,
 email varchar(80) not null,
 telefone char(14) not null,
  -- validação com @ posteriormente
 senha varchar(30) not null,
 constraint chkEmail check(email like('%@%'))
 ) auto_increment = 1000 ;
 
 select*from Empresa;
 create table Empregado (
 idEmpregado int primary key auto_increment,
 CredEmp int ,
 constraint CredEmp foreign key (CredEmp) references Empresa (idEmpresa),
 nome varchar(80),
 cpf char(11),
 email varchar(80),
 senha varchar(80)
 );
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
 fkSede int, constraint fkSede foreign key (fkSede) references sede(idsede)
 );
 
 create table Denuncias (
 idDenuncia int primary key auto_increment,
 tipo varchar(45),
 Descricao varchar(100),
 Fk_p_u int, constraint Fk_p_u foreign key(fk_p_u) references Empregado(idEmpregado));
 
 create table Escala(
 idEscala int primary key auto_increment,
 minimo float,
 maxmimo float
 );
 
 desc escala;
 
 create table Tipo_ (
 idTipagem int primary key auto_increment,
 modelo varchar(40),
 funcao varchar(40),
 fkEscala int, constraint fkEscala foreign key (fkEscala) references Escala(idEscala)
 );
 
 
 create table sensores (
 idSensor int primary key auto_increment,
 status_s varchar(20)
 );
 
 alter table sensores add column fkLocal int, add constraint fkLocal foreign key(fkLocal) references local_s (idlocal);
alter table sensores add column fkTipagem int, add constraint fkTipagem foreign key (fkTipagem) references Tipo_ (idTipagem);
alter table sensores add column fkEscala int,add constraint fkEscala2 foreign key (fkEscala) references Escala(idEscala);
 
 desc sensores;

 
 -- Error Code: 1022. Can't write; duplicate key in table 'sensores'	0.030 sec

 
 create table Dados(
 nLeitura int auto_increment,
 horario datetime default current_timestamp,
 fkSensor int, constraint fkSensor foreign key (fkSensor) references sensor (idSensor),
	constraint fkCompS primary key (nLeitura, fkSensor)
 
 );
 
