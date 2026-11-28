# B6 · Políticas de seguridad de los datos

| ID | Principio | Política SAB concreta | Tablas/datos afectados |
|---|---|---|---|
| PI-01 | Integridad | Cada asistencia referencia sesión y aprendiz; `UNIQUE(id_sesion,id_aprendiz)` evita marcas duplicadas. | `asistencia`, `sesion`, `usuario` |
| PI-02 | Integridad | Estados, jornada, método, rango horario y capacidad se restringen con `CHECK`; FK bloquea borrados de datos históricos. | Todas las tablas relacionadas |
| PI-03 | Integridad | Aprobación/rechazo de excusa y cambios de horario registran actor, fecha y acción en auditoría. | `excusa`, `horario`, `auditoria` |
| PC-01 | Confidencialidad | Contraseñas se almacenan con Argon2id o bcrypt y sal aleatoria por cuenta; nunca texto claro ni cifrado reversible. | `usuario.hash_contrasena`, `usuario.sal_contrasena` |
| PC-02 | Confidencialidad | Acceso por rol y pertenencia a sede/ficha se valida en servidor en cada operación; la interfaz no autoriza por sí sola. | `usuario`, `rol`, `ficha`, `inscripcion` |
| PC-03 | Confidencialidad | En producción, TLS protege tráfico; soportes de excusa y referencias biométricas usan almacenamiento privado, acceso firmado y retención autorizada. | `excusa.soporte_uri`, `credencial_identidad` |
| PC-04 | Confidencialidad | No guardar imagen de huella, plantilla facial ni secreto WebAuthn en texto de auditoría; solicitar autorización y permitir alternativa supervisada. | `credencial_identidad`, `auditoria` |
| PD-01 | Disponibilidad | Copia diaria cifrada de base y archivos asociados; custodiar copia en ubicación separada. | Base completa y soportes |
| PD-02 | Disponibilidad | Probar restauración al menos trimestralmente y registrar fecha, duración y resultado. | Base completa |
| PD-03 | Disponibilidad | Monitorear espacio, salud de BD y vencimiento de certificado; alertar a responsable técnico ante fallo. | Servicio de aplicación y BD |

## Matriz de permisos de referencia

`C` consultar, `A` alta, `M` modificar, `R` revisar/resolver, `—` sin acceso. Siempre limita filas por ficha/sede asignada; los permisos finales deben contrastarse con el SRS y el responsable institucional.

| Tabla | Aprendiz | Instructor | Superadmin |
|---|---|---|---|
| `sede`, `programa`, `ficha` | C (datos propios) | C (fichas asignadas) | C/A/M |
| `usuario`, `rol` | C/A (propia cuenta según registro permitido) | C (aprendices de ficha) | C/A/M |
| `inscripcion`, `horario`, `ambiente` | C (propios) | C (asignados) | C/A/M |
| `sesion` | C (sesiones aplicables) | C/A/M (propias) | C |
| `asistencia` | C (propia) | C/A/M supervisada (ficha asignada) | C |
| `credencial_identidad` | C/M (propia autorización/revocación) | — | C (estado mínimo; sin secretos biométricos) |
| `excusa` | C/A (propia) | C/R si está autorizado | C/R si está autorizado |
| `novedad`, `notificacion` | C (publicadas/propias) | C (aplicables) | C/A/M |
| `auditoria` | — | C (eventos propios autorizados) | C (solo consulta auditada) |

El cuadro es una propuesta de diseño, no una autorización institucional de tratamiento. Finalidad, base legal/autorización, conservación y proveedor biométrico requieren validación antes de producción.
