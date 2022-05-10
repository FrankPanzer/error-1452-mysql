
drop database if exists Funeraria;

create database Funeraria;

use Funeraria;

create table cementerio (
idcementerio char(3),
nombrecementerio varchar(30),
direccioncementerio varchar(50),
capacidadcementerio int(7),
primary key (idcementerio)
);

create table fallecido (
idfallecido char(3),
idcementerio char(3),
nombrefallecido varchar(50),
apellidosfallecido varchar(50),
fechafallecido date,
fechadefuncion date,
inicinerado boolean,
tipomuerte text,
primary key (idfallecido)
);

create table tramita (
idfallecido char(3),
idcliente char(3),
primary key (idfallecido, idcliente)
);

create table cliente (
idcliente char(3),
idsucursal char(3),
nombrecliente varchar(20),
apellidoscliente varchar(30),
di varchar(20),
primary key (idcliente)
);

create table sucursal (
idsucursal char(3),
idsepelio char(3),
nombresucursal varchar(30),
direccionsucursal varchar(50),
paissucursal varchar(20),
primary key (idsucursal)
);

create table empleado (
idempleado char(3),
idsucursal char(3),
nombreempleado varchar(20),
apellidosempleado varchar(40),
di varchar(20),
fechaempleado date,
especialidad varchar(20),
sueldobase int,
primary key (idempleado)
);

create table sepelio (
idsepelio char(3),
ataud enum('lisado','cedro y lino','ceremonial','colonial','adornado'),
urna enum('clasic','negra borde dorado','sencilla','cielo','ceramica china'),
mausoleo boolean,
musica enum('rock','pop','jazz','blues','gospel','clasica'),
banquete enum('antes','despues'),
barralibre enum('1','2','3','4','5'),
precio int default 2.000,
primary key (idsepelio)
);


alter table fallecido add constraint FK_fallecido foreign key (idcementerio) references cementerio(idcementerio);
alter table tramita add constraint FK_tramita1 foreign key (idfallecido) references fallecido(idfallecido);
alter table tramita add constraint FK_tramita2 foreign key (idcliente) references cliente(idcliente);
alter table cliente add constraint FK_cliente foreign key (idsucursal) references sucursal(idsucursal);
alter table sucursal add constraint FK_sucursal foreign key (idsepelio) references sepelio(idsepelio);
alter table empleado add constraint FK_empleado foreign key (idsucursal) references sucursal(idsucursal);


insert into cementerio values 
('C01','La Celosa','Calle Aspajueros',150);

insert into fallecido values 
('F01','C01','Pablo','Albarran','1990-12-05','2015-06-23',0,'Se callo por las escaleras');

insert into cliente values 
('X01','S01','Pedro','Millan','73849302G');

insert into tramita values 
('F01','X01');



insert into sucursal values 
('S01','P01','Clisandri','Calle Palagosa','Francia');

insert into empleado values 
('E01','S01','Lisa','Wang','83759302T','1976-10-24','Vendedor',19000);

insert into sepelio values 
('P01','ceremonial','cielo',0,'blues','antes','2',2200);
