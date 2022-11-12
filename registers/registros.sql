USE sanifersac;

INSERT INTO medio_de_pago (id, medio_de_pago)
VALUES 
	(1, 'efectivo'),
	(2, 'transferencia'),
	(3, 'tarjeta de credito o debito')
;

INSERT INTO estado_de_venta (id, descripcion_estado)
VALUES
	(1, 'pendiente'),
    (2, 'pagada'),
    (3, 'reembolsado'),
    (4, 'rechazado')
;

INSERT INTO proveedor (id, razon_social, direccion, email, telefono)
VALUES
	(1,'Plaswag S.A.','Lavalle  2507 Villa Maipu','ventas@plaswag.com.ar',5411475201),
    (2,'Plastec USA Inc.','7752 NW 74th Ave Miami','plastec@plastecusa.com',3058876920),
    (3,'Santa Rosa Plásticos S.R.L.','Maquinista Carregal 3151','info@srplasticos.com.ar',5401147624),
    (4,'UNITRADE','Av Nestor Gambetta 8651 Callao','informes@unitrade.pe',5116169797),
    (5,'MET Group','Av Argentina 2787 Lima','ventas@metgroup.pe',5116193600)
;
    
INSERT INTO fabrica (id, nombre_fabrica, telefono, direccion)
VALUES
	(1,'fabrica1',4652434,'Calle Sebastian Barranca 1159 La Victoria'),
    (2,'fabrica2',4732457,'Carretera Central 9201 Ate')
;

INSERT INTO ciudad (id, nombre_ciudad)
VALUES
	(1,'callao'),
    (2,'arequipa'),
    (3,'cajamarca'),
    (4,'lima'),
    (5,'chimbote'),
    (6,'cusco'),
    (7,'ica'),
    (8,'tarapoto'),
    (9,'trujillo'),
    (10,'tacna')
;

INSERT INTO cliente (id, razon_social, telefono, direccion, id_ciudad)
VALUES
	(1,'Promilsa SRL',4844816,'Av los Dominicos 772',1),
    (2,'Comercial Nemdar EIRL',958949285,'Lambayeque 102 Mariano Melgar',2),
    (3,'Global Importaciones SAC',959824465,'Andia 113 Mariano Melgar',2),
    (4,'Distribuciones M Olano SAC',955089849,'Av Manuel Antonio Mesones Muro 230',3),
    (5,'Cano Hnos SRL',999276722,'Viv Paraiso Florido Lote 34',4),
    (6,'Distribuidora y Electro Abigail SAC',944960909,'Avenida Jose Galvez 518',5),
    (7,'D Co Centro El Olivo SAC',984102527,'Via Expresa A12',6),
    (8,'Dimarsa SAC',233261,'Pasaje los Angeles 116',7),
    (9,'Distribuidora El Auquiato EIRL',4494024,'Calle Daniel Cruz Lote 22',4),
    (10,'Inversiones Shimba',987003718,'Jr Martinez De Compagnon 225',8),
    (11,'Distribuidora ATM SRLTDA',949660241,'Calle El Palmar 395',9),
    (12,'Inversiones Baltodano SAC',955806730,'Calle Los Calderos 247',9),
    (13,'CORPBESTS SAC',994570903,'Av Jorge Basadre Lote 3',10)
;

INSERT INTO empleado (dni_empleado, nombre, apellido, edad, email, telefono, id_ciudad, id_fabrica)
VALUES
	(45637584,'Juan','Montes',30,'jmontes@gmail.com',9874627495,1,1),
    (37609854,'Manuel','Ceballos',29,'manuc@gmail.com',9375638275,4,1),
    (43519008,'Diego','Pinillos',27,'diegopinillos@gmail.com',9027484930,10,2),
    (30985729,'Rodrigo','Mendes',38,'romendes@gmail.com',9993765893,8,1),
    (50927494,'Maximiliano','Gomez',38,'maxigo@gmail.com',9834362852,8,2),
    (49038275,'Jose','Rubio',28,'joserubio@gmail.com',9019087365,8,2),
    (56826394,'Pedro','Silva',29,'pedro@gmail.com',9128365820,3,2),
    (39762089,'Jose','Robles',27,'josero@gmail.com',9347520913,5,1),
    (66372659,'Enrique','Vallve',30,'kikevallve@gmail.com',9385766387,2,2),
    (30342634,'Manuel','Guevara',29,'manuelg@gmail.com',9222857364,9,2),
    (49522600,'Alberto','Cabello',31,'albertoc@gmail.com',9059378238,4,1),
    (50382756,'Pablo','Sanchez',27,'pablosz@gmail.com',9673983402,6,1),
    (31857384,'Maximo','Diaz',26,'maxidiaz@gmail.com',9347267312,7,1),
    (64909275,'Guillermo','Favero',29,'guillefavero@gmail.com',9173655893,10,2)
