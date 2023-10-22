--1) Hallar para una persona dada, por ejemplo Juan Perez, los tipos y números de
--documentos, nombres, dirección y fecha de nacimiento de todos sus hijos.select p.tipoDoc, p.nroDoc, p.nombre, p.direccion, p.fechaNacfrom Persona pinner join Progenitor pr on p.nroDoc=pr.nroDocHijowhere exists (	select *	from Persona p2	where p2.nroDoc = pr.nroDoc and p2.tipoDoc=pr.tipoDoc and p2.nombre='Juan Perez')--2. Hallar para cada persona los tipos y números de documento, nombre, domicilio y
--fecha de nacimiento de:
--a. Todos sus hermanos, incluyendo medios hermanos.
select *
from Persona p
inner join Progenitor pr on p.nroDoc=pr.nroDocHijo and p.tipoDoc=pr.tipoDocHijo
where pr.nroDoc in (
	select pr2.nroDoc
	from Persona p2
	inner join Progenitor pr2 on p2.nroDoc=pr2.nroDocHijo and p2.tipoDoc=pr2.tipoDocHijo
	where p2.nroDoc<>p.nroDoc and p2.nombre='Lucía Torres'
)

--b. Su madre 
select *from Persona pwhere p.sexo='F' and p.nroDoc in (
	select pr.nroDoc
	from Persona p
	inner join Progenitor pr on p.nroDoc=pr.nroDocHijo and p.tipoDoc=pr.tipoDocHijo
	where p.nombre='Lucía Torres'
)
go

--c. Su abuelo materno
create view BusqMadre as
select p.nroDocfrom Persona pwhere p.sexo='F' and p.nroDoc in (
	select pr.nroDoc
	from Persona p
	inner join Progenitor pr on p.nroDoc=pr.nroDocHijo
	where p.nombre='Lucía Torres'
)
go

select * 
from Persona p
inner join Progenitor pr on pr.nroDoc=p.nroDoc and pr.tipoDoc=p.tipoDoc
where pr.nroDocHijo=(select * from BusqMadre) and p.sexo='M'

--d. Todos sus nietos
select *
from Persona p
where p.nroDoc in (
	select pr2.nroDocHijo
	from Progenitor pr2
	where pr2.nroDoc in(
		select pr3.nroDocHijo
		from Progenitor pr3
		inner join Persona p2 on p2.nroDoc=pr3.nroDoc and p2.tipoDoc=pr3.tipoDoc
		where p2.nombre='Rodolfo Lopez'
	)
)


