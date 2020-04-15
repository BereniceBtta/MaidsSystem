set search_path to prestador;
set datestyle to sql,dmy;

--tabla de servicios
insert into cat_servicio(id_servicio,nombre,descripcion,costo_serv,fecha_creacion)values(1,'limpieza','limpieza general del hogar',150.5,'10/02/2020');
insert into cat_servicio values(2,'lavar','lavado de ropa familiar',80.0,'10/02/2020');
insert into cat_servicio values(3,'cuidar niños','cuidado de niños',120,'10/02/2020');

--tabla prestador
insert into prestadora values('AABG980424MOCNTD07','Guadalupe','Anaya','Bautista','24/04/1998','Benito Juarez #10','Villa de Etla','Centro',68200,'5219515089032',5,'de 3-7 pm','con horario','comidas incluidas',true,'10/02/2020');
insert into prestadora values('AAFA950830MOCNTD07','Felipe Aurelio','Anaya','Bautista','30/08/1995','Benito Juarez #10','Villa de Etla','Centro',68200,'5219511001244',5,'de 10am a 7 pm','con horario','comidas incluidas',false,'10/02/2020');


--tabla cliente
insert into cliente values('ABCDEF8794545','Delfino','Anaya','Martínez','Morelos #26','Villa de Etla','Centro',68200,'5219511955441','elementos conocidos','10/02/2020');
insert into cliente values('ABCDEF879454578','Raquel','Bautista','Perez','Guerrero #4','Asunción Guelache','Asuncion',68204,'5219511955437','elementos conocidos','10/02/2020');

--tabla serv_prestador
insert into serv_prestador values(1,'AABG980424MOCNTD07','10/02/2020');
insert into serv_prestador values(2,'AABG980424MOCNTD07','10/02/2020');
insert into serv_prestador values(1,'AAFA950830MOCNTD07','10/02/2020');
insert into serv_prestador values(2,'AAFA950830MOCNTD07','10/02/2020');

--prest_cliente
insert into prestador_cliente values('02/02/2020','25/02/2020','miercoles','sábado y domingo','02/02/2020','AABG980424MOCNTD07','ABCDEF8794545');
insert into prestador_cliente values('02/02/2020','25/02/2020','miercoles','sábado y domingo','02/02/2020','AABG980424MOCNTD07','ABCDEF879454578');

insert into prestador_cliente values('02/02/2020','25/02/2020','miercoles','sábado y domingo','02/02/2020','AAFA950830MOCNTD07','ABCDEF879454578');
insert into prestador_cliente values('03/02/2020','25/02/2020','miercoles','sábado y domingo','02/02/2020','AAFA950830MOCNTD07','ABCDEF879454578');
insert into prestador_cliente values(current_date,'25/02/2020','miercoles','sábado y domingo',current_date,'AAFA950830MOCNTD07','ABCDEF879454578');

--imagenes
insert into imagenes values('AABG980424MOCNTD07','A',current_date);
insert into imagenes values('AAFA950830MOCNTD07','B',current_date);

--evaluacion
insert into evaluacion values('03/02/2020','AAFA950830MOCNTD07','ABCDEF879454578',8,'tuvo un buen desempeño de trabajo','09/02/2020','03/02/2020');
insert into evaluacion values('02/02/2020','AAFA950830MOCNTD07','ABCDEF879454578',9,'tuvo un buen desempeño de trabajo','07/02/2020','12/02/2020');
insert into evaluacion values(current_date,'AAFA950830MOCNTD07','ABCDEF879454578',9,'tuvo un buen desempeño de trabajo','07/02/2020',current_date);

--pago
insert into pago values(current_date,'AAFA950830MOCNTD07','ABCDEF879454578',250.0,'05/02/2020',current_date);
insert into pago values(current_date,'AAFA950830MOCNTD07','ABCDEF879454578',300.0,'01/02/2020',current_date);
