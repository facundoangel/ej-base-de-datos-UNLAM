create database EJERCICIO12

use EJERCICIO12


create table Proveedor (
	codProv int not null,
	razonSocial varchar(50),
	fechaInicio date,
	constraint pk_Proveedor primary key (codProv)
);

create table Producto(
	codProd int not null,
	descripcion varchar(60),
	codProv int not null,
	stockActual int,
	constraint pk_Producto primary key (codProd),
	constraint fk_Producto_codProv foreign key (codProv) references Proveedor(codProv)
);

alter table Producto add constraint fk_Producto_codProv foreign key (codProv) references Proveedor(codProv) on delete cascade

create table Stock (
	nro int not null,
	fecha date,
	codProd int not null,
	cantidad int,
	constraint pk_Stock primary key (nro,codProd),
	constraint fk_Stock_codProd foreign key (codProd) references Producto(codProd)
);

alter table Stock add constraint fk_Stock_codProd foreign key (codProd) references Producto(codProd)
on delete cascade
--====================================INSERCCIÓN DE DATOS==========================-- Carga de datos ficticios para la tabla Proveedor
INSERT INTO Proveedor (codProv, razonSocial, fechaInicio)
VALUES
    (1, 'YPF S.A.', '2005-01-01'),
    (2, 'Arcor S.A.I.C.', '1982-03-21'),
    (3, 'Techint Group', '1945-12-19'),
    (4, 'Mercado Libre, Inc.', '1999-08-01'),
    (5, 'Grupo Clarín', '1945-01-28'),
    (6, 'Telecom Argentina', '1990-02-14'),
    (7, 'Banco Santander Río', '1968-05-01'),
    (8, 'Petrobras Argentina', '1922-07-12'),
    (9, 'Grupo Roggio', '1925-09-05'),
    (10, 'Grupo Financiero Galicia', '1905-12-19'),
    (11, 'IRSA Inversiones y Representaciones', '1943-06-22'),
    (12, 'YPF Luz', '2016-11-08'),
    (13, 'Banco Macro', '1985-04-09'),
    (14, 'Grupo Supervielle', '1887-09-08'),
    (15, 'Cablevisión', '1981-03-15'),
    (16, 'Edesur', '1992-01-02'),
    (17, 'Grupo Newsan', '1988-07-05'),
    (18, 'Grupo Werthein', '1912-10-14'),
    (19, 'YPF Directo', '2007-09-28'),
    (20, 'Sancor Seguros', '1945-07-01');
INSERT INTO Proveedor (codProv, razonSocial, fechaInicio)
VALUES  (19, 'YPF Directo', '2007-09-28')
-- Carga de datos ficticios para la tabla Producto
INSERT INTO Producto (codProd, descripcion, codProv, stockActual)
VALUES
    (1, 'Aceite de Girasol Cada Día 1L', 1, 50),
    (2, 'Dulce de Leche La Serenísima 500g', 2, 30),
    (3, 'Acero Inoxidable Ternium 3mm', 3, 25),
    (4, 'Smartphone Samsung Galaxy S21', 4, 10),
    (5, 'Diario Clarín', 5, 60),
    (6, 'Plan de Telefonía Personal 4G', 6, 15),
    (7, 'Préstamo Personal Santander Río', 7, 40),
    (8, 'Gasolina Infinia YPF', 8, 20),
    (9, 'Construcción de Viviendas Roggio', 9, 35),
    (10, 'Servicios Bancarios Galicia', 10, 55),
    (11, 'Desarrollo Inmobiliario IRSA', 11, 5),
    (12, 'Energía Eléctrica YPF Luz', 12, 45),
    (13, 'Préstamo Hipotecario Banco Macro', 13, 65),
    (14, 'Seguros de Auto Supervielle', 14, 75),
    (15, 'Cable de Conexión HDMI Cablevisión', 15, 22),
    (16, 'Suministro Eléctrico Edesur', 16, 18),
    (17, 'Electrodomésticos Newsan', 17, 28),
    (18, 'Servicios Financieros Grupo Werthein', 18, 8),
    (19, 'Combustible YPF Directo', 19, 38),
    (20, 'Seguro de Vida Sancor', 20, 12);
	
