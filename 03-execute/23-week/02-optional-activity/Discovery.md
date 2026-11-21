# Discovery — Asistencia SENA (MVP)

Fecha: 2026-08-22
Método: reconstrucción retrospectiva por ingeniería inversa, a partir de Fase 1 (inventario) y Fase 2 (ingeniería inversa funcional)

## 3.1 ¿Dónde comenzó el Discovery de este proyecto?

**Problema original reconstruido desde el comportamiento del código** (no desde lo que la documentación del proyecto declara de sí misma):

El peso de la lógica no trivial del sistema se concentra en un solo problema: impedir que se inserte una fila en `asistencias` sin que se haya tecleado un código correcto dentro de una ventana de tiempo corta. Evidencia de esa concentración: `formacionState.js` completo (rotación de código cada 15000ms, ventana de tolerancia al código anterior, comparación case-insensitive — `formacionState.js:3,18-22,63-70`), y el 60% del flujo de `MarcarAsistencia.jsx` (líneas 84-163). Todo lo demás del sistema (login, CRUD de excusas, export a Excel) es CRUD estándar sin reglas de dominio comparables en complejidad. Por dónde el código invierte su esfuerzo, el problema real no era "digitalizar la asistencia" en general (eso no requeriría cámara ni rotación de código), sino **controlar el fraude en el registro de asistencia**.

**Primera decisión estructural detectada:** diseñar directamente un mecanismo de verificación de tres capas — QR rotativo, cámara frontal, código manual — documentado en `Docs/ADR/ADR-0005-control-anti-suplantacion-de-tres-capas.md`, en lugar de partir con un registro simple de asistencia y medir primero la magnitud real del fraude.

**Clasificación: decisión de solución.** No hay en el repositorio (código, comentarios, ADR) evidencia de una fase previa de exploración del problema: cuántos casos de suplantación había con la lista manual, si el instructor ya los detectaba a simple vista, o si un control más simple habría bastado. El ADR-0005 pasa directo de "no hay presupuesto para biometría real" a especificar un mecanismo de tres pasos concreto. El Discovery, en el sentido de explorar antes de comprometerse, fue omitido.

Esta clasificación se refuerza con un hallazgo de comportamiento (Fase 2): el paso 1 del mecanismo (escaneo de QR) **no valida el contenido decodificado** — el callback de éxito de `Html5Qrcode.start()` se declara sin capturar el texto leído (`Frontend/src/pages/MarcarAsistencia.jsx:91-94`). De los tres controles diseñados, solo uno (el código manual, verificado en `Backend/src/routes/asistencia.js:16`) comprueba algo realmente contra el servidor. Esto es consistente con una solución diseñada e implementada rápido, sin un ciclo posterior que corrigiera la brecha entre el diseño (3 controles) y el comportamiento real (1 control + 2 pasos de percepción/fricción).

## 3.2 ¿Por qué se delimita y dónde está el límite aquí?

**Borde del sistema:**

| | Contenido |
|---|---|
| **Entra** | Una ficha (`3413974`), sus aprendices, sus sesiones de clase, su asistencia, sus excusas; un instructor único; operación dentro de una LAN |
| **Queda fuera** | Multi-ficha, multi-instructor, biometría real, notificaciones/correo, recuperación de contraseña, acceso fuera de la LAN |
| **Integración externa** | Ninguna. No se detectó ningún cliente HTTP saliente ni SDK de terceros en `Backend/src/**`; todas las dependencias son librerías locales de `npm` sin llamadas de red externas |

**Problemas adyacentes que el código insinúa pero no resuelve** (esto es Discovery futuro, no alcance actual):

