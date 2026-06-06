--- Script OLPT con registros: Tablas independientes minimo 5 registros - Tablas transaccionales Mínimo 20 registros


--UBIGEO
INSERT INTO UBIGEO VALUES
(1,'01','AMAZONAS','0101','CHACHAPOYAS','010101','QUINJALCA','101170012','LAMCHE'),
(2,'01','AMAZONAS','0102','BAGUA','010202','ARAMANGO','102020064','COPALLIN DE ARAMANGO'),
(3,'01','AMAZONAS','0102','BAGUA','010205','IMAZA','102050025','BICHANAK'),
(4,'01','AMAZONAS','0102','BAGUA','010205','IMAZA','102050075','YUPICUSA'),
(5,'01','AMAZONAS','0102','BAGUA','010205','IMAZA','102050079','PUERTO PACUY');

--TAMBOS
INSERT INTO TAMBO VALUES
(1,'QUINJALCA','256114','Activo','2018-05-15',1),
(2,'COPALLIN DE ARAMANGO','259323','Activo','2018-08-20',2),
(3,'BICHANAK','311267','Activo','2019-01-10',3),
(4,'YUPICUSA','311287','Activo','2019-03-05',4),
(5,'PUERTO PACUY','342434','Activo','2019-06-18',5);

-- ENTIDAD
INSERT INTO ENTIDAD VALUES
(2584,'REGION ANCASH-SALUD ANCASH','SALUD ANCASH','Regional','Salud'),
(2474,'PENSION 65','PENSION65','Programa Nacional','Protección Social'),
(2466,'AURORA','AURORA','Programa Nacional','Protección'),
(1023,'MUNICIPALIDAD PROVINCIAL DE PUTUMAYO','MPP','Local','Gobierno Local'),
(2671,'REGION AYACUCHO-SALUD','DIRESA AYACUCHO','Regional','Salud');

--PLAN DE TRABAJO
INSERT INTO PLAN_TRABAJO VALUES
(26824,'Plan 26824','Actividades de salud','2026-01-01','2026-12-31','Activo',2584),
(25975,'Plan 25975','Atención social','2026-01-01','2026-12-31','Activo',2474),
(28912,'Plan 28912','Prevención y protección','2026-01-01','2026-12-31','Activo',2466),
(32481,'Plan 32481','Servicios municipales','2026-01-01','2026-12-31','Activo',1023),
(32292,'Plan 32292','Atenciones de salud','2026-01-01','2026-12-31','Activo',2671);

--SERVICIO
INSERT INTO SERVICIO VALUES
(535,'Atención Integral de Salud','Servicio real','Salud','Activo',2584),
(290,'Orientación Social','Servicio real','Social','Activo',2474),
(93,'Información al Usuario','Servicio real','Social','Activo',2474),
(341,'Prevención de Violencia','Servicio real','Protección','Activo',2466),
(298,'Trámite Municipal','Servicio real','Municipal','Activo',1023);

--INTERVENCION
INSERT INTO INTERVENCION VALUES
(10001,'2026-01-10','Presencial','Tambo','Ejecutado','Atención programada',26824,1),
(10002,'2026-01-15','Presencial','Tambo','Ejecutado','Atención programada',25975,2),
(10003,'2026-01-20','Presencial','Tambo','Ejecutado','Atención programada',28912,3),
(10004,'2026-01-22','Presencial','Tambo','Ejecutado','Atención programada',32481,4),
(10005,'2026-01-25','Presencial','Tambo','Ejecutado','Atención programada',32292,5),
(10006,'2026-02-01','Presencial','Tambo','Ejecutado','Atención programada',26824,1),
(10007,'2026-02-05','Presencial','Tambo','Ejecutado','Atención programada',25975,2),
(10008,'2026-02-10','Presencial','Tambo','Ejecutado','Atención programada',28912,3),
(10009,'2026-02-15','Presencial','Tambo','Ejecutado','Atención programada',32481,4),
(10010,'2026-02-20','Presencial','Tambo','Ejecutado','Atención programada',32292,5),
(10011,'2026-03-01','Presencial','Tambo','Ejecutado','Atención programada',26824,1),
(10012,'2026-03-05','Presencial','Tambo','Ejecutado','Atención programada',25975,2),
(10013,'2026-03-10','Presencial','Tambo','Ejecutado','Atención programada',28912,3),
(10014,'2026-03-15','Presencial','Tambo','Ejecutado','Atención programada',32481,4),
(10015,'2026-03-20','Presencial','Tambo','Ejecutado','Atención programada',32292,5),
(10016,'2026-04-01','Presencial','Tambo','Ejecutado','Atención programada',26824,1),
(10017,'2026-04-05','Presencial','Tambo','Ejecutado','Atención programada',25975,2),
(10018,'2026-04-10','Presencial','Tambo','Ejecutado','Atención programada',28912,3),
(10019,'2026-04-15','Presencial','Tambo','Ejecutado','Atención programada',32481,4),
(10020,'2026-04-20','Presencial','Tambo','Ejecutado','Atención programada',32292,5);

