# Producto 1 · Plan de Análisis y Casos de Uso — SAB (Sistema de Asistencia Biométrica)

## 1. Caracterización de la solución
- **Nombre del proyecto:** SAB — Sistema de Asistencia Biométrica para Aprendices SENA.
- **Tipo de proyecto:** Sistema de información web con integración de dispositivo/lector biométrico para control de asistencia académica.
- **Tamaño del equipo:** Equipo pequeño (1–3 desarrolladores en formación; entrega de análisis individual).
- **Estabilidad de requisitos:** Media (el proceso normativo de asistencia SENA es estable, pero las reglas de validación biométrica, excusas y reportes pueden ajustarse tras pruebas piloto).
- **Disponibilidad del cliente:** Alta / periódica (instructores y coordinación académica disponibles para revisiones semanales).

## 2. Comparación y selección de metodología

| Criterio (desde caracterización) | RUP | Scrum | XP | RAD |
|---|---|---|---|---|
| **Equipo pequeño (1–3 personas)** | Pesado en roles y documentación formal | Ideal: roles ligeros (PO, SM, Dev) | Muy bueno en equipo pequeño | Bueno para prototipos rápidos |
| **Estabilidad media de requisitos** | Maneja cambios por fases, pero más lento | Excelente: iteraciones cortas (Sprints) permiten ajustar | Excelente: ciclos muy cortos | Bueno, pero sacrifica rigor si cambia mucho |
| **Disponibilidad periódica del cliente** | Revisiones por hito de fase | Revisiones al final de cada Sprint (Sprint Review) | Requiere cliente casi tiempo completo | Requiere usuario muy disponible |

- **Metodología seleccionada:** **Scrum**.
- **Justificación:** Se adapta mejor a un equipo pequeño con disponibilidad periódica del cliente (instructores/coordinación) y estabilidad media de requisitos, permitiendo validar incrementos funcionales (registro biométrico, consulta de asistencia, excusas y reportes) en cada Sprint.

## 3. Plan de actividades de análisis

| # | Actividad | Responsable | Fecha | Entregable |
|---|---|---|---|---|
| 1 | Levantamiento y consolidación de requisitos (SRS) | Analista (Cardozo) | 2026-11-21 | Documento SRS base (`03-execute/14-week` a `17-week`) |
| 2 | Caracterización y selección de metodología | Analista (Cardozo) | 2026-11-22 | Ficha de caracterización y matriz comparativa |
| 3 | Identificación de actores y casos de uso | Analista (Cardozo) | 2026-11-23 | Lista de actores y 10 casos de uso |
| 4 | Elaboración del diagrama de casos de uso UML | Analista (Cardozo) | 2026-11-24 | `diagrama-casos-de-uso.mmd` + imagen |
| 5 | Elaboración de matriz de trazabilidad RF → CU | Analista (Cardozo) | 2026-11-25 | Matriz requisito → caso de uso (100 % RF) |
| 6 | Revisión de coherencia y verificación de entregables | Analista (Cardozo) | 2026-11-26 | `README.md` y paquete `G1-P1-SAB` listo |

## 4. Requisitos (Funcionales vs No Funcionales) y Matriz Requisito → Caso de Uso

### Requisitos No Funcionales (RNF)
- **RNF-01 (Seguridad):** Autenticación mediante credenciales y control de acceso por rol (Aprendiz, Instructor, Administrador).
- **RNF-02 (Rendimiento):** El registro de asistencia biométrica debe responder en menos de 2 segundos.
- **RNF-03 (Disponibilidad / Usabilidad):** Interfaz web responsiva y disponible durante la jornada académica (6:00 a. m. – 10:00 p. m.).

### Matriz Requisito Funcional → Caso de Uso (100 % cobertura)

| ID RF | Requisito Funcional | Caso(s) de Uso |
|---|---|---|
| **RF-01** | Iniciar sesión en el sistema según rol | `CU-01: Autenticar usuario` |
| **RF-02** | Registrar huella/biometría del aprendiz | `CU-02: Registrar biometría de aprendiz` |
| **RF-03** | Registrar asistencia diaria mediante lector biométrico | `CU-03: Registrar asistencia biométrica` |
| **RF-04** | Validar horario y ficha activa al registrar asistencia | `CU-04: Validar horario de ficha` (incluido en `CU-03`) |
| **RF-05** | Registrar asistencia manual por contingencia | `CU-05: Registrar asistencia manual` (extiende a `CU-03`) |
| **RF-06** | Consultar historial de asistencia por aprendiz o ficha | `CU-06: Consultar historial de asistencia` |
| **RF-07** | Registrar excusa o novedad de inasistencia | `CU-07: Gestionar excusas y novedades` |
| **RF-08** | Aprobar o rechazar excusas de aprendices | `CU-07: Gestionar excusas y novedades` |
| **RF-09** | Gestionar aprendices, instructores y fichas | `CU-08: Gestionar usuarios y fichas` |
| **RF-10** | Generar reportes de asistencia por ficha y rango de fechas | `CU-09: Generar reporte de asistencia` |

## 5. Justificación de relaciones UML (`«include»` y `«extend»`)
- **`CU-03: Registrar asistencia biométrica` `«include»` `CU-04: Validar horario de ficha`:** Siempre que se registra una asistencia biométrica es obligatorio validar que la ficha tenga sesión activa en ese horario.
- **`CU-05: Registrar asistencia manual` `«extend»` `CU-03: Registrar asistencia biométrica`:** Solo ocurre de forma opcional/excepcional cuando el lector biométrico falla o el aprendiz no puede usar biometría.
- **`CU-09: Generar reporte de asistencia` `«include»` `CU-01: Autenticar usuario`:** Para generar reportes académicos el usuario debe estar autenticado y autorizado previamente.
