# Design Thinking — Control de mascotas y medicamentos (veterinaria)

## 1. Empatizar

**Usuario principal:** recepcionista/veterinario de la clínica (rol único del MVP).

**Situación actual:**
- Lleva el control de propietarios, mascotas, citas, consultas y medicación de forma manual o dispersa.
- No hay forma rápida de saber qué citas no terminaron en consulta (pacientes que no llegaron o no fueron atendidos).
- El historial de cada mascota es independiente y debe quedar completo: cita → consulta → diagnóstico → tratamiento → prescripción.
- El control de medicamentos y lotes es crítico porque un lote vencido no se puede recetar.

**Necesidades detectadas:**
- Registrar todo el flujo clínico sin perder trazabilidad entre etapas.
- Saber en cualquier momento qué citas quedaron sin atender.
- Evitar recetar medicamentos vencidos.
- Acceder al sistema de forma segura (login con token).

## 2. Definir

**Problema central:**
La clínica no tiene un sistema que centralice el historial médico de las mascotas ni que permita detectar fácilmente las citas que no se atendieron, lo que genera riesgo de perder seguimiento de pacientes y de recetar medicación en mal estado.

**Punto de vista (POV):**
El recepcionista/veterinario necesita una forma de registrar el ciclo completo de atención (cita, consulta, diagnóstico, tratamiento, prescripción) porque hoy no existe un control único que le permita saber qué mascotas no fueron atendidas ni garantizar que la medicación recetada esté vigente.

**Pregunta guía (HMW):**
¿Cómo podríamos diseñar un sistema que registre todo el historial clínico de una mascota y alerte sobre citas sin atender y medicación vencida, de forma simple y confiable?

## 3. Idear

**Ideas generadas:**
- Relación 1:1 opcional entre cita y consulta: si no hay consulta registrada, la cita queda marcada como "sin atender".
- Reporte específico de citas sin consulta, disponible para el usuario en cualquier momento.
- Cadena de dependencia clara: diagnóstico → tratamiento → prescripción (la prescripción es opcional, no todo tratamiento requiere medicación).
- Lote como entidad débil del medicamento (identificado por número de lote + código de medicamento), con fecha de vencimiento y cantidad disponible.
- Validación automática: no se puede generar una prescripción con un lote vencido.
- Login con token y contraseñas hasheadas para proteger la información.
- Catálogo de medicamentos reutilizable entre distintas prescripciones.

**Idea seleccionada:**
Sistema web (backend Go, frontend Angular, base de datos PostgreSQL) desplegado con Docker Compose, que registra el flujo completo cita → consulta → diagnóstico → tratamiento → prescripción, con reglas de negocio automáticas (consulta única por cita, lote no vencido) y un reporte de citas sin consulta.

## 4. Prototipar

**Alcance del prototipo (MVP):**
- Login con token.
- CRUD de propietarios y mascotas.
- Agendar citas (mascota, veterinario, motivo).
- Registrar consulta desde una cita atendida.
- Registrar diagnósticos (1..N por consulta) y su tratamiento.
- Prescripción opcional referenciando medicamento y lote.
- Reporte de citas que no derivaron en consulta.
- Despliegue funcional con `docker compose` y datos de administrador sembrados.

**Forma del prototipo:** wireframes de las pantallas clave (login, lista de mascotas, agenda de citas, registro de consulta con diagnóstico y tratamiento, catálogo de medicamentos/lotes, reporte de citas sin consulta) antes de construir el sistema completo.

## 5. Testear

**Qué se valida:**
- Un usuario puede iniciar sesión, crear un propietario, una mascota, agendar una cita y registrar la consulta con diagnóstico y tratamiento sin errores.
- El reporte de citas sin consulta muestra correctamente las citas que no fueron atendidas.
- El sistema rechaza una prescripción si el lote seleccionado está vencido.
- La aplicación completa (backend, frontend, base de datos) queda arriba y navegable tras `docker compose up`.

**Criterio de éxito:**
El flujo completo (login → propietario → mascota → cita → consulta → diagnóstico → tratamiento → reporte) se ejecuta sin fallos y las reglas de negocio (consulta única por cita, lote no vencido) se cumplen en todos los casos de prueba.
