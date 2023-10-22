

create table pais(
	nombre varchar(50),
	constraint pk_pais primary key (nombre)
);

create table banco(
	id int not null,
	nombre varchar(50),
	pais varchar(50),
	constraint pk_banco primary key (id),
	constraint fk_pais foreign key (pais) references pais(nombre)
);

create table moneda(
	id char(2),
	descripcion varchar(50),
	valorOro decimal(15,2),
	valorPetroleo decimal(15,2),
	constraint pk_moneda primary key(id)
);

create table persona(
	pasaporte int not null,
	codigoFiscal int,
	nombre varchar(50),
	constraint pk_persona primary key (pasaporte),
);

create table cuenta(
	monto decimal(15,2),
	idBanco int not null,
	idMoneda char(2) not null,
	idPersona int not null,
	constraint pk_cuenta primary key (idBanco,idMoneda,idPersona),
	constraint fk_banco foreign key (idBanco) references banco(id),
	constraint fk_moneda foreign key (idMoneda) references moneda(id),
	constraint fk_persona foreign key (idPersona) references persona(pasaporte)
);


create table opera(
	idBanco int not null,
	idMoneda char(2) not null,
	cambioCompra decimal(15,2),
	cambioVenta decimal(15,2),
	constraint pk_opera primary key (idBanco,idMoneda),
	constraint fk_banco_opera foreign key (idBanco) references banco(id),
	constraint fk_moneda_opera foreign key (idMoneda) references moneda(id)
);

select * from opera
alter table opera add cambioVenta decimal(15,2)

--======================================================SCRIPTS DE CARGA==============================================================

