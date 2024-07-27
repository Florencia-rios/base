-- Instalar la extensión dblink
CREATE EXTENSION dblink;

DO $$
BEGIN
   -- Verifica si la base de datos ya existe
   IF NOT EXISTS (
       SELECT FROM pg_database
       WHERE datname = 'boletinesoficiales'
   ) THEN
      PERFORM dblink_exec('dbname=postgres', 'CREATE DATABASE boletinesoficiales');
   END IF;
END
$$;

\c boletinesoficiales

CREATE TABLE cargos (
  id SERIAL PRIMARY KEY,
  codigo VARCHAR(2),
  nombre VARCHAR
);

CREATE TABLE estado_civil (
  id SERIAL PRIMARY KEY,
  codigo VARCHAR(1),
  nombre VARCHAR
);

CREATE TABLE provincias (
  id SERIAL PRIMARY KEY,
  codigo VARCHAR(1),
  nombre VARCHAR
);

CREATE TABLE sexo (
  id SERIAL PRIMARY KEY,
  codigo VARCHAR(1),
  nombre VARCHAR
);

CREATE TABLE nacionalidades (
  id SERIAL PRIMARY KEY,
  codigo VARCHAR(2),
  nombre VARCHAR
);

CREATE TABLE sociedad (
  id SERIAL PRIMARY KEY,
  mor_user VARCHAR,
  mor_nro_user VARCHAR DEFAULT '62',
  mor_lote VARCHAR DEFAULT '0',
  mor_codint INT,
  mor_matriz VARCHAR DEFAULT 'AA0029',
  mor_sucursal VARCHAR DEFAULT '9999',
  mor_sector VARCHAR,
  mor_cliente VARCHAR DEFAULT '',
  mor_nombre_completo VARCHAR(72) NOT NULL,
  mor_fecha_nac VARCHAR(10),
  mor_sexo_id INT,
  mor_documento1 VARCHAR(11),
  mor_documento2 VARCHAR(11) DEFAULT '',
  mor_prov_doc2_id INT,
  mor_telefono VARCHAR(14),
  mor_marca_dire_1 VARCHAR(1) DEFAULT 'S',
  mor_calle VARCHAR(40),
  mor_numer VARCHAR(10),
  mor_piso VARCHAR(6),
  mor_loca VARCHAR(36),
  mor_prov_id INT,
  mor_cp VARCHAR(8),
  mor_est_civil_id INT,
  mor_nacionalidad_id INT,
  mor_relacion VARCHAR(1) DEFAULT '',
  mor_cargo_id INT,
  mor_cargo_fecha VARCHAR(10),
  mor_cargo_fuente VARCHAR(3) DEFAULT 'BOL',
  mor_ant_codigo VARCHAR(3) DEFAULT 'XXX',
  mor_campo_1 VARCHAR DEFAULT '',
  mor_campo_2 VARCHAR DEFAULT '',
  mor_campo_3 VARCHAR DEFAULT '',
  mor_campo_4 VARCHAR DEFAULT '',
  mor_campo_5 VARCHAR DEFAULT '',
  mor_campo_6 VARCHAR DEFAULT '',
  mor_campo_7 VARCHAR DEFAULT '',
  mor_campo_8 VARCHAR DEFAULT '',
  mor_ant_fecha VARCHAR(10) DEFAULT '',
  mor_archivo VARCHAR(72) DEFAULT '',
  mor_soc_categoria VARCHAR(3),
  fecha_insercion_boletin VARCHAR,
  boletin_oficial BYTEA
);

ALTER TABLE sociedad ADD FOREIGN KEY (mor_sexo_id) REFERENCES sexo(id);
ALTER TABLE sociedad ADD FOREIGN KEY (mor_prov_doc2_id) REFERENCES provincias(id);
ALTER TABLE sociedad ADD FOREIGN KEY (mor_prov_id) REFERENCES provincias(id);
ALTER TABLE sociedad ADD FOREIGN KEY (mor_est_civil_id) REFERENCES estado_civil(id);
ALTER TABLE sociedad ADD FOREIGN KEY (mor_nacionalidad_id) REFERENCES nacionalidades(id);
ALTER TABLE sociedad ADD FOREIGN KEY (mor_cargo_id) REFERENCES cargos(id);