;

INSERT INTO producto (id, nombre, descripcion, precio, stock, id_fabrica)
VALUES
	(1,'Accesorio Plastico para Tanque Bajo','Equipo disenado para artefactos sanitarios del tipo inodoro',50.63,10265,1),
    (2,'Trampa Botella con Desague Lavatorio','Accesorio disenado para artefactos sanitarios del tipo lavatorio',65.25,29876,1),
    (3,'Tubo de Abasto','Accesorio disenado para artefactos sanitarios del tipo lavatorio para conexion de 1/2 e inodoros para conexion a 7/8',70.39,26532,2)
;

INSERT INTO material (id, nombre, descripcion, stock, id_proveedor)
VALUES
	(1,'Termoplastico','Termoplastico virgen sin reciclaje',4567,1),
    (2,'Piton','PEAD (Polietileno de alta densidad)',1560,4),
    (3,'Empaquetadura','PVC (Policloruro de vinilo flexible)',2409,5),
    (4,'Anillos centradores','PC (Policarbonato)',861,2),
    (5,'Tuerca 1/2','ABS (acrilonitrilobutadienoestireno)',742,3),
    (6,'Tuerca 7/8','ABS (acrilonitrilobutadienoestireno)',6917,3),
    (7,'Niple','ABS (acrilonitrilobutadienoestireno)',4806,3),
    (8,'Manguera flexible','PVC (Policloruro de vinilo flexible)',8394,5),
    (9,'Embalaje','Bolsas y cajas',13457,4),
    (10,'Manubrio','Accesorio de zamack ABS y bronce',5931,3),
    (11,'Canopla','PEAD (Polietileno de alta densidad)',6203,4)
;

INSERT INTO detalle_factura_venta (id, fecha, hora, id_estado_de_venta, id_producto, cantidad, total, id_medio_de_pago)
VALUES
	(1,'2022-04-24','12:35:01',2,2,417,27209.25,2),
    (2,'2022-05-11','13:40:21',3,3,745,52440.55,2),
    (3,'2022-06-03','14:39:27',2,1,176,8910.88,3),
    (4,'2022-06-04','15:39:13',2,1,350,17720.5,2),
    (5,'2022-06-15','18:27:21',4,2,230,15007.5,2),
    (6,'2022-06-19','17:39:45',3,3,627,44134.53,1),
    (7,'2022-06-29','18:31:53',2,3,360,25340.4,3),
    (8,'2022-07-01','18:32:27',2,3,208,14641.12,2),
    (9,'2022-07-05','20:54:52',3,2,638,41629.5,2),
    (10,'2022-07-18','20:24:16',4,1,555,28099.65,3),
    (11,'2022-07-22','15:35:43',2,1,1080,54680.4,2),
    (12,'2022-08-13','14:39:27',2,2,417,14641.13,2),
    (13,'2022-08-24','15:39:13',2,1,745,41629.6,2),
    (14,'2022-08-30','18:27:21',4,3,176,28099.66,1),
    (15,'2022-09-04','12:35:01',2,1,208,54680.5,2)
;

INSERT INTO detalle_factura_compra (id, fecha, hora, total, cantidad, id_material, id_medio_de_pago)
VALUES
	(1,'2022-04-21','12:35:01',2459,96441.98,11,2),
    (2,'2022-04-25','12:40:27',3656,56119.6,7,2),
    (3,'2022-04-29','14:35:43',7542,246774.24,5,2),
    (4,'2022-05-11','14:55:21',5543,99718.57,8,2),
    (5,'2022-05-17','15:35:07',3567,49060.25,10,3),
    (6,'2022-05-22','14:43:28',3802,85278.86,9,2),
    (7,'2022-06-01','18:32:25',2683,63801.74,3,2),
    (8,'2022-06-02','13:28:18',8913,269261.73,1,2),
    (9,'2022-06-12','19:27:31',7930,162961.5,6,2),
    (10,'2022-06-17','21:52:13',8426,254549.46,1,2),
    (11,'2022-06-25','12:45:11',1487,48654.64,5,2),
    (12,'2022-06-28','16:38:24',13634,446104.48,5,2),
    (13,'2022-07-07','14:15:51',32406,633861.36,2,2),
    (14,'2022-07-09','17:32:32',7893,309563.46,11,3),
    (15,'2022-07-25','13:39:27',2869,68224.82,3,3),
    (16,'2022-07-29','12:32:43',26902,412945.7,7,2),
    (17,'2022-08-10','18:45:07',8754,145579.02,4,2)
