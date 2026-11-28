# B4 · Matriz RF–entidades–tablas SAB

**Fuente:** SRS-SAB-001 v2.3 y matriz RF→CU existente en G1-P1. La asociación con tablas es una propuesta de diseño, no prueba de implementación. Cobertura de referencias: 100/100 RF (100% si el SRS tiene 100 RF).

| Requisito | Resumen | Caso(s) de uso | Actor(es) relacionado(s) | Tabla(s) propuesta(s) | Cobertura / observación |
|---|---|---|---|---|---|
| RF-SAB-001 | Inicio de sesión | CU-01 · Iniciar sesión | Todos | `usuario`, `rol`, `auditoria` | Trazado a entidades del modelo; requiere validación del criterio de aceptación. |
| RF-SAB-002 | Cerrar sesión | CU-01 · Iniciar sesión | Todos | `usuario`, `rol`, `auditoria` | Trazado a entidades del modelo; requiere validación del criterio de aceptación. |
| RF-SAB-003 | Permisos | CU-01 · Iniciar sesión | Todos | `usuario`, `rol`, `auditoria` | Trazado a entidades del modelo; requiere validación del criterio de aceptación. |
| RF-SAB-004 | Recuperación | CU-01 · Iniciar sesión | Todos | `usuario`, `rol`, `auditoria` | Trazado a entidades del modelo; requiere validación del criterio de aceptación. |
| RF-SAB-005 | Límite de acceso | CU-01 · Iniciar sesión | Todos | `usuario`, `rol`, `auditoria` | Trazado a entidades del modelo; requiere validación del criterio de aceptación. |
| RF-SAB-006 | Sedes | CU-02 · Administrar ficha y liderazgo | Superadmin | `sede`, `programa`, `ficha`, `ambiente`, `horario`, `usuario` | Trazado a entidades del modelo; requiere validación del criterio de aceptación. |
| RF-SAB-007 | Fichas | CU-02 · Administrar ficha y liderazgo | Superadmin | `sede`, `programa`, `ficha`, `ambiente`, `horario`, `usuario` | Trazado a entidades del modelo; requiere validación del criterio de aceptación. |
| RF-SAB-008 | Cuentas de personal | CU-02 · Administrar ficha y liderazgo; CU-24 · Gestionar instructores y ambientes | Superadmin | `sede`, `programa`, `ficha`, `ambiente`, `horario`, `usuario` | Trazado a entidades del modelo; requiere validación del criterio de aceptación. |
| RF-SAB-009 | Asignar líder | CU-02 · Administrar ficha y liderazgo; CU-16 · Reasignar líder | Superadmin | `sede`, `programa`, `ficha`, `ambiente`, `horario`, `usuario` | Trazado a entidades del modelo; requiere validación del criterio de aceptación. |
| RF-SAB-010 | Parámetros | CU-02 · Administrar ficha y liderazgo | Superadmin | `sede`, `programa`, `ficha`, `ambiente`, `horario`, `usuario` | Trazado a entidades del modelo; requiere validación del criterio de aceptación. |
| RF-SAB-011 | Tablero general | CU-02 · Administrar ficha y liderazgo; CU-29 · Consultar panel administrativo | Superadmin | `sede`, `programa`, `ficha`, `ambiente`, `horario`, `usuario`, `sesion` | Trazado a entidades del modelo; requiere validación del criterio de aceptación. |
| RF-SAB-012 | Alta aprendiz | CU-03 · Registrar aprendiz | Aprendiz | `usuario`, `inscripcion` | Trazado a entidades del modelo; requiere validación del criterio de aceptación. |
| RF-SAB-013 | Unicidad | CU-03 · Registrar aprendiz | Aprendiz | `usuario`, `inscripcion` | Trazado a entidades del modelo; requiere validación del criterio de aceptación. |
| RF-SAB-014 | Editar aprendiz | CU-03 · Registrar aprendiz | Aprendiz | `usuario`, `inscripcion` | Trazado a entidades del modelo; requiere validación del criterio de aceptación. |
| RF-SAB-015 | Listado aprendiz | CU-03 · Registrar aprendiz | Aprendiz | `usuario`, `inscripcion` | Trazado a entidades del modelo; requiere validación del criterio de aceptación. |
| RF-SAB-016 | Desvinculación | CU-03 · Registrar aprendiz | Aprendiz | `usuario`, `inscripcion` | Trazado a entidades del modelo; requiere validación del criterio de aceptación. |
| RF-SAB-017 | Enrolamiento | CU-04 · Enrolar identidad | Aprendiz, responsable autorizado | `credencial_identidad` | Trazado a entidades del modelo; requiere validación del criterio de aceptación. |
| RF-SAB-018 | Abrir sesión | CU-05 · Abrir sesión | Instructor | `horario`, `sesion` | Trazado a entidades del modelo; requiere validación del criterio de aceptación. |
| RF-SAB-019 | Solapamiento | CU-05 · Abrir sesión | Instructor | `horario`, `sesion` | Trazado a entidades del modelo; requiere validación del criterio de aceptación. |
| RF-SAB-020 | Generar QR | CU-05 · Abrir sesión | Instructor | `horario`, `sesion` | Trazado a entidades del modelo; requiere validación del criterio de aceptación. |
| RF-SAB-021 | Rotación QR | CU-05 · Abrir sesión | Instructor | `horario`, `sesion` | Trazado a entidades del modelo; requiere validación del criterio de aceptación. |
| RF-SAB-022 | Cerrar sesión | CU-05 · Abrir sesión; CU-10 · Cerrar sesión y exportar | Instructor | `horario`, `sesion`, `asistencia` | Trazado a entidades del modelo; requiere validación del criterio de aceptación. |
| RF-SAB-023 | Consultar sesiones | CU-05 · Abrir sesión; CU-10 · Cerrar sesión y exportar | Instructor | `horario`, `sesion`, `asistencia` | Trazado a entidades del modelo; requiere validación del criterio de aceptación. |
| RF-SAB-024 | Verificar autenticador | CU-06 · Verificar identidad | Aprendiz | `credencial_identidad`, `asistencia` | Trazado a entidades del modelo; requiere validación del criterio de aceptación. |
| RF-SAB-025 | Orden de validación | CU-07 · Validar QR o código | Aprendiz | `sesion`, `asistencia` | Trazado a entidades del modelo; requiere validación del criterio de aceptación. |
| RF-SAB-026 | Validar QR | CU-07 · Validar QR o código | Aprendiz | `sesion`, `asistencia` | Trazado a entidades del modelo; requiere validación del criterio de aceptación. |
| RF-SAB-027 | Ventana de identidad | CU-06 · Verificar identidad | Aprendiz | `credencial_identidad`, `asistencia` | Trazado a entidades del modelo; requiere validación del criterio de aceptación. |
| RF-SAB-028 | Intentos | CU-06 · Verificar identidad | Aprendiz | `credencial_identidad`, `asistencia` | Trazado a entidades del modelo; requiere validación del criterio de aceptación. |
| RF-SAB-029 | Asistencia única | CU-08 · Registrar asistencia | Aprendiz, sistema | `asistencia` | Trazado a entidades del modelo; requiere validación del criterio de aceptación. |
| RF-SAB-030 | Resultado | CU-08 · Registrar asistencia | Aprendiz, sistema | `asistencia` | Trazado a entidades del modelo; requiere validación del criterio de aceptación. |
| RF-SAB-031 | Crear incidencia | CU-09 · Escalar incidencia | Sistema, Instructor | `auditoria`, `notificacion` | Trazado a entidades del modelo; requiere validación del criterio de aceptación. |
| RF-SAB-032 | Notificar Admin | CU-09 · Escalar incidencia | Sistema, Instructor | `auditoria`, `notificacion` | Trazado a entidades del modelo; requiere validación del criterio de aceptación. |
| RF-SAB-033 | Resolver incidencia | CU-09 · Escalar incidencia | Sistema, Instructor | `auditoria`, `notificacion` | Trazado a entidades del modelo; requiere validación del criterio de aceptación. |
| RF-SAB-034 | Novedad operativa | CU-09 · Escalar incidencia; CU-20 · Contingencia de servicio | Sistema, Instructor | `auditoria`, `notificacion`, `sesion` | Trazado a entidades del modelo; requiere validación del criterio de aceptación. |
| RF-SAB-035 | Rechazo incidencia | CU-09 · Escalar incidencia | Sistema, Instructor | `auditoria`, `notificacion` | Trazado a entidades del modelo; requiere validación del criterio de aceptación. |
| RF-SAB-036 | Contingencia manual | CU-11 · Registrar asistencia manual; CU-20 · Contingencia de servicio | Instructor | `asistencia`, `sesion`, `auditoria` | Trazado a entidades del modelo; requiere validación del criterio de aceptación. |
| RF-SAB-037 | Origen de registro | CU-11 · Registrar asistencia manual | Instructor | `asistencia` | Trazado a entidades del modelo; requiere validación del criterio de aceptación. |
| RF-SAB-038 | Cancelar clase | CU-12 · Cancelar clase | Instructor | `sesion`, `auditoria` | Trazado a entidades del modelo; requiere validación del criterio de aceptación. |
| RF-SAB-039 | Corrección | CU-11 · Registrar asistencia manual | Instructor | `asistencia` | Trazado a entidades del modelo; requiere validación del criterio de aceptación. |
| RF-SAB-040 | Enviar excusa | CU-13 · Enviar excusa | Aprendiz | `excusa` | Trazado a entidades del modelo; requiere validación del criterio de aceptación. |
| RF-SAB-041 | Validar adjunto | CU-13 · Enviar excusa | Aprendiz | `excusa` | Trazado a entidades del modelo; requiere validación del criterio de aceptación. |
| RF-SAB-042 | Confirmar recepción | CU-14 · Confirmar excusa | Instructor | `excusa`, `notificacion` | Trazado a entidades del modelo; requiere validación del criterio de aceptación. |
| RF-SAB-043 | Historial excusas | CU-14 · Confirmar excusa; CU-19 · Consultar historial | Instructor, Aprendiz | `excusa`, `notificacion`, `asistencia` | Trazado a entidades del modelo; requiere validación del criterio de aceptación. |
| RF-SAB-044 | Reporte sesión | CU-10 · Cerrar sesión y exportar | Instructor | `sesion`, `asistencia` | Trazado a entidades del modelo; requiere validación del criterio de aceptación. |
| RF-SAB-045 | Exportar PDF | CU-10 · Cerrar sesión y exportar | Instructor | `sesion`, `asistencia` | Trazado a entidades del modelo; requiere validación del criterio de aceptación. |
| RF-SAB-046 | Exportar XLSX | CU-10 · Cerrar sesión y exportar | Instructor | `sesion`, `asistencia` | Trazado a entidades del modelo; requiere validación del criterio de aceptación. |
| RF-SAB-047 | Estadísticas | CU-15 · Consultar reportes | Superadmin, Instructor autorizado | `asistencia`, `ficha` | Trazado a entidades del modelo; requiere validación del criterio de aceptación. |
| RF-SAB-048 | Supervisión | CU-15 · Consultar reportes; CU-29 · Consultar panel administrativo | Superadmin, Instructor autorizado | `asistencia`, `ficha`, `sede`, `horario`, `sesion` | Trazado a entidades del modelo; requiere validación del criterio de aceptación. |
| RF-SAB-049 | Historial Admin | CU-15 · Consultar reportes | Superadmin, Instructor autorizado | `asistencia`, `ficha` | Trazado a entidades del modelo; requiere validación del criterio de aceptación. |
| RF-SAB-050 | Bitácora | CU-18 · Consultar auditoría | Superadmin | `auditoria` | Trazado a entidades del modelo; requiere validación del criterio de aceptación. |
| RF-SAB-051 | Autorización | CU-04 · Enrolar identidad | Aprendiz, responsable autorizado | `credencial_identidad` | Trazado a entidades del modelo; requiere validación del criterio de aceptación. |
| RF-SAB-052 | Supresión | CU-17 · Suprimir datos | Superadmin autorizado | `credencial_identidad`, `auditoria` | Trazado a entidades del modelo; requiere validación del criterio de aceptación. |
| RF-SAB-053 | Protección de exportación | CU-17 · Suprimir datos | Superadmin autorizado | `credencial_identidad`, `auditoria` | Trazado a entidades del modelo; requiere validación del criterio de aceptación. |
| RF-SAB-054 | Consulta auditoría | CU-18 · Consultar auditoría | Superadmin | `auditoria` | Trazado a entidades del modelo; requiere validación del criterio de aceptación. |
| RF-SAB-055 | Código manual | CU-05 · Abrir sesión | Instructor | `horario`, `sesion` | Trazado a entidades del modelo; requiere validación del criterio de aceptación. |
| RF-SAB-056 | Validar código manual | CU-07 · Validar QR o código | Aprendiz | `sesion`, `asistencia` | Trazado a entidades del modelo; requiere validación del criterio de aceptación. |
| RF-SAB-057 | Verificación facial | CU-06 · Verificar identidad | Aprendiz | `credencial_identidad`, `asistencia` | Trazado a entidades del modelo; requiere validación del criterio de aceptación. |
| RF-SAB-058 | Selección modalidad | CU-06 · Verificar identidad | Aprendiz | `credencial_identidad`, `asistencia` | Trazado a entidades del modelo; requiere validación del criterio de aceptación. |
| RF-SAB-059 | Puntualidad | CU-08 · Registrar asistencia | Aprendiz, sistema | `asistencia` | Trazado a entidades del modelo; requiere validación del criterio de aceptación. |
| RF-SAB-060 | Historial propio | CU-08 · Registrar asistencia; CU-19 · Consultar historial; CU-21 · Consultar panel e indicadores propios | Aprendiz, sistema | `asistencia`, `excusa` | Trazado a entidades del modelo; requiere validación del criterio de aceptación. |
| RF-SAB-061 | Revocar credencial | CU-04 · Enrolar identidad | Aprendiz, responsable autorizado | `credencial_identidad` | Trazado a entidades del modelo; requiere validación del criterio de aceptación. |
| RF-SAB-062 | Reintento técnico | CU-06 · Verificar identidad | Aprendiz | `credencial_identidad`, `asistencia` | Trazado a entidades del modelo; requiere validación del criterio de aceptación. |
| RF-SAB-063 | Ausencia | CU-10 · Cerrar sesión y exportar | Instructor | `sesion`, `asistencia` | Trazado a entidades del modelo; requiere validación del criterio de aceptación. |
| RF-SAB-064 | Acceso cámara | CU-06 · Verificar identidad | Aprendiz | `credencial_identidad`, `asistencia` | Trazado a entidades del modelo; requiere validación del criterio de aceptación. |
| RF-SAB-065 | Programas | CU-02 · Administrar ficha y liderazgo | Superadmin | `sede`, `programa`, `ficha`, `ambiente`, `horario`, `usuario` | Trazado a entidades del modelo; requiere validación del criterio de aceptación. |
| RF-SAB-066 | Ambientes | CU-02 · Administrar ficha y liderazgo; CU-24 · Gestionar instructores y ambientes | Superadmin | `sede`, `programa`, `ficha`, `ambiente`, `horario`, `usuario` | Trazado a entidades del modelo; requiere validación del criterio de aceptación. |
| RF-SAB-067 | Jornadas | CU-02 · Administrar ficha y liderazgo; CU-25 · Asignar y consultar horarios | Superadmin | `sede`, `programa`, `ficha`, `ambiente`, `horario`, `usuario` | Trazado a entidades del modelo; requiere validación del criterio de aceptación. |
| RF-SAB-068 | Asignación académica | CU-02 · Administrar ficha y liderazgo | Superadmin | `sede`, `programa`, `ficha`, `ambiente`, `horario`, `usuario` | Trazado a entidades del modelo; requiere validación del criterio de aceptación. |
| RF-SAB-069 | Cambio contraseña | CU-01 · Iniciar sesión | Todos | `usuario`, `rol`, `auditoria` | Trazado a entidades del modelo; requiere validación del criterio de aceptación. |
| RF-SAB-070 | Desactivar modalidad | CU-06 · Verificar identidad | Aprendiz | `credencial_identidad`, `asistencia` | Trazado a entidades del modelo; requiere validación del criterio de aceptación. |
| RF-SAB-071 | Estado sesión | CU-05 · Abrir sesión | Instructor | `horario`, `sesion` | Trazado a entidades del modelo; requiere validación del criterio de aceptación. |
| RF-SAB-072 | Estado identidad | CU-27 · Consultar estados de validación | Instructor | `sesion`, `asistencia` | Trazado a entidades del modelo; requiere validación del criterio de aceptación. |
| RF-SAB-073 | Resolución excusa | CU-28 · Resolver excusa | Admin autorizado | `excusa` | Trazado a entidades del modelo; requiere validación del criterio de aceptación. |
| RF-SAB-074 | Notificación excusa | CU-14 · Confirmar excusa; CU-28 · Resolver excusa | Instructor, Admin autorizado | `excusa`, `notificacion` | Trazado a entidades del modelo; requiere validación del criterio de aceptación. |
| RF-SAB-075 | Exportación consolidada | CU-14 · Confirmar excusa; CU-15 · Consultar reportes | Instructor, Superadmin, Instructor autorizado | `excusa`, `notificacion`, `asistencia`, `ficha` | Trazado a entidades del modelo; requiere validación del criterio de aceptación. |
| RF-SAB-076 | Consulta novedades | CU-09 · Escalar incidencia | Sistema, Instructor | `auditoria`, `notificacion` | Trazado a entidades del modelo; requiere validación del criterio de aceptación. |
| RF-SAB-077 | Retiro autorización | CU-04 · Enrolar identidad | Aprendiz, responsable autorizado | `credencial_identidad` | Trazado a entidades del modelo; requiere validación del criterio de aceptación. |
| RF-SAB-078 | Estado servicio | CU-20 · Contingencia de servicio | Instructor | `sesion`, `auditoria` | Trazado a entidades del modelo; requiere validación del criterio de aceptación. |
| RF-SAB-079 | Idempotencia | CU-08 · Registrar asistencia | Aprendiz, sistema | `asistencia` | Trazado a entidades del modelo; requiere validación del criterio de aceptación. |
| RF-SAB-080 | Cierre de transacción | CU-08 · Registrar asistencia | Aprendiz, sistema | `asistencia` | Trazado a entidades del modelo; requiere validación del criterio de aceptación. |
| RF-SAB-081 | Acceso soporte | CU-13 · Enviar excusa | Aprendiz | `excusa` | Trazado a entidades del modelo; requiere validación del criterio de aceptación. |
| RF-SAB-082 | Indicadores propios | CU-21 · Consultar panel e indicadores propios | Aprendiz | `asistencia` | Trazado a entidades del modelo; requiere validación del criterio de aceptación. |
| RF-SAB-083 | Competencias y resultados | CU-22 · Consultar competencias y resultados | Aprendiz, Instructor autorizado | `ficha`, `horario` | Trazado a entidades del modelo; requiere validación del criterio de aceptación. |
| RF-SAB-084 | Notificaciones | CU-23 · Consultar notificaciones y novedades | Aprendiz, Instructor | `novedad`, `notificacion` | Trazado a entidades del modelo; requiere validación del criterio de aceptación. |
| RF-SAB-085 | Gestionar instructores | CU-24 · Gestionar instructores y ambientes | Superadmin | `usuario`, `ambiente` | Trazado a entidades del modelo; requiere validación del criterio de aceptación. |
| RF-SAB-086 | Asignar horarios | CU-25 · Asignar y consultar horarios | Superadmin | `horario` | Trazado a entidades del modelo; requiere validación del criterio de aceptación. |
| RF-SAB-087 | Detectar cruces | CU-25 · Asignar y consultar horarios | Superadmin | `horario` | Trazado a entidades del modelo; requiere validación del criterio de aceptación. |
| RF-SAB-088 | Consultar horarios | CU-25 · Asignar y consultar horarios | Superadmin | `horario` | Trazado a entidades del modelo; requiere validación del criterio de aceptación. |
| RF-SAB-089 | Gestionar novedades | CU-26 · Gestionar novedades institucionales | Superadmin | `novedad` | Trazado a entidades del modelo; requiere validación del criterio de aceptación. |
| RF-SAB-090 | Publicar novedades | CU-26 · Gestionar novedades institucionales | Superadmin | `novedad` | Trazado a entidades del modelo; requiere validación del criterio de aceptación. |
| RF-SAB-091 | Fijar novedades | CU-26 · Gestionar novedades institucionales | Superadmin | `novedad` | Trazado a entidades del modelo; requiere validación del criterio de aceptación. |
| RF-SAB-092 | Retirar novedades | CU-26 · Gestionar novedades institucionales | Superadmin | `novedad` | Trazado a entidades del modelo; requiere validación del criterio de aceptación. |
| RF-SAB-093 | Validaciones de sesión | CU-27 · Consultar estados de validación | Instructor | `sesion`, `asistencia` | Trazado a entidades del modelo; requiere validación del criterio de aceptación. |
| RF-SAB-094 | Consultar novedades | CU-23 · Consultar notificaciones y novedades | Aprendiz, Instructor | `novedad`, `notificacion` | Trazado a entidades del modelo; requiere validación del criterio de aceptación. |
| RF-SAB-095 | Registrar cuenta según el rol | CU-03 · Registrar aprendiz; CU-30 · Crear cuenta por rol | Aprendiz, Instructor, Superadmin | `usuario`, `inscripcion`, `rol` | Trazado a entidades del modelo; requiere validación del criterio de aceptación. |
| RF-SAB-096 | Validar ficha del aprendiz | CU-03 · Registrar aprendiz; CU-30 · Crear cuenta por rol | Aprendiz, Instructor, Superadmin | `usuario`, `inscripcion`, `rol` | Trazado a entidades del modelo; requiere validación del criterio de aceptación. |
| RF-SAB-097 | Validar unicidad de cuenta | CU-03 · Registrar aprendiz; CU-30 · Crear cuenta por rol | Aprendiz, Instructor, Superadmin | `usuario`, `inscripcion`, `rol` | Trazado a entidades del modelo; requiere validación del criterio de aceptación. |
| RF-SAB-098 | Guiar captura facial | CU-06 · Verificar identidad | Aprendiz | `credencial_identidad`, `asistencia` | Trazado a entidades del modelo; requiere validación del criterio de aceptación. |
| RF-SAB-099 | Adaptar vista de cámara | CU-06 · Verificar identidad | Aprendiz | `credencial_identidad`, `asistencia` | Trazado a entidades del modelo; requiere validación del criterio de aceptación. |
| RF-SAB-100 | Informar método de autenticación | CU-06 · Verificar identidad | Aprendiz | `credencial_identidad`, `asistencia` | Trazado a entidades del modelo; requiere validación del criterio de aceptación. |

La cobertura se cuenta por RF con al menos una entidad/tablas candidatas asociadas; los seis requisitos RF-SAB-095 a RF-SAB-100 conservan la nota del P1 sobre criterios de aceptación incompletos. Revisar cada fila junto al SRS antes de presentar. Un vínculo documental no significa funcionalidad implementada.
