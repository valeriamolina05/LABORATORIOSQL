create database lab3
create table compañia(
comnit varchar primary key,
comnombre varchar(30),
comañofun int,
comreplegal varchar(100)
)

create table tiposAutomotores(
auttipo int primary key,
autnombre varchar(20)
)

create table automotores (
autoplaca varchar(6) primary key,
automarca varchar (30),
autotipo int  foreign key references tiposAutomotores(auttipo),
automodelo int,
autopasajeros int,
autocilindraje int,
autonumchasis varchar(20)
)

create table aseguramientos(
asecodigo int primary key,
asefechainicio date not null,
asefechaexpiracion date not null,
asevalorasegurado int,
aseestado varchar(10),
asecosto int,
aseplaca varchar(6) foreign key (aseplaca)  references automotores(autoplaca),

)

create table incidentes(
incicodigo int primary key,
incifecha date not null,
inciplaca varchar (6) foreign key references automotores(autoplaca),
incilugar varchar(40),
inciantheridos int,
incicanfatalidades int,
incicanautosinvolucrados int

)

insert into compañia (comnit,comnombre, comañofun, comreplegal)
values
('800890890-2', 'Seguros Atlantida', '1998', 'Carlos López'),
('899999999-1', 'Aseguradora Rojas', '1991', 'Luis Fernando Rojas'),
('899999999-5', 'Seguros del Estado', '2001', 'María Margarita Pérez')

insert into tiposAutomotores (auttipo, autnombre )
values
('1', 'Automóviles'),
('2', 'Camperos'),
('3', 'Camiones')

insert automotores (autoplaca, automarca, autotipo,automodelo, autopasajeros, autocilindraje,autonumchasis)
values
('FLL420', 'chevrolet corsa', '1', '2003', '5', '1400', 'wywzzz167kk009d25'),
('DKZ820', 'renault stepway', '1', '2008', '5', '1600', 'wywzzz167kk009d25'),
('KJQ920', 'kia sportage', '2', '2009', '7', '2000', 'wywzzz157kk009d25')

insert aseguramientos(asecodigo,asefechainicio, asefechaexpiracion, asevalorasegurado,aseestado,asecosto, aseplaca)
values
('1', '2012-09-30', '2013-09-30', '30000000', 'Vigente', '500000', 'FLL420'),
('2', '2012-09-27', '2013-09-27', '35000000', 'Vigente', '600000', 'DKZ820'),
('3', '2011-09-28', '2012-09-28', '50000000', 'Vigente', '800000', 'KJQ920')

insert incidentes (incicodigo, incifecha, inciplaca,incilugar, inciantheridos,incicanfatalidades, incicanautosinvolucrados)
values
('1', '2012-09-30', 'DKZ820' , 'Bucaramanga', '0' , '0' , '2'),
('2', '2012-09-27', 'FLL420' , 'Girón', '1' , '0' , '1'),
('3', '2011-09-28', 'FLL420' , 'Bucaramanga', '1' , '0' , '2')

select * from compañia where comañofun >=1991 and comañofun <=1998;

select autoplaca, automodelo, automarca, autopasajeros, autocilindraje, autnombre, asecosto, asevalorasegurado
from automotores, aseguramientos, tiposAutomotores
where autoplaca= aseplaca and autotipo= autotipo and asefechaexpiracion >='2013-09-30';

select incifecha, incilugar, inciplaca, asecodigo, asefechainicio, asevalorasegurado
from incidentes, aseguramientos
where inciplaca= aseplaca and incifecha='2012-09-30';

select inciantheridos, autoplaca, incilugar, incifecha, asefechainicio, asecosto, aseestado, asevalorasegurado
from aseguramientos, incidentes, automotores
where inciplaca= aseplaca and autoplaca= inciplaca and inciantheridos=1;

select * from aseguramientos
where asecosto in(select max(asecosto) from aseguramientos);

select incicanautosinvolucrados, incifecha, inciplaca, asevalorasegurado,aseestado
from aseguramientos, incidentes
where inciplaca= aseplaca and incicanautosinvolucrados in(select min(incicanautosinvolucrados) from incidentes);

select incilugar, inciplaca, incifecha, inciantheridos, asefechainicio, asefechaexpiracion, asevalorasegurado
from incidentes, aseguramientos 
where inciplaca= aseplaca and inciplaca='FLL420';

select* from compañia where comnit ='899999999-5';

select * from aseguramientos, automotores
where aseplaca= autoplaca and asevalorasegurado in (select max(asevalorasegurado) from aseguramientos);

select automarca, autoplaca, automodelo, autocilindraje, asefechainicio, asefechaexpiracion
from aseguramientos, automotores
where autoplaca= aseplaca and asecodigo=1;

Select *
from aseguramientos ase
inner join incidentes inc
on ase.asecodigo= inc.incicodigo;

Select *
from automotores aut
inner join aseguramientos ase
on aut.autoplaca=ase.aseplaca;

