# CU-06 · Verificar identidad

| Campo | Contenido |
|---|---|
| Requisitos | RF-SAB-024, RF-SAB-027, RF-SAB-028, RF-SAB-057, RF-SAB-058, RF-SAB-062, RF-SAB-064, RF-SAB-070, RF-SAB-098 a RF-SAB-100 |
| Actor primario / secundarios | Aprendiz / servicio autorizado de cotejo, si se aprueba |
| Objetivo | Comprobar la identidad por una modalidad autorizada, sin afirmar que WebAuthn siempre usa huella. |
| Precondiciones | CU-07 aceptó el QR o código. La cuenta está activa y la modalidad fue autorizada. |
| Disparador | El sistema habilita el paso de identidad después de validar el medio temporal. |
| Flujo principal | 1. El sistema muestra las modalidades disponibles y su descripción.
2. El Aprendiz elige una modalidad autorizada.
3. Si la modalidad usa cámara, el Aprendiz concede permiso y sigue las indicaciones de encuadre.
4. El sistema guía la captura y comunica su estado.
5. El sistema realiza la comprobación autorizada de identidad.
6. El sistema registra el resultado y el método confirmado, sin guardar datos crudos innecesarios.
7. El sistema informa si la identidad fue aceptada y permite continuar al registro de asistencia. |
| Flujos alternos | 3a. Si la cámara o modalidad no está disponible, el sistema ofrece una alternativa supervisada permitida y registra que se usó esa alternativa. |
| Excepciones | 5a. Si la identidad no coincide, el sistema rechaza la verificación y actualiza el conteo de intentos.
5b. Si ocurre un fallo técnico, el sistema no lo cuenta como intento fallido de identidad y permite reintentar cuando sea posible. |
| Postcondiciones | El resultado queda asociado a la sesión; se conserva la modalidad confirmada, sin declarar huella cuando solo se validó una credencial WebAuthn. |
| Reglas de negocio | RN-003, RN-005, RN-014, RN-015, RN-021, RN-022, RN-025. |
| Pantalla del prototipo | Mockup vigente por confirmar; el SRS v2.3 describe guía de cámara, pero la pantalla debe revisarse contra el mockup actual. |
