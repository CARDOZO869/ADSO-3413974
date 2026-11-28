# Lista de chequeo — G1-P2 SAB

Marca Sí/No con evidencia concreta. La columna de resultado refleja la revisión de los archivos incluidos en esta carpeta. El mockup público vigente no está sincronizado aquí; su contenido debe revisarse manualmente.

| # | Criterio verificable | Artefacto | Cumple | Evidencia / hallazgo |
|---:|---|---|---|---|
| 1 | Hay al menos dos diagramas de actividades con inicio y fin. | Diagramas | Sí | `01_actividad_abrir_sesion.svg` y `02_actividad_registrar_asistencia.svg`. |
| 2 | Cada actividad separa actor y sistema mediante calles. | Diagramas | Sí | Ambos diagramas tienen calles Instructor/Aprendiz y SAB. |
| 3 | Cada decisión muestra salidas con guardas completas. | Diagramas | Sí | CU-05 envía `[Sí]` a crear sesión y `[No]` a rechazo; CU-07/06 separa código válido, código rechazado, identidad aceptada, fallo de identidad y fallo técnico. |
| 4 | Las plantillas tienen flujo principal de seis o más pasos. | Plantillas | Sí | CU-05 tiene 8 pasos, CU-07 tiene 7, CU-06 tiene 7. |
| 5 | Cada plantilla incluye al menos un flujo alterno. | Plantillas | Sí | CU-05 5a; CU-07 1a; CU-06 3a. |
| 6 | Cada plantilla incluye al menos una excepción. | Plantillas | Sí | CU-05 5b; CU-07 3a; CU-06 5a/5b. |
| 7 | Las precondiciones son anteriores al inicio del caso. | Plantillas | Sí | Se requieren cuenta/sesión activa y condiciones previas en cada plantilla. |
| 8 | Los flujos no nombran tablas, SQL ni endpoints. | Plantillas | Sí | Revisión de los tres archivos CU-05, CU-07, CU-06. |
| 9 | El dominio tiene al menos ocho conceptos y no usa métodos. | Dominio | Sí | `03_modelo_dominio.md`, 22 conceptos de negocio en tabla, sin métodos. |
| 10 | Al menos cinco conceptos del dominio tienen dos atributos de negocio. | Dominio | Sí | Persona, Aprendiz, Instructor, Ficha, Sesión, Asistencia y Excusa presentan al menos dos atributos. |
| 11 | El dominio tiene asociaciones y multiplicidades. | Dominio | Sí | Relaciones y multiplicidades expresadas en una tabla de asociaciones. |
| 12 | El MER declara notación y contiene seis o más entidades. | MER | Sí | `04_modelo_entidad_relacion.md`, notación pata de gallo expresada en tablas, 22 entidades. |
| 13 | El MER resuelve N:M con asociativa y atributos propios. | MER | Sí | `VINCULACION_FICHA` relaciona `APRENDIZ` y `FICHA`, con fechas y estado. |
| 14 | El MER muestra relación recursiva o entidad débil, o justifica. | MER | Sí | `AUDITORIA` puede referenciar un evento anterior; la relación se declara como propuesta. |
| 15 | El prototipo tiene al menos tres pantallas rotuladas con CU. | Prototipo | Sí | `05_prototipo_inicial.html`, CU-05, CU-07 y CU-06. |
| 16 | La lista contiene al menos 15 criterios verificables con evidencia. | Lista | Sí | 18 criterios. |
| 17 | La matriz permite trazar ≥90 % de RF hasta plantilla, dominio y entidad. | Matriz | Sí, como propuesta | `07_matriz_trazabilidad.md` contiene los RF-SAB-001 a RF-SAB-100 y relaciones con CU, dominio y MER; las asignaciones a prototipo deben cotejarse con el mockup vigente. |
| 18 | El informe enlaza artefactos y resume requisitos y verificaciones. | Informe | Sí, con pendientes declarados | `09_informe_analisis.md` enlaza los modelos, resume requisitos y declara las verificaciones abiertas. |

## Segunda verificación

Se corrigió H-01 al crear salidas separadas para rutas válidas y rechazadas; se volvió a comprobar que hay 100 RF y que se conservaron los CU múltiples de la matriz P1. H-02 sigue parcialmente pendiente: las asignaciones a clases/entidades son propuestas y las pantallas deben cotejarse con el mockup vigente. H-03 se revisó: el informe describe esos resultados y deja claro qué falta confirmar.
