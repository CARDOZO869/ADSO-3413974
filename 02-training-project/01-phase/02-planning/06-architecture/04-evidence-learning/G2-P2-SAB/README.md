# G2 · Producto 2 — SAB

## Datos

| Campo | Valor |
|---|---|
| Producto | P2 · Modelo de datos y verificación |
| Usuario GitHub | `CARDOZO869` (confirma antes de publicar) |
| Ficha | ADSO 3413974 |
| Caso | Sistema de Asistencia Biométrica (SAB) |
| Insumo | SRS-SAB-001 v2.3; Producto 1 G2 del mismo caso aún pendiente en esta rama |

## Qué se reutilizó y creó

- Se reutilizó el SRS del SAB como fuente de requisitos y la matriz RF→casos de uso de G1-P1/G1-P2 como referencia de trazabilidad.
- Se construyeron el modelo conceptual, el modelo lógico, el diccionario, el script SQL, la normalización, las políticas de seguridad, la lista de verificación y el registro de hallazgos.
- Las capturas del compañero se usaron solo para observar una presentación clara de diagramas; no se copiaron sus datos ni su caso de tienda.
- El motor elegido para la evidencia local es SQLite porque el SRS no fija un motor y permite validar aquí las restricciones. La selección de producción debe acordarse con el equipo.

## Archivos

- [Modelo conceptual](./03_modelo_conceptual.md) · [Editable](./03_modelo_conceptual.drawio) · [PNG](./03_modelo_conceptual.png) · [SVG](./03_modelo_conceptual.svg)
- [Modelo lógico y reglas](./02_modelo_logico_y_transformacion.md) · [Editable](./02_modelo_logico.drawio) · [PNG](./02_modelo_logico.png) · [SVG](./02_modelo_logico.svg)
- [Normalización](./07_normalizacion.md)
- [Diccionario de datos](./04_diccionario_datos.md)
- [Esquema SQL](./05_esquema_sab.sql) · [Log de ejecución local](./06_evidencia_ejecucion_sql.txt)
- [Políticas de seguridad y matriz de permisos](./08_politicas_seguridad.md)
- [Matriz RF–tablas](./09_matriz_trazabilidad_rf_tablas.md)
- [Lista de chequeo aplicada](./10_lista_chequeo.md) · [Registro de hallazgos](./10_registro_hallazgos.md)

## Estado de los mínimos B1–B7

| Mínimo | Estado |
|---|---|
| B1–B6 | Preparados en esta carpeta; revisa los supuestos y explica el diseño antes de presentarlo. |
| B7 | La lista tiene 27 criterios medibles. G2-P1 no está disponible para evaluar porque su carpeta conserva la plantilla vacía; por eso tres criterios aparecen como No y el hallazgo H-05 queda abierto. |

## IA, autoría y commits

Se usó ChatGPT como apoyo para estructurar documentos, construir diagramas y generar un primer esquema SQL. La ejecución local y el cotejo de nombres fueron realizados en este entorno; el aprendiz debe revisar requisitos y reglas, ajustar el diseño y poder explicarlo. No se declaran commits hasta que el aprendiz los cree.

| Día | Cambio y enlace real al commit propio |
|---|---|
| Pendiente | Completar tras el primer commit propio |
| Pendiente | Completar tras el segundo día de avance propio |

## Autoría

Usuario de GitHub: `CARDOZO869`. Antes de declarar el trabajo final, el aprendiz debe revisar el SRS, corregir decisiones que no correspondan al caso y confirmar las políticas de datos con el equipo. No incluir datos personales reales en este repositorio público.
