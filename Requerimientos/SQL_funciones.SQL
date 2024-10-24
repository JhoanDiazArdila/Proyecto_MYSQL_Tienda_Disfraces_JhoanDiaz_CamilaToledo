USE disfraces_doña_ruca;

-- 1. Calcular el total de compras a proveedores
DELIMITER //
CREATE FUNCTION total_compras_proveedor(nit BIGINT)
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
    RETURN (SELECT SUM(facturas_proveedor.total)
            FROM facturas_proveedor
            WHERE facturas_proveedor.nit = nit);
END// 
DELIMITER ;

-- Llamado funcion
SELECT total_compras_proveedor(123456789);

-- 2 disfraces_mas_alquilados(anio INT)
DELIMITER //

CREATE FUNCTION disfraz_mas_alquilado(anio INT)
RETURNS VARCHAR(100)
DETERMINISTIC
BEGIN
    DECLARE resultado VARCHAR(100);

    SELECT productos.nombre INTO resultado
    FROM alquiler_disfraz
    JOIN facturas ON alquiler_disfraz.id_factura = facturas.id_factura
    JOIN disfraces ON alquiler_disfraz.id_producto = disfraces.id_producto
    JOIN productos ON disfraces.id_producto = productos.id_producto
    WHERE YEAR(facturas.fecha) = anio
    GROUP BY disfraces.id_producto
    ORDER BY SUM(alquiler_disfraz.cantidad) DESC
    LIMIT 1;

    RETURN resultado;
END //

DELIMITER ;

-- Llamado funcion
SELECT disfraz_mas_alquilado(2023) ;


-- 3 costos_por_area_anualmente(id_area INT, anio INT)
DELIMITER //

CREATE FUNCTION costos_por_area_anualmente(id_area INT)
RETURNS DECIMAL(10, 2)
DETERMINISTIC
BEGIN
    DECLARE total_costos DECIMAL(10, 2);

    SELECT SUM(puestos_trabajos.sueldo)* 12  INTO total_costos
    FROM puestos_trabajos
    JOIN areas_trabajos ON puestos_trabajos.id_area =  areas_trabajos.id_area
    WHERE puestos_trabajos.id_area = id_area;

    RETURN IFNULL(total_costos, 0.00);  
END //

DELIMITER ;

-- Llamado funcion
SELECT costos_por_area_anualmente(1) ;

-- 4 rentabilidad_por_producto(id_producto INT)
DELIMITER //

CREATE FUNCTION rentabilidad_por_producto(id_producto INT)
RETURNS DECIMAL(10, 2)
DETERMINISTIC
BEGIN
    DECLARE total_ingresos DECIMAL(10, 2);
    DECLARE total_costos DECIMAL(10, 2);
    DECLARE rentabilidad DECIMAL(10, 2);

    SELECT SUM(venta_producto.cantidad * productos.precio_venta) INTO total_ingresos
    FROM venta_producto
    JOIN productos ON venta_producto.id_producto = productos.id_producto
    WHERE productos.id_producto = id_producto;

    SELECT SUM(compra_producto.cantidad * productos.costo) INTO total_costos
    FROM compra_producto
    JOIN productos ON compra_producto.id_producto = productos.id_producto
    WHERE productos.id_producto = id_producto;

    SET rentabilidad = IFNULL(total_ingresos, 0.00) - IFNULL(total_costos, 0.00);
	RETURN rentabilidad; 
END //

DELIMITER ;

-- Llamado funcion
SELECT rentabilidad_por_producto(93) ;


-- 6 tiempo_promedio_alquiler_por_tipo(tipo_usuario ENUM)
DELIMITER //

