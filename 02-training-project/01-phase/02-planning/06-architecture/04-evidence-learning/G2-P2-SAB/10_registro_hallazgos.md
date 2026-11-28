# Registro de hallazgos y segunda revisión

| ID | Artefacto | Hallazgo / impacto | Severidad | Ajuste aplicado | Segunda verificación |
|---|---|---|---|---|---|
| H-01 | G2-P2 / SQL | El modelo necesitaba evidencia ejecutable y reglas referenciales verificables. | Crítico | Se creó el esquema de 14 tablas con FK, UNIQUE, CHECK y acciones referenciales. | Ejecutado en SQLite 3.53.1; 14 tablas visibles y `foreign_key_check` sin resultados. |
| H-02 | G2-P2 / Diccionario | No había diccionario que probara correspondencia columna a columna con SQL. | Mayor | Se documentaron las 74 columnas del script con tipo, restricción y dominio. | Revisión de nombres contra DDL: todas las columnas listadas. |
| H-03 | G2-P2 / Normalización | No se explicaban las dependencias parciales y transitivas pedidas. | Mayor | Se agregaron dos recorridos 0FN–3FN con DF y descomposición. | Revisión: caso con PK compuesta y caso con DF transitiva. |
| H-04 | G2-P2 / Seguridad | Faltaba matriz concreta de roles sobre las entidades SAB. | Mayor | Se añadieron políticas por integridad, confidencialidad y disponibilidad y matriz de tres roles. | Revisión de 11 políticas; hash+sal y TLS explícitos. |
| H-05 | G2-P1 / Evaluación | El README de G2-P1 sigue siendo una plantilla; no hay vistas de diseño para inspeccionar. | Crítico | Se registró como pendiente en la lista, sin declarar cumplimiento ni inventar corrección ajena a esta solicitud. | Sigue pendiente; B7 global requiere completar y revisar G2-P1. |

El hallazgo H-05 queda abierto porque este paquete desarrolla G2-P2 y no reemplaza el Producto 1 de G2.
