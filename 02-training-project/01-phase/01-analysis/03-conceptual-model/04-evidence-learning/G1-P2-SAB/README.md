# G1 · Producto 2 — SAB

## 1. Datos de la entrega

- **Producto:** P2 · modelo de análisis y verificación.
- **Usuario de GitHub del autor:** `CARDOZO869`.
- **Caso:** Sistema de Asistencia Biométrica (SAB).
- **Trabajo en equipo del año:** Sí; el SRS y parte de los insumos de SAB se elaboraron en equipo. Los ajustes de esta carpeta son individuales.

## 2. Qué reutilicé

| Artefacto | Ruta original en mi fork | Origen |
|---|---|---|
| SRS-SAB-001 v2.3 | Insumo actualizado en esta conversación; referencia documental | Equipo; base para los RF y casos de uso. No se copió el documento completo a la carpeta individual. |
| Mockup previo | `03-execute/17-week/02-optional-activity/MOCKUP` | Trabajo del año; el archivo contiene una URL anterior, no se toma como mockup vigente. |
| Proceso y modelo de horarios (solo como referencia de estructura documental) | `03-execute/22-week/02-optional-activity/BPMN , BASE DE DATOS/` | Trabajo previo; dominio distinto, no reutilizado como artefacto SAB. |

## 3. Qué ajusté

| # | Artefacto | Cambio y criterio | Enlace al commit |
|---:|---|---|---|
| 1 | Plantillas de caso de uso | Amplié CU-05, CU-07 y CU-06 con flujo de seis pasos o más, alterno, excepción y postcondiciones (C2). | Pendiente de commit de revisión. |
| 2 | Modelo de dominio y MER | Separé conceptos del negocio de entidades de datos y añadí multiplicidades y relaciones (C3, C4). | Pendiente de commit de revisión. |
| 3 | Lista e informe | Registré hallazgos pendientes y una ruta para segunda verificación, sin afirmar correcciones no realizadas (C6–C8). | Pendiente de commit de revisión. |

## 4. Qué construí nuevo

- Dos diagramas de actividades editables y exportados a SVG.
- Tres plantillas extendidas de caso de uso.
- Modelo de dominio y modelo entidad-relación propios para SAB.
- Prototipo inicial con tres pantallas conceptuales.
- Lista de chequeo, matriz de 100 RF e informe de análisis.

## 5. Artefactos entregados

Los modelos de dominio y entidad-relación se presentan en tablas Markdown para facilitar su lectura y revisión. Las actividades usan carriles por actor, decisiones con condiciones en las salidas y caminos de excepción. Los archivos `.drawio` son editables; `.svg` y `.png` permiten verlos rápidamente.

### Producto 2

- [x] Diagramas de actividades (2), editables en Draw.io y con vista SVG: [abrir sesión](./01_actividad_abrir_sesion.drawio) · [ver SVG](./01_actividad_abrir_sesion.svg) · [ver PNG](./01_actividad_abrir_sesion.png) · [registrar asistencia](./02_actividad_registrar_asistencia.drawio) · [ver SVG](./02_actividad_registrar_asistencia.svg) · [ver PNG](./02_actividad_registrar_asistencia.png)
- [x] Plantillas extendidas: [CU-05](./CU-05_Abrir_sesion.md) · [CU-07](./CU-07_Validar_codigo.md) · [CU-06](./CU-06_Verificar_identidad.md)
- [x] Modelo de dominio en tablas legibles: [archivo](./03_modelo_dominio.md)
- [x] Modelo entidad-relación en tablas de entidades y relaciones: [archivo](./04_modelo_entidad_relacion.md)
- [x] Prototipo inicial (3 pantallas): [archivo HTML](./05_prototipo_inicial.html)
- [x] Lista de chequeo (18 criterios): [archivo](./06_lista_chequeo.md)
- [x] Registro de ajustes y segunda verificación: [archivo](./08_registro_ajustes.md)
- [x] Informe de análisis: [archivo](./09_informe_analisis.md)
- [x] Matriz de trazabilidad (100 RF): [archivo](./07_matriz_trazabilidad.md)

**Estado de verificación:** H-01 se corrigió y se verificó en ambos diagramas; H-03 se actualizó. H-02 está parcialmente resuelto: la matriz contiene los 100 RF, pero los vínculos a dominio, entidad y pantalla necesitan cotejo manual contra cada RF y el mockup vigente. No marcar esta matriz como validación final hasta hacer ese cotejo.

## 6. Declaración de autoría

- [x] Declaro que el ajuste y lo construido nuevo en esta carpeta es mi trabajo individual.
- [x] Declaro que el SRS compartido y las rutas de referencia del trabajo del equipo se identifican en la sección 2.
- [x] Entiendo que debo explicar mis decisiones de análisis y verificación en la sustentación.

Firma: `CARDOZO869` · 27/11/2026

## 7. Uso de inteligencia artificial

| Herramienta | Para qué la usé | Qué debo verificar/corregir personalmente |
|---|---|---|
| ChatGPT | Borrador de plantillas, modelos, matriz y estructura de informe. | Comparar cada vínculo con el SRS v2.3, confirmar roles y cardinalidades, revisar el mockup vigente y cerrar los hallazgos pendientes. |

## 8. Autocontrol antes del push

- [ ] Confirmar commits sustantivos en al menos dos días distintos.
- [x] No se incluyeron plantillas del instructor sin completar ni trabajos ajenos como entregables.
- [ ] Hacer push y comprobar que todos los archivos abren en GitHub.
