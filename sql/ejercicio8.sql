--Frecuenta (persona, bar)
--Sirve (bar, cerveza)
--Gusta (persona, cerveza)



create table Sirve(
	bar varchar(50),
	cerveza varchar(50),
	constraint pk_Sirve primary key (cerveza,bar),
);

create table Frecuenta(
	persona varchar(50),
	bar varchar(50),
	constraint pk_Frecuenta primary key (persona,bar),
);


create table Gusta(
	persona varchar(50),
	cerveza varchar(50),
	constraint pk_Gusta primary key (cerveza,persona),
);


GO

-- Carga de 20 registros sin duplicados para la tabla Sirve
INSERT INTO Sirve (bar, cerveza)
VALUES
    ('La Puerta Roja', 'Quilmes'),
    ('Victoria Brown', 'Patagonia'),
    ('878 Bar', 'Stella Artois'),
    ('Soria Bar', 'Iguana'),
    ('Frank''s Bar', 'Andes'),
    ('Rey de Copas', 'Quilmes'),
    ('Florería Atlántico', 'Patagonia'),
    ('Gran Bar Danzón', 'Stella Artois'),
    ('Verne Club', 'Iguana'),
    ('Victoria Lounge', 'Andes');

INSERT INTO Frecuenta (persona, bar)
VALUES 
('Carlos', '878 Bar'),
    ('Juan', 'La Puerta Roja'),
    ('María', 'Victoria Brown'),
    ('Pedro', '878 Bar'),
    ('Ana', 'Soria Bar'),
    ('Luis', 'Frank''s Bar'),
    ('Pedro', 'Rey de Copas'),
    ('María', 'Florería Atlántico'),
    ('Juan', 'Gran Bar Danzón'),
    ('Ana', 'Verne Club'),
    ('Luis', 'Victoria Lounge')
	;


INSERT INTO Gusta (persona, cerveza) VALUES ('Juan', 'Quilmes');
INSERT INTO Gusta (persona, cerveza) VALUES ('Juan', 'Patagonia');
INSERT INTO Gusta (persona, cerveza) VALUES ('Carlos', 'Stella Artois');
INSERT INTO Gusta (persona, cerveza) VALUES ('María', 'Iguana');
INSERT INTO Gusta (persona, cerveza) VALUES ('Pedro', 'Andes');
INSERT INTO Gusta (persona, cerveza) VALUES ('Pedro', 'Quilmes');
INSERT INTO Gusta (persona, cerveza) VALUES ('Ana', 'Patagonia');
INSERT INTO Gusta (persona, cerveza) VALUES ('Ana', 'Brahma');
INSERT INTO Gusta (persona, cerveza) VALUES ('Luis', 'Stella Artois');
GO


--1. Frecuentan solamente bares que sirven alguna cerveza que les guste.select distinct f.personafrom Frecuenta finner join Sirve s on f.bar=s.barwhere exists(	select *	from Gusta g	where g.cerveza=s.cerveza and g.persona=f.persona)--2. No frecuentan ningún bar que sirva alguna cerveza que les guste.select distinct f.personafrom Frecuenta finner join Sirve s on f.bar=s.barwhere not exists(	select *	from Gusta g	where g.cerveza=s.cerveza and g.persona=f.persona)--3. Frecuentan solamente los bares que sirven todas las cervezas que les gustan.select distinct *from Frecuenta fwhere not exists(	select s.*	from Sirve s	where s.bar = f.bar and s.cerveza not in(		select g.cerveza		from Gusta g		where g.persona=f.persona	))--4.Frecuentan solamente los bares que no sirven ninguna de las cervezas que no les gusta.select distinct *from Frecuenta fwhere not exists(	select s.*	from Sirve s	where s.bar = f.bar and s.cerveza not in(		select g.cerveza		from Gusta g		where g.persona=f.persona	))