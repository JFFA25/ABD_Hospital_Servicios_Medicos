USE hospital_230417;

-- =========================================
-- PRUEBAS DE VOLUMEN
-- PRACTICA POBLACION MASIVA DE PACIENTES
-- =========================================


-- =========================
-- TEST 1
-- Registro de 1 Paciente
-- =========================
CALL sp_poblar_pacientes_volumen(1);



-- =========================
-- TEST 2
-- Registro de 10 Pacientes
-- =========================
CALL sp_poblar_pacientes_volumen(10);



-- =========================
-- TEST 3
-- Registro de 100 Pacientes
-- =========================
CALL sp_poblar_pacientes_volumen(100);



-- =========================
-- TEST 4
-- Registro de 1000 Pacientes
-- =========================
CALL sp_poblar_pacientes_volumen(1000);



-- =========================
-- TEST 5
-- Registro de 10000 Pacientes
-- =========================
CALL sp_poblar_pacientes_volumen(10000);



-- =========================
-- TEST 6
-- Registro de 1,000,000 Pacientes
-- (Ejecutar por bloques)
-- =========================

CALL sp_poblar_pacientes_volumen(10000);
CALL sp_poblar_pacientes_volumen(10000);
CALL sp_poblar_pacientes_volumen(10000);
CALL sp_poblar_pacientes_volumen(10000);
CALL sp_poblar_pacientes_volumen(10000);
CALL sp_poblar_pacientes_volumen(10000);
CALL sp_poblar_pacientes_volumen(10000);
CALL sp_poblar_pacientes_volumen(10000);
CALL sp_poblar_pacientes_volumen(10000);
CALL sp_poblar_pacientes_volumen(10000);

-- Repetir hasta alcanzar 1,000,000 registros



-- =========================================
-- VALIDACIONES
-- =========================================

-- Total pacientes insertados
SELECT COUNT(*) AS total_pacientes
FROM tbb_pacientes;


-- Validar integridad entre tablas
SELECT *
FROM tbb_personas p
JOIN tbb_personas_fisicas pf ON pf.ID = p.ID
JOIN tbb_pacientes pa ON pa.ID = p.ID
LIMIT 50;