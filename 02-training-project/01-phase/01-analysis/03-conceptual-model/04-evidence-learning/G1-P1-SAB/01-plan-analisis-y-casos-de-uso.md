# G1 · Producto 1: Plan de análisis y casos de uso — SAB

**Aprendiz:** Juan Sebastián Medina Cardozo  
**Programa:** ADSO · Ficha 3413974  
**Insumo principal:** `SRS_SAB.docx` (versión 25 de noviembre de 2026)  
**Caso:** Sistema de Asistencia Biométrica (SAB)  

> Documento de trabajo individual preparado a partir del SRS indicado. La selección metodológica y el plan son propuestas académicas; los valores que el SRS deja pendientes de aprobación no se presentan como decisiones institucionales definitivas.

## A. Caracterización de la solución

| Aspecto | Caracterización SAB | Implicación para el análisis |
|---|---|---|
| Tipo de proyecto | Aplicación web para registrar asistencia, administrar sesiones, consultar novedades y generar reportes. Alcance inicial: sedes Comercio e Industria de Neiva. | Modelar procesos de tres roles (Superadmin, Instructor/Admin y Aprendiz) y sus permisos. |
| Tamaño del equipo | Proyecto académico pequeño, con tres integrantes nombrados en el SRS. Esta entrega y sus ajustes son individuales. | Conviene coordinar requisitos mediante un backlog común y dejar decisiones verificables. |
| Estabilidad de requisitos | Media: el SRS contiene 94 RF y 40 RNF; algunos parámetros, proveedor facial, retención y reglas institucionales siguen pendientes de aprobación. | Mantener trazabilidad y revisar requisitos cuando se resuelvan las decisiones abiertas. |
| Disponibilidad del cliente | No se documenta disponibilidad continua de usuarios institucionales; validar reglas con instructor y representantes de sede antes de producción. | Planificar validaciones cortas y registrar supuestos, preguntas y acuerdos. |

### Alcance y restricciones que afectan el análisis

- Acceso mediante navegador y conexión HTTPS; resolución adaptable desde 320 px.
- Flujo de asistencia contempla QR o código temporal, verificación de identidad por WebAuthn o cotejo facial aprobado y contingencia supervisada.
- No incluye GPS, vigilancia facial continua, aplicación nativa ni integración oficial con SOFIA Plus.
- No se almacenan huellas crudas; la captura biométrica requiere autorización y alternativa supervisada.
- El mockup es una referencia de interfaz, no evidencia de implementación funcional.

## B. Comparación de metodologías

| Criterio basado en SAB | Scrum | RUP | XP |
|---|---|---|---|
| Cambios en requisitos | Sprints y revisión frecuente permiten incorporar decisiones pendientes (p. ej., proveedor facial y retención). | Gestiona cambios, pero su ciclo formal puede resultar pesado para el tiempo académico. | Acepta cambios frecuentes con ciclos cortos. |
| Equipo y coordinación | Roles, backlog y revisión ayudan a coordinar un equipo pequeño y un trabajo individual trazable. | Define roles y artefactos amplios, más adecuados a equipos/proyectos con mayor estructura. | Favorece equipo pequeño, comunicación continua y participación cercana del cliente. |
| Validación de seguridad y privacidad | Cada incremento puede revisar permisos, consentimiento y trazabilidad con criterios de aceptación. | Tiene fases y artefactos para análisis de riesgos y documentación. | Prácticas de pruebas frecuentes ayudan, aunque no sustituyen la documentación exigida. |
| Encaje con entrega académica | Alto: permite entregas incrementales, tablero ya disponible y revisión del SRS. | Medio: útil como referencia documental, pero sobredimensionado para una semana. | Medio-alto: buenas prácticas para diseño/código, requiere acceso frecuente a usuarios y disciplina de pruebas. |

### Selección

**Se selecciona Scrum para organizar el análisis**, por el tamaño pequeño del equipo, la incertidumbre en algunos requisitos y el tablero de Trello ya usado para priorizar tareas. Se trabajará con un backlog priorizado, una meta corta de análisis, revisión diaria breve y una revisión de artefactos antes de cerrar. Las prácticas XP de pruebas y revisión por pares pueden adoptarse como apoyo, pero no se declara un híbrido metodológico para esta entrega.

## C. Plan de actividades de análisis

