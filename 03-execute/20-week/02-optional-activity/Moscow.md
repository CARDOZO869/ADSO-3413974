
# MoSCoW — Control de mascotas y medicamentos

## 🔴 Must have — obligatorio, sin esto no hay MVP

| # | Requisito |
|---|---|
| 1 | Login con token, contraseñas hasheadas |
| 2 | CRUD de propietarios (documento, nombre, teléfono) |
| 3 | CRUD de mascotas asociadas a un propietario |
| 4 | Agendar citas (mascota, veterinario, motivo) |
| 5 | Registrar consulta desde una cita atendida (1:1 opcional con appointment) |
| 6 | Registrar 1..N diagnósticos por consulta |
| 7 | Registrar tratamiento derivado de un diagnóstico |
| 8 | Reporte de citas que no derivaron en consulta |
| 9 | Docker compose levanta backend + frontend + BD con admin sembrado |
| 10 | Regla: consulta existe máximo una vez por cita |

## 🟠 Should have — importante, pero el sistema funciona sin esto al inicio

| # | Requisito |
|---|---|
| 1 | Prescripción opcional derivada del tratamiento |
| 2 | Catálogo de medicamentos (CRUD) |
| 3 | Lotes de medicamento (entidad débil, con vencimiento y cantidad disponible) |
| 4 | Regla: prescripción no puede usar lote vencido |
| 5 | Pruebas automatizadas básicas (backend y frontend) |
| 6 | Mensajes de error claros en español |

## 🔵 Could have — deseable, mejora la experiencia, no crítico

| # | Requisito |
|---|---|
| 1 | Filtros/búsqueda en listados (por mascota, por fecha, por veterinario) |
| 2 | Paginación en listados grandes |
| 3 | Validaciones extra en frontend (formato de fecha local, campos obligatorios) |
| 4 | Indicador de stock bajo en lotes |

## ⚪ Won't have — fuera de alcance en esta fase

| # | Requisito |
|---|---|
| 1 | Múltiples roles de usuario (solo hay un rol: recepcionista/veterinario) |
| 2 | Facturación o pagos |
| 3 | Notificaciones automáticas (recordatorios de cita, vencimiento de lote) |
| 4 | Reportes avanzados/estadísticas más allá de "citas sin consulta" |
| 5 | App móvil (solo web) |
