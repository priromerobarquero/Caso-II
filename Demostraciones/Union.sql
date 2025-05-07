-- UNION de planes individuales y empresariales basados en tipo de plan

-- Planes Individuales
SELECT
    p.idPlan,
    p.name AS planName,
    pt.name AS planType,
    'Individual' AS tipoCliente
FROM
    caipi_plans p
INNER JOIN
    caipi_planTypes pt ON p.idplanTypes = pt.idplanTypes
WHERE
    pt.name IN ('Básico', 'Familiar', 'Salud y Bienestar')

UNION

-- Planes Empresariales
SELECT
    p.idPlan,
    p.name AS planName,
    pt.name AS planType,
    'Empresarial' AS tipoCliente
FROM
    caipi_plans p
INNER JOIN
    caipi_planTypes pt ON p.idplanTypes = pt.idplanTypes
WHERE
    pt.name IN ('Corporativo', 'Personalizado')
ORDER BY
    tipoCliente, planName;
