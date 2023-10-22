

-- =============================================CREACION DE TABLAS========================================0


-- TABLAS NO RELACIONADAS CON OTRAS 
CREATE TABLE Almacen(
	Nro int NOT NULL,
	Responsable varchar(50),
	CONSTRAINT FKALMACEN PRIMARY KEY (Nro)
);

CREATE TABLE Articulo(
	CodArt int NOT NULL,
	Descripcion varchar(100),
	Precio float,
	CONSTRAINT FKARTICULO PRIMARY KEY (CodArt)
);

CREATE TABLE Material(
	CodMat int NOT NULL,
	Descripcion VARCHAR(100),
	CONSTRAINT FK_MATERIAL PRIMARY KEY (CodMat)
);

CREATE TABLE Proveedor(
	CodProv int NOT NULL,
	Nombre VARCHAR(50),
	Domicilio VARCHAR(50),
	ciudad VARCHAR(50),
	CONSTRAINT FK_PROVEEDOR PRIMARY KEY (CodProv)
);

-- TABLAS RELACIONADAS CON OTRAS 


CREATE TABLE Tiene(
	NroAlmacen INT NOT NULL,
	CodArt INT NOT NULL,
	CONSTRAINT FK_TIENE PRIMARY KEY (NroAlmacen, CodArt),
	CONSTRAINT FORK1_TIENE FOREIGN KEY (NroAlmacen) REFERENCES Almacen(Nro),
	CONSTRAINT FORK2_TIENE FOREIGN KEY (CodArt) REFERENCES Articulo(CodArt)
);


CREATE TABLE Compuesto_Por(
	CodArt INT NOT NULL,
	CodMat INT NOT NULL,
	CONSTRAINT FK_Compuesto_Por PRIMARY KEY (CodArt, CodMat),
	CONSTRAINT FORK_Compuesto_Por FOREIGN KEY (CodMat) REFERENCES Material(CodMat),
	CONSTRAINT FORK2_Compuesto_Por FOREIGN KEY (CodArt) REFERENCES Articulo(CodArt)
);


CREATE TABLE Provisto_por(
	CodMat INT NOT NULL,
	CodProv INT NOT NULL,
	CONSTRAINT FK_Provisto_por PRIMARY KEY (CodProv, CodMat),
	CONSTRAINT FORK_Provisto_por FOREIGN KEY (CodMat) REFERENCES Material(CodMat),
	CONSTRAINT FORK2_Provisto_por FOREIGN KEY (CodProv) REFERENCES Proveedor(CodProv)
);

-- =============================================INSERCION DE DATOS========================================

insert into Almacen values
(1, 'Juan Perez'),
(2, 'Jose Basualdo'),
(3, 'Rogelio Rodriguez');

insert into Articulo values
(1, 'Sandwich JyQ', 5),
(2, 'Pancho', 6),
(3, 'Hamburguesa', 10),
(4, 'Hamburguesa completa', 15);
insert into Material values
(1, 'Pan'),
(2, 'Jamon'),
(3, 'Queso'),
(4, 'Salchicha'),
(5, 'Pan Pancho'),
(6, 'Paty'),
(7, 'Lechuga'),
(8, 'Tomate');
insert into Proveedor values
(1, 'Panadería Carlitos', 'Carlos Calvo 1212', 'CABA'),
(2, 'Fiambres Perez', 'San Martin 121', 'Pergamino'),
(3, 'Almacen San Pedrito', 'San Pedrito 1244', 'CABA'),
(4, 'Carnicería Boedo', 'Av. Boedo 3232', 'CABA'),
(5, 'Verdulería Platense', '5 3232', 'La Plata');
insert into Tiene values
--Juan Perez
(1, 1),
--Jose Basualdo
(2, 1),
(2, 2),
(2, 3),
(2, 4),
--Rogelio Rodriguez
(3, 3),
(3, 4);
insert into Compuesto_Por values
--Sandwich JyQ
(1, 1), (1, 2), (1, 3),
--Pancho
(2, 4), (2, 5),
--Hamburguesa
(3, 1), (3, 6),
--Hamburguesa completa
(4, 1), (4, 6), (4, 7), (4, 8);
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
(8, 3), (8, 5);
GO



