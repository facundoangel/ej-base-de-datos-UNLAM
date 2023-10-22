create database EJERCICIO11

use EJERCICIO11



create table Genero (
	id int not null,
	nombGenero varchar (50),
	constraint pk_Genero primary key (id)
);

create table Director(
	id int not null,
	nya varchar(50),
	constraint pk_Director primary key (id)
);

create table Pelicula(
	codPel int not null,
	titulo varchar(50),
	duracion varchar(50),
	codGenero int not null,
	idDirector int not null,
	constraint pk_Pelicula primary key (codPel),
	constraint fk_Pelicula_codGenero foreign key (codGenero) references Genero(id),
	constraint fk_Pelicula_idDirector foreign key (idDirector) references Director(id)
);

create table Ejemplar(
	nroEj int not null,
	CodPel int not null,
	Estado bit not null,
	constraint pk_Ejemplar primary key (nroEj,CodPel),
	constraint fk_Ejemplar_CodPel foreign key (CodPel) references Pelicula(codPel)
);
--{Estado: 1 Disponible, 0 No disponible}

create table Cliente (
	codCli int not null,
	nya varchar (50),
	direccion varchar(50),
	tel int,
	email varchar (40),
	borrado tinyint default 2,
	constraint pk_Cliente primary key (codCli)
);
--{Borrado: 1 Si, 2 No(Default) }

create table Alquiler (
	id int not null,
	nroEj int not null,
	codPel int not null,
	codCli int not null,
	fechaAlq date,
	fechaDev date,
	constraint pk_Alquiler primary key (id),
	constraint fk_Alquiler_nroEj foreign key (nroEj,codPel) references Ejemplar(nroEj,codPel),
	constraint fk_Alquiler_codPEl foreign key (codCli) references Cliente(codCli),

);
GO--=================================================CARGA DE DATOS=========================-- Inserción de datos para la tabla de Películas
INSERT INTO Pelicula (codPel, titulo, duracion, codGenero, idDirector)
VALUES
    (1, 'Titanic', '3 horas', 1, 1),
    (2, 'Jurassic Park', '2 horas 7 minutos', 2, 2),
    (3, 'The Shawshank Redemption', '2 horas 22 minutos', 3, 3),
    (4, 'Avatar', '2 horas 42 minutos', 4, 4),
    (5, 'Pulp Fiction', '2 horas 34 minutos', 5, 5),
    (6, 'The Godfather', '2 horas 55 minutos', 6, 6),
    (7, 'The Dark Knight', '2 horas 32 minutos', 2, 7),
    (8, 'Inception', '2 horas 28 minutos', 4, 8),
    (9, 'Fight Club', '2 horas 19 minutos', 5, 9),
    (10, 'Forrest Gump', '2 horas 22 minutos', 3, 10);

insert into Pelicula(codPel, titulo, duracion, codGenero, idDirector) 
values (11, 'V de Venganza', '2 horas 10 minutos', 3, 10);


-- Inserción de datos para la tabla de Clientes
INSERT INTO Cliente (codCli, nya, direccion, tel, email, borrado)
VALUES
    (1, 'John Doe', '123 Calle Principal', 55512345, 'john.doe@example.com', 2),
    (2, 'Jane Smith', '456 Oak Street', 55598654, 'jane.smith@example.com', 2),
    (3, 'Michael Johnson', '789 Elm Avenue', 55551234, 'michael.johnson@example.com', 2),
    (4, 'Emily Davis', '321 Pine Road', 55543210, 'emily.davis@example.com', 2),
    (5, 'David Wilson', '654 Maple Lane', 55524815, 'david.wilson@example.com', 2);

	INSERT INTO Cliente (codCli, nya, direccion, tel, email, borrado)
	VALUES (6,'Facundo Angel', 'calle 123', 123123, 'facundo@mail.com',2);
	INSERT INTO Cliente (codCli, nya, direccion, tel, email, borrado)
	VALUES (7,'gustavo Angel', 'calle 21', 67767, 'gustavo@mail.com',2);

	-- Inserción de datos para la tabla de Género
INSERT INTO Genero (id, nombGenero)
VALUES
    (1, 'Romance'),
    (2, 'Acción'),
    (3, 'Drama'),
    (4, 'Ciencia ficción'),
    (5, 'Crimen'),
    (6, 'Suspense'),
    (7, 'Comedia'),
    (8, 'Aventura'),
    (9, 'Fantasía'),
    (10, 'Animación');

	-- Inserción de datos para la tabla de Director
INSERT INTO Director (id, nya)
VALUES
    (1, 'Steven Spielberg'),
    (2, 'Martin Scorsese'),
    (3, 'Frank Darabont'),
    (4, 'James Cameron'),
    (5, 'Quentin Tarantino'),
    (6, 'Francis Ford Coppola'),
    (7, 'Christopher Nolan'),
    (8, 'David Fincher'),
    (9, 'David Lynch'),
    (10, 'Robert Zemeckis');


-- Inserción de datos para la tabla de Ejemplar
INSERT INTO Ejemplar (nroEj, CodPel, Estado)
VALUES
    (1, 1, 1),
    (2, 2, 1),
    (3, 3, 1),
    (4, 4, 0),
    (5, 5, 1),
    (6, 6, 1),
    (7, 7, 0),
    (8, 8, 1),
    (9, 9, 1),
    (10, 10, 1);