INSERT INTO Producto (codProd, descripcion, codProv, stockActual)
VALUES  (19, 'Combustible YPF Directo', 19, 38)	-- Carga de datos ficticios para la tabla Stock
INSERT INTO Stock (nro, fecha, codProd, cantidad)
VALUES
    (1, '2023-06-01', 1, 20),
    (2, '2023-06-02', 2, 15),
    (3, '2023-06-03', 3, 30),
    (4, '2023-06-04', 4, 5),
    (5, '2023-06-05', 5, 40),
    (6, '2023-06-06', 6, 10),
    (7, '2023-06-07', 7, 25),
    (8, '2023-06-08', 8, 18),
    (9, '2023-06-09', 9, 35),
    (10, '2023-06-10', 10, 50),
    (11, '2023-06-11', 11, 2),
    (12, '2023-06-12', 12, 40),
    (13, '2023-06-13', 13, 60),
    (14, '2023-06-14', 14, 70),
    (15, '2023-06-15', 15, 20),
    (16, '2023-06-16', 16, 15),
    (17, '2023-06-17', 17, 30),
    (18, '2023-06-18', 18, 5),
    (19, '2023-06-19', 19, 35),
    (20, '2023-06-20', 20, 8),
    (21, '2023-06-21', 1, 10),
    (22, '2023-06-22', 2, 25),
    (23, '2023-06-23', 3, 12),
    (24, '2023-06-24', 4, 8),
    (25, '2023-06-25', 5, 20),
    (26, '2023-06-26', 6, 5),
    (27, '2023-06-27', 7, 30),
    (28, '2023-06-28', 8, 22),
    (29, '2023-06-29', 9, 18),
    (30, '2023-06-30', 10, 40);
INSERT INTO Stock (nro, fecha, codProd, cantidad)
VALUES (19, '2020-06-19', 19, 0)--====================================EJERCICIOS SQL==========================--1. p_EliminaSinstock(): Realizar un procedimiento que elimine los productos que no
--poseen stock.gocreate procedure p_EliminaSinstockasbegin	delete from Producto	where stockActual=0endgo--2. p_ActualizaStock(): Para los casos que se presenten inconvenientes en los
--datos, se necesita realizar un procedimiento que permita actualizar todos los
--Stock_Actual de los productos, tomando los datos de la entidad Stock. Para ello,
--se utilizará como stock válido la última fecha en la cual se haya cargado el stock.create procedure p_ActualizaStockasbegin	declare @i int;	declare @cantProductos int;	declare @stockNuevo int;	set @i = 1;	set @cantProductos = (select count(*) from Producto);	while(@i <= @cantProductos)	begin		set @stockNuevo = (select top(1) s.cantidad from Stock s where s.codProd=@i order by s.fecha desc);		update Producto		set stockActual=@stockNuevo		where codProd=@i		set @i=@i+1;	endendexec p_ActualizaStock;select * from Productogo--3. p_DepuraProveedor(): Realizar un procedimiento que permita depurar todos los
--proveedores de los cuales no se posea stock de ningún producto provisto desde
--hace más de 1 añocreate view proveedoresInactivosasselect *	from Proveedor p	where p.codProv in(		select pr.codProv		from Stock s		inner join Producto pr on pr.codProd=s.codProd 		where s.fecha<= (select getdate())-365 and pr.stockActual=0	)gocreate procedure p_DepuraProveedorasbegin	declare @cantProvInact int = (select count(*) from proveedoresInactivos);	declare @i int = 1;	while(@i<=@cantProvInact)	begin		declare @idProvInac int = (select top(1) p.codProv from proveedoresInactivos p);		delete from Proveedor		where codProv=@idProvInac		print('Se elimino el proveedor: ' + cast(@idProvInac as varchar));		set @i = @i + 1;	endendexec p_DepuraProveedorgo--4. p_InsertStock(nro,fecha,prod,cantidad): Realizar un procedimiento que permita
--agregar stocks de productos. Al realizar la inserción se deberá validar que:
--a. El producto debe ser un producto existente
--b. La cantidad de stock del producto debe ser cualquier número entero
--mayor a cero.
--c. El número de stock será un valor correlativo que se irá agregando por
--cada nuevo stock de producto.create procedure p_InsertStock(@nro int,@fecha date,@prod int,@cantidad int)asbegin 	if (select count(*) from Producto p where p.codProd=@prod) = 0	begin		print('ERROR: Procuto inexistente');		return;	end	if(@cantidad<=0)	begin		print('ERROR: cantidad erronea');		return;	end	declare @nroStockNuevo int = (select MAX(s.nro) from Stock s) + 1;	if(@nroStockNuevo <> @nro)	begin		print('ERROR: el numero deberia ser ' + cast(@nroStockNuevo as varchar));		return;	end	if(@nro is null)	begin		set @nro = @nroStockNuevo;	end		insert into Stock	values (@nro, @fecha, @prod, @cantidad);	print('Producto agregado con exito');endexec p_InsertStock null,'2023-06-29',9,18;drop procedure p_InsertStock; go--5. tg_CrearStock: Realizar un trigger que permita automáticamente agregar un
--registro en la entidad Stock, cada vez que se inserte un nuevo producto. El stock
--inicial a tomar, será el valor del campo Stock_Actual.create trigger tg_CrearStock on Producto after insertasbegin	declare @fechaActual date = (select CAST(GETDATE() as date));	declare @prodInsertado int = (select i.codProd from inserted i);	declare @StockNuevoProd int = (select i.stockActual from inserted i);	exec p_InsertStock null, @fechaActual, @prodInsertado, @StockNuevoProd;	print('stock agregado con exito para el producto: ');endINSERT INTO Producto 
VALUES (21, 'Alfajores aguila', 2, 500)