/* ===========================================================
   TAREA 05: 20 consultas de Transact sql persona
   (10 básicas y Intermedias, 10 avanzadas  y expertas)
   =========================================================== */
   --Primero agregue mas datos
   INSERT INTO ATENCION VALUES
(21,'2026-04-21','08:00:00','Segunda atención',1,21),
(22,'2026-04-21','08:10:00','Segunda atención',1,22),
(23,'2026-04-21','08:20:00','Segunda atención',2,23),
(24,'2026-04-21','08:30:00','Segunda atención',2,24),
(25,'2026-04-21','08:40:00','Segunda atención',3,25),
(26,'2026-04-21','08:50:00','Segunda atención',4,26),
(27,'2026-04-21','09:00:00','Segunda atención',5,27),
(28,'2026-04-21','09:10:00','Segunda atención',6,28),
(29,'2026-04-21','09:20:00','Segunda atención',7,29),
(30,'2026-04-21','09:30:00','Segunda atención',8,30);

INSERT INTO INTERVENCION_SERVICIO VALUES
(21,'INT-10001-B','Segundo servicio brindado','Activo',10001,290),
(22,'INT-10002-B','Segundo servicio brindado','Activo',10002,535),
(23,'INT-10003-B','Segundo servicio brindado','Activo',10003,93),
(24,'INT-10004-B','Segundo servicio brindado','Activo',10004,341),
(25,'INT-10005-B','Segundo servicio brindado','Activo',10005,298),
(26,'INT-10006-B','Segundo servicio brindado','Activo',10006,535),
(27,'INT-10007-B','Segundo servicio brindado','Activo',10007,290),
(28,'INT-10008-B','Segundo servicio brindado','Activo',10008,93),
(29,'INT-10009-B','Segundo servicio brindado','Activo',10009,341),
(30,'INT-10010-B','Segundo servicio brindado','Activo',10010,298);


/* ===========================================================
   CONSULTAS BASICAS
   =========================================================== */
-- 1. Listar todos los Tambos
SELECT *
FROM TAMBO;

-- 2. Mostrar todos los servicios
SELECT *
FROM SERVICIO;

-- 3. Beneficiarios de sexo femenino
SELECT *
FROM BENEFICIARIO
WHERE sexo = 'F';

-- 4. Intervenciones realizadas en 2026
SELECT *
FROM INTERVENCION
WHERE YEAR(fecha_intervencion) = 2026;

-- 5. Servicios brindados por una entidad
SELECT e.nombre_entidad,
       s.nombre_servicio
FROM ENTIDAD e
INNER JOIN SERVICIO s
ON e.id_entidad = s.id_entidad;

-- 6. Cantidad de servicios por entidad
SELECT e.nombre_entidad,
       COUNT(*) AS total_servicios
FROM ENTIDAD e
INNER JOIN SERVICIO s
ON e.id_entidad = s.id_entidad
GROUP BY e.nombre_entidad;

-- 7. Beneficiarios ordenados por apellido
SELECT *
FROM BENEFICIARIO
ORDER BY apellidos;

-- 8. Intervenciones realizadas en un Tambo
SELECT t.nombre_tambo,
       i.fecha_intervencion
FROM TAMBO t
INNER JOIN INTERVENCION i
ON t.id_tambo = i.id_tambo;

-- 9. Cantidad de beneficiarios registrados
SELECT COUNT(*) AS total_beneficiarios
FROM BENEFICIARIO;

-- 10. Atenciones realizadas por fecha
SELECT fecha_atencion,
       COUNT(*) AS total_atenciones
FROM ATENCION
GROUP BY fecha_atencion;


/* ===========================================================
   CONSULTAS AVANZADAS Y EXPERTAS
   =========================================================== */

-- 11. Total de atenciones por entidad
SELECT e.nombre_entidad,
       COUNT(*) AS total_atenciones
FROM ENTIDAD e
INNER JOIN SERVICIO s
    ON e.id_entidad = s.id_entidad
INNER JOIN INTERVENCION_SERVICIO isv
    ON s.id_servicio = isv.id_servicio
INNER JOIN ATENCION a
    ON isv.id_intervencion_servicio = a.id_intervencion_servicio
GROUP BY e.nombre_entidad;

