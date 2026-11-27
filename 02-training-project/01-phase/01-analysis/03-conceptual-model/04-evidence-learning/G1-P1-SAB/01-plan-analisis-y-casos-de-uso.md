# G1 · Producto 1: Plan de análisis y casos de uso — SAB

**Aprendiz:** Juan Sebastián Medina Cardozo **Programa:** ADSO · Ficha 3413974 **Insumo principal:** `SRS-SAB-001`, versión 2.3 (27 de noviembre de 2026) **Caso:** Sistema de Asistencia Biométrica (SAB)

> Documento de trabajo individual preparado a partir del SRS indicado. La selección metodológica y el plan son propuestas académicas; los valores que el SRS deja pendientes de aprobación no se presentan como decisiones institucionales definitivas.

## A. Caracterización de la solución

| **Aspecto**                | **Caracterización SAB**                                                                                                                                       | **Implicación para el análisis**                                                         |
| -------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------- |
| Tipo de proyecto           | Aplicación web para registrar asistencia, administrar sesiones, consultar novedades y generar reportes. Alcance inicial: sedes Comercio e Industria de Neiva. | Modelar procesos de tres roles (Aprendiz, Instructor y Superadmin) y sus permisos.       |
| Tamaño del equipo          | Proyecto académico pequeño, con tres integrantes nombrados en el SRS. Esta entrega y sus ajustes son individuales.                                            | Conviene coordinar requisitos mediante un backlog común y dejar decisiones verificables. |
| Estabilidad de requisitos  | Media: el SRS contiene 100 RF y 40 RNF; algunos parámetros, proveedor facial, retención y reglas institucionales siguen pendientes de aprobación.             | Mantener trazabilidad y revisar requisitos cuando se resuelvan las decisiones abiertas.  |
| Disponibilidad del cliente | No se documenta disponibilidad continua de usuarios institucionales; validar reglas con instructor y representantes de sede antes de producción.              | Planificar validaciones cortas y registrar supuestos, preguntas y acuerdos.              |

### Alcance y restricciones que afectan el análisis

- Acceso mediante navegador y conexión HTTPS; resolución adaptable desde 320 px.
- Flujo de asistencia contempla QR o código temporal, verificación de identidad por WebAuthn o cotejo facial aprobado y contingencia supervisada.
- No incluye GPS, vigilancia facial continua, aplicación nativa ni integración oficial con SOFIA Plus.
- No se almacenan huellas crudas; la captura biométrica requiere autorización y alternativa supervisada.
- El mockup es una referencia de interfaz, no evidencia de implementación funcional.

## B. Comparación de metodologías

| **Criterio basado en SAB**           | **Scrum**                                                                                                      | **RUP**                                                                                    | **XP**                                                                                                         |
| ------------------------------------ | -------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------ | -------------------------------------------------------------------------------------------------------------- |
| Cambios en requisitos                | Sprints y revisión frecuente permiten incorporar decisiones pendientes (p. ej., proveedor facial y retención). | Gestiona cambios, pero su ciclo formal puede resultar pesado para el tiempo académico.     | Acepta cambios frecuentes con ciclos cortos.                                                                   |
| Equipo y coordinación                | Roles, backlog y revisión ayudan a coordinar un equipo pequeño y un trabajo individual trazable.               | Define roles y artefactos amplios, más adecuados a equipos/proyectos con mayor estructura. | Favorece equipo pequeño, comunicación continua y participación cercana del cliente.                            |
| Validación de seguridad y privacidad | Cada incremento puede revisar permisos, consentimiento y trazabilidad con criterios de aceptación.             | Tiene fases y artefactos para análisis de riesgos y documentación.                         | Prácticas de pruebas frecuentes ayudan, aunque no sustituyen la documentación exigida.                         |
| Encaje con entrega académica         | Alto: permite entregas incrementales, tablero ya disponible y revisión del SRS.                                | Medio: útil como referencia documental, pero sobredimensionado para una semana.            | Medio-alto: buenas prácticas para diseño/código, requiere acceso frecuente a usuarios y disciplina de pruebas. |

### Selección