- La tabla `fichas` admite múltiples filas (`numero UNIQUE`, `Backend/src/db.js`) pero la constante `FICHA_NUMERO = '3413974'` está repetida de forma idéntica en 4 archivos (`routes/auth.js:6`, `routes/ficha.js:6`, `routes/formacion.js:8`, `routes/asistencia.js:7`) en vez de leerse de una configuración o de la sesión. El modelo de datos ya contempla multi-ficha; la capa de rutas no.
- La tabla `instructores` admite múltiples filas (`usuario UNIQUE`) pero no existe ningún endpoint de gestión (crear/listar/eliminar instructor) — mismo patrón que `fichas`.
- La columna `excusas.estado` es `TEXT` libre, sin `CHECK` en el esquema; el código solo escribe 3 valores (`pendiente`, `aprobada`, `devuelta`) por convención en las rutas, no por restricción de base de datos.
- Endpoint huérfano `GET /api/ficha/aprendices` (sin pantalla que lo consuma, Fase 1) sugiere una vista de aprendices independiente que no llegó a construirse o fue reemplazada por el `GET /ficha` combinado.
- Endpoint huérfano `GET /api/asistencia/mias` (sin pantalla que lo consuma, Fase 1) sugiere un historial detallado de asistencia por fecha para el aprendiz, más allá del resumen agregado que sí existe hoy.

**Justificación del recorte (costo de cambio vs. riesgo que queda abierto):**

Extender a multi-ficha/multi-instructor tiene costo bajo en el modelo de datos (ya soporta múltiples filas) pero costo medio en la capa de rutas (eliminar 4 constantes hardcodeadas, incorporar selección de ficha en la sesión, agregar gestión de instructores). Ese costo no estaba justificado mientras solo operó una ficha y un instructor reales — de ahí el recorte. El riesgo que queda abierto por dejarlo así: si alguien inserta una segunda fila en `fichas` directamente en la base de datos, el sistema seguirá sirviendo únicamente `3413974` en las 4 rutas con la constante hardcodeada, produciendo una inconsistencia entre el dato (la ficha existe) y la funcionalidad (no es alcanzable).

## 3.3 ¿Dónde culmina la participación del Discovery?

**Criterios de salida** (verificados contra código y datos reales de `BD/asistencia.db`, no contra documentación previa del proyecto):

| Criterio | Estado | Evidencia |
|---|---|---|
| El instructor puede iniciar/detener una formación con código+QR rotativo | Cumplido | `routes/formacion.js:10-27`, `formacionState.js` |
| El aprendiz pasa por un flujo de 3 pantallas antes de marcar asistencia | Cumplido | `MarcarAsistencia.jsx` |
| Los 3 pasos son 3 controles de verificación independientes | **No cumplido** | El paso 1 (QR) no valida el contenido decodificado (`MarcarAsistencia.jsx:91-94`); solo el paso 3 verifica algo en el servidor |
| Cada sesión finalizada es exportable a Excel | Cumplido | `routes/asistencia.js:61-125` |
| El aprendiz puede registrar una excusa con archivo adjunto y consultar su estado | Cumplido | `routes/excusas.js` |
| El sistema corre como proceso único sin Docker | Cumplido | `server.js`, `Docs/ADR/ADR-0004-proceso-node-unico-sin-docker.md` |
| Accesible por HTTPS en la LAN | Cumplido | `certs.js`, `server.js:49-59` |
| Validado con datos reales de uso | Cumplido, con matiz | Consulta directa a `BD/asistencia.db`: 17 aprendices, 4 sesiones (0 abiertas), 14 asistencias, 10 excusas (6 pendientes, 2 aprobadas, 2 devueltas) — de esas 10, solo 4 fueron efectivamente resueltas por un instructor |
| Existe una suite de pruebas automatizadas que respalda el sistema | **No cumplido — sin evidencia** | No se encontró ningún archivo de prueba, ninguna dependencia de framework de test (`jest`/`mocha`/`vitest`/`supertest`) ni script `"test"` en los `package.json` de raíz, `Backend` o `Frontend`. La afirmación de "34 pruebas automatizadas" que figuraba en documentación previa del proyecto no tiene respaldo verificable en el repositorio actual |

**Actividad continua durante la construcción** (no termina con este Discovery):

