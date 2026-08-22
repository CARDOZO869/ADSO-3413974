# Investigación: BPMN (Business Process Model and Notation)

## 1. Qué es

BPMN es una notación gráfica estándar para modelar procesos de negocio. Sirve para dibujar, paso a paso, cómo funciona un proceso: quién hace qué, en qué orden, y qué pasa si algo sale bien o mal.

Lo mantiene el OMG (Object Management Group). La versión actual y más usada es **BPMN 2.0**, publicada en 2011.

## 2. Para qué sirve

- Documentar procesos existentes (AS-IS).
- Diseñar procesos nuevos o mejorados (TO-BE).
- Comunicar el proceso entre áreas de negocio y equipos técnicos, con un lenguaje visual que todos entienden.
- Servir de base para automatizar procesos en motores BPM (Camunda, Bizagi, etc.).

## 3. Los 4 grupos de elementos

BPMN se organiza en cuatro categorías de elementos:

### 3.1 Objetos de flujo (Flow Objects)
Son el corazón del diagrama.

- **Eventos**: algo que "sucede" durante el proceso. Se dibujan como círculos.
  - Evento de inicio (círculo delgado): dispara el proceso.
  - Evento intermedio (círculo doble línea): pasa algo en medio del proceso (ej. recibir un mensaje, esperar un tiempo).
  - Evento de fin (círculo de borde grueso): el proceso termina.
- **Actividades**: trabajo que se realiza. Se dibujan como rectángulos de esquinas redondeadas.
  - Tarea: trabajo simple, no se puede descomponer más.
  - Subproceso: agrupa varias tareas, se puede expandir o colapsar.
  - Tipos de tarea según quién la ejecuta: tarea de usuario, tarea de servicio (automática), tarea manual, tarea de script, tarea de envío/recepción.
- **Compuertas (Gateways)**: puntos de decisión o control del flujo. Se dibujan como rombos.
  - Exclusiva (XOR, con una "X" o vacía): el flujo toma un solo camino, según una condición.
  - Paralela (AND, con un "+"): abre varios caminos que se ejecutan al mismo tiempo, todos.
  - Inclusiva (OR, con un círculo): puede tomar uno o varios caminos, según condiciones.
  - Basada en eventos: el camino se decide según cuál evento ocurra primero.

### 3.2 Objetos de conexión
- **Flujo de secuencia** (línea continua con flecha): indica el orden en que se ejecutan las actividades, dentro del mismo participante.
- **Flujo de mensaje** (línea punteada con flecha): indica comunicación entre dos participantes distintos (dos piscinas).
- **Asociación** (línea punteada sin flecha o con flecha delgada): conecta un elemento con un dato, texto o anotación.

### 3.3 Swimlanes (carriles)
Organizan el diagrama por responsable.

- **Pool (piscina)**: representa un participante completo del proceso (una empresa, un sistema, un departamento).
- **Lane (carril)**: subdivisión dentro de una piscina, representa un rol o área específica (ej. "Ventas", "Bodega", "Cliente").

### 3.4 Artefactos
Dan información extra sin afectar el flujo.

- **Objeto de datos**: representa información que entra o sale de una actividad (un documento, un formulario).
- **Grupo**: agrupa visualmente elementos relacionados, solo con fines de lectura.
- **Anotación de texto**: nota aclaratoria pegada a un elemento.

## 4. Tipos de eventos según su disparador (los más usados)

- **Mensaje** (sobre): se envía o recibe un mensaje.
- **Temporizador** (reloj): se activa por una fecha, hora o duración.
- **Error** (rayo): captura o lanza un error.
- **Señal** (triángulo): comunicación general, puede tener varios receptores.
- **Terminación** (círculo relleno negro): termina todo el proceso de inmediato, sin importar qué otras ramas sigan activas.

## 5. Regla práctica para leer un diagrama

1. Busca el evento de inicio (siempre hay al menos uno).
2. Sigue las flechas de flujo de secuencia.
3. En cada rombo (compuerta), identifica qué tipo es para saber si el flujo se divide, se decide o se junta.
4. Verifica que cada camino llegue a un evento de fin.
5. Si hay varias piscinas, revisa los flujos de mensaje entre ellas para entender la comunicación.

## 6. Errores comunes al modelar

- Mezclar flujo de secuencia entre dos piscinas distintas (no se permite; entre piscinas solo va flujo de mensaje).
- Dejar una compuerta abierta sin su compuerta de cierre correspondiente (una XOR que abre debe cerrar con una XOR, no con una AND).
- Usar una tarea genérica cuando existe un tipo más específico (ejemplo: usar tarea simple en vez de tarea de usuario cuando sí se sabe quién la ejecuta).
- No indicar el evento de fin.
- Modelar demasiado detalle en un solo nivel: hay que usar subprocesos para no saturar el diagrama.

## 7. Niveles de proceso

- **Nivel descriptivo**: diagrama simple, para que las personas de negocio entiendan el proceso. No necesita todos los detalles técnicos.
- **Nivel analítico**: agrega más detalle (tipos de tarea, eventos, compuertas específicas), útil para análisis y rediseño.
- **Nivel ejecutable**: el diagrama tiene toda la información técnica necesaria para que un motor BPM (como Camunda) lo ejecute automáticamente.

