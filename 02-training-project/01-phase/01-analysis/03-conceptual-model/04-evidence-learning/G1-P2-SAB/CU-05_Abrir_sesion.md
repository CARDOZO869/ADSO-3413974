# CU-05 · Abrir sesión

| Campo | Contenido |
|---|---|
| Requisitos | RF-SAB-018 a RF-SAB-023, RF-SAB-055, RF-SAB-071 |
| Actor primario / secundarios | Instructor / servicio de hora del sistema |
| Objetivo | Abrir una sesión de formación asignada y poner a disposición su medio temporal de validación. |
| Precondiciones | El Instructor inició sesión y tiene asignada la ficha correspondiente. La ficha, el ambiente y el horario existen y están activos. |
| Disparador | El Instructor solicita abrir una sesión de su horario. |
| Flujo principal | 1. El Instructor selecciona la ficha y el horario asignados.
2. El sistema muestra los datos de la sesión seleccionada.
3. El Instructor confirma la apertura.
4. El sistema comprueba la asignación del Instructor y la vigencia de la ficha.
5. El sistema comprueba que el ambiente y el horario estén disponibles y que no haya cruces.
6. El sistema crea la sesión activa y registra la hora del servidor.
7. El sistema genera el QR o código temporal asociado a esa sesión.
8. El sistema informa al Instructor que la sesión quedó abierta. |
| Flujos alternos | 5a. Si el Instructor elige código manual en lugar de QR, el sistema genera el código temporal y muestra su vigencia. |
| Excepciones | 5b. Si existe un cruce, la asignación no corresponde o la sesión ya está abierta, el sistema no la crea e informa el motivo. |
| Postcondiciones | La sesión queda activa, vinculada a su ficha, horario, ambiente y responsable; el medio temporal corresponde a esa sesión. |
| Reglas de negocio | RN-003, RN-004, RN-016, RN-026, RN-027. |
| Pantalla del prototipo | Mockup vigente por confirmar; antecedente de interfaz en `03-execute/17-week/02-optional-activity/MOCKUP`. |
