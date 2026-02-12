USE hospital_230417;

-- =========================================
-- PRUEBAS DE NATURALEZA
-- PRACTICA POBLACION PACIENTES
-- =========================================

-- =========================
-- TEST 7
-- 150 Mujeres
-- =========================
CALL sp_pruebas_naturaleza(
'150',
'mujer',
NULL,
NULL,
NULL,
NULL
);

-- =========================
-- TEST 8
-- 340 Varones 20-30 años
-- =========================
CALL sp_pruebas_naturaleza(
'340',
'hombre',
'20',
'30',
NULL,
NULL
);

-- =========================
-- TEST 9
-- 500 Pacientes <= 65 años
-- =========================
CALL sp_pruebas_naturaleza(
'500',
NULL,
'0',
'65',
NULL,
NULL
);

-- =========================
-- TEST 10
-- 2200 Pacientes Vivos
-- =========================
CALL sp_pruebas_naturaleza(
'2200',
NULL,
NULL,
NULL,
'vivo',
NULL
);

-- =========================
-- TEST 11
-- 502 Mujeres Finadas > 45
-- =========================
CALL sp_pruebas_naturaleza(
'502',
'mujer',
'46',
'120',
'finado',
NULL
);

-- =========================
-- TEST 12
-- 30 Pacientes en Coma
-- =========================
CALL sp_pruebas_naturaleza(
'30',
NULL,
NULL,
NULL,
'coma',
NULL
);

-- =========================
-- TEST 13
-- 15 Pacientes Vegetativo
-- =========================
CALL sp_pruebas_naturaleza(
'15',
NULL,
NULL,
NULL,
'vegetativo',
NULL
);

-- =========================
-- TEST 14
-- 107 Cuidados Paliativos
-- =========================
CALL sp_pruebas_naturaleza(
'107',
NULL,
NULL,
NULL,
NULL,
'paliativo'
);

-- =========================
-- TEST 15
-- 208 Pacientes Pediatricos
-- =========================
CALL sp_pruebas_naturaleza(
'208',
NULL,
'0',
'12',
NULL,
'infante'
);
