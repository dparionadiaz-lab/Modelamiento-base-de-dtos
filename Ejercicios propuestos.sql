-- EJERCICIOS


--Ejercicio 1 - Score Crediticio
WITH scores AS(
SELECT id,solicitud_id,score_riesgo,ingresos_mensuales,nivel_endeudamiento,
(score_riesgo*0.5)+((ingresos_mensuales/1000.0)*0.3)-(nivel_endeudamiento*0.2) Score_final
FROM evaluaciones_crediticias)
SELECT *,
CASE WHEN Score_final<200 THEN 'Alto Riesgo'
WHEN Score_final<400 THEN 'Riesgo Medio'
ELSE 'Riesgo Bajo' END clasificacion
FROM scores;

--Ejercicio 2 - Tasa de aprobación
SELECT COUNT(*) total_solicitudes,
SUM(CASE WHEN estado='aprobada' THEN 1 ELSE 0 END) total_aprobadas,
ROUND(SUM(CASE WHEN estado='aprobada' THEN 1.0 ELSE 0 END)/COUNT(*)*100,2) porcentaje_aprobacion
FROM solicitudes;

--Ejercicio 3 - Ratio de morosidad
SELECT COUNT(*) total_cuotas,
SUM(CASE WHEN estado IN ('pendiente','pagada parcialmente') THEN 1 ELSE 0 END) cuotas_morosas,
ROUND(SUM(CASE WHEN estado IN ('pendiente','pagada parcialmente') THEN 1.0 ELSE 0 END)/COUNT(*)*100,2) ratio_morosidad
FROM cuotas;

--Ejercicio 4 - Clientes de alto riesgo
SELECT c.id,ec.score_riesgo,ec.nivel_endeudamiento,ec.deuda_activa_otras_entidades
FROM clientes c
JOIN solicitudes s ON s.cliente_id=c.id
JOIN evaluaciones_crediticias ec ON ec.solicitud_id=s.id
WHERE ec.score_riesgo<500 AND ec.nivel_endeudamiento>70
AND ec.deuda_activa_otras_entidades>20000;


--Ejercicio 5 - Ranking exposición crediticia
SELECT c.id,
(cr.saldo_credito+ec.deuda_activa+ec.deuda_activa_otras_entidades) exposicion_crediticia
FROM clientes c
JOIN solicitudes s ON s.cliente_id=c.id
JOIN evaluaciones_crediticias ec ON ec.solicitud_id=s.id
JOIN creditos cr ON cr.evaluacion_crediticia_id=ec.id
ORDER BY exposicion_crediticia DESC;

--Ejercicio 6 - Señales tempranas
SELECT c.id,COUNT(*) cuotas_morosas,ec.score_riesgo
FROM clientes c
JOIN solicitudes s ON s.cliente_id=c.id
JOIN evaluaciones_crediticias ec ON ec.solicitud_id=s.id
JOIN creditos cr ON cr.evaluacion_crediticia_id=ec.id
JOIN cuotas ct ON ct.credito_id=cr.id
WHERE ct.estado IN ('pendiente','pagada parcialmente')
AND ec.score_riesgo<600
GROUP BY c.id,ec.score_riesgo
HAVING COUNT(*)>3;

--Ejercicio 7 - Ingreso recomendado
SELECT c.id,SUM(cr.valor_cuota) cuotas_activas,
SUM(cr.valor_cuota)*3 ingreso_recomendado
FROM clientes c
JOIN solicitudes s ON s.cliente_id=c.id
JOIN evaluaciones_crediticias ec ON ec.solicitud_id=s.id
JOIN creditos cr ON cr.evaluacion_crediticia_id=ec.id
WHERE cr.estado IN ('vigente','desembolsado')
GROUP BY c.id;


--Ejercicio 8 - Concentración de cartera
WITH cartera AS(
SELECT pc.nombre,SUM(cr.monto) monto_producto
FROM productos_crediticios pc
JOIN solicitudes s ON s.producto_crediticio_id=pc.id
JOIN evaluaciones_crediticias ec ON ec.solicitud_id=s.id
JOIN creditos cr ON cr.evaluacion_crediticia_id=ec.id
GROUP BY pc.nombre)
SELECT nombre,monto_producto,
ROUND(monto_producto*100.0/SUM(monto_producto) OVER(),2) participacion_pct
FROM cartera;

--Ejercicio 9 - Utilización de línea
SELECT c.id,ec.linea_credito,ec.deuda_activa,
ROUND(ec.deuda_activa/NULLIF(ec.linea_credito,0)*100,2) utilizacion_pct
FROM clientes c
JOIN solicitudes s ON s.cliente_id=c.id
JOIN evaluaciones_crediticias ec ON ec.solicitud_id=s.id;


