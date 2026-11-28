# Modelo entidad-relación SAB (G1-P2)

**Fuente:** SRS-SAB-001 v2.3. Esta propuesta lógica usa notación pata de gallo expresada mediante cardinalidades (`1 : 0..*`, `1 : 0..1` y `N : M` resuelta con entidad asociativa). Se presenta en tablas para revisar entidades, atributos y relaciones sin un diagrama saturado.

## Entidades y datos principales

`PK` identifica cada registro, `FK` lo relaciona con otra entidad y `único` evita duplicados de ese dato.

| Entidad | Qué guarda | Identificador y atributos principales |
|---|---|---|
| `PERSONA` | Persona que usa el sistema. | id_persona (PK), documento (único), nombre, correo (único), estado |
| `APRENDIZ` | Tipo de persona que participa en formación. | id_aprendiz (PK), id_persona (FK, única), estado |
| `INSTRUCTOR` | Tipo de persona que dirige sesiones. | id_instructor (PK), id_persona (FK, única), especialidad, estado |
| `SUPERADMIN` | Tipo de persona que administra SAB. | id_superadmin (PK), id_persona (FK, única), alcance |
| `CUENTA` | Acceso de una persona con un rol. | id_cuenta (PK), id_persona (FK), id_rol (FK), estado, fecha_creacion |
| `ROL` | Permisos asignables a una cuenta. | id_rol (PK), nombre (único), alcance |
| `SEDE` | Lugar institucional de formación. | id_sede (PK), nombre, codigo (único) |
| `PROGRAMA` | Programa formativo. | id_programa (PK), nombre, nivel |
| `FICHA` | Grupo asociado a sede y programa. | id_ficha (PK), id_sede (FK), id_programa (FK), numero (único), jornada, estado |
| `VINCULACION_FICHA` | Vigencia de la pertenencia de un aprendiz a una ficha. | id_vinculacion (PK), id_aprendiz (FK), id_ficha (FK), fecha_inicio, fecha_fin, estado |
| `AMBIENTE` | Espacio de formación. | id_ambiente (PK), nombre, ubicacion, estado |
| `HORARIO` | Asignación de ficha, instructor y ambiente. | id_horario (PK), id_ficha (FK), id_instructor (FK), id_ambiente (FK), inicio, fin |
| `SESION` | Ocurrencia de una clase. | id_sesion (PK), id_horario (FK), id_ficha (FK), id_instructor (FK), inicio, fin, estado |
| `ASISTENCIA` | Marca única de un aprendiz en una sesión. | id_asistencia (PK), id_sesion (FK), id_aprendiz (FK), fecha_hora, estado, modalidad |
| `EXCUSA` | Solicitud para justificar ausencia. | id_excusa (PK), id_aprendiz (FK), id_sesion (FK), motivo, estado, fecha |
| `EVIDENCIA` | Archivo relacionado con una excusa. | id_evidencia (PK), id_excusa (FK), tipo, nombre, fecha |
| `INCIDENCIA` | Situación de una sesión que requiere revisión. | id_incidencia (PK), id_sesion (FK), motivo, estado, fecha |
| `IDENTIDAD_AUTORIZADA` | Modalidad de identidad autorizada para un aprendiz. | id_identidad (PK), id_aprendiz (FK), modalidad, estado_autorizacion, fecha_autorizacion |
| `RESULTADO_COMPETENCIA` | Resultado formativo relacionado con una ficha. | id_resultado (PK), id_ficha (FK), competencia, resultado, fecha |
| `NOTIFICACION` | Aviso para una persona. | id_notificacion (PK), id_persona (FK), tipo, estado, fecha |
| `NOVEDAD` | Aviso institucional publicado en SAB. | id_novedad (PK), id_superadmin (FK), titulo, fecha_publicacion, estado |
| `AUDITORIA` | Evento relevante del sistema. | id_evento (PK), id_persona (FK, opcional), id_evento_anterior (FK, opcional), accion, fecha, resultado, valor_anterior, valor_nuevo |

## Relaciones y cardinalidades