CREATE FUNCTION tiempo_promedio_alquiler_por_tipo(id_disfraz INT)
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
    DECLARE promedio_tiempo DECIMAL(10,2);

    SELECT AVG(DATEDIFF(alquiler_disfraz.fecha_devolucion, alquiler_disfraz.fecha_alquiler)) INTO promedio_tiempo
    FROM alquiler_disfraz 
    JOIN productos ON alquiler_disfraz.id_producto = productos.id_producto
	JOIN disfraces ON productos.id_producto = disfraces.id_producto
    WHERE disfraces.id_producto = id_disfraz;

    RETURN IFNULL(promedio_tiempo, 0);  
END //

DELIMITER ;

-- Llamado funcion
SELECT tiempo_promedio_alquiler_por_tipo(93) AS tiempo_promedio;



-- 7 costos_operativos_anuales(anio INT)
DELIMITER //

CREATE FUNCTION costos_operativos_anuales(año INT)
RETURNS DECIMAL(10, 2)
DETERMINISTIC
BEGIN
    DECLARE total_costos DECIMAL(10, 2);

    SELECT SUM(gastos_operativos.valor) INTO total_costos
    FROM gastos_operativos
    WHERE YEAR(gastos_operativos.fecha_pago) = año; 

    RETURN IFNULL(total_costos, 0);  
END //

DELIMITER ;

-- Llamado funcion
SELECT costos_operativos_anuales(2024) AS total_costos_operativos;


-- 8 dias_promedio_devolucion(id_producto INT)
DELIMITER //

CREATE FUNCTION dias_promedio_devolucion(id_producto INT)
RETURNS DECIMAL(10, 2)
DETERMINISTIC
BEGIN
    DECLARE promedio_dias DECIMAL(10, 2);

    SELECT AVG(DATEDIFF(alquiler_disfraz.fecha_devolucion, alquiler_disfraz.fecha_alquiler)) INTO promedio_dias
    FROM alquiler_disfraz
    WHERE alquiler_disfraz.id_producto = id_producto; 

    RETURN IFNULL(promedio_dias, 0);  
END //

DELIMITER ;

-- Llamado funcion
SELECT dias_promedio_devolucion(93) AS promedio_dias_devolucion;

-- 9 rentabilidad_total_por_categoria(id_categoria INT) (Calcula la rentabilidad total (ingresos menos costos) de una categoría específica.)
DELIMITER //

CREATE FUNCTION rentabilidad_total_por_categoria(id_categoria INT)
RETURNS DECIMAL(10, 2)
DETERMINISTIC
BEGIN
    DECLARE total_ingresos DECIMAL(10, 2);
    DECLARE total_costos DECIMAL(10, 2);
    DECLARE rentabilidad_total DECIMAL(10, 2);

    
    SELECT 
        SUM(facturas.total) INTO total_ingresos
    FROM facturas
    JOIN venta_producto ON facturas.id_factura = venta_producto.id_factura
    JOIN productos ON venta_producto.id_producto = productos.id_producto
    WHERE productos.id_categoria = id_categoria;  

    SELECT 
        SUM(compra_producto.cantidad * productos.costo) INTO total_costos
    FROM compra_producto
    JOIN productos ON compra_producto.id_producto = productos.id_producto
    WHERE productos.id_categoria = id_categoria;  

    SET rentabilidad_total = total_ingresos - total_costos;

    RETURN IFNULL(rentabilidad_total, 0);  -- Retornar 0 si no hay registros
END //

DELIMITER ;

-- Llamado funcion
SELECT rentabilidad_total_por_categoria(3) AS rentabilidad_total;


-- 10 costos_operativos_mensuales(mes INT año INT)
DELIMITER //

CREATE FUNCTION costos_operativos_mensuales(mes INT, anio INT)
RETURNS DECIMAL(10, 2)
DETERMINISTIC
BEGIN
    DECLARE total_costos_operativos DECIMAL(10, 2);

    
    SELECT SUM(gastos_operativos.valor) INTO total_costos_operativos
    FROM gastos_operativos
    WHERE MONTH(gastos_operativos.fecha_pago) = mes AND  YEAR(gastos_operativos.fecha_pago) = anio;    

    RETURN IFNULL(total_costos_operativos, 0); 
END //