| Qué se sigue investigando | Cadencia |
|---|---|
| Si el paso 1 (QR) debe corregirse para validar contenido, dado que hoy no aporta la garantía que su diseño sugiere | Antes de la siguiente iteración de construcción — bloqueante, no cosmético |
| Casos reales de suplantación detectados por el instructor, para calibrar si el único control real (código manual) es suficiente | Por ficha/cohorte |
| Volumen de excusas `pendiente` sin resolver (6 de 10 hoy) | Por ficha/cohorte |
| Estabilidad del certificado autofirmado si cambia la IP del servidor | Cada vez que el equipo cambie de red |

**Recomendación: Go, condicionado.**

Fundamento: 7 de 9 criterios de salida se cumplen con evidencia directa de código y datos. Los dos que no se cumplen son puntuales y acotados (el paso 1 del flujo anti-suplantación no valida contenido; no hay suite de pruebas verificable) y no bloquean el uso actual, que ya opera con datos reales sin señales de incidente en la base de datos. Condiciones para mantener el Go:
1. Corregir o retirar el paso 1 (QR) — si no va a validar contenido, no debería presentarse como un control de verificación independiente.
2. No avanzar a la fase de pruebas (Fase 6) asumiendo cobertura existente: se construye desde cero.

## 3.4 Riesgos abiertos

| Riesgo | Tipo | Evidencia | Impacto | Cómo se cerraría |
|---|---|---|---|---|
| El paso 1 (QR) no valida el contenido escaneado | Valor | `MarcarAsistencia.jsx:91-94` | El mecanismo anti-suplantación es más débil de lo que su propio diseño (ADR-0005) declara; el único control real es el código manual | Capturar y validar el texto decodificado del QR contra el código vigente antes de avanzar de paso |
| Afirmación de "34 pruebas automatizadas" sin respaldo en el repositorio | Viabilidad técnica | Ausencia de archivos de test, de frameworks de test y de script `"test"` en los 3 `package.json` | Cualquier cambio futuro se hace sin red de seguridad real, aunque documentación previa sugiera lo contrario | Construir la suite desde cero (Fase 6) y no repetir la afirmación sin evidencia |
| Constante de ficha hardcodeada en 4 archivos distintos | Viabilidad técnica | `routes/auth.js:6`, `routes/ficha.js:6`, `routes/formacion.js:8`, `routes/asistencia.js:7` | Si se agrega una segunda ficha en la base de datos, el sistema la ignora de forma inconsistente | Centralizar la constante o parametrizarla por sesión antes de soportar una segunda ficha |
| `totalClases` del aprendiz no filtra sesiones sin `fin` | Valor | `routes/asistencia.js:46-48` vs `routes/formacion.js:40` | El indicador que ve el aprendiz puede no coincidir con el historial que ve el instructor | Unificar el filtro `fin IS NOT NULL` en ambas consultas |
| 6 de 10 excusas reales permanecen `pendiente` sin resolver | Negocio | Consulta directa a `BD/asistencia.db` | El flujo de excusas no se está cerrando en la operación real, más allá de que la funcionalidad exista | Confirmar con el instructor si es backlog operativo normal o fricción del flujo de aprobación |
| Secreto de sesión hardcodeado en el código fuente | Viabilidad técnica | `server.js:23` | Bajo mientras el sistema viva en LAN cerrada; alto si se expone a internet | Mover a variable de entorno antes de cualquier exposición fuera de la LAN |
| Estado de la formación vive solo en memoria de un proceso | Viabilidad técnica | `formacionState.js:5-12` | Un reinicio del proceso durante una clase deja una sesión con `fin` nulo para siempre, sin poder cerrarla | Persistir el estado mínimo de formación en base de datos, o aceptar el riesgo de forma explícita |
| Advertencia de certificado autofirmado en cada dispositivo nuevo | Usabilidad | `Docs/ADR/ADR-0003-https-obligatorio-con-certificado-autofirmado.md` | Fricción/desconfianza de adopción la primera vez en cada dispositivo | Certificado de una CA real si el sistema sale de la LAN |