## 8. Herramientas para modelar BPMN

- **Bizagi Modeler**: gratuito, fácil de usar, orientado a nivel descriptivo/analítico.
- **Camunda Modeler**: orientado a procesos ejecutables, se conecta a un motor de ejecución.
- **draw.io / diagrams.net**: gratuito, sirve para diagramas básicos, sin motor de ejecución.
- **Signavio**: herramienta empresarial, colaborativa.

## 9. Diferencia con otras notaciones

- **Diagrama de flujo tradicional**: más simple, no tiene estándar fijo de símbolos ni distingue participantes con piscinas/carriles.
- **UML (diagrama de actividades)**: sirve para modelar lógica de software, no está enfocado en procesos de negocio ni en comunicación entre participantes.
- **BPMN**: estándar específico para procesos de negocio, con símbolos definidos y reglas claras de conexión.

## 10. Camunda

Camunda es un motor BPM (Business Process Management) que ejecuta diagramas BPMN de verdad, no solo los dibuja. Un diagrama hecho en Camunda Modeler puede correr directamente en el motor de Camunda, disparando tareas de sistema, formularios, reglas de negocio, etc.

### 10.1 Qué es Camunda Modeler
Es la herramienta gráfica (de escritorio o web) donde se dibuja el diagrama BPMN. Usa la misma notación estándar de BPMN 2.0, pero agrega propiedades técnicas a cada elemento (nombre de variable, expresión, formulario, conector) para que el motor sepa qué ejecutar.

### 10.2 Diferencia con Bizagi
- Bizagi Modeler: pensado para modelar y documentar, nivel descriptivo/analítico.
- Camunda Modeler: pensado para modelar y **ejecutar**, nivel ejecutable. Cada figura puede llevar código o configuración detrás.

### 10.3 Figuras principales en Camunda (mismas de BPMN, con su uso técnico)

**Eventos (círculos)**
- Evento de inicio simple: dispara el proceso manualmente o por API.
- Evento de inicio de mensaje (sobre sin relleno): el proceso arranca cuando llega un mensaje externo.
- Evento de inicio de temporizador (reloj): arranca en fecha/hora programada.
- Evento de fin simple: termina esa rama del proceso.
- Evento de fin de mensaje: al terminar, envía un mensaje a otro proceso.
- Evento de fin de error: termina lanzando un error que puede ser capturado en otro punto.
- Evento intermedio de mensaje: el proceso espera o envía un mensaje en medio del flujo.
- Evento intermedio de temporizador: pausa el proceso hasta cierta hora o duración (ej. "esperar 2 días").
- Evento de límite (boundary event, círculo pegado al borde de una tarea): captura algo mientras la tarea está activa (ej. un timeout si la tarea tarda demasiado, o un error).

**Actividades (rectángulos redondeados)**
- Tarea de usuario (ícono de persona): requiere que un humano la complete, normalmente con un formulario.
- Tarea de servicio (ícono de engranaje): la ejecuta el sistema automáticamente, llamando código o una API.
- Tarea de script (ícono de código): ejecuta un script directamente (ej. JavaScript, Groovy).
- Tarea de regla de negocio (ícono de tabla): evalúa una tabla de decisión (DMN).
- Tarea de envío/recepción (sobre): manda o recibe un mensaje sin más lógica.
- Subproceso (rectángulo con un "+" abajo): agrupa actividades, se puede colapsar o expandir.
- Llamada a subproceso (call activity, borde grueso): invoca otro proceso ya definido, reutilizable.

**Compuertas (rombos)**
- Exclusiva (X o vacía): un solo camino según condición. La más común.
- Paralela (+): abre o cierra caminos simultáneos.
- Inclusiva (círculo): uno o varios caminos según condiciones.
- Basada en eventos: el camino que sigue depende de cuál evento llegue primero (ej. "lo que pase primero: llega el pago o se cumple el plazo").

**Piscinas y carriles**
Igual que en BPMN estándar: piscina (pool) representa un participante o sistema completo; carril (lane) divide por rol dentro de la piscina. En Camunda, cada piscina puede ejecutarse como un proceso independiente que se comunica con otras por mensajes.

**Elementos de datos**
- Objeto de datos: información que entra o sale de una tarea.
- Data store (contenedor con bordes tipo "vaso"): representa una base de datos o repositorio persistente.

### 10.4 Colores y marcado en el modelador
Camunda Modeler no cambia colores por defecto según el tipo de figura (todo se ve gris/blanco), pero sí distingue por el ícono dentro de cada forma: el ícono es lo que dice si una tarea es de usuario, de servicio, de script, etc.

## 11. Resumen en una frase

BPMN es el estándar visual para dibujar procesos de negocio con reglas fijas: eventos (círculos) disparan o cierran el proceso, actividades (rectángulos) son el trabajo, compuertas (rombos) deciden el camino, y piscinas/carriles muestran quién hace qué. Camunda usa esas mismas figuras pero les agrega configuración técnica para poder ejecutar el proceso de verdad, no solo dibujarlo.
