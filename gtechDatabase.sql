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
 constraint chkEmail check(email like('%@%', '.com'))
 ) auto_increment = 1000 ;
 -- 10:45:37	create table Empresa(  idEmpresa int primary key auto_increment,  nomeEmpresa varchar(80),  CNPJ char(14) not null,  email varchar(80) not null,  telefone char(14) not null,   -- validação com @ posteriormente  senha varchar(30) not null,  constraint chkEmail check(email like('%@%'))  ) auto_increment = 1000	0 row(s) affected	0.028 sec
insert into Empresa (nomeEmpresa, CNPJ, email, telefone, senha) values ('Pedro Uvas', '12345678901234','uvasmaneirasP@gmail.com', '11975403497', '123');
insert into Empresa (nomeEmpresa, CNPJ, email, telefone, senha) values ('Grapes Wines', '12345678901234','GrapesWine@gmail.com', '11900099999', '123');


select*from Empresa;
 
  create table Empregado (
 Token varchar(20),
 CredEmp int ,
 constraint CredEmp foreign key (CredEmp) references Empresa (idEmpresa),
 nome varchar(80),
 cpf char(11) primary key,
 email varchar(80),
 constraint chkemail check (email like ('@', '.com')),
 telefoneCelular char(11)
 ); 
 
 
 -- Error Code: 1063. Incorrect column specifier for column 'Token'	0.00026 sec

 insert into empregado(credEmp, nome, cpf, email, telefoneCelular) values 
 (1000,'Pedro', '49147963840', 'pedro.pinto@sptech.school', '#Gf999' ),
 (1001,'Pedro', '49147962738', 'blbalba@sptech.school', '#Gf333' ),
 (1000,'Paulo', '49832893840', 'paulo.barbiellini@sptech.school', '#Gf555' );
 

 update empregado set token = 'b7134e8d4' where cpf = '49147962738';
  
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
 
 insert into Unidade (endereco, numero, cep , hectar,fkEmpresa) values(
 'rua biru biru', 200, '12345678901',2,1000
 );
 select*From Unidade;
 
 create table plantacao(
 idPlantação int primary key auto_increment,
 fkUnidade int, foreign key (fkUnidade)references Unidade(idSede)
 );
 
 insert into plantacao values(null, 1);
 
 select*from plantacao;
 
 
 create table local_s(
 idlocal int primary key auto_increment,
 Especificacao varchar(45),
 fkPlant int, constraint fkPlant foreign key (fkPlant) references plantacao(idPlantação)
 );
 
 insert into local_s(especificacao, fkPlant) values('ao lado da cerca da entrada 3 ',1);
 
 select*from local_s;
 
 create table Denuncias (
 idDenuncia int primary key auto_increment,
 tipo varchar(45),
 Descricao varchar(100),
 email varchar(45),
 constraint chkemailDenuncias check (email like ('@', '.com'))
 );
 select*from Denuncias;
 
 
 create table Escala(
 idEscala int primary key auto_increment,
 minimo float,
 maximo float
 );
 insert into escala(maximo, minimo) values(22,16);
 desc escala;
 select*from escala;
 
 create table Tipo_ (
 idTipagem int primary key auto_increment,
 modelo varchar(40),
 funcao varchar(40),
 fkEscala int, constraint fkEscala foreign key (fkEscala) references Escala(idEscala)
 );
 
 desc tipo_;
 insert into tipo_(modelo, funcao,fkEscala) values('DHT11','Umidade',1);
 
 
 
 create table sensores (
 idSensor int primary key auto_increment,
 status varchar(20),
 CONSTRAINT chkStatus CHECK (status IN ('Ativo', 'Inativo','Manutenção'))
 );
 
alter table sensores add column fkLocal int, add constraint fkLocal foreign key(fkLocal) references local_s (idlocal);
alter table sensores add column fkTipagem int, add constraint fkTipagem foreign key (fkTipagem) references Tipo_ (idTipagem);
alter table sensores add column fkEscala_ int,add constraint fkEscala_ foreign key (fkEscala_) references Escala(idEscala);
 
 drop table dados;
 drop table sensores;
 desc sensores;

 insert into sensores (status, fkLocal, fkTipagem, fkEscala_) values('Ativo', 1, 1, 1);
 select*from sensores;
-- 1Error Code: 1452. Cannot add or update a child row: a foreign key constraint fails (`gtech`.`sensores`, CONSTRAINT `fkTipagem` FOREIGN KEY (`fkTipagem`) REFERENCES `Tipo_` (`idTipagem`))	0.0013 sec


 
 create table Dados(
 nLeitura int auto_increment,
 horario datetime default current_timestamp,
 fkSensord int, constraint fkSensord foreign key (fkSensord) references sensores (idSensor),
	constraint fkCompS primary key (nLeitura, fkSensord),
 dht11_umidade DECIMAL(10,2),
lm35_temperatura DECIMAL(10,2)
 );
 
 
 insert into dados( dht11_umidade, lm35_temperatura, fkSensord) values
 (86, 18,1),
 (86, 18,1),
  (86, 18,1),
   (86, 18,1),
    (86, 18,1),
     (86, 18,1),
      (86, 18,1);
 
 select*from dados;
 -- Error Code: 1452. Cannot add or update a child row: a foreign key constraint fails (`gtech`.`dados`, CONSTRAINT `fkSensord` FOREIGN KEY (`fkSensord`) REFERENCES `sensores` (`idSensor`))	0.0011 sec



 select*from Dados join sensores on idsensor = fksensord;
 select*from empresa join empregado on CredEmp = idempresa;
 
 select*from sensores join local_s on fklocal = idlocal
join tipo_ on fkTipagem = idTipagem
join escala on fkEscala_ = idescala;
 
-- Error Code: 1052. Column 'fkEscala' in on clause is ambiguous	0.00039 sec

insert into empresa (nomeEmpresa, cpnj,email,telefone, senha) values('uvas uvas', '12345678901234', 'uvauva@gmail.com', '12345678901234', '123');
select*from empresa;
select*from empregado;