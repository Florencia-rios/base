CREATE EXTENSION dblink;

DO $$
BEGIN
   IF NOT EXISTS (
      SELECT FROM pg_database
      WHERE datname = 'boletinesoficiales'
   ) THEN
      PERFORM dblink_exec('dbname=postgres', 'CREATE DATABASE boletinesoficiales');
   END IF;
END
$$;

\c boletinesoficiales

CREATE TABLE IF NOT EXISTS cargos (
  id SERIAL PRIMARY KEY,
  nombre VARCHAR(30),
  codigo VARCHAR(2)
);

CREATE TABLE IF NOT EXISTS estado_civil (
  id SERIAL PRIMARY KEY,
  nombre VARCHAR(30),
  codigo VARCHAR(1)
);

CREATE TABLE IF NOT EXISTS fuente_informacion (
  id SERIAL PRIMARY KEY,
  nombre VARCHAR(30),
  codigo VARCHAR(3)
);

CREATE TABLE IF NOT EXISTS provincias (
  id SERIAL PRIMARY KEY,
  nombre VARCHAR(30),
  codigo VARCHAR(1)
);

CREATE TABLE IF NOT EXISTS sexo (
  id SERIAL PRIMARY KEY,
  nombre VARCHAR(30),
  codigo VARCHAR(1)
);

CREATE TABLE IF NOT EXISTS nacionalidades (
  id SERIAL PRIMARY KEY,
  nombre VARCHAR(30),
  codigo VARCHAR(2)
);

CREATE TABLE IF NOT EXISTS sociedad (
  id SERIAL PRIMARY KEY,
  mor_user VARCHAR(10),
  mor_nro_user VARCHAR(10),
  mor_lote VARCHAR(10),
  mor_codint INT,
  mor_matriz VARCHAR(10),
  mor_sucursal VARCHAR(10),
  mor_sector VARCHAR(10),
  mor_cliente VARCHAR(10),
  mor_nombre_completo VARCHAR(72),
  mor_fecha_nac VARCHAR(10),
  mor_sexo_id INT,
  mor_documento1 VARCHAR(11),
  mor_documento2 VARCHAR(11),
  mor_prov_doc2 VARCHAR(1),
  mor_telefono VARCHAR(14),
  mor_marca_dire_1 VARCHAR(1),
  mor_calle VARCHAR(40),
  mor_numer VARCHAR(10),
  mor_piso VARCHAR(6),
  mor_loca VARCHAR(36),
  mor_prov_id INT,
  mor_cp VARCHAR(8),
  mor_est_civil_id INT,
  mor_nacionalidad_id INT,
  mor_relacion VARCHAR(1),
  mor_cargo_id INT,
  mor_cargo_fecha VARCHAR(10),
  mor_cargo_fuente_id INT,
  mor_ant_codigo VARCHAR(3) DEFAULT 'XXX',
  mor_campo_1 VARCHAR(20),
  mor_campo_2 VARCHAR(20),
  mor_campo_3 VARCHAR(20),
  mor_campo_4 VARCHAR(20),
  mor_campo_5 VARCHAR(20),
  mor_campo_6 VARCHAR(20),
  mor_campo_7 VARCHAR(20),
  mor_campo_8 VARCHAR(20),
  mor_ant_fecha VARCHAR(10),
  mor_archivo VARCHAR(72),
  mor_soc_categoria VARCHAR(3),
  fecha_insercion_boletin VARCHAR
);

ALTER TABLE sociedad ADD FOREIGN KEY (mor_sexo_id) REFERENCES sexo(id);
ALTER TABLE sociedad ADD FOREIGN KEY (mor_prov_id) REFERENCES provincias(id);
ALTER TABLE sociedad ADD FOREIGN KEY (mor_est_civil_id) REFERENCES estado_civil(id);
ALTER TABLE sociedad ADD FOREIGN KEY (mor_nacionalidad_id) REFERENCES nacionalidades(id);
ALTER TABLE sociedad ADD FOREIGN KEY (mor_cargo_id) REFERENCES cargos(id);
ALTER TABLE sociedad ADD FOREIGN KEY (mor_cargo_fuente_id) REFERENCES fuente_informacion(id);