-- =============================================REALIZACIÓN DE LOS EJERCICIOS========================================


--1. Listar los nombres de los proveedores de la ciudad de La Plata
SELECT (Nombre) FROM Proveedor WHERE ciudad = 'La Plata';
--2. Listar los números de artículos cuyo precio sea inferior a $10.
SELECT (CodArt) FROM Articulo WHERE Precio < 10;
--3. Listar los responsables de los almacenes.
SELECT (Responsable) FROM Almacen;
--4. Listar los códigos de los materiales que provea el proveedor 1 y no los provea el proveedor 5.
SELECT (CodMat) FROM Provisto_por where CodProv = 1 AND CodMat NOT IN (SELECT (CodMat) FROM Provisto_por WHERE CodProv = 5);
-- 5. Listar los números de almacenes que almacenan el artículo Hamburguesa.
SELECT COUNT(*) AS NUMERO_ALMACENES FROM Almacen where  Nro 
IN (SELECT (NroAlmacen) FROM Tiene t FULL JOIN Articulo a ON t.CodArt=a.CodArt where a.Descripcion = 'Hamburguesa');
-- 6. Listar los proveedores de Pergamino que se llamen Pérez
SELECT * FROM Proveedor where ciudad = 'Pergamino' AND Nombre like '%Perez';
-- 7. Listar los almacenes que contienen los artículos A y los artículos B (ambos).
SELECT * FROM Almacen where  Nro 
IN (SELECT (NroAlmacen) FROM Tiene t FULL JOIN Articulo a 
ON t.CodArt=a.CodArt where a.Descripcion = 'Hamburguesa' OR a.Descripcion = 'Hamburguesa completa');
-- 8. Listar los artículos que cuesten más de $100 o que estén compuestos por el material Paty.
SELECT * FROM Articulo where Precio > 100 OR CodArt 
IN (Select (CodArt) FROM Compuesto_Por c FULL JOIN Material m ON c.CodMat=m.CodMat WHERE m.Descripcion='Paty')
-- 9. Listar los materiales, código y descripción, provistos por proveedores de la ciudad de Rosario.
SELECT * FROM Material where CodMat 
in (select (CodMat) from Provisto_por pp INNER JOIN Proveedor p on pp.CodProv=p.CodProv where p.ciudad='Rosario');
-- 10. Listar el código, descripción y precio de los artículos que se almacenan en A1.
select * from Articulo where CodArt in (select CodArt from Tiene where NroAlmacen = 1) 
--11. Listar la descripción de los materiales que componen el artículo Pancho.
select Descripcion from Material where CodMat 
in (select distinct CodMat from Articulo a join Compuesto_Por c on a.CodArt=c.CodArt where a.Descripcion = 'Pancho') 
-- 12. Listar los nombres de los proveedores que proveen los materiales al almacén que Juan Perez tiene a su cargo.
select Nombre from Proveedor where CodProv 
	in (select CodProv from Provisto_por pp inner join Material m on pp.CodMat=m.CodMat where m.CodMat 
		in(
		select (CodMat) from Compuesto_Por c inner join Articulo a on c.CodArt=a.CodArt where a.CodArt 
			in(
				select CodArt from Tiene t inner join Almacen a on t.NroAlmacen=a.Nro where a.Responsable='Juan Perez'
			) 
		)
	)
-- 13. Listar códigos y descripciones de los artículos compuestos por al menos un material provisto por el proveedor Boedo.
select CodArt, Descripcion from Articulo where CodArt 
	in (
		select CodArt from Compuesto_Por cp inner Join Material m on cp.CodMat=m.CodMat where m.CodMat 
		in (
			select CodMat from Provisto_por pp inner join Proveedor p on pp.CodProv=p.CodProv where p.Nombre like '% Boedo'
		)
	)
