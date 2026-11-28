# CU-07 · Validar QR o código

| Campo | Contenido |
|---|---|
| Requisitos | RF-SAB-025, RF-SAB-026, RF-SAB-056 |
| Actor primario / secundarios | Aprendiz / servicio de hora del sistema |
| Objetivo | Validar que el medio temporal corresponda a una sesión activa y permita continuar con la verificación de identidad. |
| Precondiciones | El Aprendiz inició sesión y pertenece a la ficha de la sesión. El Instructor abrió la sesión. |
| Disparador | El Aprendiz presenta el QR o ingresa el código manual. |
| Flujo principal | 1. El Aprendiz selecciona escanear QR o ingresar el código.
2. El sistema recibe el medio temporal presentado.
3. El sistema comprueba que el código sea íntegro y vigente.
4. El sistema comprueba que la sesión siga activa.
5. El sistema comprueba que la sesión corresponda a la ficha del Aprendiz.
6. El sistema asocia la validación temporal a la sesión y al Aprendiz.
7. El sistema informa que la validación fue aceptada y permite continuar a la verificación de identidad. |
| Flujos alternos | 1a. Si el Aprendiz no puede escanear, ingresa el código manual vigente; el sistema aplica las mismas comprobaciones. |
| Excepciones | 3a. Si el código está vencido, alterado o pertenece a otra ficha, el sistema lo rechaza y solicita un medio vigente. |
| Postcondiciones | Una validación temporal aceptada queda asociada a la sesión y al Aprendiz; la asistencia todavía no queda registrada. |
| Reglas de negocio | RN-003, RN-004, RN-018, RN-019. |
| Pantalla del prototipo | Mockup vigente por confirmar; referencia previa: pantalla de registro en `03-execute/17-week/02-optional-activity/MOCKUP`. |