insert into Ejemplar (nroEj, CodPel, Estado)
values (11, 11, 1);

-- Inserción de datos para la tabla de Alquiler
INSERT INTO Alquiler (id, nroEj, codPel, codCli, fechaAlq, fechaDev)
VALUES
    (1, 1, 1, 1, '2023-01-05', '2023-01-07'),
    (2, 2, 2, 2, '2023-02-15', '2023-02-18'),
    (3, 3, 3, 3, '2023-03-10', '2023-03-13'),
    (4, 4, 4, 4, '2023-04-22', '2023-04-25'),
    (5, 5, 5, 5, '2023-05-12', '2023-05-15'),
    (6, 1, 1, 1, '2023-06-30', '2023-07-02'),
    (7, 3, 3, 2, '2023-08-08', '2023-08-11'),
    (8, 8, 8, 3, '2023-09-18', '2023-09-21'),
    (9, 9, 9, 4, '2023-10-05', '2023-10-08'),
    (10, 10, 10, 5, '2023-11-16', '2023-11-19'),
    (11, 2, 2, 1, '2023-12-10', '2023-12-13'),
    (12, 3, 3, 2, '2023-07-01', '2023-07-04'),
    (13, 4, 4, 3, '2023-09-14', '2023-09-17'),
    (14, 5, 5, 4, '2023-03-28', '2023-03-31'),
    (15, 6, 6, 5, '2023-05-20', '2023-05-23');


--============================================EJERCICIOS=====================================

--3. Agregue el atributo “año” en la tabla Película
alter table Pelicula add anio int


--4. Actualice la tabla película para que incluya el año de lanzamiento de las películas en stock.
UPDATE Pelicula
SET anio = 2020 WHERE codPel = 1;

UPDATE Pelicula
SET anio = 2018 WHERE codPel = 2;

UPDATE Pelicula
SET anio = 2019 WHERE codPel = 3;

UPDATE Pelicula
SET anio = 2021 WHERE codPel = 4;

UPDATE Pelicula
SET anio = 2017 WHERE codPel = 5;

UPDATE Pelicula
SET anio = 2022 WHERE codPel = 6;

UPDATE Pelicula
SET anio = 2023 WHERE codPel = 7;

UPDATE Pelicula
SET anio = 2016 WHERE codPel = 8;

UPDATE Pelicula
SET anio = 2024 WHERE codPel = 9;

UPDATE Pelicula
SET anio = 2015 WHERE codPel = 10;
go
--5. Queremos que al momento de eliminar una película se eliminen todos los
--ejemplares de la misma. Realice una CONSTRAINT para esta tarea.alter table Ejemplar add constraint  fk_Ejemplar_CodPel  foreign key (CodPel) references Pelicula(CodPel) on delete cascadego--6. Queremos que exista un borrado de lógico y no físico de clientes, realice un
--TRIGGER que usando el atributo “Borrado” haga esta tarea

alter table Alquiler drop constraint fk_Alquiler_codPel

create trigger borradoCliente on Cliente instead of delete
as
begin
	
	declare @idCliente int;
	set @idCliente = (select d.codCli from deleted d);


	update Cliente
	set borrado=1 where codCli=@idCliente;

end
go

--7. Elimine las películas de las que no se hayan alquilado ninguna copia.


create view peliculasSinAlquilarSinLimite
as
select p.codPel
		from Alquiler a
		right join Pelicula p on a.codPel=p.codPel
		group by p.codPel
		having count(a.nroEj)=0
go

create view cantPelisSinAlquilar
as
select count(*) as cantPeliculas
from peliculasSinAlquilarSinLimite
go

create view obtenerPeliculaSinAlquilar
as
select top(1) p.codPel
from Alquiler a
right join Pelicula p on a.codPel=p.codPel
group by p.codPel
having count(a.nroEj)=0
go

create procedure eliminarPelisSiinAlquilar
as
begin
	declare @cantPelis int;
	set @cantPelis = (select * from cantPelisSinAlquilar);
	
	while (@cantPelis>0)
	begin
		set @cantPelis = @cantPelis-1;

		declare @idPeli int;
		set @idPeli = (select * from obtenerPeliculaSinAlquilar);

		delete from Pelicula where codPel=@idPeli
	end
end
go

exec eliminarPelisSiinAlquilar
select * from Pelicula
drop procedure eliminarPelisSiinAlquilar


--8. Elimine los clientes sin alquileres.
create view ClientesSinAlquilar
as
select c.codCli
		from Alquiler a
		right join Cliente c on a.codCli=c.codCli
		group by c.codCli
		having count(a.codPel)=0
go

create view cantClientesSinAlquilar
as
select count(*) as cantClientes
from ClientesSinAlquilar
go

create view obtenerClienteSinAlquilar
as
select top(1) c.codCli
from Alquiler a
right join Cliente c on a.codCli=c.codCli
where c.borrado<>1
group by c.codCli
having count(a.codPel)=0
		
go


create procedure eliminarClientesSiinAlquilar
as
begin
	declare @cantCli int;
	set @cantCli = (select * from cantClientesSinAlquilar);
	
	while (@cantCli>0)
	begin

		set @cantCli = @cantCli-1;

		declare @idCli int;
		set @idCli = (select * from obtenerClienteSinAlquilar);

		delete from Cliente where codCli=@idCli
	end
end
go


select * from Cliente
exec eliminarClientesSiinAlquilar


