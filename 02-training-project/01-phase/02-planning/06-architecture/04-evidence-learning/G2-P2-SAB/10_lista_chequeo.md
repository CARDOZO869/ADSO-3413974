# B7 · Lista de chequeo aplicada

**Escala de severidad:** Crítico = bloquea validez o seguridad; Mayor = requisito obligatorio incompleto; Menor = mejora documental. Se revisan G2-P1 y G2-P2 según la evidencia presente hoy. No se presume un archivo ausente.

| ID | Artefacto | Criterio verificable | Resultado | Evidencia / ubicación | Severidad |
|---|---|---|---|---|---|
| B1-01 | Modelo conceptual | Hay ≥6 entidades con id y atributos de negocio. | Sí | 03_modelo_conceptual.md, tabla de entidades | Menor |
| B1-02 | Modelo conceptual | Todas las relaciones tienen mínimo/máximo y verbo. | Sí | 03_modelo_conceptual.md, relaciones | Mayor |
| B1-03 | Modelo conceptual | Aparece una relación 1:N. | Sí | Sede–Programa, Programa–Ficha | Menor |
| B1-04 | Modelo conceptual | Aparece N:M con entidad asociativa y atributos. | Sí | Usuario–Ficha mediante Inscripción | Mayor |
| B2-01 | Modelo lógico | El esquema contiene ≥8 tablas. | Sí | 05_esquema_sab.sql; 14 CREATE TABLE | Mayor |
| B2-02 | Modelo lógico | Todas las tablas tienen PK y FK donde corresponde. | Sí | 05_esquema_sab.sql; inspección DDL | Crítico |
| B2-03 | Modelo lógico | La relación N:M se resuelve con tabla puente. | Sí | inscripcion, PK compuesta y dos FK | Mayor |
| B2-04 | Modelo lógico | Se documentan reglas de transformación. | Sí | 02_modelo_logico_y_transformacion.md | Menor |
| B3-01 | Normalización | Dos ejemplos muestran pasos 0FN a 3FN. | Sí | 07_normalizacion.md, secciones 1 y 2 | Mayor |
| B3-02 | Normalización | Un ejemplo muestra llave compuesta y dependencia parcial. | Sí | 07_normalizacion.md, caso 1, DF | Mayor |
| B3-03 | Normalización | Un ejemplo muestra dependencia transitiva resuelta en 3FN. | Sí | 07_normalizacion.md, caso 2 | Mayor |
| B4-01 | Diccionario | Cada columna del SQL está en el diccionario. | Sí | 04_diccionario_datos.md cotejado con 05_esquema_sab.sql | Crítico |
| B4-02 | Diccionario | Tipos, tamaño, restricciones y dominio están informados. | Sí | 04_diccionario_datos.md | Mayor |
| B5-01 | SQL | El script crea todas las tablas sin error en motor indicado. | Sí | 06_evidencia_ejecucion_sql.txt; SQLite 3.53.1 | Crítico |
| B5-02 | SQL | Hay ≥3 CHECK y restricciones UNIQUE. | Sí | 05_esquema_sab.sql; varios CHECK/UNIQUE | Mayor |
| B5-03 | SQL | Hay ≥3 FK con acciones ON DELETE/UPDATE. | Sí | 05_esquema_sab.sql; FK declaradas | Mayor |
| B6-01 | Seguridad | Hay ≥6 políticas, al menos dos por principio. | Sí | 08_politicas_seguridad.md, PI/PC/PD | Crítico |
| B6-02 | Seguridad | Incluye matriz para 3 roles y tablas. | Sí | 08_politicas_seguridad.md, matriz | Mayor |
| B6-03 | Seguridad | Contraseña usa hash + sal, no cifrado reversible. | Sí | Esquema usuario y políticas PC-01 | Crítico |
| B6-04 | Seguridad | Protege datos en tránsito mediante TLS. | Sí | Política PC-03 | Crítico |
| B7-01 | G2-P1 | Existe ficha de interpretación y vista de clases. | No | G2-P1-SAB/README.md aún está como plantilla vacía | Crítico |
| B7-02 | G2-P1 | Existe decisión de arquitectura y vistas de componentes/despliegue. | No | No hay artefactos G2-P1 para revisar | Crítico |
| B7-03 | G2-P1 | Existe matriz de trazabilidad clase/componente. | No | No hay matriz de G2-P1 para revisar | Mayor |
| B7-04 | G2-P2 | Existe exportación editable e imagen de ambos modelos. | Sí | 03_modelo_conceptual.drawio/.png y 02_modelo_logico.drawio/.png | Mayor |
| B7-05 | G2-P2 | El informe limita afirmaciones de cobertura a vínculos documentales. | Sí | 09_matriz_trazabilidad_rf_tablas.md, nota de alcance | Menor |
| B7-06 | G2-P2 | Existe ≥3 hallazgos con corrección y segunda revisión. | Sí | 10_registro_hallazgos.md | Mayor |
| B7-07 | Documentación | README identifica fuentes, reutilización, IA y pendientes sin inventar commits. | Sí | README.md | Mayor |

## Resultado de la verificación

- Criterios cumplidos en G2-P2: **24/27** en esta revisión.
- G2-P1 permanece incompleto en la carpeta de entrega y tres criterios se marcan **No**. Por eso la verificación del Producto 1 de G2 no puede cerrarse ni afirmarse que ambos productos están completos.
- La lista es una revisión documental; no sustituye pruebas institucionales, de carga, de privacidad ni aceptación del SRS.
