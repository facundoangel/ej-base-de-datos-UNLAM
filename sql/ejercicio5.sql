create database EJERCICIO05

-- Creación de estructuras.

create table GaleriaDeArte(
	id int not null,
	nombre varchar(50),
	disponible varchar(50),
	calle  varchar(50),
	nro varchar(50),
	localidad  varchar(50),
	constraint pk_GaleriaDeArte primary key (id)
);

create table TipoDeObra(
	id int not null,
	descripcion varchar(60),
	constraint pk_TipoDeObra primary key (id)
);
create table Tematica(
	id int not null,
	descripcion varchar(60),
	constraint pk_Tematica primary key(id)
);

create table Autor(
	id int not null,
	nya varchar(80),
	fechanacimiento date,
	constraint pk_autor primary key (id)
);

create table Obra(
	id int not null,
	nombre varchar(50),
	material varchar(60),
	idTipo int not null,
	idAutor int not null,
	constraint pk_Obra primary key (id),
	constraint fk_tipo_Obra foreign key (idTipo) references TipoDeObra(id),
	constraint fk_autor_Obra foreign key (idAutor) references Autor(id)
);
create table Exposicion(
	idGaleria int not null,
	idObra int not null,
	idTematica int not null,
	fecha date not null,
	sala int,
	constraint pk_Exposicion primary key (idGaleria,idObra,idTematica,fecha),
	constraint fk_galeria_Exposicion foreign key (idGaleria) references GaleriaDeArte(id),
	constraint fk_obra_Exposicion foreign key (idObra) references Obra(id),
	constraint fk_tematica_Exposicion foreign key (idTematica) references Tematica(id)

);


-- Insertando datos.
-- Insertar registros en la tabla GaleriaDeArte
INSERT INTO GaleriaDeArte VALUES
(1, 'Galería Barcelona', 'si', 'Calle Barcelona', 123, 'Barcelona'),
(2, 'Galería Buenos Aires', 'no', 'Calle Buenos Aires', 456, 'Buenos Aires'),
(3, 'Galería Florencia', 'no', 'Calle Florencia', 789, 'Florencia'),
(4, 'Galería Recoleta', 'si', 'Calle Recoleta', 321, 'Recoleta'),
(5, 'Galería Orfeo', 'si', 'Calle Orfeo', 654, 'Orfeo');

-- Insertar registros en la tabla Autor
INSERT INTO Autor VALUES
(1, 'Salvador Dalí', '1904-05-11'),
(2, 'Pablo Picasso', '1881-10-25'),
(3, 'Joan Miró', '1893-04-20'),
(4, 'Max Ernst', '1891-04-02'),
(5, 'Man Ray', '1890-08-27');

-- Insertar registros en la tabla TipoDeObra
INSERT INTO TipoDeObra VALUES
(1, 'dadaísmo'),
(2, 'surrealismo'),
(3, 'pop art'),
(4, 'Art Deco'),
(5, 'Minimalismo');

-- Insertar registros en la tabla Obra
INSERT INTO Obra VALUES
(1, 'La persistencia de la memoria', 'lienzo', 2, 1),
(2, 'La tentación de San Antonio', 'lienzo', 2, 1),
(3, 'Guernica', 'lienzo', 2, 2),
(4, 'El Grito', 'lienzo', 2, 2),
(5, 'La danza', 'bronce', 5, 3);

-- Insertar registros en la tabla Tematica
INSERT INTO Tematica VALUES
(1, 'Surrealismo'),
(2, 'Expresionismo abstracto'),
(3, 'Cubismo'),
(4, 'Arte contemporáneo'),
(5, 'Arte conceptual');