**Se selecciona Scrum para organizar el análisis**, por el tamaño pequeño del equipo, la incertidumbre en algunos requisitos y el tablero de Trello ya usado para priorizar tareas. Se trabajará con un backlog priorizado, una meta corta de análisis, revisión diaria breve y una revisión de artefactos antes de cerrar. Las prácticas XP de pruebas y revisión por pares pueden adoptarse como apoyo, pero no se declara un híbrido metodológico para esta entrega.

## C. Plan de actividades de análisis

| **#** | **Actividad priorizada**                                                   | **Responsable**               | **Fecha objetivo**             | **Entregable / evidencia**                                  |
| ----- | -------------------------------------------------------------------------- | ----------------------------- | ------------------------------ | ----------------------------------------------------------- |
| 1     | Confirmar alcance, actores, restricciones y versión base del SRS           | Juan Sebastián Medina Cardozo | 26/11/2026                     | Ficha de caracterización y registro de supuestos            |
| 2     | Revisar y priorizar RF/RNF; identificar decisiones abiertas y dependencias | Juan Sebastián Medina Cardozo | 26/11/2026                     | Backlog de análisis priorizado y lista de preguntas         |
| 3     | Comparar metodologías y acordar la forma de trabajo para el análisis       | Juan Sebastián Medina Cardozo | 26/11/2026                     | Comparación y justificación documentadas                    |
| 4     | Construir matriz de trazabilidad requisito funcional → caso de uso         | Juan Sebastián Medina Cardozo | 27/11/2026                     | Matriz de 100 requisitos funcionales vinculados             |
| 5     | Ajustar diagrama UML de casos de uso por rol y revisar relaciones          | Juan Sebastián Medina Cardozo | 27/11/2026                     | Fuente DOT editable y SVG exportado                         |
| 6     | Revisar cobertura, nombres, actores, frontera y relaciones UML con rúbrica | Juan Sebastián Medina Cardozo | 27/11/2026                     | Lista de revisión del Producto 1 y registro de correcciones |
| 7     | Actualizar README con reutilización, cambios, IA y autoría                 | Juan Sebastián Medina Cardozo | 27/11/2026                     | README de entrega diligenciado                              |     |

## D. Matriz requisito funcional → caso de uso

El SRS v2.3 enumera **100 RF, 40 RNF y 30 casos de uso**. Esta matriz reproduce las referencias requisito–caso de uso incluidas en las descripciones de los casos de uso del SRS. Los 100 RF tienen al menos una referencia: cobertura trazada **100/100 (100 %)**. La cobertura indica que existe un vínculo documentado; no significa que el sistema esté implementado ni que todos los criterios hayan sido verificados. RF-SAB-095 a RF-SAB-100 quedan señalados porque el SRS aún requiere completar o revisar sus criterios de aceptación. Los RNF se verifican transversalmente y no se cuentan como funciones independientes.