| Entidad origen | Entidad relacionada | Cardinalidad | Significado |
|---|---|---|---|
| `PERSONA` | `APRENDIZ` | 1 : 0..1 | Una persona puede tener cero o un perfil de aprendiz; cada perfil pertenece a una persona. |
| `PERSONA` | `SUPERADMIN` | 1 : 0..1 | Una persona puede tener cero o un perfil de superadministrador; cada perfil pertenece a una persona. |
| `PERSONA` | `INSTRUCTOR` | 1 : 0..1 | Una persona puede tener cero o un perfil de instructor; cada perfil pertenece a una persona. |
| `PERSONA` | `CUENTA` | 1 : 0..* | Una persona puede tener varias cuentas; cada cuenta pertenece a una persona. |
| `ROL` | `CUENTA` | 1 : 0..* | Un rol puede asignarse a varias cuentas; cada cuenta tiene un rol. |
| `SEDE` | `FICHA` | 1 : 0..* | Una sede ofrece varias fichas; cada ficha pertenece a una sede. |
| `PROGRAMA` | `FICHA` | 1 : 0..* | Un programa define varias fichas; cada ficha corresponde a un programa. |
| `APRENDIZ` | `VINCULACION_FICHA` | N : M mediante VINCULACION_FICHA | Una ficha y un aprendiz se relacionan mediante vinculaciones con vigencia. |
| `FICHA` | `VINCULACION_FICHA` | 1 : 0..* | Cada vinculación corresponde a una ficha y un aprendiz. |
| `INSTRUCTOR` | `HORARIO` | 1 : 0..* | Un instructor puede tener varios horarios asignados. |
| `FICHA` | `HORARIO` | 1 : 0..* | Una ficha puede tener varios horarios. |
| `AMBIENTE` | `HORARIO` | 1 : 0..* | Un ambiente puede asignarse a varios horarios en distintos momentos. |
| `HORARIO` | `SESION` | 1 : 0..* | Un horario puede originar varias sesiones. |
| `INSTRUCTOR` | `SESION` | 1 : 0..* | Un instructor puede dirigir varias sesiones. |
| `FICHA` | `SESION` | 1 : 0..* | Una ficha puede tener varias sesiones. |
| `SESION` | `ASISTENCIA` | 1 : 0..* | Cada asistencia pertenece a una sola sesión. |
| `APRENDIZ` | `ASISTENCIA` | 1 : 0..* | Cada asistencia pertenece a un solo aprendiz. |
| `APRENDIZ` | `EXCUSA` | 1 : 0..* | Un aprendiz puede presentar varias excusas. |
| `SESION` | `EXCUSA` | 1 : 0..* | Una sesión puede tener varias excusas. |
| `EXCUSA` | `EVIDENCIA` | 1 : 0..* | Una excusa puede tener cero o varias evidencias. |
| `SESION` | `INCIDENCIA` | 1 : 0..* | Una sesión puede generar varias incidencias. |
| `APRENDIZ` | `IDENTIDAD_AUTORIZADA` | 1 : 0..* | Un aprendiz puede tener varias modalidades autorizadas; cada registro corresponde a un aprendiz. |
| `FICHA` | `RESULTADO_COMPETENCIA` | 1 : 0..* | Una ficha puede registrar varios resultados. |
| `PERSONA` | `NOTIFICACION` | 1 : 0..* | Una persona puede recibir varias notificaciones. |
| `SUPERADMIN` | `NOVEDAD` | 1 : 0..* | Un superadministrador puede publicar varias novedades. |
| `PERSONA` | `AUDITORIA` | 1 : 0..* | Una persona puede originar varios eventos; el actor puede ser desconocido. |
| `AUDITORIA` | `AUDITORIA` | 0..1 : 0..* | Un evento anterior puede relacionarse con eventos posteriores; relación propuesta. |

## Reglas para interpretar el modelo

- La relación entre `APRENDIZ` y `FICHA` es muchos a muchos y se resuelve con `VINCULACION_FICHA`, que guarda fechas y estado.
- Una asistencia debe apuntar a una sesión y a un aprendiz. Se propone una restricción única para la pareja `(id_sesion, id_aprendiz)`.
- Una sesión cancelada no debe crear registros de inasistencia.
- Los datos de identidad se limitan a la modalidad autorizada y su estado. No se propone guardar imágenes faciales o datos biométricos crudos.
- `AUDITORIA.id_evento_anterior` es opcional y representa una propuesta; la regla confirmada del SRS es conservar valores anteriores y nuevos cuando aplique.
- Las cardinalidades son propuestas y deben confirmarse con el equipo frente a las reglas del SRS.