| # | Actividad priorizada | Responsable | Fecha objetivo | Entregable / evidencia |
|---:|---|---|---|---|
| 1 | Confirmar alcance, actores, restricciones y versión base del SRS | Juan Sebastián Medina Cardozo | 26/11/2026 | Ficha de caracterización y registro de supuestos |
| 2 | Revisar y priorizar RF/RNF; identificar decisiones abiertas y dependencias | Juan Sebastián Medina Cardozo | 26/11/2026 | Backlog de análisis priorizado y lista de preguntas |
| 3 | Comparar metodologías y acordar la forma de trabajo para el análisis | Juan Sebastián Medina Cardozo | 26/11/2026 | Comparación y justificación documentadas |
| 4 | Construir matriz de trazabilidad requisito funcional → caso de uso | Juan Sebastián Medina Cardozo | 27/11/2026 | Matriz de 94 requisitos funcionales vinculados |
| 5 | Ajustar diagrama UML de casos de uso por rol y revisar relaciones | Juan Sebastián Medina Cardozo | 27/11/2026 | Fuente DOT editable y SVG exportado |
| 6 | Revisar cobertura, nombres, actores, frontera y relaciones UML con rúbrica | Juan Sebastián Medina Cardozo | 27/11/2026 | Lista de revisión del Producto 1 y registro de correcciones |
| 7 | Actualizar README con reutilización, cambios, IA y autoría | Juan Sebastián Medina Cardozo | 27/11/2026 | README de entrega diligenciado |
| 8 | Publicar los archivos en el fork y comprobar la carpeta antes del cierre | Juan Sebastián Medina Cardozo | 28/11/2026 antes de 6:00 a. m. | Enlace al commit publicado y carpeta visible |

## D. Matriz requisito funcional → caso de uso

El SRS aporta **94 RF**. Se vincularon todos a los 29 casos de uso nombrados en la sección 5.1; cobertura: **100 % (94/94)**. Los RNF no se incorporan como casos de uso: se verifican como restricciones y atributos de calidad. Revisar el mapa frente al diagrama vigente del SRS antes de publicar, especialmente los RF añadidos en la versión más reciente.

