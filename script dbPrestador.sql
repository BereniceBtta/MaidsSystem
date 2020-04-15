create schema prestador authorization postgres;
--drop schema prestador cascade;

set search_path to prestador;
 
create table cat_servicio(
id_servicio int primary key, --identificador del servicio 
nombre varchar(15), --nombre del servicio 
descripcion text, --descripcion del servicio
costo_serv numeric(4),  --costo de cada servicio ofrecido 
fecha_creacion date --fecha de creacion
);

create table prestadora(
curp_prestador varchar(18) primary key, --curp del prestador 
nombre varchar(20), --nombre del prestador 
ap_paterno varchar(20), --apellido materno del prestador
ap_materno varchar(20), --apellido paterno del prestador 
f_nacimiento date,          --fecha de nacimiento del prestador 
calle varchar(20), --calle del prestador 
localidad varchar(20), --localidad del prestador  
colonia varchar(20), --colonia del prestador 
cpostal bigint, --código postal del domicilio del prestador 
num_contacto varchar(13), --número (con lada 521 del prestador)  https://wa.me/5211234567890
--https://wa.me/5211234567890?text=Me%20gustaría%20saber%20el%20precio%20del%20coche
--https://api.whatsapp.com/send?phone=5211234567890&text=&source=&data=
experiencia smallint, --experiencia del prestador 
horario_disp varchar(20), --horario del prestador 
tipo_serv varchar(15),  --servicio ofrecido del prestador (de planta o con horario)
condiciones text,  --condiciones del prestador 
status boolean, --sí está disponible o no
fecha_creacion date --fecha de creacion
);

create table cliente(
curp_cliente varchar(18) primary key,
nombre varchar(20), --nombre del cliente 
ap_paterno varchar(20), --apellido materno del cliente 
ap_materno varchar(20), --apellido paterno del cliente 
calle varchar(20), --nombre del cliente
localidad varchar(20), --localidad del cliente
colonia varchar(20), --nombre del cliente
cpostal bigint, --nombre del cliente 
num_contacto varchar(13), --número (con lada 521 del cliente)
condiciones text, --condiciones del cliente
fecha_creacion date --fecha de creacion
);

create table serv_prestador(
id_serv int references cat_servicio(id_servicio), --identificador del servicio
curp varchar references prestadora(curp_prestador), --curp del prestador
fecha_c date --fecha de creacion
);

/*create table prest_cliente(
curp_p varchar references prestadora(curp_p), --curp del prestador
curp_c varchar references cliente(curp_c) --curp del cliente
);*/
create table prestador_cliente(
fecha_inicio varchar(10), --fecha de inicio del trabajo
fecha_termino varchar(10), --fecha de termino del trabajo
dias_pago varchar(50), --en que días debe de pagarle
dias_descanso varchar(50), --que dias tiene de descanso
fecha_c date, --fecha de creacion
curp_p varchar references prestadora(curp_prestador), --curp del prestador
curp_c varchar references cliente(curp_cliente), --curp del cliente
primary key(curp_p,curp_c,fecha_inicio)
--aquí va una clave compuesta
);

create table imagenes(
curp_p varchar references prestadora(curp_prestador), --referencia al id del prestador
url varchar(50), --referencia a la imagen 
fecha_c date --fecha de creacion
);

create table evaluacion(
--aqui va el id 
fecha_i varchar(10), --fecha de inicio del trabajo
curp_p varchar(18), --curp del prestador
curp_c varchar(18), --curp del cliente
foreign key (curp_p,curp_c,fecha_i) references prestador_cliente(curp_p,curp_c,fecha_inicio),

calif smallint, --la calificacion del usuario al cliente o viceversa
descrip_calif text, --el por qué puso esa calificación
fecha_evaluacion date, --en que fecha lo evaluó
fecha_c date --fecha de creacion
);

create table pago(
--aqui  va el id
fecha_i varchar(10), --fecha de inicio del trabajo
curp_p varchar(18), --curp del prestador
curp_c varchar(18), --curp del cliente
foreign key (curp_p,curp_c,fecha_i) references prestador_cliente(curp_p,curp_c,fecha_inicio),

monto numeric(4),  --pago por el servicio ofrecido
fecha_pago date,   --fecha del pago
fecha_c date --fecha de creacion
);
