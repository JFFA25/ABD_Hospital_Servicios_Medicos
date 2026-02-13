CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_poblar_pacientes_volumen`(
    IN p_cantidad INT
)
BEGIN

    DECLARE i INT DEFAULT 0;
    DECLARE v_persona_id INT;
    DECLARE v_genero CHAR(1);
    DECLARE v_nombre VARCHAR(60);
    DECLARE v_apellido1 VARCHAR(60);
    DECLARE v_apellido2 VARCHAR(60);
    DECLARE v_fecha_nac DATE;
    DECLARE v_status_vida VARCHAR(20);
    DECLARE v_status_medico VARCHAR(150);
    DECLARE v_fecha_cita DATETIME;
    DECLARE v_fecha_base DATETIME;

    SELECT IFNULL(MAX(fecha_ultima_citamedica), NOW())
    INTO v_fecha_base
    FROM tbb_pacientes;

    WHILE i < p_cantidad DO

        SET v_genero = ELT(FLOOR(1 + RAND()*2),'H','M');

        IF v_genero = 'H' THEN
            SET v_nombre = ELT(FLOOR(1 + RAND()*20),
                'Juan','Jose','Luis','Carlos','Jorge',
                'Miguel','Alejandro','Daniel','Manuel','Antonio',
                'Fernando','Roberto','Eduardo','Diego','Andres',
                'Raul','Mario','Hector','Ivan','Gabriel');
        ELSE
            SET v_nombre = ELT(FLOOR(1 + RAND()*20),
                'Maria','Guadalupe','Fernanda','Daniela','Andrea',
                'Sofia','Valeria','Ximena','Camila','Renata',
                'Natalia','Mariana','Paola','Carolina','Gabriela',
                'Patricia','Rosa','Laura','Adriana','Claudia');
        END IF;

        SET v_apellido1 = ELT(FLOOR(1 + RAND()*20),
            'Hernandez','Garcia','Martinez','Lopez','Gonzalez',
            'Perez','Rodriguez','Sanchez','Ramirez','Cruz',
            'Flores','Gomez','Morales','Vazquez','Reyes',
            'Torres','Ruiz','Mendoza','Aguilar','Castillo');

        SET v_apellido2 = ELT(FLOOR(1 + RAND()*20),
            'Hernandez','Garcia','Martinez','Lopez','Gonzalez',
            'Perez','Rodriguez','Sanchez','Ramirez','Cruz',
            'Flores','Gomez','Morales','Vazquez','Reyes',
            'Torres','Ruiz','Mendoza','Aguilar','Castillo');

        SET v_fecha_nac = DATE_SUB(CURDATE(), INTERVAL FLOOR(1 + RAND()*85) YEAR);

        SET v_status_vida = ELT(FLOOR(1 + RAND()*5),
            'Vivo','Finado','Coma','Vegetativo','Desconocido');

        SET v_status_medico = ELT(FLOOR(1 + RAND()*5),
            'Estable','Observacion','Cuidados Paliativos',
            'Recuperacion','Terapia Intensiva');

        SET v_fecha_cita = DATE_SUB(v_fecha_base, INTERVAL (i + 1) SECOND);

        INSERT INTO tbb_personas(tipo,pais_origen)
        VALUES('Fisica','Mexico');

        SET v_persona_id = LAST_INSERT_ID();

        INSERT INTO tbb_personas_fisicas(
            ID,nombre,primer_apellido,segundo_apellido,
            genero,fecha_nacimiento
        )
        VALUES(
            v_persona_id,v_nombre,v_apellido1,v_apellido2,
            v_genero,v_fecha_nac
        );

        INSERT INTO tbb_pacientes(
            ID,status_medico,status_vida,fecha_ultima_citamedica
        )
        VALUES(
            v_persona_id,
            v_status_medico,
            v_status_vida,
            v_fecha_cita
        );

        SET i = i + 1;

    END WHILE;
