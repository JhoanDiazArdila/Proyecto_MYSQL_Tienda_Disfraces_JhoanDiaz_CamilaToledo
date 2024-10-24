



USE disfraces_doña_ruca;

-- 1. Stock actual de disfraces para mujer.
SELECT d.id_producto,
        p.nombre,
        d.genero,
        d.tipo_usuario,
        c.nombre AS color,
        t.nombre AS tematica,
        d.stock_alquiler,
        d.stock_venta
FROM disfraces AS d 
JOIN tematicas t ON d.id_tematica = t.id_tematica
JOIN colores c ON d.id_color = c.id_color
JOIN productos p ON d.id_producto = d.id_producto
WHERE d.genero = 'Femenino';


-- 2. Mostrar todos los productos disponibles en la tienda
SELECT p.id_producto,
        p.nombre,
        p.descripcion,
        p.precio_venta,
        c.nombre AS categoria
FROM productos AS p
JOIN categorias AS c ON p.id_categoria = c.id_categoria
WHERE p.id_producto IN (SELECT id_producto FROM disfraces AS d WHERE d.stock_venta > 0 OR d.stock_alquiler > 0)
    OR p.id_producto IN (SELECT id_producto FROM decoraciones AS d WHERE d.stock > 0)
    OR p.id_producto IN (SELECT id_producto FROM accesorios AS a WHERE a.stock > 0)
    OR p.id_producto IN (SELECT id_producto FROM maquillaje AS m WHERE m.stock > 0);


-- 3. Mostrar todas las ventas realizadas en un día específico.
SELECT f.id_factura,
        f.fecha,
        f.total,
        c.nombre AS cliente,
        e.nombre AS vendedor
FROM facturas AS f
JOIN clientes AS c ON f.id_cliente = c.id_cliente
JOIN empleados AS e ON f.id_empleado = e.id_empleado
WHERE f.fecha = '2024-01-01';

-- 4. Listar todos los clientes Activos
SELECT * FROM clientes WHERE estado = 'Activo';

-- 5. Listar todos los clientes Inactivos
SELECT * FROM clientes WHERE estado = 'Inactivo';

-- 6. Listar todos los clientes VIP
SELECT * FROM clientes WHERE vip = 1;

-- 7. Listar todos los clientes registrados
SELECT * FROM clientes;

-- 8. Mostrar todos los empleados que trabajan o han trabajado
SELECT * FROM empleados;

-- 9. Mostrar todos los empleados que trabajan actualmente
SELECT * FROM empleados WHERE estado = 'Activo';

-- 10. Mostrar todos los empleados que NO trabajan actualmente para vetarlos de la empresa
SELECT * FROM empleados WHERE estado = 'Inactivo';

-- 11. Mostrar todos los empleados que han trabajado mas de 1 año
SELECT * 
FROM empleados 
WHERE fecha_contratacion < DATE_SUB(CURDATE(), INTERVAL 1 YEAR);

-- 12. Mostrar el empleado mas antiguo de la tienda
SELECT *
FROM empleados
WHERE fecha_contratacion = (SELECT MIN(fecha_contratacion) FROM empleados);

-- opcion 2
SELECT *
FROM empleados
ORDER BY fecha_contratacion ASC
LIMIT 1;


-- 13. Mostrar los empleados que viven un lugar diferente a Bogotá
SELECT * FROM empleados AS e
JOIN ciudades_pueblos c ON e.id_ciudad_pueblo = c.id_ciudad_pueblo
WHERE c.nombre != 'Bogotá';


-- 14. Mostrar clientes que no vivan en Bogotá
SELECT c.nombre, c.telefono, c.correo, c.estado FROM clientes AS c
JOIN ciudades_pueblos cp ON c.id_ciudad_pueblo = cp.id_ciudad_pueblo
WHERE cp.nombre != 'Bogotá';


-- 15. Mostrar clientes que no vivan en Colombia
SELECT c.nombre, c.telefono, c.correo, c.estado 
FROM clientes AS c
JOIN ciudades_pueblos cp ON c.id_ciudad_pueblo = cp.id_ciudad_pueblo
JOIN departamentos_estados de ON cp.id_departamento_estado = de.id_departamento_estado
JOIN paises p ON de.id_pais = p.id_pais
WHERE p.nombre != 'Colombia';


-- 16. Mostrar clientes VIP
SELECT c.nombre, c.telefono, c.correo
FROM clientes AS c
WHERE c.VIP = 1;

-- 17. Mostrar los 3 clientes con mas ordenes
SELECT c.nombre, 
        c.telefono, 
        c.correo, 
        COUNT(f.id_cliente) AS cantidad_ordenes
FROM clientes AS c
JOIN facturas AS f ON c.id_cliente = f.id_cliente
GROUP BY c.nombre, c.telefono, c.correo
ORDER BY cantidad_ordenes DESC
LIMIT 3;

-- 18. Mostrar los empleados 2 con mas ventas
SELECT e.nombre, 
        e.correo, 
        e.telefono,
        e.estado,
        COUNT(f.id_empleado) AS cantidad_ventas