-- 12. Total de atenciones por Tambo
SELECT t.nombre_tambo,
       COUNT(*) AS total_atenciones
FROM TAMBO t
INNER JOIN INTERVENCION i
    ON t.id_tambo = i.id_tambo
INNER JOIN INTERVENCION_SERVICIO isv
    ON i.id_intervencion = isv.id_intervencion
INNER JOIN ATENCION a
    ON isv.id_intervencion_servicio = a.id_intervencion_servicio
GROUP BY t.nombre_tambo;

-- 13. Servicio más solicitado
SELECT TOP 1
       s.nombre_servicio,
       COUNT(*) AS total
FROM SERVICIO s
INNER JOIN INTERVENCION_SERVICIO isv
ON s.id_servicio = isv.id_servicio
INNER JOIN ATENCION a
ON isv.id_intervencion_servicio = a.id_intervencion_servicio
GROUP BY s.nombre_servicio
ORDER BY total DESC;

-- 14. Beneficiarios que recibieron más de una atención
SELECT b.nombres,
       b.apellidos,
       COUNT(*) AS total_atenciones
FROM BENEFICIARIO b
INNER JOIN ATENCION a
ON b.id_beneficiario = a.id_beneficiario
GROUP BY b.nombres,
         b.apellidos
HAVING COUNT(*) > 1;

-- 15. Total de intervenciones por entidad
SELECT e.nombre_entidad,
       COUNT(*) AS total_intervenciones
FROM ENTIDAD e
INNER JOIN PLAN_TRABAJO p
ON e.id_entidad = p.id_entidad
INNER JOIN INTERVENCION i
ON p.id_plan = i.id_plan
GROUP BY e.nombre_entidad;

-- 16. Ranking de Tambos por atenciones
SELECT t.nombre_tambo,
       COUNT(*) AS total_atenciones
FROM TAMBO t
INNER JOIN INTERVENCION i
ON t.id_tambo = i.id_tambo
INNER JOIN INTERVENCION_SERVICIO isv
ON i.id_intervencion = isv.id_intervencion
INNER JOIN ATENCION a
ON isv.id_intervencion_servicio = a.id_intervencion_servicio
GROUP BY t.nombre_tambo
ORDER BY total_atenciones DESC;

-- 17. Edad promedio de beneficiarios
SELECT AVG(DATEDIFF(YEAR,
                    fecha_nacimiento,
                    GETDATE())) AS edad_promedio
FROM BENEFICIARIO;

-- 18. Atenciones por departamento
SELECT u.departamento,
       COUNT(*) AS total_atenciones
FROM UBIGEO u
INNER JOIN TAMBO t
ON u.id_ubigeo = t.id_ubigeo
INNER JOIN INTERVENCION i
ON t.id_tambo = i.id_tambo
INNER JOIN INTERVENCION_SERVICIO isv
ON i.id_intervencion = isv.id_intervencion
INNER JOIN ATENCION a
ON isv.id_intervencion_servicio = a.id_intervencion_servicio
GROUP BY u.departamento;

-- 19. Última intervención realizada por cada Tambo
SELECT t.nombre_tambo,
       MAX(i.fecha_intervencion) AS ultima_intervencion
FROM TAMBO t
INNER JOIN INTERVENCION i
ON t.id_tambo = i.id_tambo
GROUP BY t.nombre_tambo;

-- 20. Vista integral de atención
SELECT
    a.id_atencion,
    a.fecha_atencion,
    b.nombres,
    b.apellidos,
    e.nombre_entidad,
    s.nombre_servicio,
    t.nombre_tambo,
    u.departamento
FROM ATENCION a
INNER JOIN BENEFICIARIO b
    ON a.id_beneficiario = b.id_beneficiario
INNER JOIN INTERVENCION_SERVICIO isv
    ON a.id_intervencion_servicio = isv.id_intervencion_servicio
INNER JOIN SERVICIO s
    ON isv.id_servicio = s.id_servicio
INNER JOIN ENTIDAD e
    ON s.id_entidad = e.id_entidad
INNER JOIN INTERVENCION i
    ON isv.id_intervencion = i.id_intervencion
INNER JOIN TAMBO t
    ON i.id_tambo = t.id_tambo
INNER JOIN UBIGEO u
    ON t.id_ubigeo = u.id_ubigeo;