| ID SRS | Requisito | Caso de uso relacionado |
|---|---|---|
| RF-SAB-001 | Inicio de sesión | CU-01 · Iniciar sesión |
| RF-SAB-002 | Cerrar sesión | CU-01 · Iniciar sesión |
| RF-SAB-003 | Permisos | CU-01 · Iniciar sesión |
| RF-SAB-004 | Recuperación | CU-01 · Iniciar sesión |
| RF-SAB-005 | Límite de acceso | CU-01 · Iniciar sesión |
| RF-SAB-006 | Sedes | CU-02 · Administrar ficha y liderazgo |
| RF-SAB-007 | Fichas | CU-02 · Administrar ficha y liderazgo |
| RF-SAB-008 | Cuentas de personal | CU-24 · Gestionar instructores y ambientes |
| RF-SAB-009 | Asignar líder | CU-02 · Administrar ficha y liderazgo |
| RF-SAB-010 | Parámetros | CU-02 · Administrar ficha y liderazgo |
| RF-SAB-011 | Tablero general | CU-29 · Consultar panel administrativo |
| RF-SAB-012 | Alta aprendiz | CU-03 · Registrar aprendiz |
| RF-SAB-013 | Unicidad | CU-03 · Registrar aprendiz |
| RF-SAB-014 | Editar aprendiz | CU-03 · Registrar aprendiz |
| RF-SAB-015 | Listado aprendiz | CU-19 · Consultar historial |
| RF-SAB-016 | Desvinculación | CU-03 · Registrar aprendiz |
| RF-SAB-017 | Enrolamiento | CU-04 · Enrolar identidad |
| RF-SAB-018 | Abrir sesión | CU-05 · Abrir sesión |
| RF-SAB-019 | Solapamiento | CU-05 · Abrir sesión |
| RF-SAB-020 | Generar QR | CU-07 · Validar QR o código |
| RF-SAB-021 | Rotación QR | CU-07 · Validar QR o código |
| RF-SAB-022 | Cerrar sesión | CU-05 · Abrir sesión |
| RF-SAB-023 | Consultar sesiones | CU-05 · Abrir sesión |
| RF-SAB-024 | Verificar autenticador | CU-06 · Verificar identidad |
| RF-SAB-025 | Orden de validación | CU-07 · Validar QR o código |
| RF-SAB-026 | Validar QR | CU-07 · Validar QR o código |
| RF-SAB-027 | Ventana de identidad | CU-06 · Verificar identidad |
| RF-SAB-028 | Intentos | CU-06 · Verificar identidad |
| RF-SAB-029 | Asistencia única | CU-08 · Registrar asistencia |
| RF-SAB-030 | Resultado | CU-08 · Registrar asistencia |
| RF-SAB-031 | Crear incidencia | CU-09 · Escalar incidencia |
| RF-SAB-032 | Notificar Admin | CU-09 · Escalar incidencia |
| RF-SAB-033 | Resolver incidencia | CU-09 · Escalar incidencia |
| RF-SAB-034 | Novedad operativa | CU-09 · Escalar incidencia |
| RF-SAB-035 | Rechazo incidencia | CU-09 · Escalar incidencia |
| RF-SAB-036 | Contingencia manual | CU-11 · Registrar asistencia manual |
| RF-SAB-037 | Origen de registro | CU-11 · Registrar asistencia manual |
| RF-SAB-038 | Cancelar clase | CU-12 · Cancelar clase |
| RF-SAB-039 | Corrección | CU-09 · Escalar incidencia |
| RF-SAB-040 | Enviar excusa | CU-13 · Enviar excusa |
| RF-SAB-041 | Validar adjunto | CU-13 · Enviar excusa |
| RF-SAB-042 | Confirmar recepción | CU-13 · Enviar excusa |
| RF-SAB-043 | Historial excusas | CU-19 · Consultar historial |
| RF-SAB-044 | Reporte sesión | CU-10 · Cerrar sesión y exportar |
| RF-SAB-045 | Exportar PDF | CU-10 · Cerrar sesión y exportar |
| RF-SAB-046 | Exportar XLSX | CU-10 · Cerrar sesión y exportar |
| RF-SAB-047 | Estadísticas | CU-15 · Consultar reportes |
| RF-SAB-048 | Supervisión | CU-15 · Consultar reportes |
| RF-SAB-049 | Historial Admin | CU-10 · Cerrar sesión y exportar |
| RF-SAB-050 | Bitácora | CU-18 · Consultar auditoría |
| RF-SAB-051 | Autorización | CU-04 · Enrolar identidad |
| RF-SAB-052 | Supresión | CU-17 · Suprimir datos |
| RF-SAB-053 | Protección de exportación | CU-10 · Cerrar sesión y exportar |
| RF-SAB-054 | Consulta auditoría | CU-18 · Consultar auditoría |
| RF-SAB-055 | Código manual | CU-07 · Validar QR o código |
| RF-SAB-056 | Validar código manual | CU-07 · Validar QR o código |
| RF-SAB-057 | Verificación facial | CU-06 · Verificar identidad |
| RF-SAB-058 | Selección modalidad | CU-06 · Verificar identidad |
| RF-SAB-059 | Puntualidad | CU-08 · Registrar asistencia |
| RF-SAB-060 | Historial propio | CU-19 · Consultar historial |
| RF-SAB-061 | Revocar credencial | CU-06 · Verificar identidad |
| RF-SAB-062 | Reintento técnico | CU-06 · Verificar identidad |
| RF-SAB-063 | Ausencia | CU-10 · Cerrar sesión y exportar |
| RF-SAB-064 | Acceso cámara | CU-06 · Verificar identidad |
| RF-SAB-065 | Programas | CU-24 · Gestionar instructores y ambientes |
| RF-SAB-066 | Ambientes | CU-24 · Gestionar instructores y ambientes |
| RF-SAB-067 | Jornadas | CU-25 · Asignar y consultar horarios |
| RF-SAB-068 | Asignación académica | CU-25 · Asignar y consultar horarios |
| RF-SAB-069 | Cambio contraseña | CU-01 · Iniciar sesión |
| RF-SAB-070 | Desactivar modalidad | CU-06 · Verificar identidad |
| RF-SAB-071 | Estado sesión | CU-27 · Consultar estados de validación |
| RF-SAB-072 | Estado identidad | CU-27 · Consultar estados de validación |
| RF-SAB-073 | Resolución excusa | CU-28 · Resolver excusa |
| RF-SAB-074 | Notificación excusa | CU-23 · Consultar notificaciones y novedades |
| RF-SAB-075 | Exportación consolidada | CU-10 · Cerrar sesión y exportar |
| RF-SAB-076 | Consulta novedades | CU-23 · Consultar notificaciones y novedades |
| RF-SAB-077 | Retiro autorización | CU-17 · Suprimir datos |
| RF-SAB-078 | Estado servicio | CU-20 · Contingencia de servicio |
| RF-SAB-079 | Idempotencia | CU-08 · Registrar asistencia |
| RF-SAB-080 | Cierre de transacción | CU-08 · Registrar asistencia |
| RF-SAB-081 | Acceso soporte | CU-13 · Enviar excusa |
| RF-SAB-082 | Indicadores propios | CU-21 · Consultar panel e indicadores propios |
| RF-SAB-083 | Competencias y resultados | CU-22 · Consultar competencias y resultados |
| RF-SAB-084 | Notificaciones | CU-23 · Consultar notificaciones y novedades |
| RF-SAB-085 | Gestionar instructores | CU-24 · Gestionar instructores y ambientes |
| RF-SAB-086 | Asignar horarios | CU-25 · Asignar y consultar horarios |
| RF-SAB-087 | Detectar cruces | CU-25 · Asignar y consultar horarios |
| RF-SAB-088 | Consultar horarios | CU-25 · Asignar y consultar horarios |
| RF-SAB-089 | Gestionar novedades | CU-26 · Gestionar novedades institucionales |
| RF-SAB-090 | Publicar novedades | CU-26 · Gestionar novedades institucionales |
| RF-SAB-091 | Fijar novedades | CU-26 · Gestionar novedades institucionales |
| RF-SAB-092 | Retirar novedades | CU-26 · Gestionar novedades institucionales |
| RF-SAB-093 | Validaciones de sesión | CU-27 · Consultar estados de validación |
| RF-SAB-094 | Consultar novedades | CU-23 · Consultar notificaciones y novedades |