FROM empleados AS e
JOIN facturas AS f ON e.id_empleado = f.id_empleado
GROUP BY e.nombre, e.correo, e.telefono, e.estado
ORDER BY cantidad_ventas DESC
LIMIT 2;

-- 19. Mostrar el empleado que ha tenido el valor de venta mas alto en los ultimos 6 meses
SELECT e.nombre,
        e.correo,
        e.telefono,
        e.estado,
        SUM(f.total) AS 'Valor total ventas'
FROM empleados AS e 
JOIN facturas AS f ON e.id_empleado = f.id_empleado
WHERE f.fecha BETWEEN NOW() - INTERVAL 6 MONTH AND NOW()
GROUP BY e.nombre, e.correo, e.telefono, e.estado
ORDER BY SUM(f.total) DESC
LIMIT 1;

-- 20. Mostrar el metodo de pago preferido por los clientes
SELECT mp.nombre,
        COUNT(t.id_metodo_pago) AS cantidad_usos
FROM metodos_pago mp
JOIN transacciones t ON mp.id_metodo_pago = t.id_metodo_pago
GROUP BY mp.nombre
ORDER BY cantidad_usos DESC
LIMIT 1;


-- 21. Mostrar las 3 transportadora que mas envios han entregado
SELECT t.nombre,
        COUNT(e.nit_transportadora) AS cantidad_envios
FROM transportadoras AS t
JOIN envios AS e ON t.nit_transportadora = e.nit_transportadora
GROUP BY t.nombre
ORDER BY cantidad_envios DESC
LIMIT 3;

-- 22. Mostrar la ciudad donde mas envio se entregan
SELECT c.nombre,
        COUNT(c.id_ciudad_pueblo) AS cantidad_envios
FROM ciudades_pueblos AS c
JOIN envios AS e ON c.id_ciudad_pueblo = e.id_ciudad_pueblo
GROUP BY c.nombre
ORDER BY cantidad_envios DESC
LIMIT 1;

-- 23. Listar las ventas superiores a $300
SELECT f.id_factura,
        f.fecha,
        f.total,
        e.nombre AS 'nombre_empleado',
        c.nombre AS 'nombre_cliente'
FROM facturas AS f
JOIN empleados AS e ON f.id_empleado = e.id_empleado
JOIN clientes AS c ON f.id_cliente = c.id_cliente
WHERE f.total > 300.00;

-- 24. Mostrar todos los Accesorios en Plata
SELECT p.nombre, p.descripcion, p.precio_venta, a.tamaño, a.stock
FROM productos AS p
JOIN accesorios AS a ON p.id_producto = a.id_producto
JOIN materiales AS m ON a.id_material = m.id_material
WHERE m.material = 'plata';

-- 25. Mostrar todos los envios en preparacion
SELECT e.id_envio, e.fecha_envio, e.id_factura, e.direccion_envio, e.estado
FROM envios AS e
WHERE e.estado = 'Preparacion';


-- 26. Cuando se registro el pago mas costoso en energia
SELECT tg.nombre, g.descripcion, g.fecha_pago, g.valor
FROM tipos_gastos tg
JOIN gastos_operativos g ON tg.id_tipo_gasto = g.id_tipo_gasto
WHERE tg.nombre = 'Servio de luz'
ORDER BY g.valor DESC
LIMIT 1;

-- 27. Mostrar el valor promedio por gasto pagado
SELECT tg.nombre, AVG(g.valor)
FROM tipos_gastos tg
JOIN gastos_operativos g ON tg.id_tipo_gasto = g.id_tipo_gasto
GROUP BY tg.nombre;


-- 28. Mostrar las ganancias obtenidas despues de gastos en el mes de Abril 2024
WITH pago_empleados AS (
    SELECT SUM(pt.sueldo) AS total_pagado_sueldo
    FROM puestos_trabajos pt
    JOIN empleados e ON pt.id_puesto_trabajo = e.id_puesto_trabajo
    WHERE e.estado = 'Activo'
        AND e.fecha_contratacion < '2024-04-30'
), 
gastos AS (
    SELECT SUM(g.valor) AS total_gastos
    FROM gastos_operativos g
    WHERE g.fecha_pago BETWEEN '2024-04-01' AND '2024-04-30'
),
ganancias AS (
    SELECT SUM(f.total) AS total_facturas
    FROM facturas AS f
    WHERE f.fecha BETWEEN '2024-04-01' AND '2024-04-30'
),
costo_producto AS (
    SELECT SUM(p.costo * vp.cantidad) AS total_costo
    FROM productos AS p
    JOIN venta_producto vp ON p.id_producto = vp.id_producto
    JOIN facturas f ON vp.id_factura = f.id_factura
    WHERE f.fecha BETWEEN '2024-04-01' AND '2024-04-30'
)
SELECT 
    (SELECT total_facturas FROM ganancias) -
    (SELECT total_gastos FROM gastos) -
    (SELECT total_costo FROM costo_producto) -
    (SELECT total_pagado_sueldo FROM pago_empleados) AS ganancias_obtenidas;


