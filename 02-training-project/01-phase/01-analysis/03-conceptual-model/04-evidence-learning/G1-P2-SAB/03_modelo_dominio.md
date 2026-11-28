# Modelo de dominio SAB (G1-P2)

**Fuente:** SRS-SAB-001 v2.3. Este modelo describe palabras y elementos del negocio; no es una base de datos. Por eso no incluye métodos, tipos de datos ni llaves técnicas.

## Conceptos del negocio

| Concepto | ¿Qué representa? | Atributos importantes |
|---|---|---|
| Persona | Alguien que usa SAB o participa en la formación. | Documento, nombre, correo, estado. |
| Aprendiz | Persona inscrita en una ficha. | Estado, fecha de vinculación. |
| Instructor | Persona que dirige sesiones y acompaña fichas. | Especialidad, estado. |
| Superadministrador | Persona que administra la configuración institucional. | Alcance, estado. |
| Cuenta | Acceso de una persona al sistema. | Estado, fecha de creación. |
| Rol | Permisos que puede tener una cuenta. | Nombre, alcance. |
| Sede | Lugar institucional donde se ofrece formación. | Nombre, código. |
| Programa | Formación a la que pertenece una ficha. | Nombre, nivel. |
| Ficha | Grupo de aprendices de un programa y sede. | Número, jornada, estado. |
| Vinculación a ficha | Relación que indica en qué periodo un aprendiz pertenece a una ficha. | Fecha de inicio, fecha de fin, estado. |
| Ambiente | Espacio donde se realiza una sesión. | Nombre, ubicación, estado. |
| Horario | Tiempo asignado a una ficha, instructor y ambiente. | Inicio, fin. |
| Sesión | Clase abierta para una ficha en una fecha y horario. | Fecha, hora de inicio, hora de fin, estado. |
| Asistencia | Resultado de la participación de un aprendiz en una sesión. | Hora de registro, estado, modalidad confirmada. |
| Identidad autorizada | Modalidad permitida para comprobar la identidad del aprendiz. | Modalidad, autorización, estado. |
| Excusa | Solicitud del aprendiz para justificar una ausencia. | Fecha, motivo, estado. |
| Evidencia | Archivo que respalda una excusa. | Nombre, tipo, fecha. |
| Incidencia | Situación que requiere revisión o atención. | Motivo, estado, fecha. |
| Resultado de competencia | Resultado de aprendizaje relacionado con una ficha. | Competencia, resultado, fecha. |
| Notificación | Aviso dirigido a una persona. | Tipo, fecha, estado. |
| Novedad | Información institucional publicada en SAB. | Título, fecha de publicación, estado. |
| Auditoría | Registro de una acción relevante realizada en SAB. | Acción, fecha, resultado, valores anterior y nuevo cuando aplique. |

## Relaciones entre conceptos

La multiplicidad indica cuántos elementos pueden participar en cada relación. Por ejemplo, una ficha agrupa varios aprendices, y cada vinculación corresponde a un solo aprendiz y una sola ficha.

| Concepto 1 | Relación | Concepto 2 | Multiplicidad | Explicación |
|---|---|---|---|---|
| Persona | puede tener | Cuenta | Persona 1 — 0..* Cuentas | Una persona puede contar con una o más cuentas, según la asignación de acceso. |
| Rol | autoriza | Cuenta | Rol 1 — 0..* Cuentas | Un rol puede asignarse a varias cuentas. |
| Persona | puede ser | Aprendiz / Instructor / Superadministrador | Generalización | Son tipos de persona con responsabilidades distintas. |
| Sede | ofrece | Ficha | Sede 1 — 0..* Fichas | Una sede puede tener varias fichas. |
| Programa | define | Ficha | Programa 1 — 0..* Fichas | Un programa puede tener varias fichas. |
| Aprendiz | se vincula mediante | Vinculación a ficha | Aprendiz 1 — 0..* Vinculaciones | Guarda la vigencia de la participación del aprendiz. |
| Ficha | agrupa mediante | Vinculación a ficha | Ficha 1 — 0..* Vinculaciones | La relación permite que las vinculaciones cambien con el tiempo. |
| Instructor | tiene asignado | Horario | Instructor 1 — 0..* Horarios | Un horario asigna una actividad a un instructor. |
| Ficha | tiene | Horario | Ficha 1 — 0..* Horarios | Una ficha puede tener varios horarios. |
| Ambiente | recibe | Horario | Ambiente 1 — 0..* Horarios | Un ambiente puede usarse en diferentes horarios no cruzados. |
| Horario | puede originar | Sesión | Horario 1 — 0..* Sesiones | Una sesión corresponde a una ocurrencia del horario. |
| Instructor | dirige | Sesión | Instructor 1 — 0..* Sesiones | El instructor responsable dirige la sesión. |
| Ficha | participa en | Sesión | Ficha 1 — 0..* Sesiones | Cada sesión corresponde a una ficha. |
| Sesión | recibe | Asistencia | Sesión 1 — 0..* Asistencias | Cada asistencia pertenece a una sesión. |
| Aprendiz | obtiene | Asistencia | Aprendiz 1 — 0..* Asistencias | Cada asistencia corresponde a un aprendiz. |
| Aprendiz | presenta | Excusa | Aprendiz 1 — 0..* Excusas | Una excusa es presentada por un aprendiz. |
| Sesión | puede motivar | Excusa | Sesión 1 — 0..* Excusas | Una excusa justifica la ausencia en una sesión. |
| Excusa | puede incluir | Evidencia | Excusa 1 — 0..* Evidencias | Los soportes son opcionales. |
| Sesión | puede generar | Incidencia | Sesión 1 — 0..* Incidencias | Una sesión puede tener situaciones para revisar. |
| Aprendiz | puede autorizar | Identidad autorizada | Aprendiz 1 — 0..* Identidades | Cada registro representa una modalidad autorizada vigente. |
| Ficha | registra | Resultado de competencia | Ficha 1 — 0..* Resultados | Los resultados se asocian a la formación de la ficha. |
| Persona | recibe | Notificación | Persona 1 — 0..* Notificaciones | Una notificación tiene una persona destinataria. |
| Superadministrador | publica | Novedad | Superadministrador 1 — 0..* Novedades | Una novedad tiene una persona que la publica. |
| Persona | realiza | Auditoría | Persona 1 — 0..* Eventos | Un evento registra quién realizó la acción, cuando se conoce. |

## Reglas que se deben conservar

- Una asistencia requiere una sesión y un aprendiz. El sistema no debe crear dos asistencias del mismo aprendiz para la misma sesión.
- La asistencia se registra solo después de validar el código temporal y la identidad.
- Una sesión cancelada no genera ausencias.
- Una excusa puede tener soportes, pero no es obligatorio adjuntarlos.
- Para la auditoría, el SRS solicita guardar los valores anterior y nuevo cuando aplique. La relación con un evento anterior es una propuesta de organización que debe validar el equipo.
- Los nombres y multiplicidades son una propuesta de análisis; se deben contrastar con las reglas completas del SRS antes de cerrar el producto.