INSERT INTO pais (nombre) VALUES ('Argentina');
INSERT INTO pais (nombre) VALUES ('USA');
INSERT INTO pais (nombre) VALUES ('Uruguay');
INSERT INTO pais (nombre) VALUES ('España');
INSERT INTO pais (nombre) VALUES ('Alemania');
INSERT INTO pais (nombre) VALUES ('Suiza');
INSERT INTO banco (id, nombre, pais) VALUES ('1', 'Banco Nacion', 'Argentina');
INSERT INTO banco (id, nombre, pais) VALUES ('2', 'Banco Montevideo', 'Uruguay');
INSERT INTO banco (id, nombre, pais) VALUES ('3', 'Banco Ciudad', 'Argentina');
INSERT INTO banco (id, nombre, pais) VALUES ('4', 'City Bank', 'USA');
INSERT INTO banco (id, nombre, pais) VALUES ('5', 'Switzerland Bank', 'Suiza');
INSERT INTO banco (id, nombre, pais) VALUES ('6', 'BBVA', 'España');
INSERT INTO moneda (id, descripcion, valorOro, valorPetroleo) VALUES ('AR', 'Peso Argentino',
'2', '1');
INSERT INTO moneda (id, descripcion, valorOro, valorPetroleo) VALUES ('UY', 'Peso Uruguayo',
'5', '2.5');
INSERT INTO moneda (id, descripcion, valorOro, valorPetroleo) VALUES ('US', 'Dolar', '1',
'.5');
INSERT INTO moneda (id, descripcion, valorOro, valorPetroleo) VALUES ('EU', 'Euro', '2', '1');
INSERT INTO persona (pasaporte, codigoFiscal, nombre) VALUES ('1', '1234', 'Bill Gates');
INSERT INTO persona (pasaporte, codigoFiscal, nombre) VALUES ('2', '12112', 'Carlos Slim');
INSERT INTO persona (pasaporte, codigoFiscal, nombre) VALUES ('3', '2325', 'Lionel Messi');
INSERT INTO persona (pasaporte, codigoFiscal, nombre) VALUES ('4', '01243', 'Diego Maradona');
INSERT INTO cuenta (monto, idBanco, idMoneda, idPersona) VALUES ('100000', '4', 'US', '1');INSERT INTO cuenta (monto, idBanco, idMoneda, idPersona) VALUES ('20000', '5', 'EU', '1');
INSERT INTO cuenta (monto, idBanco, idMoneda, idPersona) VALUES ('15000', '2', 'US', '1');
INSERT INTO cuenta (monto, idBanco, idMoneda, idPersona) VALUES ('50000', '4', 'US', '2');
INSERT INTO cuenta (monto, idBanco, idMoneda, idPersona) VALUES ('35000', '5', 'US', '2');
INSERT INTO cuenta (monto, idBanco, idMoneda, idPersona) VALUES ('2000', '1', 'AR', '3');
INSERT INTO cuenta (monto, idBanco, idMoneda, idPersona) VALUES ('10000', '4', 'US', '3');
INSERT INTO cuenta (monto, idBanco, idMoneda, idPersona) VALUES ('15000', '5', 'US', '3');
INSERT INTO cuenta (monto, idBanco, idMoneda, idPersona) VALUES ('15000', '5', 'US', '4');
INSERT INTO opera (idBanco, idMoneda, cambioCompra, cambioVenta) VALUES ('1', 'US', '1', '1');
INSERT INTO opera (idBanco, idMoneda, cambioCompra, cambioVenta) VALUES ('2', 'US', '1', '1');
INSERT INTO opera (idBanco, idMoneda, cambioCompra, cambioVenta) VALUES ('3', 'US', '1', '1');
INSERT INTO opera (idBanco, idMoneda, cambioCompra, cambioVenta) VALUES ('4', 'US', '1', '1');
INSERT INTO opera (idBanco, idMoneda, cambioCompra, cambioVenta) VALUES ('5', 'US', '1', '1');
INSERT INTO opera (idBanco, idMoneda, cambioCompra, cambioVenta) VALUES ('6', 'US', '1', '1');
INSERT INTO opera (idBanco, idMoneda, cambioCompra, cambioVenta) VALUES ('1', 'EU', '2', '2');
INSERT INTO opera (idBanco, idMoneda, cambioCompra, cambioVenta) VALUES ('2', 'EU', '2', '2');
INSERT INTO opera (idBanco, idMoneda, cambioCompra, cambioVenta) VALUES ('3', 'EU', '3', '3');
INSERT INTO opera (idBanco, idMoneda, cambioCompra, cambioVenta) VALUES ('4', 'EU', '2', '2');
INSERT INTO opera (idBanco, idMoneda, cambioCompra, cambioVenta) VALUES ('5', 'EU', '2.2',
'2.2');
INSERT INTO opera (idBanco, idMoneda, cambioCompra, cambioVenta) VALUES ('6', 'EU', '2.2',
'2.5');
INSERT INTO opera (idBanco, idMoneda, cambioCompra, cambioVenta) VALUES ('1', 'AR', '5', '5');
INSERT INTO opera (idBanco, idMoneda, cambioCompra, cambioVenta) VALUES ('3', 'AR', '5.5',
'5.5');
INSERT INTO opera (idBanco, idMoneda, cambioCompra, cambioVenta) VALUES ('2', 'AR', '7', '7');
INSERT INTO opera (idBanco, idMoneda, cambioCompra, cambioVenta) VALUES ('1', 'UY', '3', '3');
INSERT INTO opera (idBanco, idMoneda, cambioCompra, cambioVenta) VALUES ('2', 'UY', '2', '2');

--=====================================================================EJERCICIO===================================================


--a) A. Listar a las personas que no tienen ninguna cuenta en "pesos argentinos" en Ningún banco. Que además
--tengan al menos dos cuentas en "dólares"create view PersCon2CuentasUs asselect c.idPersonafrom cuenta cwhere c.idMoneda='US'group by c.idPersonahaving COUNT(c.idMoneda) < 2;select * from persona pwhere not exists(		select c.idPersona		from cuenta c		where c.idPersona=p.pasaporte		and c.idMoneda='AR'		or p.pasaporte in (select * from PersCon2CuentasUs)	)--b)  Listar de las monedas que son operadas en todos los bancos, aquellas con el valor oro más altocreate view monedasOperadaXTodosBancos asselect *from moneda mwhere not exists (	select * 	from banco b	where not exists(		select *		from opera o		where o.idMoneda=m.id		and b.id=o.idBanco	));select *from monedasOperadaXTodosBancoswhere valorOro >= all (	select m.valorOro	from monedasOperadaXTodosBancos m)