-- 29. Obtener las ventas con la información de los clientes que las realizaron.
SELECT f.id_factura,
        f.fecha,
        f.total,
        c.nombre AS nombre_cliente,
        c.telefono,
        c.correo,
        c.vip
FROM facturas f 
JOIN clientes c ON f.id_cliente = c.id_cliente;

-- 30. Mostrar los 10 productos mas costosos junto con el nombre del proveedor
SELECT p.nombre, p.costo, pr.nombre_empresa AS nombre_proveedor
FROM productos p
JOIN compra_producto cp ON p.id_producto = cp.id_producto
JOIN facturas_proveedor fp ON cp.id_factura_proveedor = fp.id_factura_proveedor
JOIN proveedores pr ON fp.nit = pr.nit
ORDER BY p.costo DESC
LIMIT 10;


-- 31. Obtener el precio promedio de los productos vendidos.
SELECT AVG(p.precio_venta) AS promedio_costo
FROM productos p
JOIN venta_producto vp ON p.id_producto = vp.id_producto;


-- 32. Mostrar la cantidad total de productos vendidos por categoría.
SELECT c.nombre, SUM(vp.cantidad) AS total_vendido
FROM categorias c 
JOIN productos p ON c.id_categoria = p.id_categoria
JOIN venta_producto vp ON p.id_producto = vp.id_producto
GROUP BY c.nombre;


-- 33. Mostrar el total de ventas realizadas por un empleado específico.
SELECT e.nombre, SUM(f.total) AS total_ventas
FROM empleados e
JOIN facturas f ON e.id_empleado = f.id_empleado
WHERE e.id_empleado = 2
GROUP BY e.nombre;

-- 34. Mostrar los productos mas vendidos para envios
SELECT p.nombre,
        SUM(vp.cantidad) AS 'Cantidad vendidos'
FROM productos p 
JOIN venta_producto vp ON p.id_producto = vp.id_producto
JOIN envios e ON vp.id_factura = e.id_factura
GROUP BY p.nombre
ORDER BY SUM(vp.cantidad) DESC
LIMIT 5;


-- 35. Borrar los clientes que no han realizado compras en los últimos 2 años.
DELETE FROM clientes c
WHERE NOT EXISTS (
    SELECT 1
    FROM facturas f
    WHERE c.id_cliente = f.id_cliente
    AND f.fecha > NOW() - INTERVAL 2 YEAR
);



-- 36. Mostrar productos que tengan stock menor de 2 para realizar compras
SELECT p.id_producto,
        p.nombre,
        p.descripcion,
        p.precio_venta,
        c.nombre AS categoria
FROM productos AS p
JOIN categorias AS c ON p.id_categoria = c.id_categoria
WHERE p.id_producto IN (SELECT id_producto FROM disfraces AS d WHERE d.stock_venta <= 2 OR d.stock_alquiler <= 2)
    OR p.id_producto IN (SELECT id_producto FROM decoraciones AS d WHERE d.stock <= 2)
    OR p.id_producto IN (SELECT id_producto FROM accesorios AS a WHERE a.stock <= 2)
    OR p.id_producto IN (SELECT id_producto FROM maquillaje AS m WHERE m.stock <= 2);


-- 37. Actualizar estado VIP a clientes con mas de 3 compras en el ultimo año
UPDATE clientes c
SET c.vip = 1
WHERE EXISTS (
    SELECT 1
    FROM facturas f
    WHERE f.id_cliente = c.id_cliente
    AND f.fecha > NOW() - INTERVAL 1 YEAR
    GROUP BY f.id_cliente
    HAVING COUNT(f.id_factura) > 3
);


-- 38. Mostrar los proveedores que han sido utilizados en los últimos tres meses.
SELECT p.nombre_empresa AS Empresa,
        p.nombre_contacto AS Contacto,
        p.telefono,
        p.correo
FROM proveedores p
JOIN facturas_proveedor fp ON p.nit = fp.nit
WHERE fp.fecha > NOW() - INTERVAL 3 MONTH;



-- 39. Mostrar los proveedores que no han sido utilizados en el ultimo año.
SELECT p.nombre_empresa AS Empresa,
        p.nombre_contacto AS Contacto,
        p.telefono,
        p.correo
FROM proveedores p
WHERE p.nit NOT IN (
    SELECT fp.nit
    FROM facturas_proveedor fp
    WHERE fp.fecha > NOW() - INTERVAL 1 YEAR
);

-- 40. Mostrar los disfraces para Niños, de genero Femenino en talla 12
SELECT p.nombre,
        p.precio_venta,
        d.genero,
        tc.nombre AS Tematica,
        d.tipo_usuario,
        c.nombre AS Color,
        tll.talla,
        d.stock_venta,
        d.stock_alquiler
FROM productos AS p 
JOIN disfraces AS d ON p.id_producto = d.id_producto
JOIN tematicas AS tc ON d.id_tematica = tc.id_tematica
JOIN tallas AS tll ON d.id_talla = tll.id_talla
JOIN colores AS c ON d.id_color = c.id_color
WHERE d.tipo_usuario = 'Niños'
        AND d.genero = 'Femenino'
        AND tll.talla = '12';



