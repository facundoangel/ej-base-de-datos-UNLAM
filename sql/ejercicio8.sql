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
    ('Florer�a Atl�ntico', 'Patagonia'),
    ('Gran Bar Danz�n', 'Stella Artois'),
    ('Verne Club', 'Iguana'),
    ('Victoria Lounge', 'Andes');

INSERT INTO Frecuenta (persona, bar)
VALUES 
('Carlos', '878 Bar'),
    ('Juan', 'La Puerta Roja'),
    ('Mar�a', 'Victoria Brown'),
    ('Pedro', '878 Bar'),
    ('Ana', 'Soria Bar'),
    ('Luis', 'Frank''s Bar'),
    ('Pedro', 'Rey de Copas'),
    ('Mar�a', 'Florer�a Atl�ntico'),
    ('Juan', 'Gran Bar Danz�n'),
    ('Ana', 'Verne Club'),
    ('Luis', 'Victoria Lounge')
	;


INSERT INTO Gusta (persona, cerveza) VALUES ('Juan', 'Quilmes');
INSERT INTO Gusta (persona, cerveza) VALUES ('Juan', 'Patagonia');
INSERT INTO Gusta (persona, cerveza) VALUES ('Carlos', 'Stella Artois');
INSERT INTO Gusta (persona, cerveza) VALUES ('Mar�a', 'Iguana');
INSERT INTO Gusta (persona, cerveza) VALUES ('Pedro', 'Andes');
INSERT INTO Gusta (persona, cerveza) VALUES ('Pedro', 'Quilmes');
INSERT INTO Gusta (persona, cerveza) VALUES ('Ana', 'Patagonia');
INSERT INTO Gusta (persona, cerveza) VALUES ('Ana', 'Brahma');
INSERT INTO Gusta (persona, cerveza) VALUES ('Luis', 'Stella Artois');
GO


--1. Frecuentan solamente bares que sirven alguna cerveza que les guste.