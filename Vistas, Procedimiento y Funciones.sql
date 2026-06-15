--Ejercicios de Vistas, Procedimientos Almacenados y Funciones
--Vistas
--1.- Atenciones realizadas por entidad.
CREATE VIEW VW_ATENCIONES_ENTIDAD
AS
SELECT
    e.nombre_entidad,
    COUNT(a.id_atencion) total_atenciones
FROM ENTIDAD e
INNER JOIN SERVICIO s
    ON e.id_entidad=s.id_entidad
INNER JOIN INTERVENCION_SERVICIO isv
    ON s.id_servicio=isv.id_servicio
INNER JOIN ATENCION a
    ON isv.id_intervencion_servicio=a.id_intervencion_servicio
GROUP BY e.nombre_entidad;





--2.- Atenciones realizadas por Tambo.
CREATE VIEW VW_ATENCIONES_TAMBO
AS
SELECT
    t.nombre_tambo,
    COUNT(*) total_atenciones
FROM TAMBO t
INNER JOIN INTERVENCION i
    ON t.id_tambo=i.id_tambo
INNER JOIN INTERVENCION_SERVICIO isv
    ON i.id_intervencion=isv.id_intervencion
INNER JOIN ATENCION a
    ON isv.id_intervencion_servicio=a.id_intervencion_servicio
GROUP BY t.nombre_tambo;


--3.- Atenciones realizadas por Departamento.
CREATE VIEW VW_ATENCIONES_DEPARTAMENTO
AS
SELECT
    u.departamento,
    COUNT(*) total_atenciones
FROM UBIGEO u
INNER JOIN TAMBO t
    ON u.id_ubigeo=t.id_ubigeo
INNER JOIN INTERVENCION i
    ON t.id_tambo=i.id_tambo
INNER JOIN INTERVENCION_SERVICIO isv
    ON i.id_intervencion=isv.id_intervencion
INNER JOIN ATENCION a
    ON isv.id_intervencion_servicio=a.id_intervencion_servicio
GROUP BY u.departamento;



--4.- Servicios mas demandados
CREATE VIEW VW_SERVICIOS_MAS_DEMANDADOS
AS
SELECT
    s.nombre_servicio,
    COUNT(*) total_atenciones
FROM SERVICIO s
INNER JOIN INTERVENCION_SERVICIO isv
    ON s.id_servicio=isv.id_servicio
INNER JOIN ATENCION a
    ON isv.id_intervencion_servicio=a.id_intervencion_servicio
GROUP BY s.nombre_servicio;

--PROCEDIMIENTOS ALMACENADOS (3)

--5.- Servicios mas demandados
CREATE PROC SP_ATENCIONES_POR_TAMBO
@ID_TAMBO INT
AS
BEGIN

SELECT *
FROM INTERVENCION
WHERE id_tambo=@ID_TAMBO

END

--6.- Buscar beneficiario
CREATE PROC SP_BUSCAR_BENEFICIARIO
@DNI VARCHAR(15)
AS
BEGIN

SELECT *
FROM BENEFICIARIO
WHERE numero_documento=@DNI

END

--7. Servicio por entidad

CREATE PROC SP_SERVICIOS_ENTIDAD
@ID_ENTIDAD INT
AS
BEGIN

SELECT *
FROM SERVICIO
WHERE id_entidad=@ID_ENTIDAD

END

--FUNCIONES (3)
--8. FN_TOTAL_ATENCIONES

CREATE FUNCTION FN_TOTAL_ATENCIONES()
RETURNS INT
AS
BEGIN

DECLARE @TOTAL INT

SELECT @TOTAL=COUNT(*)
FROM ATENCION

RETURN @TOTAL

END


--9. FN_TOTAL_SERVICIOS


CREATE FUNCTION FN_TOTAL_SERVICIOS
(
@ID_ENTIDAD INT
)
RETURNS INT
AS
BEGIN

DECLARE @TOTAL INT

SELECT @TOTAL=COUNT(*)
FROM SERVICIO
WHERE id_entidad=@ID_ENTIDAD

RETURN @TOTAL

END

--10. FN_EDAD

CREATE FUNCTION FN_EDAD
(
@FECHA DATE
)
RETURNS INT
AS
BEGIN

RETURN DATEDIFF(YEAR,@FECHA,GETDATE())

END