-- 41. verificar todos los productos vendidos y la cantidad de cada uno
SELECT p.id_producto, p.nombre, p.costo, p.precio_venta, vp.cantidad, vp.id_factura
FROM productos AS p
JOIN venta_producto AS vp ON p.id_producto = vp.id_producto
JOIN facturas AS f ON vp.id_factura = f.id_factura;


-- 42. Validar el valor total de facturas vendidas en un tiempo determinado
SELECT SUM(f.total) AS total_facturas
FROM facturas AS f
WHERE f.fecha BETWEEN '2024-04-01' AND '2024-04-30';


-- 43. validar los costos de los productos vendidos en un periodo determinado
SELECT SUM(p.costo * vp.cantidad) AS total_costo
FROM productos AS p
JOIN venta_producto vp ON p.id_producto = vp.id_producto
JOIN facturas f ON vp.id_factura = f.id_factura
WHERE f.fecha BETWEEN '2024-04-01' AND '2024-04-30';


-- 44. Validar el total de gastos sin sueldos para un perido determinad
SELECT SUM(g.valor) AS total_gastos
FROM gastos_operativos g
WHERE g.fecha_pago BETWEEN '2024-04-01' AND '2024-04-30';



-- Contar la cantidad de productos por tipo de maquillaje. 
SELECT tipos_maquillaje.nombre AS Tipo_maquillaje, COUNT(maquillaje.id_tipo_maquillaje) AS total_productos_maquillaje
FROM maquillaje
JOIN tipos_maquillaje ON maquillaje.id_tipo_maquillaje = tipos_maquillaje.id_tipo_maquillaje
WHERE maquillaje.stock > 0
GROUP BY maquillaje.id_tipo_maquillaje
ORDER BY tipos_maquillaje.nombre;


-- Obtener la cantidad total de disfraces disponibles para venta y alquiler por cada tema.
SELECT productos.nombre AS Disfraz, productos.descripcion, tematicas.nombre, disfraces.stock_venta, disfraces.stock_alquiler
FROM disfraces
JOIN productos ON disfraces.id_producto = productos.id_producto
JOIN tematicas ON disfraces.id_tematica = tematicas.id_tematica
WHERE tematicas.nombre = 'Monstruos';

-- Listar todos los accesorios de color Aguamarina y su stock disponible 
SELECT productos.nombre AS Accesorios, productos.descripcion, colores.nombre AS Color, accesorios.stock
FROM accesorios
JOIN productos ON accesorios.id_producto = productos.id_producto
JOIN colores ON accesorios.id_color = colores.id_color
WHERE colores.nombre = 'Aguamarina';

-- Consultar los 5 productos de maquillaje con más stock y sus fechas de expiración.
SELECT productos.nombre AS 'Producto Maquillaje', maquillaje.fecha_expiracion, maquillaje.stock
FROM maquillaje
JOIN productos ON maquillaje.id_producto = productos.id_producto
ORDER BY maquillaje.stock DESC
LIMIT 5; 

-- Obtener los disfraces de niños que están disponibles en talla 8 y su precio de alquiler.
SELECT productos.nombre AS Disfraz, productos.descripcion, tallas.talla, disfraces.precio_alquiler, disfraces.stock_alquiler
FROM disfraces
JOIN productos ON disfraces.id_producto = productos.id_producto
JOIN tallas ON disfraces.id_talla = tallas.id_talla
WHERE disfraces.stock_alquiler > 0 AND disfraces.tipo_usuario = 'Niños' AND tallas.talla = '8';


-- Listar los proveedores que ofrecen productos de maquillaje y sus correos electrónicos.
SELECT proveedores.nombre_empresa, proveedores.correo
FROM proveedores 
JOIN facturas_proveedor  ON proveedores.nit = facturas_proveedor.nit
JOIN compra_producto  ON facturas_proveedor.id_factura_proveedor = compra_producto.id_factura_proveedor
JOIN productos  ON compra_producto.id_producto = productos.id_producto
JOIN categorias  ON productos.id_categoria = categorias.id_categoria
WHERE categorias.id_categoria = 1;


-- Obtener el total de empleados por área de trabajo.
SELECT  areas_trabajos.nombre AS Area, COUNT(empleados.id_empleado) AS total_empleados 
FROM empleados
JOIN puestos_trabajos ON empleados.id_puesto_trabajo = puestos_trabajos.id_puesto_trabajo
JOIN areas_trabajos ON puestos_trabajos.id_area = areas_trabajos.id_area
WHERE areas_trabajos.nombre = 'Atención al Cliente' AND empleados.estado = 'Activo';

-- Listar todas las facturas emitidas por un empleado específico, junto con los totales.
SELECT facturas.id_factura, facturas.total, empleados.nombre
FROM facturas
JOIN empleados ON facturas.id_empleado = empleados.id_empleado
WHERE empleados.id_empleado = 16;

-- Obtener el número total de productos de decoración que pertenecen al tipo de decoracion "lamapara" y están en stock.
SELECT tipos_decoraciones.nombre AS tipo_decoracion, COUNT(decoraciones.id_producto) AS cantidad 
FROM decoraciones
JOIN tipos_decoraciones ON tipos_decoraciones.id_tipo_decoracion = decoraciones.id_tipo_decoracion 
WHERE tipos_decoraciones.nombre = 'lamparas';

