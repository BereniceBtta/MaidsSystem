set search_path to prestador;
set datestyle to sql,dmy;

--todas las tablas
select * from cat_servicio; 
select * from cliente;
select * from imagenes;
select * from prestador_cliente;
select * from prestadora;
select * from serv_prestador;

--1.- Mostrar a los prestadores de servicio y los servicios que han realizado en todos los registros que tengas ya quedó)
--revisar
select descripcion,p.nombre as nombre_prestador 
from cat_servicio as cs 
inner join serv_prestador as sp ON (sp.id_serv=cs.id_servicio)
inner join prestadora as p ON (sp.curp = p.curp_prestador) WHERE sp.curp = p.curp_prestador;

/*SELECT *
FROM anuncios AS an
INNER JOIN  afiliados AS af ON ( an.id_afiliado = af. id_afiliado )
INNER JOIN comentarios AS co ON ( an.id_afiliado= co.id_afiliado AND co.id_anuncio= an.id_anuncio )
--SELECT *
FROM anuncios AS anu LEFT JOIN comentario AS com ON anu.id_anuncio = com.co_id_anuncio LEFT JOIN afiliados AS afi ON anu.id_afiliado = afi.id_afiliado
WHERE anu.name= colname */
 

--2.- Mostrar un reporte de los montos a cobrar en un servicio dada la fecha, el prestador y el empleador  (solo da el nombre)
select nombre from prestador_cliente natural join prestadora where curp_p=curp_prestador group by nombre;

--3.- Calcular el monto por mes de un prestador (no ha quedado)
select * from prestadora as p natural join prestador_cliente as pc where pc.curp_p=p.curp_prestador;

--4.- Calcular el # de veces que ha sido empleado cada prestador (ya)

select nombre,count(curp_p) from prestador_cliente natural join prestadora where curp_p=curp_prestador group by nombre ;

--5.- Calcular el # de veces que el empleador ha usado los servicios de algún prestador (ya)

select nombre,count(curp_c) from prestador_cliente natural join cliente where curp_c=curp_cliente group by nombre ;

--//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
-------------------------------------------------------------------------------------------------------------------------------------------------------
--prueba
select p.nombre as prestador from prestadora as p natural join prestador_cliente as pc where pc.curp_p=p.curp_prestador;
select c.nombre as cliente from cliente as c natural join prestador_cliente as pc where pc.curp_c=c.curp_cliente;
