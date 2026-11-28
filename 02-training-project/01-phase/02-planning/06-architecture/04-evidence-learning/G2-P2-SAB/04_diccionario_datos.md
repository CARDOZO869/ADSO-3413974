# Diccionario de datos SAB (B4)

**Convención:** tablas y columnas `snake_case`; PK numéricas autogeneradas por la aplicación; fechas ISO 8601. Tipos del modelo relacional; longitudes expresadas en caracteres. Cada columna del SQL aparece una vez en esta tabla.

| Tabla | Columna | Tipo y tamaño | Restricciones | Dominio / significado |
|---|---|---|---|---|
| `sede` | `id_sede` | `INTEGER` | PK; NOT NULL | Identificador positivo |
| `sede` | `nombre` | `VARCHAR(100)` | NOT NULL | Nombre de sede |
| `sede` | `ciudad` | `VARCHAR(80)` | NOT NULL | Municipio |
| `sede` | `estado` | `VARCHAR(15)` | NOT NULL; CHECK | ACTIVA o INACTIVA |
| `programa` | `id_programa` | `INTEGER` | PK; NOT NULL | Identificador positivo |
| `programa` | `codigo` | `VARCHAR(20)` | NOT NULL; UNIQUE | Código institucional |
| `programa` | `nombre` | `VARCHAR(120)` | NOT NULL | Nombre de programa |
| `programa` | `id_sede` | `INTEGER` | FK; NOT NULL | Sede existente |
| `programa` | `activo` | `INTEGER` | NOT NULL; CHECK | 0 o 1 |
| `ficha` | `id_ficha` | `INTEGER` | PK; NOT NULL | Identificador positivo |
| `ficha` | `codigo` | `VARCHAR(20)` | NOT NULL; UNIQUE | Código de ficha |
| `ficha` | `id_programa` | `INTEGER` | FK; NOT NULL | Programa existente |
| `ficha` | `jornada` | `VARCHAR(20)` | NOT NULL; CHECK | DIURNA, NOCTURNA, MIXTA o FIN_DE_SEMANA |
| `ficha` | `estado` | `VARCHAR(15)` | NOT NULL; CHECK | ACTIVA, CERRADA o INACTIVA |
| `rol` | `id_rol` | `INTEGER` | PK; NOT NULL | Identificador positivo |
| `rol` | `codigo` | `VARCHAR(20)` | NOT NULL; UNIQUE; CHECK | APRENDIZ, INSTRUCTOR o SUPERADMIN |
| `rol` | `descripcion` | `VARCHAR(120)` | NOT NULL | Descripción del rol |
| `usuario` | `id_usuario` | `INTEGER` | PK; NOT NULL | Identificador positivo |
| `usuario` | `id_rol` | `INTEGER` | FK; NOT NULL | Rol existente |
| `usuario` | `documento` | `VARCHAR(20)` | NOT NULL; UNIQUE | Documento como texto; conservar ceros iniciales |
| `usuario` | `nombres` | `VARCHAR(80)` | NOT NULL | Nombres |
| `usuario` | `apellidos` | `VARCHAR(80)` | NOT NULL | Apellidos |
| `usuario` | `correo` | `VARCHAR(150)` | NOT NULL; UNIQUE | Correo normalizado |
| `usuario` | `hash_contrasena` | `VARCHAR(255)` | NOT NULL | Hash Argon2id/bcrypt; nunca contraseña |
| `usuario` | `sal_contrasena` | `VARCHAR(128)` | NOT NULL | Sal aleatoria por cuenta |
| `usuario` | `estado` | `VARCHAR(15)` | NOT NULL; CHECK | ACTIVA, BLOQUEADA o INACTIVA |
| `usuario` | `fecha_creacion` | `DATETIME` | NOT NULL; DEFAULT | Fecha y hora de alta |
| `inscripcion` | `id_usuario` | `INTEGER` | PK compuesta; FK; NOT NULL | Usuario aprendiz |
| `inscripcion` | `id_ficha` | `INTEGER` | PK compuesta; FK; NOT NULL | Ficha existente |
| `inscripcion` | `fecha_inicio` | `DATE` | PK compuesta; NOT NULL | Inicio de vigencia |
| `inscripcion` | `fecha_fin` | `DATE` | NULL; CHECK | Fin igual o posterior al inicio |
| `inscripcion` | `estado` | `VARCHAR(15)` | NOT NULL; CHECK | ACTIVA, RETIRADA o FINALIZADA |
| `ambiente` | `id_ambiente` | `INTEGER` | PK; NOT NULL | Identificador positivo |
| `ambiente` | `id_sede` | `INTEGER` | FK; NOT NULL | Sede existente |
| `ambiente` | `codigo` | `VARCHAR(30)` | NOT NULL; UNIQUE compuesto | Código único dentro de sede |
| `ambiente` | `nombre` | `VARCHAR(100)` | NOT NULL | Nombre del ambiente |
| `ambiente` | `capacidad` | `INTEGER` | NOT NULL; CHECK | Entero mayor que cero |
| `ambiente` | `estado` | `VARCHAR(15)` | NOT NULL; CHECK | ACTIVO o INACTIVO |
| `horario` | `id_horario` | `INTEGER` | PK; NOT NULL | Identificador positivo |
| `horario` | `id_ficha` | `INTEGER` | FK; NOT NULL | Ficha asignada |
| `horario` | `id_instructor` | `INTEGER` | FK; NOT NULL | Usuario con rol Instructor |
| `horario` | `id_ambiente` | `INTEGER` | FK; NOT NULL | Ambiente asignado |
| `horario` | `dia_semana` | `INTEGER` | NOT NULL; CHECK | 1=lunes a 7=domingo |
| `horario` | `hora_inicio` | `TIME` | NOT NULL | Hora de inicio |
| `horario` | `hora_fin` | `TIME` | NOT NULL; CHECK | Posterior a hora_inicio |
| `horario` | `fecha_vigencia_inicio` | `DATE` | NOT NULL | Inicio de vigencia |
| `horario` | `fecha_vigencia_fin` | `DATE` | NULL; CHECK | Nulo o igual/posterior al inicio |
| `sesion` | `id_sesion` | `INTEGER` | PK; NOT NULL | Identificador positivo |
| `sesion` | `id_horario` | `INTEGER` | FK; NOT NULL | Horario base |
| `sesion` | `fecha` | `DATE` | NOT NULL | Fecha de la clase |
| `sesion` | `inicio_real` | `DATETIME` | NOT NULL | Inicio registrado |
| `sesion` | `fin_real` | `DATETIME` | NULL; CHECK | Nulo o posterior al inicio |
| `sesion` | `estado` | `VARCHAR(15)` | NOT NULL; CHECK | ABIERTA, CERRADA o CANCELADA |
| `sesion` | `codigo_temporal_hash` | `VARCHAR(255)` | NULL | Hash del código, nunca el QR reutilizable |
| `sesion` | `codigo_expira` | `DATETIME` | NULL | Vencimiento del código |
| `credencial_identidad` | `id_credencial` | `INTEGER` | PK; NOT NULL | Identificador positivo |
| `credencial_identidad` | `id_usuario` | `INTEGER` | FK; NOT NULL | Titular |
| `credencial_identidad` | `modalidad` | `VARCHAR(20)` | NOT NULL; CHECK | WEBAUTHN o FACIAL aprobado |
| `credencial_identidad` | `referencia_proveedor` | `VARCHAR(255)` | NOT NULL; UNIQUE | Identificador no biométrico del proveedor |
| `credencial_identidad` | `estado` | `VARCHAR(15)` | NOT NULL; CHECK | ACTIVA, REVOCADA o PENDIENTE |
| `credencial_identidad` | `fecha_autorizacion` | `DATETIME` | NULL | Fecha de autorización informada |
| `credencial_identidad` | `fecha_revocacion` | `DATETIME` | NULL; CHECK | Nula o posterior a autorización |
| `asistencia` | `id_asistencia` | `INTEGER` | PK; NOT NULL | Identificador positivo |
| `asistencia` | `id_sesion` | `INTEGER` | FK; NOT NULL; UNIQUE compuesto | Sesión validada |
| `asistencia` | `id_aprendiz` | `INTEGER` | FK; NOT NULL; UNIQUE compuesto | Usuario aprendiz; una marca por sesión |
| `asistencia` | `fecha_hora` | `DATETIME` | NOT NULL | Fecha y hora de registro |
| `asistencia` | `estado` | `VARCHAR(15)` | NOT NULL; CHECK | PUNTUAL, RETARDO, REVISAR o AUSENTE |
| `asistencia` | `metodo` | `VARCHAR(20)` | NOT NULL; CHECK | QR_WEBAUTHN, QR_FACIAL o MANUAL |
| `asistencia` | `origen` | `VARCHAR(15)` | NOT NULL; CHECK | AUTOMATICO o MANUAL |
| `asistencia` | `observacion` | `VARCHAR(250)` | NULL | Nota de contingencia o revisión |
| `excusa` | `id_excusa` | `INTEGER` | PK; NOT NULL | Identificador positivo |
| `excusa` | `id_asistencia` | `INTEGER` | FK; NOT NULL; UNIQUE | Asistencia asociada |
| `excusa` | `fecha_envio` | `DATETIME` | NOT NULL | Fecha de envío |
| `excusa` | `motivo` | `VARCHAR(500)` | NOT NULL | Motivo informado |
| `excusa` | `soporte_uri` | `VARCHAR(500)` | NULL | Ruta privada, no URL pública |
| `excusa` | `estado` | `VARCHAR(15)` | NOT NULL; CHECK | PENDIENTE, APROBADA o RECHAZADA |
| `excusa` | `id_revisor` | `INTEGER` | FK; NULL | Usuario autorizado que revisa |
| `excusa` | `fecha_revision` | `DATETIME` | NULL | Fecha de decisión |
| `excusa` | `respuesta` | `VARCHAR(500)` | NULL | Motivo de decisión |
| `novedad` | `id_novedad` | `INTEGER` | PK; NOT NULL | Identificador positivo |
| `novedad` | `id_sede` | `INTEGER` | FK; NOT NULL | Sede destinataria |
| `novedad` | `id_autor` | `INTEGER` | FK; NOT NULL | Usuario publicador autorizado |
| `novedad` | `titulo` | `VARCHAR(120)` | NOT NULL | Título |
| `novedad` | `contenido` | `VARCHAR(1000)` | NOT NULL | Texto informativo |
| `novedad` | `fecha_publicacion` | `DATETIME` | NULL | Nulo mientras borrador |
| `novedad` | `estado` | `VARCHAR(15)` | NOT NULL; CHECK | BORRADOR, PUBLICADA o RETIRADA |
| `novedad` | `fijada` | `INTEGER` | NOT NULL; CHECK | 0 o 1 |
| `notificacion` | `id_notificacion` | `INTEGER` | PK; NOT NULL | Identificador positivo |
| `notificacion` | `id_usuario` | `INTEGER` | FK; NOT NULL | Destinatario |
| `notificacion` | `id_novedad` | `INTEGER` | FK; NULL | Novedad relacionada |
| `notificacion` | `tipo` | `VARCHAR(30)` | NOT NULL | Categoría |
| `notificacion` | `mensaje` | `VARCHAR(500)` | NOT NULL | Texto visible autorizado |
| `notificacion` | `fecha_creacion` | `DATETIME` | NOT NULL | Creación |
| `notificacion` | `fecha_lectura` | `DATETIME` | NULL | Nulo mientras no leída |
| `auditoria` | `id_evento` | `INTEGER` | PK; NOT NULL | Identificador positivo |
| `auditoria` | `id_actor` | `INTEGER` | FK; NULL | Actor; nulo si cuenta eliminada o evento de sistema |
| `auditoria` | `accion` | `VARCHAR(80)` | NOT NULL | Acción auditada |
| `auditoria` | `entidad` | `VARCHAR(50)` | NOT NULL | Tipo de registro afectado |
| `auditoria` | `id_registro` | `VARCHAR(50)` | NULL | Identificador externo del registro |
| `auditoria` | `fecha_hora` | `DATETIME` | NOT NULL | Instante del evento |
| `auditoria` | `detalle` | `TEXT` | NULL | Detalle minimizado; no incluir biometría ni secretos |