-- Listar las transacciones realizadas con tarjeta de crédito y sus montos totales.
SELECT transacciones.id_transacion, transacciones.valor_total
FROM transacciones
JOIN metodos_pago ON transacciones.id_metodo_pago = metodos_pago.id_metodo_pago
WHERE metodos_pago.nombre = 'Tarjeta de crédito';

-- Consultar el stock total de disfraces por color y por género.
SELECT productos.nombre AS disfraz, productos.descripcion, colores.nombre, tallas.talla, disfraces.genero
FROM disfraces
JOIN colores ON disfraces.id_color = colores.id_color
JOIN productos ON disfraces.id_producto = productos.id_producto
JOIN tallas ON disfraces.id_talla = tallas.id_talla
WHERE disfraces.genero = 'Unisex' AND colores.nombre = 'Negro';

-- Listar los proveedores cuyo nombre contiene la palabra "Estilo" y su NIT.
SELECT proveedores.nit, proveedores.nombre_empresa
FROM proveedores
WHERE proveedores.nombre_empresa LIKE '%Estilo%';

-- Obtener la cantidad total de accesorios disponibles por tipo de accesorio y color.
SELECT productos.nombre, productos.descripcion, productos.precio_venta, colores.nombre, tipos_accesorios.nombre
FROM productos
JOIN accesorios ON productos.id_producto = accesorios.id_producto
JOIN colores ON accesorios.id_color = colores.id_color
JOIN tipos_accesorios ON accesorios.id_tipo_accesorio = tipos_accesorios.id_tipo_accesorio
WHERE colores.nombre = 'Azul zafiro' AND tipos_accesorios.nombre = 'Choker';

-- Consultar la cantidad de transacciones realizadas en un mes y año especifico y el valor total.
SELECT COUNT(t.id_transacion) AS cantidad_transacciones,SUM(t.valor_total) AS valor_total
FROM transacciones t
WHERE MONTH(t.fecha_hora) = 01 AND YEAR(t.fecha_hora) = 2024;  

-- Obtener los disfraces unisex disponibles para adultos . 
SELECT productos.nombre, productos.descripcion, tallas.talla, productos.precio_venta, disfraces.stock_venta, disfraces.stock_alquiler
FROM disfraces
JOIN productos ON disfraces.id_producto = productos.id_producto
JOIN tallas ON disfraces.id_talla = tallas.id_talla
WHERE disfraces.genero = 'Unisex' AND tipo_usuario = 'Adultos';


-- Consultar los proveedores de disfraces a los que previamente se le ha comprado y sus datos de contacto.
SELECT proveedores.nombre_empresa, proveedores.nombre_contacto, proveedores.telefono,proveedores.correo
FROM proveedores 
JOIN facturas_proveedor  ON proveedores.nit = facturas_proveedor.nit
JOIN compra_producto  ON facturas_proveedor.id_factura_proveedor = compra_producto.id_factura_proveedor
JOIN productos  ON compra_producto.id_producto = productos.id_producto
JOIN categorias  ON productos.id_categoria = categorias.id_categoria
WHERE categorias.id_categoria = 4
ORDER BY proveedores.nombre_empresa ASC;


-- Contar la cantidad de decoraciones por tipo de decoracion. 
SELECT tipos_decoraciones.nombre AS Tipo_decoracion, COUNT(decoraciones.id_tipo_decoracion) AS total_productos_decoracion
FROM decoraciones
JOIN tipos_decoraciones ON decoraciones.id_tipo_decoracion = tipos_decoraciones.id_tipo_decoracion
WHERE decoraciones.stock > 0
GROUP BY decoraciones.id_tipo_decoracion
ORDER BY tipos_decoraciones.nombre;


-- Obtener el stock total de productos de maquillaje que vencen en el año 2025.
SELECT productos.nombre AS 'Producto Maquillaje', maquillaje.fecha_expiracion, maquillaje.stock
FROM maquillaje
JOIN productos ON maquillaje.id_producto = productos.id_producto
WHERE YEAR(maquillaje.fecha_expiracion) = 2025
ORDER BY productos.nombre ASC ; 

-- Listar las decoraciones disponibles que  pertenezcan al tipo "figuras".
SELECT tipos_decoraciones.nombre AS tipo_decoracion, productos.nombre, productos.descripcion, colores.nombre AS Color, productos.precio_venta
FROM decoraciones
JOIN tipos_decoraciones ON tipos_decoraciones.id_tipo_decoracion = decoraciones.id_tipo_decoracion 
JOIN productos ON decoraciones.id_producto = productos.id_producto
JOIN colores ON decoraciones.id_color = colores.id_color
WHERE tipos_decoraciones.nombre = 'figuras'
ORDER BY productos.nombre ASC;

