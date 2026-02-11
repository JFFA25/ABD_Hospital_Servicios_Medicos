/*
=====================================================
Base de Datos Hospital - Estructura de Tablas
Equipo: SICPES
Practica: Poblacion de Pacientes
Fecha: 10 Febrero 2026
=====================================================

DESCRIPCION:
Este archivo documenta la estructura de las tablas
utilizadas en el modelo hospitalario.

Jerarquia Relacional:
tbb_personas
   ↓
tbb_personas_fisicas
   ↓
tbb_pacientes
=====================================================
*/

-- ==========================================
-- TABLA: tbb_personas
-- ==========================================

/*
Campos principales:
ID → PK AUTO_INCREMENT
tipo → Fisica / Moral
rfc → RFC persona
pais_origen → Pais
estatus → Activo/Inactivo
*/

-- ==========================================
-- TABLA: tbb_personas_fisicas
-- ==========================================

/*
Campos principales:
ID → FK hacia tbb_personas
nombre
primer_apellido
genero
fecha_nacimiento
grupo_sanguineo
*/

-- ==========================================
-- TABLA: tbb_pacientes
-- ==========================================

/*
Campos principales:
ID → PK AUTO_INCREMENT
status_medico
status_vida
fecha_ultima_citamedica
estatus
*/

-- ==========================================
-- TABLA: tbb_personas
-- ==========================================

CREATE TABLE IF NOT EXISTS tbb_personas (
    ID INT UNSIGNED NOT NULL AUTO_INCREMENT,
    tipo ENUM('Fisica','Moral') NOT NULL DEFAULT 'Fisica',
    rfc VARCHAR(14) UNIQUE,
    pais_origen VARCHAR(50),
    fecha_registro DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    fecha_actualizacion DATETIME NULL,
    estatus BIT(1) NOT NULL DEFAULT b'1',
    
    PRIMARY KEY (ID)
);

-- ==========================================
-- TABLA: tbb_personas_fisicas
-- ==========================================

CREATE TABLE IF NOT EXISTS tbb_personas_fisicas (
    ID INT UNSIGNED NOT NULL,
    titulo_cortesia VARCHAR(40),
    nombre VARCHAR(60) NOT NULL,
    primer_apellido VARCHAR(45) NOT NULL,
    segundo_apellido VARCHAR(60),
    genero ENUM('H','M','N/B') NOT NULL DEFAULT 'N/B',
    fecha_nacimiento DATE NOT NULL,
    curp VARCHAR(18),
    grupo_sanguineo ENUM('A+','A-','B+','B-','AB+','AB-','O+','O-'),
    fecha_registro DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    fecha_actualizacion DATETIME NULL,
    estatus BIT(1) NOT NULL DEFAULT b'1',

    PRIMARY KEY (ID),

    CONSTRAINT fk_persona_fisica_persona
    FOREIGN KEY (ID)
    REFERENCES tbb_personas(ID)
);

-- ==========================================
-- TABLA: tbb_pacientes
-- ==========================================

CREATE TABLE IF NOT EXISTS tbb_pacientes (
    ID INT UNSIGNED NOT NULL AUTO_INCREMENT,
    status_medico VARCHAR(150),
    status_vida ENUM('Vivo','Finado','Coma','Vegetativo','Desconocido') 
        NOT NULL DEFAULT 'Desconocido',
    fecha_ultima_citamedica DATETIME UNIQUE,
    fecha_registro DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    fecha_actualizacion DATETIME NULL,
    estatus BIT(1) NOT NULL DEFAULT b'1',

    PRIMARY KEY (ID)
);