| **ID SRS** | **Requisito** | **Caso(s) de uso relacionado(s)** | **Actor(es) relacionado(s)** | **Cobertura / nota** |
| --- | --- | --- | --- | --- |
| RF-SAB-001 | Inicio de sesión | CU-01 · Iniciar sesión | Todos | Trazado en el SRS. |
| RF-SAB-002 | Cerrar sesión | CU-01 · Iniciar sesión | Todos | Trazado en el SRS. |
| RF-SAB-003 | Permisos | CU-01 · Iniciar sesión | Todos | Trazado en el SRS. |
| RF-SAB-004 | Recuperación | CU-01 · Iniciar sesión | Todos | Trazado en el SRS. |
| RF-SAB-005 | Límite de acceso | CU-01 · Iniciar sesión | Todos | Trazado en el SRS. |
| RF-SAB-006 | Sedes | CU-02 · Administrar ficha y liderazgo | Superadmin | Trazado en el SRS. |
| RF-SAB-007 | Fichas | CU-02 · Administrar ficha y liderazgo | Superadmin | Trazado en el SRS. |
| RF-SAB-008 | Cuentas de personal | CU-02 · Administrar ficha y liderazgo<br>CU-24 · Gestionar instructores y ambientes | Superadmin | Trazado en el SRS. |
| RF-SAB-009 | Asignar líder | CU-02 · Administrar ficha y liderazgo<br>CU-16 · Reasignar líder | Superadmin | Trazado en el SRS. |
| RF-SAB-010 | Parámetros | CU-02 · Administrar ficha y liderazgo | Superadmin | Trazado en el SRS. |
| RF-SAB-011 | Tablero general | CU-02 · Administrar ficha y liderazgo<br>CU-29 · Consultar panel administrativo | Superadmin | Trazado en el SRS. |
| RF-SAB-012 | Alta aprendiz | CU-03 · Registrar aprendiz | Aprendiz | Trazado en el SRS. |
| RF-SAB-013 | Unicidad | CU-03 · Registrar aprendiz | Aprendiz | Trazado en el SRS. |
| RF-SAB-014 | Editar aprendiz | CU-03 · Registrar aprendiz | Aprendiz | Trazado en el SRS. |
| RF-SAB-015 | Listado aprendiz | CU-03 · Registrar aprendiz | Aprendiz | Trazado en el SRS. |
| RF-SAB-016 | Desvinculación | CU-03 · Registrar aprendiz | Aprendiz | Trazado en el SRS. |
| RF-SAB-017 | Enrolamiento | CU-04 · Enrolar identidad | Aprendiz, responsable autorizado | Trazado en el SRS. |
| RF-SAB-018 | Abrir sesión | CU-05 · Abrir sesión | Instructor | Trazado en el SRS. |
| RF-SAB-019 | Solapamiento | CU-05 · Abrir sesión | Instructor | Trazado en el SRS. |
| RF-SAB-020 | Generar QR | CU-05 · Abrir sesión | Instructor | Trazado en el SRS. |
| RF-SAB-021 | Rotación QR | CU-05 · Abrir sesión | Instructor | Trazado en el SRS. |
| RF-SAB-022 | Cerrar sesión | CU-05 · Abrir sesión<br>CU-10 · Cerrar sesión y exportar | Instructor | Trazado en el SRS. |
| RF-SAB-023 | Consultar sesiones | CU-05 · Abrir sesión<br>CU-10 · Cerrar sesión y exportar | Instructor | Trazado en el SRS. |
| RF-SAB-024 | Verificar autenticador | CU-06 · Verificar identidad | Aprendiz | Trazado en el SRS. |
| RF-SAB-025 | Orden de validación | CU-07 · Validar QR o código | Aprendiz | Trazado en el SRS. |
| RF-SAB-026 | Validar QR | CU-07 · Validar QR o código | Aprendiz | Trazado en el SRS. |
| RF-SAB-027 | Ventana de identidad | CU-06 · Verificar identidad | Aprendiz | Trazado en el SRS. |
| RF-SAB-028 | Intentos | CU-06 · Verificar identidad | Aprendiz | Trazado en el SRS. |
| RF-SAB-029 | Asistencia única | CU-08 · Registrar asistencia | Aprendiz, sistema | Trazado en el SRS. |
| RF-SAB-030 | Resultado | CU-08 · Registrar asistencia | Aprendiz, sistema | Trazado en el SRS. |
| RF-SAB-031 | Crear incidencia | CU-09 · Escalar incidencia | Sistema, Instructor | Trazado en el SRS. |
| RF-SAB-032 | Notificar Admin | CU-09 · Escalar incidencia | Sistema, Instructor | Trazado en el SRS. |
| RF-SAB-033 | Resolver incidencia | CU-09 · Escalar incidencia | Sistema, Instructor | Trazado en el SRS. |
| RF-SAB-034 | Novedad operativa | CU-09 · Escalar incidencia<br>CU-20 · Contingencia de servicio | Sistema, Instructor | Trazado en el SRS. |
| RF-SAB-035 | Rechazo incidencia | CU-09 · Escalar incidencia | Sistema, Instructor | Trazado en el SRS. |
| RF-SAB-036 | Contingencia manual | CU-11 · Registrar asistencia manual<br>CU-20 · Contingencia de servicio | Instructor | Trazado en el SRS. |
| RF-SAB-037 | Origen de registro | CU-11 · Registrar asistencia manual | Instructor | Trazado en el SRS. |
| RF-SAB-038 | Cancelar clase | CU-12 · Cancelar clase | Instructor | Trazado en el SRS. |
| RF-SAB-039 | Corrección | CU-11 · Registrar asistencia manual | Instructor | Trazado en el SRS. |
| RF-SAB-040 | Enviar excusa | CU-13 · Enviar excusa | Aprendiz | Trazado en el SRS. |
| RF-SAB-041 | Validar adjunto | CU-13 · Enviar excusa | Aprendiz | Trazado en el SRS. |
| RF-SAB-042 | Confirmar recepción | CU-14 · Confirmar excusa | Instructor | Trazado en el SRS. |
| RF-SAB-043 | Historial excusas | CU-14 · Confirmar excusa<br>CU-19 · Consultar historial | Instructor, Aprendiz | Trazado en el SRS. |
| RF-SAB-044 | Reporte sesión | CU-10 · Cerrar sesión y exportar | Instructor | Trazado en el SRS. |
| RF-SAB-045 | Exportar PDF | CU-10 · Cerrar sesión y exportar | Instructor | Trazado en el SRS. |
| RF-SAB-046 | Exportar XLSX | CU-10 · Cerrar sesión y exportar | Instructor | Trazado en el SRS. |
| RF-SAB-047 | Estadísticas | CU-15 · Consultar reportes | Superadmin, Instructor autorizado | Trazado en el SRS. |
| RF-SAB-048 | Supervisión | CU-15 · Consultar reportes<br>CU-29 · Consultar panel administrativo | Superadmin, Instructor autorizado | Trazado en el SRS. |
| RF-SAB-049 | Historial Admin | CU-15 · Consultar reportes | Superadmin, Instructor autorizado | Trazado en el SRS. |
| RF-SAB-050 | Bitácora | CU-18 · Consultar auditoría | Superadmin | Trazado en el SRS. |
| RF-SAB-051 | Autorización | CU-04 · Enrolar identidad | Aprendiz, responsable autorizado | Trazado en el SRS. |
| RF-SAB-052 | Supresión | CU-17 · Suprimir datos | Superadmin autorizado | Trazado en el SRS. |
| RF-SAB-053 | Protección de exportación | CU-17 · Suprimir datos | Superadmin autorizado | Trazado en el SRS. |
| RF-SAB-054 | Consulta auditoría | CU-18 · Consultar auditoría | Superadmin | Trazado en el SRS. |
| RF-SAB-055 | Código manual | CU-05 · Abrir sesión | Instructor | Trazado en el SRS. |
| RF-SAB-056 | Validar código manual | CU-07 · Validar QR o código | Aprendiz | Trazado en el SRS. |
| RF-SAB-057 | Verificación facial | CU-06 · Verificar identidad | Aprendiz | Trazado en el SRS. |
| RF-SAB-058 | Selección modalidad | CU-06 · Verificar identidad | Aprendiz | Trazado en el SRS. |
| RF-SAB-059 | Puntualidad | CU-08 · Registrar asistencia | Aprendiz, sistema | Trazado en el SRS. |
| RF-SAB-060 | Historial propio | CU-08 · Registrar asistencia<br>CU-19 · Consultar historial<br>CU-21 · Consultar panel e indicadores propios | Aprendiz, sistema | Trazado en el SRS. |
| RF-SAB-061 | Revocar credencial | CU-04 · Enrolar identidad | Aprendiz, responsable autorizado | Trazado en el SRS. |
| RF-SAB-062 | Reintento técnico | CU-06 · Verificar identidad | Aprendiz | Trazado en el SRS. |
| RF-SAB-063 | Ausencia | CU-10 · Cerrar sesión y exportar | Instructor | Trazado en el SRS. |
| RF-SAB-064 | Acceso cámara | CU-06 · Verificar identidad | Aprendiz | Trazado en el SRS. |
| RF-SAB-065 | Programas | CU-02 · Administrar ficha y liderazgo | Superadmin | Trazado en el SRS. |
| RF-SAB-066 | Ambientes | CU-02 · Administrar ficha y liderazgo<br>CU-24 · Gestionar instructores y ambientes | Superadmin | Trazado en el SRS. |
| RF-SAB-067 | Jornadas | CU-02 · Administrar ficha y liderazgo<br>CU-25 · Asignar y consultar horarios | Superadmin | Trazado en el SRS. |
| RF-SAB-068 | Asignación académica | CU-02 · Administrar ficha y liderazgo | Superadmin | Trazado en el SRS. |
| RF-SAB-069 | Cambio contraseña | CU-01 · Iniciar sesión | Todos | Trazado en el SRS. |
| RF-SAB-070 | Desactivar modalidad | CU-06 · Verificar identidad | Aprendiz | Trazado en el SRS. |
| RF-SAB-071 | Estado sesión | CU-05 · Abrir sesión | Instructor | Trazado en el SRS. |
| RF-SAB-072 | Estado identidad | CU-27 · Consultar estados de validación | Instructor | Trazado en el SRS. |
| RF-SAB-073 | Resolución excusa | CU-28 · Resolver excusa | Admin autorizado | Trazado en el SRS. |
| RF-SAB-074 | Notificación excusa | CU-14 · Confirmar excusa<br>CU-28 · Resolver excusa | Instructor, Admin autorizado | Trazado en el SRS. |
| RF-SAB-075 | Exportación consolidada | CU-14 · Confirmar excusa<br>CU-15 · Consultar reportes | Instructor, Superadmin, Instructor autorizado | Trazado en el SRS. |
| RF-SAB-076 | Consulta novedades | CU-09 · Escalar incidencia | Sistema, Instructor | Trazado en el SRS. |
| RF-SAB-077 | Retiro autorización | CU-04 · Enrolar identidad | Aprendiz, responsable autorizado | Trazado en el SRS. |
| RF-SAB-078 | Estado servicio | CU-20 · Contingencia de servicio | Instructor | Trazado en el SRS. |
| RF-SAB-079 | Idempotencia | CU-08 · Registrar asistencia | Aprendiz, sistema | Trazado en el SRS. |
| RF-SAB-080 | Cierre de transacción | CU-08 · Registrar asistencia | Aprendiz, sistema | Trazado en el SRS. |
| RF-SAB-081 | Acceso soporte | CU-13 · Enviar excusa | Aprendiz | Trazado en el SRS. |
| RF-SAB-082 | Indicadores propios | CU-21 · Consultar panel e indicadores propios | Aprendiz | Trazado en el SRS. |
| RF-SAB-083 | Competencias y resultados | CU-22 · Consultar competencias y resultados | Aprendiz, Instructor autorizado | Trazado en el SRS. |
| RF-SAB-084 | Notificaciones | CU-23 · Consultar notificaciones y novedades | Aprendiz, Instructor | Trazado en el SRS. |
| RF-SAB-085 | Gestionar instructores | CU-24 · Gestionar instructores y ambientes | Superadmin | Trazado en el SRS. |
| RF-SAB-086 | Asignar horarios | CU-25 · Asignar y consultar horarios | Superadmin | Trazado en el SRS. |
| RF-SAB-087 | Detectar cruces | CU-25 · Asignar y consultar horarios | Superadmin | Trazado en el SRS. |
| RF-SAB-088 | Consultar horarios | CU-25 · Asignar y consultar horarios | Superadmin | Trazado en el SRS. |
| RF-SAB-089 | Gestionar novedades | CU-26 · Gestionar novedades institucionales | Superadmin | Trazado en el SRS. |
| RF-SAB-090 | Publicar novedades | CU-26 · Gestionar novedades institucionales | Superadmin | Trazado en el SRS. |
| RF-SAB-091 | Fijar novedades | CU-26 · Gestionar novedades institucionales | Superadmin | Trazado en el SRS. |
| RF-SAB-092 | Retirar novedades | CU-26 · Gestionar novedades institucionales | Superadmin | Trazado en el SRS. |
| RF-SAB-093 | Validaciones de sesión | CU-27 · Consultar estados de validación | Instructor | Trazado en el SRS. |
| RF-SAB-094 | Consultar novedades | CU-23 · Consultar notificaciones y novedades | Aprendiz, Instructor | Trazado en el SRS. |
| RF-SAB-095 | Registrar cuenta según el rol | CU-03 · Registrar aprendiz<br>CU-30 · Crear cuenta por rol | Aprendiz, Instructor, Superadmin | Trazado; revisar criterio de aceptación. |
| RF-SAB-096 | Validar ficha del aprendiz | CU-03 · Registrar aprendiz<br>CU-30 · Crear cuenta por rol | Aprendiz, Instructor, Superadmin | Trazado; revisar criterio de aceptación. |
| RF-SAB-097 | Validar unicidad de cuenta | CU-03 · Registrar aprendiz<br>CU-30 · Crear cuenta por rol | Aprendiz, Instructor, Superadmin | Trazado; revisar criterio de aceptación. |
| RF-SAB-098 | Guiar captura facial | CU-06 · Verificar identidad | Aprendiz | Trazado; revisar criterio de aceptación. |
| RF-SAB-099 | Adaptar vista de cámara | CU-06 · Verificar identidad | Aprendiz | Trazado; revisar criterio de aceptación. |
| RF-SAB-100 | Informar método de autenticación | CU-06 · Verificar identidad | Aprendiz | Trazado; revisar criterio de aceptación. |