DELIMITER ;

-- Llamado funcion
SELECT costos_operativos_mensuales(4, 2024) AS total_costos_operativos;

-- 11 ventas_producto_año(id_producto INT, año INT)
DELIMITER //

CREATE FUNCTION ventas_producto_año(id_producto INT, nombre VARCHAR(100))
RETURNS DECIMAL(10, 2)
READS SQL DATA
BEGIN
    DECLARE resultado DECIMAL(10, 2) DEFAULT 0;

    IF id_producto IS NOT NULL THEN
        SELECT SUM(venta_producto.cantidad * productos.precio_venta) INTO resultado
        FROM productos
        JOIN venta_producto ON productos.id_producto = venta_producto.id_producto
        WHERE venta_producto.id_producto = id_producto;
    ELSEIF nombre IS NOT NULL THEN
        SELECT SUM(venta_producto.cantidad * productos.precio_venta) INTO resultado
        FROM productos
        JOIN venta_producto ON productos.id_producto = venta_producto.id_producto
        WHERE productos.nombre = nombre;
    END IF;

    RETURN IFNULL(resultado, 0); 
END //

DELIMITER ;

-- Llamado funcion
SELECT ventas_producto_año(1,NULL) AS ventas_producto_año ;


-- 12 Listar todos los productos de maquillaje de un tipo especifico (por ejemplo, "Sombras").
DELIMITER $$
CREATE FUNCTION listar_productos(
    tipo VARCHAR(100)
)
RETURNS TEXT
READS SQL DATA
BEGIN
    DECLARE resultado TEXT DEFAULT '';
    SELECT GROUP_CONCAT(productos.nombre SEPARATOR ', ') INTO resultado
    FROM productos 
    JOIN categorias  ON productos.id_categoria = categorias.id_categoria
    JOIN maquillaje ON productos.id_producto = maquillaje.id_producto
    JOIN tipos_maquillaje  ON maquillaje.id_tipo_maquillaje = tipos_maquillaje.id_tipo_maquillaje
    WHERE tipos_maquillaje.nombre = tipo;
    RETURN resultado;
END $$
DELIMITER ;

-- Llamado funcion
SELECT listar_productos('Sombras') AS productos;


-- 13 disfraces_mas_alquilados(anio INT)
DELIMITER //

CREATE FUNCTION disfraz_mas_vendido(anio INT)
RETURNS VARCHAR(100)
DETERMINISTIC
BEGIN
    DECLARE resultado VARCHAR(100);

	SELECT productos.nombre
	INTO resultado 
	FROM venta_producto
	JOIN facturas ON venta_producto.id_factura = facturas.id_factura
	JOIN disfraces ON venta_producto.id_producto = disfraces.id_producto
	JOIN productos ON disfraces.id_producto = productos.id_producto
	WHERE YEAR(facturas.fecha) = anio
	GROUP BY disfraces.id_producto
	ORDER BY SUM(venta_producto.cantidad) DESC
	LIMIT 1;

    RETURN resultado;
END //

DELIMITER ;

-- Llamado funcion
SELECT disfraz_mas_vendido(2024) AS disfraz_mas_vendido;


-- 14 gastos_mensuales_por_tipo(año INT, mes INT) Calcula el total de gastos operativos por tipo en un mes específico
DELIMITER //

CREATE FUNCTION gastos_mensuales_por_tipo(año INT, mes INT, id_tipo_gasto INT)
RETURNS DECIMAL(10, 2)
READS SQL DATA
BEGIN
    DECLARE total_gastos DECIMAL(10, 2) DEFAULT 0;

    -- Calcular la suma de los gastos operativos por tipo para el mes y año especificados
    SELECT SUM(gastos_operativos.valor) INTO total_gastos
    FROM gastos_operativos
    WHERE YEAR(gastos_operativos.fecha_pago) = año AND  MONTH(gastos_operativos.fecha_pago) = mes AND  gastos_operativos.id_tipo_gasto = id_tipo_gasto;  
    RETURN IFNULL(total_gastos, 0);  
