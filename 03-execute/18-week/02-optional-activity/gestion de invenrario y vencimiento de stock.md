Problema 1: Agotamiento de productos en alerta de stock de vencimiento
Insumo del problema:
Productos que están cerca de vencerse se agotan (se venden o se dañan) antes de que el sistema pueda gestionar la alerta o antes de que alguien tome acción sobre ellos. Esto genera pérdida de control sobre inventario próximo a vencer.

Cuello de botella:
La alerta se genera pero no hay una acción automática o inmediata vinculada a ella. El proceso depende de que una persona revise manualmente el sistema y reaccione a tiempo. Si nadie revisa a tiempo, el producto se agota o vence sin que se haya aplicado ninguna estrategia (descuento, promoción, reubicación).

Medio de solución:

Crear un trigger en la base de datos que, al detectar stock bajo con fecha próxima a vencer, actualice automáticamente un estado ("prioridad de venta") en el producto.

Implementar un job/cron diario que consulte productos en ese estado y envíe notificación push o correo al responsable de inventario.

Agregar un módulo en el sistema que muestre en tiempo real un panel de "productos en riesgo" ordenado por urgencia (menor tiempo restante primero).

Problema 2: Lotes de stock vendidos
Insumo del problema:
No hay trazabilidad clara de qué lote específico se vendió cuando un producto tiene múltiples lotes con distintas fechas de ingreso o vencimiento. Esto complica el control de inventario y la rotación correcta (FIFO/FEFO).

Cuello de botella:
El sistema de ventas no descuenta stock por lote, sino por producto en general. Entonces no se sabe con certeza cuál lote se vendió, lo que rompe la trazabilidad y puede hacer que lotes viejos queden estancados mientras se venden lotes nuevos.

Medio de solución:

Modificar la estructura de base de datos para que cada venta descuente stock directamente del lote más próximo a vencer (lógica FEFO: First Expired, First Out).

Relacionar cada transacción de venta con un id_lote específico en la tabla de ventas, no solo con id_producto.

Generar un reporte de trazabilidad que muestre: lote, fecha de ingreso, fecha de vencimiento, cantidad vendida, y stock restante por lote.
