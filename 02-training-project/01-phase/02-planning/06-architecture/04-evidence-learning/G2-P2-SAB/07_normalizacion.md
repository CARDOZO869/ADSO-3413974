# B3 · Normalización de dos relaciones

Se parte de registros de asistencia que suelen llegar juntos en una planilla. Los ejemplos son ilustrativos y no contienen datos reales. La finalidad es explicar la descomposición; el modelo final mantiene las dependencias en una sola tabla cuando corresponden a esa entidad.

## Caso 1: registro de asistencia con llave compuesta y dependencia parcial

**Relación de partida 0FN:** `RegistroAsistencia(id_sesion, id_aprendiz, fecha_sesion, codigo_ficha, documento, nombre_aprendiz, estado, metodo)`. Una fila representa una persona en una sesión; clave candidata `(id_sesion, id_aprendiz)`. En el insumo original, `asistentes` puede ser una lista en una celda: no atómico.

**Dependencias funcionales:**

- `(id_sesion, id_aprendiz) → estado, metodo`
- `id_sesion → fecha_sesion, codigo_ficha`
- `id_aprendiz → documento, nombre_aprendiz`

| Etapa | Qué se corrige | Resultado |
|---|---|---|
| 0FN | Celda `asistentes` contiene varios aprendices. | Formato no atómico; no permite validar cada marca por separado. |
| 1FN | Se crea una fila por pareja sesión–aprendiz y se separa cada atributo. | `RegistroAsistencia(id_sesion,id_aprendiz,fecha_sesion,codigo_ficha,documento,nombre_aprendiz,estado,metodo)`. |
| 2FN | `fecha_sesion,codigo_ficha` dependen solo de `id_sesion`; documento y nombre solo de `id_aprendiz`, no de la llave compuesta completa. | Separar `Sesion(id_sesion,fecha_sesion,codigo_ficha)`, `Aprendiz(id_aprendiz,documento,nombre_aprendiz)` y `Asistencia(id_sesion,id_aprendiz,estado,metodo)`. |
| 3FN | En las tres relaciones resultantes cada atributo no clave depende de la llave, de toda la llave y de nada más que la llave. | No se observan dependencias transitivas en este ejemplo. En el esquema real, `asistencia` tiene PK propia y `UNIQUE(id_sesion,id_aprendiz)` para impedir duplicados. |

## Caso 2: cuenta con dependencia transitiva

**Relación de partida 0FN:** `Cuenta(id_usuario, correo, id_rol, codigo_rol, descripcion_rol, hash_contrasena, estado)`. Clave: `id_usuario`.

**Dependencias funcionales:** `id_usuario → correo,id_rol,hash_contrasena,estado` y `id_rol → codigo_rol,descripcion_rol`; por tanto `id_usuario → id_rol → codigo_rol,descripcion_rol` es transitiva.

| Etapa | Qué se corrige | Resultado |
|---|---|---|
| 0FN | Puede haber permisos concatenados en la cuenta; no son valores atómicos. | La lista se elimina de la fila y se expresa por catálogo/relación de permisos si esos permisos entran al alcance. |
| 1FN | Un valor por columna; un rol asignado por cuenta según el SRS actual. | `Cuenta(id_usuario,correo,id_rol,codigo_rol,descripcion_rol,hash_contrasena,estado)`. |
| 2FN | La llave de Cuenta es simple, no hay dependencia parcial. | Se conserva la tabla sin división por 2FN. |
| 3FN | `codigo_rol` y `descripcion_rol` dependen de `id_rol`, no directamente de `id_usuario`. | Descomponer en `usuario(id_usuario,correo,id_rol,hash_contrasena,sal_contrasena,estado)` y `rol(id_rol,codigo,descripcion)`. En el SQL se implementa con FK. |

**Resultado:** las dependencias parciales/transitivas se retiran de la tabla de asistencia/cuenta. `UNIQUE` y claves foráneas refuerzan las reglas. La sal no reemplaza un algoritmo de hash seguro; debe ser aleatoria y gestionada por la librería de contraseñas.