-- Inserts para la tabla cargos
INSERT INTO cargos (codigo, nombre) VALUES
('AB', 'ABSORBIDA'),
('GT', 'GERENTE'),
('DT', 'Director Titular'),
('PR', 'Presidente'),
('LR', 'Representante Legal'),
('SA', 'Socio Solidario'),
('SB', 'Socio Comanditado'),
('SC', 'Socio Comanditario'),
('SG', 'Socio Gerente'),
('SO', 'UNICAMENTE PARA SOCIEDADES DE HECHO Y COLECTIVA'),
('DA', 'DENOMINACION ANTERIOR'),
('ES', 'ESCINDIDA'),
('V0', 'Vicepresidente'),
('V1', 'Vicepresidente Primero'),
('V2', 'Vicepresidente Segundo'),
('V3', 'Vicepresidente Tercero'),
('V4', 'Vicepresidente Cuarto'),
('FU', 'FUSION'),
('UT', 'UTE'),
('DO', 'Directivo');

-- Inserts para la tabla estado_civil
INSERT INTO estado_civil (codigo, nombre) VALUES
('S', 'Soltero'),
('C', 'Casado'),
('D', 'Divorciado');

-- Inserts para la tabla provincias
INSERT INTO provincias (codigo, nombre) VALUES
('A', 'SALTA'),
('B', 'BUENOS AIRES'),
('C', 'CAPITAL FEDERAL'),
('D', 'SAN LUIS'),
('E', 'ENTRE RIOS'),
('F', 'LA RIOJA'),
('G', 'SANTIAGO DEL ESTERO'),
('H', 'CHACO'),
('J', 'SAN JUAN'),
('K', 'CATAMARCA'),
('L', 'LA PAMPA'),
('M', 'MENDOZA'),
('N', 'MISIONES'),
('P', 'FORMOSA'),
('Q', 'NEUQUEN'),
('R', 'RIO NEGRO'),
('S', 'SANTA FE'),
('T', 'TUCUMAN'),
('U', 'CHUBUT'),
('V', 'TIERRA DEL FUEGO'),
('W', 'CORRIENTES'),
('X', 'CORDOBA'),
('Y', 'JUJUY'),
('Z', 'SANTA CRUZ');

-- Inserts para la tabla sexo
INSERT INTO sexo (nombre, codigo) VALUES
('MASCULINO', 'M'),
('FEMENINO', 'F'),
('NO APORTADO', 'I'),
('SOCIEDAD', 'S');

-- Inserts para la tabla nacionalidades
INSERT INTO nacionalidades (codigo, nombre) VALUES
('A', 'ARGENTINA'),
('AL', 'ALEMANIA'),
('AU', 'AUSTRALIA'),
('BO', 'BOLIVIA'),
('BR', 'BRASIL'),
('C', 'COLOMBIA'),
('CB', 'CUBA'),
('CD', 'CANADA'),
('CE', 'CHECOSLOVAQUIA'),
('CH', 'CHILE'),
('CN', 'CHINA'),
('E', 'ESPAÑA'),
('EC', 'ECUADOR'),
('F', 'FRANCIA'),
('GB', 'GRAN BRETAÑA'),
('H', 'HOLANDA'),
('I', 'ITALIA'),
('IR', 'IRLANDA'),
('J', 'JAPON'),
('K', 'KOREA'),
('M', 'MEXICO'),
('O', 'EXTRANJERO'),
('P', 'PERU'),
('PG', 'PORTUGAL'),
('PR', 'PARAGUAY'),
('S', 'SUECIA'),
('SZ', 'SUIZA'),
('TW', 'TAIWAN'),
('U', 'URUGUAY'),
('US', 'ESTADOS UNIDOS'),
('XX', 'EXTRANJERO'),
('YU', 'YUGOSLAVIA');

COMMIT;
