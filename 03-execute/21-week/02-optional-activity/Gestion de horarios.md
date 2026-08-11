# Análisis Mockup — SENA Gestión de Horarios

Sistema para centralizar la programación académica: consulta, creación, modificación y actualización de horarios. No reemplaza los sistemas del SENA, los complementa.

---

## Rol: Aprendiz

**Pantallas (4):** Mi horario, Notificaciones, Detalle de clase, Detalle de notificación.

**Flujo:**
1. Login.
2. Ve sus formaciones en el dashboard.
3. Consulta detalle de sesión: competencia, instructor, ambiente, ubicación, fecha, franja.
4. Revisa notificaciones de cambios.

**UI/UX**
- Entiende rápido: dónde ver su horario y las notificaciones.
- No queda claro: cuál es su próxima formación, ni qué notificación falta por leer.
- Sobra: nada.
- Falta: día actual, líder de ficha.
- Error probable: confundir notificación leída con no leída y perderse una cancelación o reprogramación.
- Consecuencia: pierde una formación sin saberlo.

**Vs. SIGA:** más centralizado y visual. Le falta priorizar la próxima formación y marcar estado de notificaciones.

**Mejoras:**
1. Diferenciar notificaciones leídas/no leídas (prioridad).
2. Destacar próxima formación.
3. Mostrar día y fecha actual.
4. Mostrar líder de ficha.
5. Resaltar cancelaciones/reprogramaciones.

---

## Rol: Instructor

**Pantallas (6):** Mi horario, Detalle de sesión, Mi disponibilidad, Modal crear excepción, Seguimiento de ficha, Registrar seguimiento.

**Flujo:**
1. Login.
2. Ve sus formaciones programadas.
3. Abre detalle de sesión.
4. Gestiona disponibilidad y excepciones.
5. Consulta y registra seguimiento de ficha (académico, bienestar, proyecto, etapa productiva).

**UI/UX**
- Entiende rápido: horario, detalle de sesión, disponibilidad, seguimiento.
- No queda claro: cómo se relaciona su disponibilidad con las sesiones ya programadas, ni qué pasa al crear una excepción.
- Sobra: nada.
- Falta: estado visible de sesiones, opción de anexar documento en excepciones, resumen de avance de ficha.
- Error probable: registrar mal una excepción o un seguimiento sin identificar bien la ficha/sesión.
- Consecuencia: inconsistencias en programación y seguimiento.

**Vs. SIGA:** centraliza horario, disponibilidad y seguimiento en un solo sistema. Falta conectar mejor esas tres cosas entre sí.

**Mejoras:**
1. Conectar disponibilidad con horario.
2. Mostrar excepciones directamente en Mi horario.
3. Identificar ficha/sesión claramente al registrar seguimiento.
4. Vista general de avance de ficha.
5. Permitir anexar documento en excepciones.

---

## Rol: Coordinador Académico

**Pantallas (5):** Login, Inicio, Nuevo horario, Disponibilidad, Fichas.

**Flujo:**
1. Login.
2. Ve conflictos pendientes en Inicio.
3. Crea horario: ficha, período, sesiones (día, franja, competencia, instructor, ambiente).
4. Consulta disponibilidad antes de asignar.
5. Guarda, valida y publica.
6. Consulta listado de fichas.

**UI/UX**
- Entiende rápido: conflictos pendientes al entrar, tabla de sesiones con estado (Activo/Cancelada).
- No queda claro: si el sistema valida conflictos en el momento de asignar o solo después de publicar. Tampoco si "Consultar" en Disponibilidad ya se ejecutó o son datos por defecto.
- Sobra: nada.
- Falta: quién debe resolver cada conflicto, resumen de sesiones activas/canceladas, horarios ocupados (no solo disponible/no disponible).
- Error probable: publicar con conflictos sin resolver, porque "Validar" y "Publicar" son botones separados. Asignar un ambiente "No disponible" si eso no se bloquea en el formulario.
- Consecuencia: horarios con instructores o ambientes duplicados, afectando varias fichas a la vez.

**Vs. SIGA:** su fuerte es la alerta centralizada de conflictos en Inicio. SIGA no avisa esto de forma proactiva.

**Mejoras:**
1. Validar conflictos en tiempo real al asignar (prioridad).
2. Botón directo "resolver" en cada conflicto, no solo "ver panel".
3. Mostrar bloques ocupados en Disponibilidad, no solo disponible/no disponible.
4. Marcar urgencia de cada conflicto (antigüedad o cuántas fichas afecta).
5. Aclarar si el filtro de fecha en Fichas es el día actual o un filtro manual.

---

## Conclusión

El sistema escala bien en complejidad: aprendiz consulta, instructor gestiona su proceso, coordinador administra recursos compartidos. Los tres roles comparten el mismo problema de fondo: información crítica (notificación no vista, excepción sin soporte, recurso duplicado) que no se distingue visualmente de la información normal. Resolver eso es la mejora más importante en los tres casos.