END //

DELIMITER ;

-- Llamado funcion
SELECT gastos_mensuales_por_tipo(2024, 04, 1) AS total_gastos;

-- 15 Calcular el total de ventas realizadas por un empleado en un mes dado.
DELIMITER //

CREATE FUNCTION ventas_totales_por_empleado(anio INT, mes INT, id_empleado INT)
RETURNS DECIMAL(10, 2)
READS SQL DATA
BEGIN
    DECLARE total_ventas DECIMAL(10, 2) DEFAULT 0;

    SELECT SUM(facturas.total) INTO total_ventas
    FROM facturas
    JOIN empleados ON facturas.id_empleado = empleados.id_empleado
    WHERE YEAR(facturas.fecha) = anio AND  MONTH(facturas.fecha) = mes AND  empleados.id_empleado = id_empleado;  
    RETURN IFNULL(total_ventas, 0);  
END //

DELIMITER ;

-- Llamado funcion
SELECT ventas_totales_por_empleado(2024, 10, 2) AS total_ventas;


-- 16 Consultar el stock TOTAL disponible de un disfraz por  identificador.
DELIMITER //

CREATE FUNCTION consultar_stock_producto(id_producto INT)
RETURNS INT
READS SQL DATA
BEGIN
    DECLARE stock_total INT DEFAULT 0;

    
   SELECT COALESCE(disfraces.stock_venta + disfraces.stock_alquiler, 0)
        INTO stock_total
        FROM disfraces
        JOIN productos ON disfraces.id_producto = productos.id_producto
        WHERE productos.id_producto = id_producto;

    RETURN stock_total;
END //

DELIMITER ;

-- Llamado funcion
SELECT consultar_stock_producto(93) AS stock_disponible;

-- 17 Mostrar la cantidad total de órdenes de compra realizadas a un proveedor específico en el último año.

DELIMITER //

CREATE FUNCTION total_ordenes_compra_proveedor(nit_proveedor BIGINT, anio INT)
RETURNS INT
READS SQL DATA
BEGIN
    DECLARE total_ordenes INT DEFAULT 0;

    
    SELECT COUNT(*) 
    INTO total_ordenes
    FROM facturas_proveedor
    WHERE facturas_proveedor.nit = nit_proveedor AND YEAR(facturas_proveedor.fecha) = anio;
    RETURN total_ordenes;
END //

DELIMITER ;

-- Llamado funcion
SELECT total_ordenes_compra_proveedor(123456789, 2020) AS total_ordenes;

-- 19 cantidad de  empleados que han trabajado más de un año en la tienda
DELIMITER //

CREATE FUNCTION empleados_mas_de_un_año()
RETURNS INT
READS SQL DATA
BEGIN
    DECLARE total_empleados INT DEFAULT 0;

    SELECT COUNT(*) 
    INTO total_empleados
    FROM empleados
    WHERE DATEDIFF(CURDATE(), empleados.fecha_contratacion) > 365 AND empleados.estado = 'Activo';
    
    RETURN total_empleados;
END //

DELIMITER ;

-- Llamado funcion
SELECT empleados_mas_de_un_año() AS empleados_con_mas_de_un_año;


-- 20 Obtener la cantidad total de productos vendidos en un día específico.

DELIMITER //

CREATE FUNCTION total_productos_vendidos_en_dia(fecha DATE)
RETURNS INT
READS SQL DATA
BEGIN
    DECLARE total_vendidos INT DEFAULT 0;

    
    SELECT SUM(venta_producto.cantidad)
    INTO total_vendidos
    FROM facturas
    JOIN venta_producto ON facturas.id_factura = venta_producto.id_factura
    WHERE facturas.fecha = fecha;

    RETURN total_vendidos;
END //

DELIMITER ;

-- Llamado funcion
SELECT total_productos_vendidos_en_dia('2024-10-19') AS total_vendidos;