-- Consultar los empleados contratados en el último año y su puesto de trabajo.
SELECT empleados.id_empleado, empleados.nombre, empleados.fecha_contratacion, puestos_trabajos.nombre
FROM empleados
JOIN puestos_trabajos ON empleados.id_puesto_trabajo = puestos_trabajos.id_puesto_trabajo
WHERE YEAR(empleados.fecha_contratacion) = 2024
ORDER BY empleados.fecha_contratacion ASC;


-- Contar la cantidad de disfraces en cada tematica.  
SELECT tematicas.nombre AS Tematica, COUNT(disfraces.id_tematica) AS total_disfraces
FROM disfraces
JOIN tematicas ON disfraces.id_tematica = tematicas.id_tematica
GROUP BY disfraces.id_tematica;


-- Obtener el nombre de los clientes que han realizado más de 3 compras y su estatus VIP.
SELECT c.nombre, 
        c.telefono, 
        c.correo, 
        COUNT(f.id_cliente) AS cantidad_ordenes
FROM clientes AS c
JOIN facturas AS f ON c.id_cliente = f.id_cliente 
GROUP BY c.nombre, c.telefono, c.correo
HAVING cantidad_ordenes > 3
ORDER BY cantidad_ordenes DESC;


-- Listar las ciudades donde hay más de 2 clientes registrados.

SELECT Ciudades_pueblos.nombre, COUNT(clientes.id_ciudad_pueblo) AS total_clientes
FROM clientes
JOIN Ciudades_pueblos ON clientes.id_ciudad_pueblo = Ciudades_pueblos.id_ciudad_pueblo
GROUP BY Ciudades_pueblos.nombre 
HAVING total_clientes > 2
ORDER BY total_clientes;


-- Listar los productos de maquillaje clasificados como "Sombras" y su cantidad en stock.
SELECT productos.nombre, productos.descripcion, productos.precio_venta, tipos_maquillaje.nombre, maquillaje.stock
FROM maquillaje
JOIN productos ON maquillaje.id_producto = productos.id_producto
JOIN tipos_maquillaje ON maquillaje.id_tipo_maquillaje = tipos_maquillaje.id_tipo_maquillaje
WHERE tipos_maquillaje.nombre = 'Sombras';

-- Obtener el total de disfraces disponibles para alquiler que pertenecen al tema "Cultura antigua".
SELECT productos.nombre AS disfraz, productos.descripcion, disfraces.stock_alquiler, tematicas.nombre
FROM disfraces
JOIN productos ON disfraces.id_producto = productos.id_producto
JOIN tematicas ON disfraces.id_tematica = tematicas.id_tematica
WHERE tematicas.nombre = 'Cultura antigua';

-- Contar la cantidad de accesorios por tipo de accesorios.  
SELECT tipos_accesorios.nombre AS Tipo_accesorio, COUNT(accesorios.id_tipo_accesorio) AS total_productos
FROM accesorios
JOIN tipos_accesorios ON accesorios.id_tipo_accesorio = tipos_accesorios.id_tipo_accesorio
WHERE accesorios.stock > 0
GROUP BY accesorios.id_tipo_accesorio;


-- Consultar las transacciones realizadas en efectivo en el 2022
SELECT transacciones.id_transacion, transacciones.valor_total, transacciones.fecha_hora
FROM transacciones
JOIN metodos_pago ON transacciones.id_metodo_pago = metodos_pago.id_metodo_pago
WHERE metodos_pago.nombre = 'Efectivo' AND YEAR(transacciones.fecha_hora)= 2022;

-- Obtener la lista de empleados activos y su salario actual.
SELECT empleados.id_empleado, empleados.nombre AS empleado, puestos_trabajos.nombre AS puesto, puestos_trabajos.sueldo
FROM empleados
JOIN puestos_trabajos ON empleados.id_puesto_trabajo = puestos_trabajos.id_puesto_trabajo
ORDER BY puestos_trabajos.sueldo ASC;

-- Consultar la cantidad total de productos de maquillaje por tono especifico.
SELECT tonos.nombre AS tono, COUNT(maquillaje.id_tono) AS cantidad_productos
FROM maquillaje
JOIN tonos ON maquillaje.id_tono = tonos.id_tono
WHERE tonos.nombre = 'Beige claro';

-- Listar todos los disfraces disponibles en color rojo y su cantidad de stock .
SELECT productos.nombre AS disfraz, productos.descripcion, colores.nombre, tallas.talla, disfraces.genero
FROM disfraces
JOIN colores ON disfraces.id_color = colores.id_color
JOIN productos ON disfraces.id_producto = productos.id_producto
JOIN tallas ON disfraces.id_talla = tallas.id_talla
WHERE colores.nombre LIKE '%Rojo%';

-- Consultar los productos de maquillaje disponibles con fecha de expiración en los próximos 6 meses.
SELECT p.nombre AS producto,m.fecha_expiracion,m.stock
FROM maquillaje m
JOIN productos p ON m.id_producto = p.id_producto
WHERE m.fecha_expiracion BETWEEN CURDATE() AND DATE_ADD(CURDATE(), INTERVAL 6 MONTH) AND m.stock > 0;