-- 14. Hallar los códigos y nombres de los proveedores que proveen al menos un material que se usa en algún artículo cuyo precio es mayor a $100.
select CodProv, Nombre from Proveedor where CodProv 
	in(
		select CodProv from Provisto_por pp inner join Material m on pp.CodMat=m.CodMat where m.CodMat 
		in (
			select CodMat from Compuesto_Por cp inner join Articulo a on cp.CodArt=a.CodArt where a.Precio > 10
		) 
	)
--15. Listar los números de almacenes que tienen todos los artículos que incluyen el material con código 6.
select Nro from Almacen where Nro 
	in (
		select distinct NroAlmacen from Tiene e inner join Articulo a on e.CodArt=a.CodArt where a.CodArt 
		in(
			select CodArt from Compuesto_Por cp where cp.CodMat=6
		) 
	)
-- 16. Listar los proveedores de Capital Federal que sean únicos proveedores de algún material.
select distinct p.Nombre
from Proveedor p join Provisto_por pp on p.CodProv=pp.CodProv 
join (
	select distinct pp.CodMat, count(pp.CodProv) as 'cant prov'
	from Material m join Provisto_por pp on m.CodMat=pp.CodMat
	group by pp.CodMat
	having count(pp.CodProv)=1
) prodC1SoloProveedor on pp.CodMat=prodC1SoloProveedor.CodMat



--17. Listar el/los artículo/s de mayor precio.
select * from Articulo where Precio >= all (
	select Precio from Articulo
)


--18. Listar el/los artículo/s de menor precio.
select * from Articulo where Precio <= all (
	select Precio from Articulo
)

--19. Listar el promedio de precios de los artículos en cada almacén.
select a.Nro, AVG(Precio) as 'Promedio precios' from Tiene t inner join Almacen a on t.NroAlmacen=a.Nro inner join Articulo ar on ar.CodArt=t.CodArt group by a.Nro

--20. Listar los almacenes que almacenan la mayor cantidad de artículos.
select NroAlmacen, Count(CodArt) as 'cant Art'
from Tiene
group by NroAlmacen
having Count(CodArt) >= All (
	select Count(CodArt)
	from Tiene
	group by NroAlmacen
)


--21. Listar los artículos compuestos por al menos 2 materiales.
select a.Descripcion, COUNT(cp.CodMat) as 'cant materiales'
from Articulo a join Compuesto_Por cp on a.CodArt=cp.CodArt
group by a.Descripcion
having COUNT(cp.CodMat) >= 2 

--22. Listar los artículos compuestos por exactamente 2 materiales.
select a.Descripcion, COUNT(cp.CodMat) as 'cant materiales'
from Articulo a join Compuesto_Por cp on a.CodArt=cp.CodArt
group by a.Descripcion
having COUNT(cp.CodMat) = 2 

--23. Listar los artículos que estén compuestos con hasta 2 materiales.
select a.Descripcion, COUNT(cp.CodMat) as 'cant materiales'
from Articulo a join Compuesto_Por cp on a.CodArt=cp.CodArt
group by a.Descripcion
having COUNT(cp.CodMat) <= 2 

--24. Listar los artículos compuestos por todos los materiales.
select a.Descripcion
from Articulo a join Compuesto_Por cp on a.CodArt=cp.CodArt
group by a.Descripcion
having Count(cp.codMat) >= (select Count(Descripcion) from Material)

select Descripcion
from Articulo a 
where not exists(
	select * 
	from Material m
	where not exists(
		select *
		from Compuesto_Por cp
		where cp.CodArt=a.CodArt
		and cp.CodMat=m.CodMat
	)
)



--25. Listar las ciudades donde existan proveedores que provean todos los materiales.

select distinct Ciudad
from Proveedor p
join(
	select p.Nombre
	from Proveedor p join Provisto_por pp on p.CodProv=pp.CodProv
	group by p.Nombre
	having COUNT(pp.CodMat)=(select Count(Descripcion) from Material)
) proveedores_todo on p.Nombre=proveedores_todo.Nombre


select distinct p.Ciudad
from Proveedor p
where not exists (
	select * 
	from Material m
	where not exists(
		select *
		from Provisto_por pp
		where pp.CodMat=m.CodMat
		and pp.CodProv=p.CodProv
	)
)