--Ejercicio 10 - Sobreendeudados
SELECT c.id,(ec.deuda_activa+ec.deuda_activa_otras_entidades) deuda_total,
ec.ingresos_mensuales,
ROUND((ec.deuda_activa+ec.deuda_activa_otras_entidades)/ec.ingresos_mensuales,2) ratio
FROM clientes c
JOIN solicitudes s ON s.cliente_id=c.id
JOIN evaluaciones_crediticias ec ON ec.solicitud_id=s.id
WHERE (ec.deuda_activa+ec.deuda_activa_otras_entidades)/ec.ingresos_mensuales>0.50;


--Ejercicio 11 - Ranking empresas
SELECT pj.razon_social,cr.saldo_credito,ec.deuda_activa,ec.deuda_activa_otras_entidades
FROM personas_juridicas pj
JOIN clientes c ON c.id=pj.cliente_id
JOIN solicitudes s ON s.cliente_id=c.id
JOIN evaluaciones_crediticias ec ON ec.solicitud_id=s.id
JOIN creditos cr ON cr.evaluacion_crediticia_id=ec.id
ORDER BY cr.saldo_credito DESC;


--Ejercicio 12 - Cuentas sin créditos
SELECT c.id,COUNT(DISTINCT cc.cuenta_id) numero_cuentas
FROM clientes c
JOIN cuentas_clientes cc ON cc.cliente_id=c.id
LEFT JOIN solicitudes s ON s.cliente_id=c.id
LEFT JOIN evaluaciones_crediticias ec ON ec.solicitud_id=s.id
LEFT JOIN creditos cr ON cr.evaluacion_crediticia_id=ec.id
GROUP BY c.id
HAVING COUNT(cr.id)=0;


--Ejercicio 13 - Créditos sin pagos
SELECT c.id,cr.numero_credito,cr.monto
FROM clientes c
JOIN solicitudes s ON s.cliente_id=c.id
JOIN evaluaciones_crediticias ec ON ec.solicitud_id=s.id
JOIN creditos cr ON cr.evaluacion_crediticia_id=ec.id
WHERE NOT EXISTS(
SELECT 1
FROM cuotas cu
JOIN detalle_cuotas_pagos dcp ON dcp.cuota_id=cu.id
WHERE cu.credito_id=cr.id);


--Ejercicio 14 - Anomalías crediticias
SELECT c.id,ec.valor_patrimonio,cr.monto
FROM clientes c
JOIN solicitudes s ON s.cliente_id=c.id
JOIN evaluaciones_crediticias ec ON ec.solicitud_id=s.id
JOIN creditos cr ON cr.evaluacion_crediticia_id=ec.id
WHERE cr.monto>ec.valor_patrimonio;


--Ejercicio 15 - Patrimonio comprometido
SELECT c.id,
(ec.valor_patrimonio-(ec.deuda_activa+ec.deuda_activa_otras_entidades)) patrimonio_neto
FROM clientes c
JOIN solicitudes s ON s.cliente_id=c.id
JOIN evaluaciones_crediticias ec ON ec.solicitud_id=s.id
WHERE (ec.valor_patrimonio-(ec.deuda_activa+ec.deuda_activa_otras_entidades))<0;



--Ejercicio 16 - Tendencia mensual
SELECT YEAR(fecha_solicitud) anio, MONTH(fecha_solicitud) mes, COUNT(*) cantidad
FROM solicitudes
GROUP BY YEAR(fecha_solicitud),MONTH(fecha_solicitud)
ORDER BY anio,mes;


--Ejercicio 17 - Mayor desembolso
SELECT YEAR(fecha_desembolso) anio,MONTH(fecha_desembolso) mes,SUM(monto) total_desembolsado
FROM creditos
GROUP BY YEAR(fecha_desembolso),MONTH(fecha_desembolso)
ORDER BY total_desembolsado DESC;


--Ejercicio 18 - Proyección de intereses
SELECT credito_id,SUM(intereses) intereses_pendientes,
SUM(capital+intereses+seguros) total_proyectado
FROM cuotas
WHERE estado IN ('pendiente','pagada parcialmente')
GROUP BY credito_id;

--Ejercicio 29 - Semáforo
SELECT c.id,ec.score_riesgo,
CASE WHEN ec.score_riesgo>700 THEN 'VERDE'
WHEN ec.score_riesgo BETWEEN 500 AND 700 THEN 'AMARILLO'
ELSE 'ROJO' END semaforo
FROM clientes c
JOIN solicitudes s ON s.cliente_id=c.id
JOIN evaluaciones_crediticias ec ON ec.solicitud_id=s.id;