-- Obtener el total de facturas generadas para un cliente específico y su monto total.
SELECT c.nombre AS cliente,COUNT(f.id_factura) AS total_facturas,SUM(f.total) AS monto_total
FROM facturas f
JOIN clientes c ON f.id_cliente = c.id_cliente
WHERE c.id_cliente = 2
GROUP BY c.nombre;

-- Listar los disfraces femeninos para niños y su precio de venta.
SELECT productos.nombre AS disfraz, productos.descripcion, disfraces.genero, disfraces.tipo_usuario
FROM disfraces
JOIN productos ON disfraces.id_producto = productos.id_producto
WHERE disfraces.tipo_usuario = 'Niños' AND disfraces.genero = 'Femenino';

-- Consultar el total de accesorios vendidos en el último mes y su categoría.
SELECT categorias.nombre AS categoria, COUNT(venta_producto.id_producto) AS total_productos
FROM venta_producto
JOIN productos ON venta_producto.id_producto = productos.id_producto
JOIN categorias ON productos.id_categoria = categorias.id_categoria
JOIN facturas ON venta_producto.id_factura = facturas.id_factura
WHERE categorias.nombre = 'Accesorio';

-- Obtener la lista de clientes inactivos que residen en Bogotá.
SELECT c.nombre AS cliente,c.telefono,c.correo,c.direccion
FROM clientes c
JOIN ciudades_pueblos cp ON c.id_ciudad_pueblo = cp.id_ciudad_pueblo
WHERE cp.nombre = 'Bogotá' AND c.estado = 'Inactivo';

-- Listar los proveedores a los que se le han comprados decoraciones y su número de teléfono.
SELECT proveedores.nombre_empresa, proveedores.telefono
FROM proveedores 
JOIN facturas_proveedor  ON proveedores.nit = facturas_proveedor.nit
JOIN compra_producto  ON facturas_proveedor.id_factura_proveedor = compra_producto.id_factura_proveedor
JOIN productos  ON compra_producto.id_producto = productos.id_producto
JOIN categorias  ON productos.id_categoria = categorias.id_categoria
WHERE categorias.id_categoria = 2;

-- Consultar los disfraces para adultos que tienen un precio de alquiler mayor a 20.00
SELECT productos.nombre AS disfraz, disfraces.precio_alquiler, disfraces.stock_alquiler
FROM disfraces
JOIN productos ON disfraces.id_producto = productos.id_producto
WHERE disfraces.tipo_usuario = 'Adultos'AND disfraces.precio_alquiler > 20.00;

-- Obtener los productos de maquillaje clasificados como "Craquelador" y su cantidad de stock.
SELECT productos.nombre, productos.descripcion, productos.precio_venta, tipos_maquillaje.nombre AS tipo, maquillaje.stock
FROM maquillaje
JOIN productos ON maquillaje.id_producto = productos.id_producto
JOIN tipos_maquillaje ON maquillaje.id_tipo_maquillaje = tipos_maquillaje.id_tipo_maquillaje
WHERE tipos_maquillaje.nombre = 'Craquelador';


-- Listar las facturas con un valor total superior a $200,000 y los nombres de los empleados que las procesaron.
SELECT facturas.id_factura, facturas.total AS valor_total, empleados.nombre AS nombre_empleado
FROM facturas
JOIN empleados ON facturas.id_empleado = empleados.id_empleado
WHERE facturas.total > 800.00;

-- Consultar los clientes VIP que han realizado más de 2 transacciones.
SELECT clientes.id_cliente, clientes.nombre, COUNT(transacciones.id_transacion) AS cantidad_transacciones
FROM clientes
JOIN facturas ON clientes.id_cliente = facturas.id_cliente
JOIN transacciones ON facturas.id_transacion = transacciones.id_transacion
WHERE clientes.vip = 1 AND clientes.estado = 'Activo'
GROUP BY clientes.id_cliente, clientes.nombre
HAVING COUNT(transacciones.id_transacion) > 2;


-- Obtener la cantidad total de accesorios disponibles que son "Aretes".
SELECT tipos_accesorios.nombre AS tipo_accesorio, SUM(accesorios.stock) AS cantidad_total_productos
FROM accesorios
JOIN tipos_accesorios ON accesorios.id_tipo_accesorio = tipos_accesorios.id_tipo_accesorio
WHERE tipos_accesorios.nombre = 'Aretes' AND accesorios.stock > 0;

-- Listar las transacciones realizadas por empleados del área de ventas.
SELECT facturas.id_factura, facturas.fecha, facturas.total, empleados.nombre AS nombre_empleado
FROM facturas
JOIN empleados ON facturas.id_empleado = empleados.id_empleado
WHERE empleados.id_empleado = 2;

-- Consultar los disfraces a la venta para mujeres en talla s y su stock disponible.
SELECT disfraces.id_producto, productos.nombre AS disfraz, disfraces.stock_venta
FROM disfraces
JOIN productos ON disfraces.id_producto = productos.id_producto
JOIN tallas ON disfraces.id_talla = tallas.id_talla
WHERE 
    disfraces.genero = 'Femenino' AND tallas.talla = 'S';
    
-- Consultar los accesorios que tienen un precio de venta mayor a 5.00.
SELECT productos.id_producto, productos.nombre AS accesorio, productos.precio_venta
FROM productos
WHERE productos.precio_venta > 5.00 AND productos.id_categoria = 3;