-- Insertar registros en la tabla Exposicion
INSERT INTO Exposicion VALUES
(1, 2, 4, '2023-2-26', 12),
(2, 4, 1, '2023-1-23', 1),
(3, 4, 4, '2023-2-6', 6),
(1, 5, 5, '2023-6-22', 7),
(2, 1, 2, '2023-4-29', 8),
(4, 2, 2, '2023-4-4', 4),
(5, 3, 1, '2023-2-1', 2),
(5, 3, 5, '2023-1-2', 7),
(4, 4, 1, '2023-1-30', 10),
(2, 1, 2, '2023-4-1', 8),
(1, 1, 5, '2023-6-23', 3),
(1, 4, 3, '2023-5-6', 10),
(4, 4, 2, '2023-6-27', 11),
(5, 4, 4, '2023-6-2', 2),
(2, 4, 1, '2023-2-14', 5),
(4, 4, 1, '2023-1-15', 10),
(2, 3, 4, '2023-6-4', 2),
(3, 2, 3, '2023-2-10', 11),
(1, 2, 3, '2023-2-14', 1),
(1, 1, 2, '2023-3-19', 12),
(1, 4, 3, '2023-3-19', 12),
(1, 4, 1, '2023-3-29', 2),
(5, 1, 1, '2023-3-2', 8),
(1, 4, 1, '2023-1-18', 8),
(1, 2, 3, '2023-4-25', 2),
(5, 5, 2, '2023-4-23', 2),
(5, 1, 2, '2023-1-14', 2),
(4, 5, 3, '2023-3-25', 4),
(4, 1, 4, '2023-2-23', 5),
(3, 3, 1, '2023-4-16', 4),
(4, 3, 4, '2023-2-21', 11),
(4, 3, 4, '2023-5-7', 5),
(5, 1, 5, '2023-3-28', 1),
(3, 3, 2, '2023-1-24', 11),
(1, 3, 2, '2023-2-1', 3),
(4, 2, 3, '2023-6-28', 6),
(2, 4, 4, '2023-1-18', 12),
(4, 5, 4, '2023-5-10', 3),
(2, 4, 2, '2023-5-13', 1),
(1, 1, 1, '2023-1-9', 6),
(3, 4, 1, '2023-1-7', 9),
(4, 5, 5, '2023-5-20', 6),
(1, 1, 1, '2023-3-22', 10),
(3, 1, 5, '2023-1-12', 12),
(2, 3, 1, '2023-4-23', 9),
(5, 4, 3, '2023-6-3', 9),
(1, 4, 5, '2023-5-26', 1),
(3, 4, 1, '2023-3-25', 6),
(1, 2, 1, '2023-6-22', 12),
(2, 5, 2, '2023-6-21', 5)
GO


--resolucion de ejercicios

-- a - Obtener el nombre de la galería de arte, la descripción de la temática presentada y la fecha de realización,
--cuando la exposición tuvo la mayor cantidad de obras en expuestas. Sólo se mostrarán los resultados siempre y
--cuando la galería de arte haya presentado todas las temáticas disponibles o haya expuesto distintas obras a tal
--punto de haber presentado todos los tipos de obra disponibles.


create view cantObrasXGaleria as
select e.idGaleria, COUNT(e.idObra) as cant_obras  
from Exposicion e
group by e.idGaleria
GO

create view galeriaConMasObras as
select  MAX(c.cant_obras) as cant_obras
from cantObrasXGaleria c
GO
create view idGaleriaConMasObras as
select c.idGaleria
from cantObrasXGaleria c
where c.cant_obras = (select * from galeriaConMasObras)
GO

select distinct g.nombre
from Tematica t, GaleriaDeArte g, Exposicion e
where t.id=e.idTematica and g.id=e.idGaleria 
and e.idGaleria in (select * from idGaleriaConMasObras)
and (not exists(
	select t2.*
	from Tematica t2
	where not exists(
			select e2.*
			from Exposicion e2
			where e2.idGaleria=g.id and t2.id=e2.idTematica
		)
	) or	
	not exists(
		select tip.*
		from TipoDeObra tip
		where not exists(
				select o.*
				from Obra o
				where o.idTipo=tip.id
			)
	)
)
GO

--b - Se requiere crear un procedimiento almacenados q o función (PostgreSQL) para generar una nueva
--exposición, por lo tanto se desea recibir por parámetro, el id de la galería de arte, id de la temática, id de la obra a
--participar y la fecha. Si la exposición no existe se deberá asignar el número de sala “1”, pero si la exposición ya
--existiera deberá utilizarse el número de sala previamente cargado para la misma.
--Aclaración: Deberá validar que los id recibidos por parámetros existan en las tablas correspondientes.CREATE PROCEDURE generar_nueva_exposicion @idGaleria int, @idTematica int, @idObra int, @fecha dateasBEGIN	DECLARE @salaNueva int;	if(not exists(select * from GaleriaDeArte where id = @idGaleria)		or not exists(select * from Obra where id = @idObra)			or not exists(select * from Tematica where id = @idTematica)		or exists(select * from Exposicion where idGaleria = @idGaleria and idObra = @idObra and idTematica = @idTematica and fecha=@fecha)	)	begin		print 'ERROR: Registro duplicado';		return;	end	set @salaNueva = (select e.sala from Exposicion e where idGaleria = @idGaleria and idObra = @idObra and idTematica = @idTematica and fecha=@fecha);	if (@salaNueva is NULL)	BEGIN		set @salaNueva = 1;	END	insert into Exposicion	values (@idGaleria,@idObra,@idTematica,@fecha,@salaNueva);	return;ENDexec generar_nueva_exposicion 1, 2, 1,'2000-12-10';