### Requisitos no funcionales

Los 40 RNF-SAB-001 a RNF-SAB-040 se tratan como restricciones/calidades (seguridad, privacidad, rendimiento, disponibilidad, accesibilidad, portabilidad, etc.). No se cuentan en el porcentaje de cobertura de casos de uso porque describen condiciones de calidad y no objetivos funcionales independientes. Se asocian transversalmente a los casos pertinentes y deberán detallarse en el análisis del Producto 2.

## E. Diagrama de casos de uso UML

Fuente editable: [`04_diagrama_casos_uso.dot`](./04_diagrama_casos_uso.dot). Imagen: [`04_diagrama_casos_uso.svg`](./04_diagrama_casos_uso.svg). El diagrama presenta actores fuera de la frontera, nombres con verbo y objeto, y relaciones justificadas a continuación.

| Relación | Justificación |
|---|---|
| CU-08 «Registrar asistencia» incluye CU-07 «Validar QR o código» | La validación del medio temporal es un paso obligatorio del flujo ordinario definido para registrar asistencia. |
| CU-08 «Registrar asistencia» incluye CU-06 «Verificar identidad» | El registro ordinario exige verificar identidad antes de confirmar la marca; la modalidad concreta se selecciona según autorización y disponibilidad. |
| CU-09 «Escalar incidencia» extiende CU-06 «Verificar identidad» | Solo ocurre de forma condicional cuando se alcanza el límite de intentos fallidos; la flecha sale del caso que extiende hacia el caso base. |
| CU-11 «Registrar asistencia manual» generaliza CU-08 «Registrar asistencia» | La asistencia manual es una modalidad especializada y supervisada de registro, con datos adicionales de causa y responsable. |

### Decisiones pendientes de validar

- El SRS denomina los roles como Superadmin, Instructor/Admin y Aprendiz; confirmar si Admin es un rol separado del Instructor en la versión acordada.
- La renovación QR cada 15 s, ventana de identidad de 60 s, límite de intentos, proveedor facial y política de retención requieren aprobación antes de producción.
- Las asignaciones de la matriz reflejan interpretación de los títulos RF y casos de uso del propio SRS; deben cotejarse con los diagramas incluidos en el documento fuente.
