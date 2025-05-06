-- Escribir un SELECT que use CASE para crear una columna calculada que agrupe dinámicamente datos.
-- A continuación, creamos una consulta que muestre los datos por nivel de riesgo basandonos en el monto.
SELECT
    paymentId,
    userid,
    amount,
    date,
    CASE
        WHEN amount <= 50 THEN 'Bajo riesgo'
        WHEN amount BETWEEN 51 AND 250 THEN 'Medio riesgo'
        ELSE 'Alto riesgo'
    END AS nivel_riesgo
FROM caipi_payments;


