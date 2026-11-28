# Informe de análisis y verificación — SAB · G1-P2

## 1. Requisitos interpretados

Se tomó como fuente el SRS-SAB-001, versión 2.3, revisado el 27/11/2026. SAB es una aplicación web para organizar sesiones, registrar asistencia con validación temporal y de identidad, y consultar novedades. Los roles principales son Aprendiz, Instructor y Superadmin. El registro normal sigue el orden QR o código temporal, verificación de identidad y confirmación de asistencia. La verificación debe respetar autorización, alternativa supervisada y el alcance de ficha; WebAuthn no demuestra por sí solo que se usó huella.

Se identificaron 100 requisitos funcionales en el SRS. Los RNF relevantes para estos modelos incluyen privacidad, autorización por rol, disponibilidad del servicio, adaptación móvil y seguridad de la cámara/credenciales. Este producto desarrolla detalle de análisis, no acredita que el sistema esté implementado.

## 2. Modelos y prototipo

- Actividades: [abrir sesión](./01_actividad_abrir_sesion.svg) y [registrar asistencia](./02_actividad_registrar_asistencia.svg), con fuentes editables `.drawio`.
- Plantillas extendidas: [CU-05](./CU-05_Abrir_sesion.md), [CU-07](./CU-07_Validar_codigo.md) y [CU-06](./CU-06_Verificar_identidad.md).
- Dominio: [modelo conceptual](./03_modelo_dominio.md); conceptos, atributos de negocio, asociaciones y multiplicidades en tablas legibles, sin métodos.
- Datos: [MER](./04_modelo_entidad_relacion.md), notación pata de gallo expresada en tablas, con 22 entidades, la asociativa `VINCULACION_FICHA`, relaciones y cardinalidades. La relación recursiva de auditoría queda identificada como propuesta.
- Prototipo: [tres pantallas iniciales](./05_prototipo_inicial.html), rotuladas CU-05, CU-07 y CU-06. Representan pantallas conceptuales; no reemplazan el mockup vigente.
- Cobertura: [matriz de trazabilidad](./07_matriz_trazabilidad.md), 100 RF vinculados a artefactos de análisis.

## 3. Verificación y ajustes

La lista de chequeo contiene 18 criterios con evidencia. En la primera pasada se detectaron tres pendientes: (H-01) las salidas de rechazo no llegaban a un fin explícito; (H-02) las pantallas de la matriz deben cotejarse con el mockup vigente; (H-03) el informe debe describir el resultado de una segunda verificación. H-01 fue corregido y verificado en los dos diagramas editables y sus exportaciones SVG; se hizo una segunda revisión visual de las rutas y guardas. H-02 continúa parcialmente pendiente; H-03 se actualizó con ese estado. Estos puntos están registrados en [lista de chequeo](./06_lista_chequeo.md) y [registro de ajustes](./08_registro_ajustes.md). No se declaran corregidos sin una segunda comprobación.

## 4. Resultado actual

Los tres casos extendidos y ambos modelos están construidos con base en el SRS v2.3. La matriz incluye los 100 RF y conserva todos los CU relacionados según el Producto 1. Las asignaciones de clase, entidad y pantalla son propuestas iniciales y requieren validación requisito por requisito contra el SRS y el mockup vigente. El mockup vigente deberá confirmarse porque en los archivos del fork solo se encontraron enlaces a prototipos anteriores. La lista de chequeo deja visible el pendiente de cotejar pantallas con el mockup vigente.