### Requisitos no funcionales

Los 40 RNF-SAB-001 a RNF-SAB-040 se tratan como restricciones/calidades (seguridad, privacidad, rendimiento, disponibilidad, accesibilidad, portabilidad, etc.). No se cuentan en el porcentaje de cobertura de casos de uso porque describen condiciones de calidad y no objetivos funcionales independientes. Se asocian transversalmente a los casos pertinentes y deberán detallarse en el análisis del Producto 2.

## E. Diagrama de casos de uso UML

Fuente editable: [`04_diagrama_casos_uso.dot`](https://github.com/CARDOZO869/ADSO-3413974/blob/main/02-training-project/01-phase/01-analysis/03-conceptual-model/04-evidence-learning/G1-P1-SAB/04_diagrama_casos_uso.dot). Imagen: [`04_diagrama_casos_uso.svg`](https://github.com/CARDOZO869/ADSO-3413974/blob/main/02-training-project/01-phase/01-analysis/03-conceptual-model/04-evidence-learning/G1-P1-SAB/04_diagrama_casos_uso.svg). El diagrama cubre los 30 casos de uso de la sección 5.1, presenta actores fuera de la frontera, nombres con verbo y objeto, y relaciones justificadas a continuación.

| **Relación**                                                                | **Justificación**                                                                                                                                     |
| --------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------- |
| CU-08 «Registrar asistencia» incluye CU-07 «Validar QR o código»            | La validación del medio temporal es un paso obligatorio del flujo ordinario definido para registrar asistencia.                                       |
| CU-08 «Registrar asistencia» incluye CU-06 «Verificar identidad»            | El registro ordinario exige verificar identidad antes de confirmar la marca; la modalidad concreta se selecciona según autorización y disponibilidad. |
| CU-09 «Escalar incidencia» extiende CU-06 «Verificar identidad»             | Solo ocurre de forma condicional cuando se alcanza el límite de intentos fallidos; la flecha sale del caso que extiende hacia el caso base.           |
| CU-11 «Registrar asistencia manual» generaliza CU-08 «Registrar asistencia» | La asistencia manual es una modalidad especializada y supervisada de registro, con datos adicionales de causa y responsable.                          |
| CU-30 «Crear cuenta por rol» extiende CU-01 «Iniciar sesión»                | El registro aparece como flujo opcional iniciado desde la pantalla de acceso, solo cuando el usuario solicita crear una cuenta.                       |

### Decisiones pendientes de validar

- El SRS versión 2.3 define Aprendiz, Instructor y Superadmin como roles de la interfaz. Las cuentas de Instructor y Superadmin requieren autorización de servidor; no se asignan privilegios solo por selección en el formulario.
- La renovación QR, la ventana de identidad, el límite de intentos, el proveedor facial y la política de retención requieren aprobación antes de producción, según el SRS.
- Las asignaciones de la matriz se basan en la sección 5.1 del SRS v2.3 y deben revisarse junto con el equipo antes de cerrar el borrador. El SRS v2.3 incluye criterios de aceptación incompletos para RF-SAB-095 y RF-SAB-098 a RF-SAB-100; las relaciones se basan en los flujos de CU-30 y CU-06, pendientes de validación del equipo.