;

INSERT INTO  marcacion (id, fecha, hora_ingreso, hora_salida, dni_empleado)
VALUES
	(1,'2022-06-24','9:25:15','17:29:57',45637584),
    (2,'2022-06-24','9:27:38','17:30:52',37609854),
    (3,'2022-06-24','9:27:51','17:45:42',50382756),
    (4,'2022-06-24','9:28:20','17:48:04',64909275),
    (5,'2022-06-24','9:28:57','17:56:01',56826394),
    (6,'2022-06-24','9:29:57','18:02:23',43519008),
    (7,'2022-06-24','9:30:15','18:13:25',30342634),
    (8,'2022-06-25','9:26:15','17:26:57',45637584),
    (9,'2022-06-25','9:27:38','17:30:52',37609854),
    (10,'2022-06-25','9:27:51','17:45:42',50382756),
    (11,'2022-06-25','9:28:20','17:48:04',64909275),
    (12,'2022-06-25','9:28:57','17:56:01',56826394),
    (13,'2022-06-25','9:29:57','18:02:23',43519008),
    (14,'2022-06-25','9:30:15','18:13:25',30342634),
    (15,'2022-06-26','9:25:15','17:25:57',30985729),
    (16,'2022-06-26','9:27:38','17:30:52',50927494),
    (17,'2022-06-26','9:27:51','17:45:42',49038275),
    (18,'2022-06-26','9:28:20','17:48:04',39762089),
    (19,'2022-06-26','9:28:57','17:56:01',66372659),
    (20,'2022-06-26','9:29:57','18:02:23',49522600),
    (21,'2022-06-26','9:30:15','18:13:25',31857384),
    (22,'2022-06-27','9:25:15','17:26:57',30985729),
    (23,'2022-06-27','9:27:38','17:30:52',50927494),
    (24,'2022-06-27','9:27:51','17:45:42',49038275),
    (25,'2022-06-27','9:28:20','17:48:04',39762089),
    (26,'2022-06-27','9:28:57','17:56:01',66372659),
    (27,'2022-06-27','9:29:57','18:02:23',49522600),
    (28,'2022-06-27','9:30:15','18:13:25',31857384),
    (29,'2022-06-28','9:26:15','17:28:57',45637584),
    (30,'2022-06-28','9:27:38','17:30:52',37609854),
    (31,'2022-06-28','9:27:51','17:45:42',50382756),
    (32,'2022-06-28','9:28:20','17:48:04',64909275),
    (33,'2022-06-28','9:28:57','17:56:01',56826394),
    (34,'2022-06-28','9:29:57','18:02:23',43519008),
    (35,'2022-06-28','9:30:15','18:13:25',30342634),
    (36,'2022-06-29','9:25:15','17:29:57',30985729),
    (37,'2022-06-29','9:27:38','17:30:52',50927494),
    (38,'2022-06-29','9:27:51','17:45:42',49038275),
    (39,'2022-06-29','9:28:20','17:48:04',39762089),
    (40,'2022-06-29','9:28:57','17:56:01',66372659),
    (41,'2022-06-29','9:29:57','18:02:23',49522600),
    (42,'2022-06-29','9:30:15','18:13:25',31857384)
;

INSERT INTO venta_a_cliente (id, id_cliente, id_detalle_factura_venta)
VALUES
	(1,4,1),
    (2,11,2),
    (3,10,3),
    (4,7,4),
    (5,8,5),
    (6,3,6),
    (7,1,7),
    (8,2,8),
    (9,9,9),
    (10,13,10),
    (11,6,11),
    (12,12,12),
    (13,7,13),
    (14,5,14),
    (15,10,15)
;

INSERT INTO compra_a_proveedor (id, id_proveedor, id_detalle_factura_compra)
VALUES
	(1,2,1),
    (2,1,2),
    (3,3,3),
    (4,5,4),
    (5,3,5),
    (6,1,6),
    (7,4,7),
    (8,2,8),
    (9,4,9),
    (10,5,10),
    (11,1,11),
    (12,3,12),
    (13,3,13),
    (14,2,14),
    (15,5,15),
    (16,3,16),
    (17,1,17)
;