--BONUS  1
--Top 10 clientes con mayor deuda consolidada.
--Formula:
--Saldo Crédito + Deuda Activa + Deuda Externa

SELECT TOP 10

    c.id,

    (
        cr.saldo_credito
        +
        ec.deuda_activa
        +
        ec.deuda_activa_otras_entidades
    ) deuda_consolidada

FROM clientes c

INNER JOIN solicitudes s
    ON s.cliente_id = c.id

INNER JOIN evaluaciones_crediticias ec
    ON ec.solicitud_id = s.id

INNER JOIN creditos cr
    ON cr.evaluacion_crediticia_id = ec.id

ORDER BY deuda_consolidada DESC;

--BONUS 2
--Generar un ranking de clientes utilizando
--la función DENSE_RANK().

--Ordenar por:

-- Monto total desembolsado

WITH desembolsos AS
(
    SELECT

        c.id,

        SUM(cr.monto) total_desembolsado

    FROM clientes c

    INNER JOIN solicitudes s
        ON s.cliente_id = c.id

    INNER JOIN evaluaciones_crediticias ec
        ON ec.solicitud_id = s.id

    INNER JOIN creditos cr
        ON cr.evaluacion_crediticia_id = ec.id

    GROUP BY c.id
)

SELECT

    *,

    DENSE_RANK() OVER
    (
        ORDER BY total_desembolsado DESC
    ) ranking

FROM desembolsos;


--BONUS 3
--Construir una clasificación ABC de clientes.

--A = Top 20%
--B = Siguiente 30%
--C = Restante 50%

--Basado en:

--Monto total de créditos.
WITH cartera AS
(
    SELECT

        c.id,

        SUM(cr.monto) monto_total

    FROM clientes c

    INNER JOIN solicitudes s
        ON s.cliente_id = c.id

    INNER JOIN evaluaciones_crediticias ec
        ON ec.solicitud_id = s.id

    INNER JOIN creditos cr
        ON cr.evaluacion_crediticia_id = ec.id

    GROUP BY c.id
)

SELECT

    *,

    CASE

        WHEN NTILE(10) OVER
        (
            ORDER BY monto_total DESC
        ) <= 2
        THEN 'A'

        WHEN NTILE(10) OVER
        (
            ORDER BY monto_total DESC
        ) <= 5
        THEN 'B'

        ELSE 'C'

    END clasificacion

FROM cartera;

--BONUS 4

--Identificar clientes con riesgo de refinanciación.

--Condiciones:

--- Más de 5 cuotas pendientes
-- Saldo crédito > 50% del monto original
SELECT

    c.id,

    COUNT(*) cuotas_morosas,

    cr.saldo_credito,

    cr.monto

FROM clientes c

INNER JOIN solicitudes s
    ON s.cliente_id = c.id

INNER JOIN evaluaciones_crediticias ec
    ON ec.solicitud_id = s.id

INNER JOIN creditos cr
    ON cr.evaluacion_crediticia_id = ec.id

INNER JOIN cuotas ct
    ON ct.credito_id = cr.id

WHERE ct.estado IN
(
    'pendiente',
    'pagada parcialmente'
)

GROUP BY

    c.id,
    cr.id,
    cr.saldo_credito,
    cr.monto

HAVING
    COUNT(*) > 5
    AND
    cr.saldo_credito > (cr.monto * 0.50);




--BONUS 5
--Construir un reporte ejecutivo con:
-- Cliente
-- Número de créditos
-- Total desembolsado
-- Total pagado
-- Saldo pendiente
-- Score riesgo
-- Nivel endeudamiento
--Ordenado por mayor saldo pendiente.

WITH resumen AS
(
    SELECT

        c.id,

        COUNT(DISTINCT cr.id) numero_creditos,

        SUM(cr.monto) total_desembolsado,

        SUM(ISNULL(p.monto,0)) total_pagado,

        SUM(cr.saldo_credito) saldo_pendiente,

        MAX(ec.score_riesgo) score_riesgo,

        MAX(ec.nivel_endeudamiento) nivel_endeudamiento

    FROM clientes c

    INNER JOIN solicitudes s
        ON s.cliente_id = c.id

    INNER JOIN evaluaciones_crediticias ec
        ON ec.solicitud_id = s.id

    LEFT JOIN creditos cr
        ON cr.evaluacion_crediticia_id = ec.id

    LEFT JOIN cuotas ct
        ON ct.credito_id = cr.id

    LEFT JOIN detalle_cuotas_pagos dcp
        ON dcp.cuota_id = ct.id

    LEFT JOIN pagos p
        ON p.id = dcp.pago_id

    GROUP BY c.id
)

SELECT *
FROM resumen
ORDER BY saldo_pendien
