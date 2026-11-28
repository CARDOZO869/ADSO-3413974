# A1 · Ficha de interpretación — SAB

**Caso:** Sistema de Asistencia Biométrica (SAB). **Fuente:** SRS-SAB-001 v2.3. Los valores pendientes del SRS son propuestas, no acuerdos institucionales.

## Requisitos seleccionados

| ID | Resumen | Clase/componente relacionado |
|---|---|---|
| RF-SAB-018 | Instructor abre sesión | Sesion / Servicio de sesiones |
| RF-SAB-020 | Generar QR temporal | Sesion / Servicio de sesiones |
| RF-SAB-026 | Validar QR | Sesion / Servicio de asistencia |
| RF-SAB-029 | Evitar asistencia duplicada | Asistencia / Servicio de asistencia |
| RF-SAB-036 | Permitir contingencia manual supervisada | Asistencia / Servicio de asistencia |
| RF-SAB-040 | Aprendiz envía excusa | Excusa / Servicio de novedades |
| RF-SAB-045 | Exportar informe de sesión | Asistencia / Servicio de reportes |
| RF-SAB-086 | Asignar horario | Horario / Servicio académico |
| RNF-SAB-001 | Validar rol y alcance en servidor | Seguridad / API |
| RNF-SAB-002 | Proteger comunicaciones con TLS | Cliente-API |
| RNF-SAB-007 | API p95 ≤3 s sin proveedor externo | API / persistencia |
| RNF-SAB-012 | Interfaz adaptable a 320 px | Cliente web |

## Plataforma propuesta

- **Lenguaje OO:** TypeScript. El equipo ya trabaja con interfaces web; sus tipos ayudan a modelar roles, sesiones y estados; puede ejecutarse en el entorno Node usado en prototipos anteriores.
- **Base de datos:** relacional. Asistencia, sesión, usuario y ficha tienen relaciones estables; se requieren FK y transacciones para impedir duplicados; reportes necesitan consultas y filtros consistentes. SQLite sirve para validar localmente; motor productivo queda por decidir.
- **Restricciones:** navegador con HTTPS para cámara/WebAuthn; autorización institucional y políticas de conservación pendientes; no se guardan huellas crudas. Tamaño académico pequeño, tres roles base y requisitos extensos con decisiones biométricas pendientes.