--BENEFICIARIO
INSERT INTO BENEFICIARIO VALUES
(1,'DNI','70000001','Beneficiario 1','Anonimizado','M','1990-01-01','999000001','Zona Rural'),
(2,'DNI','70000002','Beneficiario 2','Anonimizado','F','1991-01-01','999000002','Zona Rural'),
(3,'DNI','70000003','Beneficiario 3','Anonimizado','M','1992-01-01','999000003','Zona Rural'),
(4,'DNI','70000004','Beneficiario 4','Anonimizado','F','1993-01-01','999000004','Zona Rural'),
(5,'DNI','70000005','Beneficiario 5','Anonimizado','M','1994-01-01','999000005','Zona Rural'),
(6,'DNI','70000006','Beneficiario 6','Anonimizado','F','1995-01-01','999000006','Zona Rural'),
(7,'DNI','70000007','Beneficiario 7','Anonimizado','M','1996-01-01','999000007','Zona Rural'),
(8,'DNI','70000008','Beneficiario 8','Anonimizado','F','1997-01-01','999000008','Zona Rural'),
(9,'DNI','70000009','Beneficiario 9','Anonimizado','M','1998-01-01','999000009','Zona Rural'),
(10,'DNI','70000010','Beneficiario 10','Anonimizado','F','1999-01-01','999000010','Zona Rural'),
(11,'DNI','70000011','Beneficiario 11','Anonimizado','M','1990-05-01','999000011','Zona Rural'),
(12,'DNI','70000012','Beneficiario 12','Anonimizado','F','1991-05-01','999000012','Zona Rural'),
(13,'DNI','70000013','Beneficiario 13','Anonimizado','M','1992-05-01','999000013','Zona Rural'),
(14,'DNI','70000014','Beneficiario 14','Anonimizado','F','1993-05-01','999000014','Zona Rural'),
(15,'DNI','70000015','Beneficiario 15','Anonimizado','M','1994-05-01','999000015','Zona Rural'),
(16,'DNI','70000016','Beneficiario 16','Anonimizado','F','1995-05-01','999000016','Zona Rural'),
(17,'DNI','70000017','Beneficiario 17','Anonimizado','M','1996-05-01','999000017','Zona Rural'),
(18,'DNI','70000018','Beneficiario 18','Anonimizado','F','1997-05-01','999000018','Zona Rural'),
(19,'DNI','70000019','Beneficiario 19','Anonimizado','M','1998-05-01','999000019','Zona Rural'),
(20,'DNI','70000020','Beneficiario 20','Anonimizado','F','1999-05-01','999000020','Zona Rural');

--INTERVENCION SERVICIO
INSERT INTO INTERVENCION_SERVICIO VALUES
(1,'INT-10001','Servicio brindado','Activo',10001,535),
(2,'INT-10002','Servicio brindado','Activo',10002,290),
(3,'INT-10003','Servicio brindado','Activo',10003,341),
(4,'INT-10004','Servicio brindado','Activo',10004,298),
(5,'INT-10005','Servicio brindado','Activo',10005,535),
(6,'INT-10006','Servicio brindado','Activo',10006,290),
(7,'INT-10007','Servicio brindado','Activo',10007,93),
(8,'INT-10008','Servicio brindado','Activo',10008,341),
(9,'INT-10009','Servicio brindado','Activo',10009,298),
(10,'INT-10010','Servicio brindado','Activo',10010,535),
(11,'INT-10011','Servicio brindado','Activo',10011,290),
(12,'INT-10012','Servicio brindado','Activo',10012,93),
(13,'INT-10013','Servicio brindado','Activo',10013,341),
(14,'INT-10014','Servicio brindado','Activo',10014,298),
(15,'INT-10015','Servicio brindado','Activo',10015,535),
(16,'INT-10016','Servicio brindado','Activo',10016,290),
(17,'INT-10017','Servicio brindado','Activo',10017,93),
(18,'INT-10018','Servicio brindado','Activo',10018,341),
(19,'INT-10019','Servicio brindado','Activo',10019,298),
(20,'INT-10020','Servicio brindado','Activo',10020,535);

--ATENCION
INSERT INTO ATENCION VALUES
(1,'2026-01-10','08:00:00','Atención registrada',1,1),
(2,'2026-01-15','08:30:00','Atención registrada',2,2),
(3,'2026-01-20','09:00:00','Atención registrada',3,3),
(4,'2026-01-22','09:15:00','Atención registrada',4,4),
(5,'2026-01-25','09:30:00','Atención registrada',5,5),
(6,'2026-02-01','10:00:00','Atención registrada',6,6),
(7,'2026-02-05','10:15:00','Atención registrada',7,7),
(8,'2026-02-10','10:30:00','Atención registrada',8,8),
(9,'2026-02-15','10:45:00','Atención registrada',9,9),
(10,'2026-02-20','11:00:00','Atención registrada',10,10),
(11,'2026-03-01','11:15:00','Atención registrada',11,11),
(12,'2026-03-05','11:30:00','Atención registrada',12,12),
(13,'2026-03-10','11:45:00','Atención registrada',13,13),
(14,'2026-03-15','12:00:00','Atención registrada',14,14),
(15,'2026-03-20','12:15:00','Atención registrada',15,15),
(16,'2026-04-01','12:30:00','Atención registrada',16,16),
(17,'2026-04-05','12:45:00','Atención registrada',17,17),
(18,'2026-04-10','13:00:00','Atención registrada',18,18),
(19,'2026-04-15','13:15:00','Atención registrada',19,19),
(20,'2026-04-20','13:30:00','Atención registrada',20,20);