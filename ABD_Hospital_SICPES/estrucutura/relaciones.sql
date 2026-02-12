/*
=====================================================
Relaciones de Integridad Referencial
Base de Datos Hospital
Equipo: SICPES
Practica: Poblacion de Pacientes
Fecha: Febrero 2026
=====================================================

DESCRIPCION:
Script para documentar y verificar las relaciones
de integridad referencial entre tablas del modelo.

=====================================================
*/

-- ==========================================
-- VERIFICACION DE FOREIGN KEYS
-- ==========================================

/*
Consulta utilizada para validar integridad referencial
del modelo de datos.
*/

SELECT
    TABLE_NAME,
    CONSTRAINT_NAME,
    REFERENCED_TABLE_NAME
FROM information_schema.KEY_COLUMN_USAGE
WHERE REFERENCED_TABLE_NAME IS NOT NULL;

-- ==========================================
-- RESULTADOS ESPERADOS (DOCUMENTADOS)
-- ==========================================

/*
TABLA                     CONSTRAINT               REFERENCIA
---------------------------------------------------------------
tbc_areas                 fk_area_superior         tbc_areas
tbb_pacientes             fk_persona_fisica        tbb_personas_fisicas
tbb_personas_fisicas      fk_persona_1             tbb_personas
*/

-- ==========================================
-- RELACIONES IDENTIFICADAS
-- ==========================================

/*
1️.tbb_personas → tbb_personas_fisicas
Relacion mediante FK fk_persona_1
*/

-- ==========================================

/*
2️.tbb_personas_fisicas → tbb_pacientes
Relacion mediante FK fk_persona_fisica
*/

-- ==========================================

/*
3️.tbc_areas → tbc_areas
Relacion jerarquica interna mediante fk_area_superior
*/

-- ==========================================
-- NOTAS TECNICAS
-- ==========================================

/*
La integridad referencial garantiza:

✔ No existen pacientes sin persona fisica
✔ No existen personas fisicas sin persona base
✔ Se mantiene consistencia jerarquica

Este script permite verificar rapidamente las
relaciones existentes en el esquema actual.
*/
