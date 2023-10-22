--========================================================CREACIÓN DE TABLAS================================================create table Almacen(	Nro int not null,	Responsable varchar(50),	constraint pk_Almacen primary key (Nro));create table Articulo2(	CodArt int not null,	descripcion varchar(50),	precio float,	constraint pk_Articulo primary key (CodArt));create table Material (
	CodMat int not null,
	descripcion varchar(50),
	constraint pk_material primary key (CodMat)
);

create table Proveedor2(
	CodProv int not null,
	Nombre varchar(50),
	Domicilio varchar(60),
	Ciudad varchar (60),
	constraint pk_proveedor primary key (CodProv)
);

create table Tiene(
	NroAlmacen int not null,
	CodArt int not null,
	constraint pk_tiene primary key(NroAlmacen, CodArt),
	constraint fk_tiene_nroAlmacen foreign key (NroAlmacen) references Almacen(Nro),
	constraint fk_tiene_codArt foreign key (CodArt) references Articulo2(CodArt)
)

create table Compuesto_por(
	CodArt int  not null,
	CodMat int  not null,
	constraint pk_compuesto_por primary key (CodArt, CodMat),
	constraint fk_copmuesto_por_codArt foreign key (CodArt) references Articulo2(CodArt),
	constraint fk_compuesto_por_CodMat foreign key (CodMat) references Material(CodMat)
)

create table Provisto_por(
	CodMat int not null,
	CodProv int not null,
	constraint pk_provisto_por primary key (CodMat, CodProv),
	constraint fk_provisto_por_codMat foreign key (CodMat) references Material(CodMat),
	constraint fk_provisto_por_codProv foreign key (CodProv) references Proveedor2(CodProv)
)


--========================================================SCRIPS DE CARGA================================================

insert into Almacen values
(1, 'Juan Perez'),
(2, 'Jose Basualdo'),
(3, 'Rogelio Rodriguez')
insert into Articulo2 values
(1, 'Sandwich JyQ', 5),
(2, 'Pancho', 6),
(3, 'Hamburguesa', 10),
(4, 'Hamburguesa completa', 15)
insert into Material values
(1, 'Pan'),
(2, 'Jamon'),
(3, 'Queso'),
(4, 'Salchicha'),
(5, 'Pan Pancho'),
(6, 'Paty'),
(7, 'Lechuga'),
(8, 'Tomate')
insert into Proveedor2 values
(1, 'Panadería Carlitos', 'Carlos Calvo 1212', 'CABA'),
(2, 'Fiambres Perez', 'San Martin 121', 'Pergamino'),
(3, 'Almacen San Pedrito', 'San Pedrito 1244', 'CABA'),
(4, 'Carnicería Boedo', 'Av. Boedo 3232', 'CABA'),
(5, 'Verdulería Platense', '5 3232', 'La Plata')
insert into Tiene values
--Juan Perez
(1, 1),
--Jose Basualdo
(2, 1),
(2, 2),(2, 3),
(2, 4),
--Rogelio Rodriguez
(3, 3),
(3, 4)
insert into Compuesto_Por values
--Sandwich JyQ
(1, 1), (1, 2), (1, 3),
--Pancho
(2, 4), (2, 5),
--Hamburguesa
(3, 1), (3, 6),
--Hamburguesa completa
(4, 1), (4, 6), (4, 7), (4, 8)
insert into Provisto_Por values
--Pan
(1, 1), (1, 3),
--Jamon
(2, 2), (2, 3), (2, 4),
--Queso
(3, 2), (3, 3),
--Salchicha
(4, 3), (4, 4),
--Pan Pancho
(5, 1), (5, 3),
--Paty
(6, 3), (6, 4),
--Lechuga
(7, 3), (7, 5),
--Tomate
(8, 3), (8, 5)
GO--========================================================EJERCICIOS================================================--1. Listar los nombres de los proveedores de la ciudad de La Plata.select Nombrefrom Proveedor2 where ciudad = 'La Plata'--2. Listar los números de artículos cuyo precio sea inferior a $10.select CodArtfrom Articulo2where precio<10--3.Listar los responsables de los almacenes.select a.Responsablefrom Almacen a--4. Listar los códigos de los materiales que provea el proveedor 3 y no los provea el proveedor 5.select pp.CodMatfrom Provisto_por pp	inner join Proveedor2 p on pp.CodProv=p.CodProvwhere pp.CodProv=3exceptselect pp.CodMatfrom Provisto_por pp	inner join Proveedor2 p on pp.CodProv=p.CodProvwhere pp.CodProv=5--5.Listar los números de almacenes que almacenan el artículo 1.select a.Nrofrom Almacen a	inner join Tiene t on t.NroAlmacen=a.Nrowhere t.CodArt=1--6. Listar los proveedores de Pergamino que se llamen Pérezselect p.CodProv from Proveedor2 pwhere ciudad = 'Pergamino'and Nombre like '% Perez'--7. Listar los almacenes que contienen los artículos 1 y los artículos 2 (ambos).select a.Nrofrom Almacen a	inner join Tiene t on a.Nro=t.NroAlmacenwhere t.CodArt = 1and t.NroAlmacen in (	select t.NroAlmacen	from Almacen a		inner join Tiene t on a.Nro=t.NroAlmacen	where t.CodArt = 2)--8.Listar los artículos que cuesten más de $100 o que estén compuestos por el material 1select CodArtfrom Articulo2where precio>100or CodArt in (	select CodArt	from Compuesto_por	where CodMat=1)