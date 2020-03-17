-- Generado por Oracle SQL Developer Data Modeler 19.4.0.350.1424
--   en:        2020-03-16 21:10:11 CLST
--   sitio:      Oracle Database 11g
--   tipo:      Oracle Database 11g



CREATE TABLE alt (
    id_alt                    INTEGER NOT NULL,
    descripcion_alternativa   VARCHAR2(200) NOT NULL,
    correcto_o_incorrecto     CHAR(1) NOT NULL,
    ponderacion_alternativa   FLOAT(2) NOT NULL,
    pregunta_id_preg          INTEGER NOT NULL,
    estudiante_id_estudiante  INTEGER
);

ALTER TABLE alt ADD CONSTRAINT alternativa_pk PRIMARY KEY ( id_alt );

CREATE TABLE curso (
    id_curso           INTEGER NOT NULL,
    descripcion_curso  VARCHAR2(100) NOT NULL
);

ALTER TABLE curso ADD CONSTRAINT curso_pk PRIMARY KEY ( id_curso );

CREATE TABLE estudiante (
    id_estudiante      INTEGER NOT NULL,
    nombre_estudiante  VARCHAR2(100) NOT NULL,
    curso_id_curso     INTEGER NOT NULL
);

ALTER TABLE estudiante ADD CONSTRAINT estudiante_pk PRIMARY KEY ( id_estudiante );

CREATE TABLE preg (
    id_preg        INTEGER NOT NULL,
    enunciado      VARCHAR2(500) NOT NULL,
    puntaje_total  FLOAT(2) NOT NULL,
    test_id_test   INTEGER NOT NULL
);

ALTER TABLE preg ADD CONSTRAINT pregunta_pk PRIMARY KEY ( id_preg );

CREATE TABLE test (
    id_test           INTEGER NOT NULL,
    nombre_test       VARCHAR2(100) NOT NULL,
    descripcion_test  VARCHAR2(200) NOT NULL,
    programa          VARCHAR2(100) NOT NULL,
    unidad            VARCHAR2(10) NOT NULL,
    autor             VARCHAR2(100) NOT NULL,
    fecha_creacion    DATE NOT NULL
);

ALTER TABLE test ADD CONSTRAINT test_pk PRIMARY KEY ( id_test );

CREATE TABLE test_por_curso (
    test_id_test    INTEGER NOT NULL,
    curso_id_curso  INTEGER NOT NULL
);

ALTER TABLE test_por_curso ADD CONSTRAINT test_por_curso_pk PRIMARY KEY ( test_id_test,
                                                                          curso_id_curso );

ALTER TABLE alt
    ADD CONSTRAINT alternativa_estudiante_fk FOREIGN KEY ( estudiante_id_estudiante )
        REFERENCES estudiante ( id_estudiante );

ALTER TABLE alt
    ADD CONSTRAINT alternativa_pregunta_fk FOREIGN KEY ( pregunta_id_preg )
        REFERENCES preg ( id_preg );

ALTER TABLE estudiante
    ADD CONSTRAINT estudiante_curso_fk FOREIGN KEY ( curso_id_curso )
        REFERENCES curso ( id_curso );

ALTER TABLE preg
    ADD CONSTRAINT pregunta_test_fk FOREIGN KEY ( test_id_test )
        REFERENCES test ( id_test );

ALTER TABLE test_por_curso
    ADD CONSTRAINT test_por_curso_curso_fk FOREIGN KEY ( curso_id_curso )
        REFERENCES curso ( id_curso );

ALTER TABLE test_por_curso
    ADD CONSTRAINT test_por_curso_test_fk FOREIGN KEY ( test_id_test )
        REFERENCES test ( id_test );



-- Informe de Resumen de Oracle SQL Developer Data Modeler: 
-- 
-- CREATE TABLE                             6
-- CREATE INDEX                             0
-- ALTER TABLE                             12
-- CREATE VIEW                              0
-- ALTER VIEW                               0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                           0
-- ALTER TRIGGER                            0
-- CREATE COLLECTION TYPE                   0
-- CREATE STRUCTURED TYPE                   0
-- CREATE STRUCTURED TYPE BODY              0
-- CREATE CLUSTER                           0
-- CREATE CONTEXT                           0
-- CREATE DATABASE                          0
-- CREATE DIMENSION                         0
-- CREATE DIRECTORY                         0
-- CREATE DISK GROUP                        0
-- CREATE ROLE                              0
-- CREATE ROLLBACK SEGMENT                  0
-- CREATE SEQUENCE                          0
-- CREATE MATERIALIZED VIEW                 0
-- CREATE MATERIALIZED VIEW LOG             0
-- CREATE SYNONYM                           0
-- CREATE TABLESPACE                        0
-- CREATE USER                              0
-- 
-- DROP TABLESPACE                          0
-- DROP DATABASE                            0
-- 
-- REDACTION POLICY                         0
-- 
-- ORDS DROP SCHEMA                         0
-- ORDS ENABLE SCHEMA                       0
-- ORDS ENABLE OBJECT                       0
-- 
-- ERRORS                                   0
-- WARNINGS                                 0