-- Obtener la lista de clientes que han realizado transacciones con tarjeta débito
SELECT 
    DISTINCT clientes.id_cliente, clientes.nombre, clientes.correo, clientes.telefono, metodos_pago.nombre AS metodo_pago
FROM clientes 
JOIN facturas ON clientes.id_cliente = facturas.id_cliente 
JOIN transacciones ON facturas.id_transacion = transacciones.id_transacion
JOIN metodos_pago ON transacciones.id_metodo_pago = metodos_pago.id_metodo_pago
WHERE metodos_pago.nombre = 'Tarjeta de débito';

-- Consultar la cantidad de productos disponibles en stock de maquillaje de un proveedor específico.
SELECT proveedores.nombre_empresa, productos.id_producto, productos.nombre, maquillaje.stock
FROM proveedores 
JOIN facturas_proveedor  ON proveedores.nit = facturas_proveedor.nit
JOIN compra_producto  ON facturas_proveedor.id_factura_proveedor = compra_producto.id_factura_proveedor
JOIN productos  ON compra_producto.id_producto = productos.id_producto
JOIN maquillaje ON productos.id_producto = maquillaje.id_producto
JOIN categorias  ON productos.id_categoria = categorias.id_categoria
WHERE proveedores.nombre_empresa = 'Maquillaje Efectos'AND maquillaje.stock > 0 ;


-- Consultar los empleados con salarios superiores a 300.00 y su área de trabajo.
SELECT empleados.id_empleado, empleados.nombre AS empleado,areas_trabajos.nombre AS area, puestos_trabajos.nombre AS puesto, puestos_trabajos.sueldo
FROM empleados
JOIN puestos_trabajos ON empleados.id_puesto_trabajo = puestos_trabajos.id_puesto_trabajo
JOIN areas_trabajos ON puestos_trabajos.id_area = areas_trabajos.id_area
WHERE puestos_trabajos.sueldo > 300;


-- Cuales disfraces fueron alquilados en un tiempo determinado
SELECT productos.id_producto, productos.nombre, alquiler_disfraz.fecha_alquiler, alquiler_disfraz.fecha_devolucion, alquiler_disfraz.estado_deposito
FROM alquiler_disfraz 
JOIN facturas ON alquiler_disfraz .id_factura = facturas.id_factura 
JOIN productos ON alquiler_disfraz.id_producto = productos.id_producto
WHERE facturas.fecha BETWEEN '2024-01-01' AND '2024-06-30';


-- Listar los accesorios que sean de "Calaveras" .
SELECT productos.nombre, productos.descripcion, categorias.nombre AS categoria, productos.precio_venta
FROM productos
JOIN categorias ON productos.id_categoria = categorias.id_categoria
WHERE productos.nombre LIKE '%calavera%' AND categorias.nombre = 'Accesorio';


-- Contar la cantidad de productos por cada categoria 
SELECT categorias.nombre AS categoria , COUNT(productos.id_categoria) AS total_productos
FROM productos
JOIN  categorias ON productos.id_categoria = categorias.id_categoria
GROUP BY productos.id_categoria;


-- Listar los productos que tienen un costo mayor al precio promedio de todos los productos.
SELECT * 
FROM productos 
WHERE productos.precio_venta > (SELECT AVG(productos.precio_venta) FROM productos);

-- Actualizar el precio de todos los productos de la categoría 'Disfraz' en un 5%.
UPDATE productos
SET productos.precio_venta = productos.precio_venta * 1.05
WHERE productos.id_categoria = (SELECT categorias.id_categoria FROM categorias WHERE categorias.nombre = 'Disfraz');

-- Listar todos los productos que tienen que ver con tematica zombi 
SELECT productos.nombre, productos.descripcion, categorias.nombre AS categoria, productos.precio_venta
FROM productos
JOIN categorias ON productos.id_categoria = categorias.id_categoria
WHERE productos.nombre LIKE '%zombi%';

-- Consultar las decoraciones que tienen un precio de venta menor a 15.00.
SELECT productos.id_producto, productos.nombre AS accesorio, productos.precio_venta
FROM productos
WHERE productos.precio_venta < 20.00 AND productos.id_categoria = 2
ORDER BY productos.nombre ASC;

-- Contar la cantidad de productos de maquillaje por tono. 
SELECT tonos.nombre AS Tono, COUNT(maquillaje.id_tono) AS total_productos_maquillaje
FROM maquillaje
JOIN tonos ON maquillaje.id_tono = tonos.id_tono
WHERE maquillaje.stock > 0
GROUP BY maquillaje.id_tono
ORDER BY tonos.nombre;

-- Contar la cantidad de disfraces por color.
SELECT colores.nombre AS Color, COUNT(disfraces.id_color) AS total_productos_disfraces
FROM disfraces
JOIN colores ON disfraces.id_color = colores.id_color
WHERE disfraces.stock_venta > 0 AND disfraces.stock_alquiler > 0
GROUP BY disfraces.id_color
ORDER BY colores.nombre;






