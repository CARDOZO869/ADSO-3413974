PRAGMA foreign_keys = ON;
BEGIN;
CREATE TABLE sede (
 id_sede INTEGER PRIMARY KEY,
 nombre VARCHAR(100) NOT NULL,
 ciudad VARCHAR(80) NOT NULL,
 estado VARCHAR(15) NOT NULL DEFAULT 'ACTIVA' CHECK (estado IN ('ACTIVA','INACTIVA')),
 UNIQUE(nombre, ciudad)
);
CREATE TABLE programa (
 id_programa INTEGER PRIMARY KEY,
 codigo VARCHAR(20) NOT NULL UNIQUE,
 nombre VARCHAR(120) NOT NULL,
 id_sede INTEGER NOT NULL,
 activo INTEGER NOT NULL DEFAULT 1 CHECK (activo IN (0,1)),
 FOREIGN KEY(id_sede) REFERENCES sede(id_sede) ON UPDATE CASCADE ON DELETE RESTRICT
);
CREATE TABLE ficha (
 id_ficha INTEGER PRIMARY KEY,
 codigo VARCHAR(20) NOT NULL UNIQUE,
 id_programa INTEGER NOT NULL,
 jornada VARCHAR(20) NOT NULL CHECK (jornada IN ('DIURNA','NOCTURNA','MIXTA','FIN_DE_SEMANA')),
 estado VARCHAR(15) NOT NULL DEFAULT 'ACTIVA' CHECK (estado IN ('ACTIVA','CERRADA','INACTIVA')),
 FOREIGN KEY(id_programa) REFERENCES programa(id_programa) ON UPDATE CASCADE ON DELETE RESTRICT
);
CREATE TABLE rol (
 id_rol INTEGER PRIMARY KEY,
 codigo VARCHAR(20) NOT NULL UNIQUE CHECK (codigo IN ('APRENDIZ','INSTRUCTOR','SUPERADMIN')),
 descripcion VARCHAR(120) NOT NULL
);
CREATE TABLE usuario (
 id_usuario INTEGER PRIMARY KEY,
 id_rol INTEGER NOT NULL,
 documento VARCHAR(20) NOT NULL UNIQUE,
 nombres VARCHAR(80) NOT NULL,
 apellidos VARCHAR(80) NOT NULL,
 correo VARCHAR(150) NOT NULL UNIQUE,
 hash_contrasena VARCHAR(255) NOT NULL,
 sal_contrasena VARCHAR(128) NOT NULL,
 estado VARCHAR(15) NOT NULL DEFAULT 'ACTIVA' CHECK (estado IN ('ACTIVA','BLOQUEADA','INACTIVA')),
 fecha_creacion DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
 FOREIGN KEY(id_rol) REFERENCES rol(id_rol) ON UPDATE CASCADE ON DELETE RESTRICT
);
CREATE TABLE inscripcion (
 id_usuario INTEGER NOT NULL,
 id_ficha INTEGER NOT NULL,
 fecha_inicio DATE NOT NULL,
 fecha_fin DATE,
 estado VARCHAR(15) NOT NULL CHECK (estado IN ('ACTIVA','RETIRADA','FINALIZADA')),
 PRIMARY KEY(id_usuario,id_ficha,fecha_inicio),
 CHECK (fecha_fin IS NULL OR fecha_fin >= fecha_inicio),
 FOREIGN KEY(id_usuario) REFERENCES usuario(id_usuario) ON UPDATE CASCADE ON DELETE RESTRICT,
 FOREIGN KEY(id_ficha) REFERENCES ficha(id_ficha) ON UPDATE CASCADE ON DELETE RESTRICT
);
CREATE TABLE ambiente (
 id_ambiente INTEGER PRIMARY KEY,
 id_sede INTEGER NOT NULL,
 codigo VARCHAR(30) NOT NULL,
 nombre VARCHAR(100) NOT NULL,
 capacidad INTEGER NOT NULL CHECK (capacidad > 0),
 estado VARCHAR(15) NOT NULL DEFAULT 'ACTIVO' CHECK (estado IN ('ACTIVO','INACTIVO')),
 UNIQUE(id_sede,codigo),
 FOREIGN KEY(id_sede) REFERENCES sede(id_sede) ON UPDATE CASCADE ON DELETE RESTRICT
);
CREATE TABLE horario (
 id_horario INTEGER PRIMARY KEY,
 id_ficha INTEGER NOT NULL,
 id_instructor INTEGER NOT NULL,
 id_ambiente INTEGER NOT NULL,
 dia_semana INTEGER NOT NULL CHECK (dia_semana BETWEEN 1 AND 7),
 hora_inicio TIME NOT NULL,
 hora_fin TIME NOT NULL,
 fecha_vigencia_inicio DATE NOT NULL,
 fecha_vigencia_fin DATE,
 CHECK (hora_fin > hora_inicio),
 CHECK (fecha_vigencia_fin IS NULL OR fecha_vigencia_fin >= fecha_vigencia_inicio),
 FOREIGN KEY(id_ficha) REFERENCES ficha(id_ficha) ON UPDATE CASCADE ON DELETE RESTRICT,
 FOREIGN KEY(id_instructor) REFERENCES usuario(id_usuario) ON UPDATE CASCADE ON DELETE RESTRICT,
 FOREIGN KEY(id_ambiente) REFERENCES ambiente(id_ambiente) ON UPDATE CASCADE ON DELETE RESTRICT
);
CREATE TABLE sesion (
 id_sesion INTEGER PRIMARY KEY,
 id_horario INTEGER NOT NULL,
 fecha DATE NOT NULL,
 inicio_real DATETIME NOT NULL,
 fin_real DATETIME,
 estado VARCHAR(15) NOT NULL CHECK (estado IN ('ABIERTA','CERRADA','CANCELADA')),
 codigo_temporal_hash VARCHAR(255),
 codigo_expira DATETIME,
 FOREIGN KEY(id_horario) REFERENCES horario(id_horario) ON UPDATE CASCADE ON DELETE RESTRICT,
 CHECK (fin_real IS NULL OR fin_real >= inicio_real)
);
CREATE TABLE credencial_identidad (
 id_credencial INTEGER PRIMARY KEY,
 id_usuario INTEGER NOT NULL,
 modalidad VARCHAR(20) NOT NULL CHECK (modalidad IN ('WEBAUTHN','FACIAL')),
 referencia_proveedor VARCHAR(255) NOT NULL UNIQUE,
 estado VARCHAR(15) NOT NULL CHECK (estado IN ('ACTIVA','REVOCADA','PENDIENTE')),
 fecha_autorizacion DATETIME,
 fecha_revocacion DATETIME,
 FOREIGN KEY(id_usuario) REFERENCES usuario(id_usuario) ON UPDATE CASCADE ON DELETE RESTRICT,
 CHECK (fecha_revocacion IS NULL OR fecha_autorizacion IS NULL OR fecha_revocacion >= fecha_autorizacion)
);
CREATE TABLE asistencia (
 id_asistencia INTEGER PRIMARY KEY,
 id_sesion INTEGER NOT NULL,
 id_aprendiz INTEGER NOT NULL,
 fecha_hora DATETIME NOT NULL,
 estado VARCHAR(15) NOT NULL CHECK (estado IN ('PUNTUAL','RETARDO','REVISAR','AUSENTE')),
 metodo VARCHAR(20) NOT NULL CHECK (metodo IN ('QR_WEBAUTHN','QR_FACIAL','MANUAL')),
 origen VARCHAR(15) NOT NULL CHECK (origen IN ('AUTOMATICO','MANUAL')),
 observacion VARCHAR(250),
 UNIQUE(id_sesion,id_aprendiz),
 FOREIGN KEY(id_sesion) REFERENCES sesion(id_sesion) ON UPDATE CASCADE ON DELETE RESTRICT,
 FOREIGN KEY(id_aprendiz) REFERENCES usuario(id_usuario) ON UPDATE CASCADE ON DELETE RESTRICT
);
CREATE TABLE excusa (
 id_excusa INTEGER PRIMARY KEY,
 id_asistencia INTEGER NOT NULL UNIQUE,
 fecha_envio DATETIME NOT NULL,
 motivo VARCHAR(500) NOT NULL,
 soporte_uri VARCHAR(500),
 estado VARCHAR(15) NOT NULL CHECK (estado IN ('PENDIENTE','APROBADA','RECHAZADA')),
 id_revisor INTEGER,
 fecha_revision DATETIME,
 respuesta VARCHAR(500),
 FOREIGN KEY(id_asistencia) REFERENCES asistencia(id_asistencia) ON UPDATE CASCADE ON DELETE RESTRICT,
 FOREIGN KEY(id_revisor) REFERENCES usuario(id_usuario) ON UPDATE CASCADE ON DELETE SET NULL
);
CREATE TABLE novedad (
 id_novedad INTEGER PRIMARY KEY,
 id_sede INTEGER NOT NULL,
 id_autor INTEGER NOT NULL,
 titulo VARCHAR(120) NOT NULL,
 contenido VARCHAR(1000) NOT NULL,
 fecha_publicacion DATETIME,
 estado VARCHAR(15) NOT NULL CHECK (estado IN ('BORRADOR','PUBLICADA','RETIRADA')),
 fijada INTEGER NOT NULL DEFAULT 0 CHECK (fijada IN (0,1)),
 FOREIGN KEY(id_sede) REFERENCES sede(id_sede) ON UPDATE CASCADE ON DELETE RESTRICT,
 FOREIGN KEY(id_autor) REFERENCES usuario(id_usuario) ON UPDATE CASCADE ON DELETE RESTRICT
);
CREATE TABLE notificacion (
 id_notificacion INTEGER PRIMARY KEY,
 id_usuario INTEGER NOT NULL,
 id_novedad INTEGER,
 tipo VARCHAR(30) NOT NULL,
 mensaje VARCHAR(500) NOT NULL,
 fecha_creacion DATETIME NOT NULL,
 fecha_lectura DATETIME,
 FOREIGN KEY(id_usuario) REFERENCES usuario(id_usuario) ON UPDATE CASCADE ON DELETE RESTRICT,
 FOREIGN KEY(id_novedad) REFERENCES novedad(id_novedad) ON UPDATE CASCADE ON DELETE SET NULL
);
CREATE TABLE auditoria (
 id_evento INTEGER PRIMARY KEY,
 id_actor INTEGER,
 accion VARCHAR(80) NOT NULL,
 entidad VARCHAR(50) NOT NULL,
 id_registro VARCHAR(50),
 fecha_hora DATETIME NOT NULL,
 detalle TEXT,
 FOREIGN KEY(id_actor) REFERENCES usuario(id_usuario) ON UPDATE CASCADE ON DELETE SET NULL
);
COMMIT;
