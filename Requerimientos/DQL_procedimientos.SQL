


USE disfraces_doña_ruca;

-- PROCEDIMIENTOS ALMACENADOS

--Registrar una nueva venta:
--Crear procedimientos que inserte una nueva venta en la tabla facturas, actualizando automáticamente el inventario de productos involucrados en la venta.


-- Se registra transaccion --------------------------------------
DELIMITER $$
CREATE PROCEDURE registrar_transaccion(
    IN p_valor_total DECIMAL (10,2),
    IN p_fecha_hora DATETIME,
    IN p_id_metodo_pago INT,
    OUT p_ultima_transaccion INT
)
BEGIN
    IF p_valor_total < 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El valor total no puede ser negativo.';
    END IF;
    INSERT INTO transacciones(valor_total, fecha_hora, id_metodo_pago)
    VALUES (p_valor_total, p_fecha_hora, p_id_metodo_pago);
    SET p_ultima_transaccion = LAST_INSERT_ID();
END $$
DELIMITER ;

SET @ultima_transaccion = 0;
CALL registrar_transaccion(50,'2024-10-28 08:34:00', 1, @ultima_transaccion);

SELECT * FROM transacciones;


-- se registra factura a Cliente de ultima transaccion --------------------------------------
DELIMITER $$
CREATE PROCEDURE registrar_factura(
    IN p_fecha DATE,
    IN p_id_cliente INT,
    IN p_id_transacion INT,
    IN p_id_empleado INT,
    OUT p_numero_factura INT
)
BEGIN
    DECLARE valor_vacio DECIMAL(10,2) DEFAULT 0.00;

    IF p_fecha < CURDATE() THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'La fecha de la factura no puede ser anterior a hoy';
    END IF;

    INSERT INTO facturas(fecha, total, id_cliente, id_transacion, id_empleado)
    VALUES(p_fecha, valor_vacio, p_id_cliente, p_id_transacion, p_id_empleado);
    SET p_numero_factura = LAST_INSERT_ID();
END $$
DELIMITER ;

SET @ultima_factura = 0;
CALL registrar_factura('2024-10-28', 1, @ultima_transaccion, 2, @ultima_factura);

SELECT * FROM facturas;


-- se registra venta_producto de la ultima factura  --------------------------------------
DELIMITER $$
CREATE PROCEDURE registrar_productos_factura(
    IN p_id_factura INT,
    IN p_id_producto VARCHAR(100),
    IN p_cantidad VARCHAR(100)
)
BEGIN
    DECLARE un_producto VARCHAR(100);
    DECLARE un_cantidad VARCHAR(100);
    productos_loop:LOOP
        IF p_id_producto = '' THEN
            LEAVE productos_loop;
        END IF;
    
        SET un_producto = SUBSTRING_INDEX(p_id_producto, ',', 1);
        SET un_cantidad = SUBSTRING_INDEX(p_cantidad, ',', 1);
        
        INSERT INTO venta_producto (id_factura, id_producto, cantidad)
        VALUES (p_id_factura, CAST(un_producto AS UNSIGNED), CAST(un_cantidad AS UNSIGNED));

        SET p_id_producto = SUBSTRING(p_id_producto, LOCATE(',', p_id_producto)+1);
        SET p_cantidad = SUBSTRING(p_cantidad, LOCATE(',', p_cantidad)+1);

    END LOOP productos_loop;
END $$
DELIMITER ;

CALL registrar_productos_factura(@ultima_factura, '1,2,15,100', '10,50,30,50');
SELECT * FROM venta_producto;


-- Se registra alquiler de ultima factura --------------------------------------
DELIMITER $$
CREATE PROCEDURE registrar_alquiler_disfraz(
    IN p_id_factura INT,
    IN p_id_producto INT,
    IN p_fecha_alquiler DATE,
    IN p_fecha_devolucion DATE,
    IN p_cantidad INT
)
BEGIN
    DECLARE total_deposito DECIMAL(10,2) DEFAULT 0.00;
    DECLARE deposito_guardado DECIMAL(10,2) DEFAULT 0.00;
    DECLARE valor_actualizar DECIMAL(10,2) DEFAULT 0.00;

-- valor deposito de producto actual
    SELECT SUM(p.precio_venta * p_cantidad) INTO total_deposito
    FROM productos p
    WHERE p.id_producto = p_id_producto;

-- valor deposito guardado con anterioridad
    SELECT ad.valor_deposito INTO deposito_guardado
    FROM alquiler_disfraz ad
    WHERE ad.id_factura = p_id_factura;

-- suma de variables
    SELECT deposito_guardado + total_deposito INTO valor_actualizar;

-- Insertar datos
    INSERT INTO alquiler_disfraz (id_factura, id_producto, fecha_alquiler, fecha_devolucion, valor_deposito, cantidad, estado_deposito)
    VALUES (p_id_factura, p_id_producto, p_fecha_alquiler, p_fecha_devolucion, valor_actualizar, p_cantidad, 'Pendiente');
END $$
DELIMITER ;

CALL registrar_alquiler_disfraz(@ultima_factura, 100, '2024-10-28', '2024-10-30', 5);

SELECT * FROM alquiler_disfraz;


-- actualizar el valor factura de la ultima factura --------------------------------------
DELIMITER $$
CREATE PROCEDURE actualizar_valor_factura(
    IN p_id_factura INT
)
BEGIN
    DECLARE valor_total_venta DECIMAL(10,2) DEFAULT 0.00;
    DECLARE valor_total_alquiler DECIMAL(10,2) DEFAULT 0.00;
    DECLARE total_dias_alquiler INT DEFAULT 0;

-- Se crea tabla reusable para Suma de todos los alquileres x dias
    WITH x AS(
    SELECT ad.id_producto, 
            ad.cantidad, 
            DATEDIFF(ad.fecha_alquiler, ad.fecha_devolucion) AS dias,
            d.precio_alquiler
    FROM alquiler_disfraz ad
    JOIN disfraces d ON ad.id_producto = d.id_producto
    WHERE ad.id_factura = p_id_factura
    )
    SELECT SUM(dias*precio_alquiler) INTO valor_total_alquiler FROM x;

-- Suma las ventas
    SELECT SUM(p.precio_venta * vp.cantidad) INTO valor_total_venta
    FROM venta_producto vp
    JOIN productos p ON vp.id_producto = p.id_producto
    WHERE vp.id_factura = p_id_factura;

-- Actualizar total factura
    UPDATE facturas
    SET total = valor_total_venta + valor_total_alquiler
    WHERE id_factura = p_id_factura;
END $$
DELIMITER ;

CALL actualizar_valor_factura(@ultima_factura);

SELECT * FROM facturas;


-- actualizar sotck de ventas con base a la ultima factura  -------------------
DELIMITER $$
CREATE PROCEDURE actualizar_inventario(
    IN p_id_factura INT
)
BEGIN
    DECLARE categoria_modificar INT DEFAULT 0;
    DECLARE producto_vendido INT DEFAULT 0;
    DECLARE cantidad_vendida INT DEFAULT 0;
    DECLARE cantidad_actual INT DEFAULT 0;
    DECLARE cantidad_iterar INT DEFAULT 0;
    DECLARE contador INT DEFAULT 0;

    -- Cursor para iterar sobre los productos vendidos en la factura
    DECLARE cur_productos CURSOR FOR
    SELECT vp.id_producto, vp.cantidad
    FROM venta_producto vp
    WHERE vp.id_factura = p_id_factura;
    -- Handler para cerrar el cursor en caso de terminar
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET contador = cantidad_iterar;
    
    -- veces para iterar
    SELECT COUNT(vp.id_producto) INTO cantidad_iterar
    FROM venta_producto vp
    WHERE vp.id_factura = p_id_factura;

    -- invoco consulta iterable de datos productos, cantidades
    OPEN cur_productos;

    -- recorro los datos
    lectura_loop: LOOP

        -- Salir del loop si se han procesado todos los productos
        IF contador >= cantidad_iterar THEN
            LEAVE lectura_loop;
        END IF;

    -- Obtener el producto vendido y la cantidad vendida
        FETCH cur_productos INTO producto_vendido, cantidad_vendida;

    -- Obtener la categoría del producto
        SELECT p.id_categoria INTO categoria_modificar
        FROM productos p
        WHERE p.id_producto = producto_vendido;

    -- Actualizar el stock según la categoría    
        CASE 
            WHEN categoria_modificar = 1 THEN
                SELECT m.stock INTO cantidad_actual
                FROM maquillaje m
                WHERE m.id_producto = producto_vendido;

                UPDATE maquillaje 
                SET stock = cantidad_actual - cantidad_vendida
                WHERE id_producto = producto_vendido;

            WHEN categoria_modificar = 2 THEN
                SELECT d.stock INTO cantidad_actual
                FROM decoraciones d
                WHERE d.id_producto = producto_vendido;

                UPDATE decoraciones 
                SET stock = cantidad_actual - cantidad_vendida
                WHERE id_producto = producto_vendido;

            WHEN categoria_modificar = 3 THEN
                SELECT a.stock INTO cantidad_actual
                FROM accesorios a
                WHERE a.id_producto = producto_vendido;

                UPDATE accesorios 
                SET stock = cantidad_actual - cantidad_vendida
                WHERE id_producto = producto_vendido;

            WHEN categoria_modificar = 4 THEN
                SELECT d.stock_venta INTO cantidad_actual
                FROM disfraces d
                WHERE d.id_producto = producto_vendido;

                UPDATE disfraces 
                SET stock_venta = cantidad_actual - cantidad_vendida
                WHERE id_producto = producto_vendido;
            ELSE
                SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'La categoria es incorrecta';
            END CASE;

        SET contador = contador + 1;
    END LOOP;
    CLOSE cur_productos;
END $$
DELIMITER ;

CALL actualizar_inventario(@ultima_factura);

SELECT p.id_producto, p.id_categoria FROM productos p WHERE p.id_producto = 1;
SELECT m.id_producto, m.stock FROM maquillaje m;


-- Actualizar stock alquiler disfraces ultima factura -------------------
DELIMITER $$
CREATE PROCEDURE actualizar_stock_alquiler_disfraces(
    IN p_id_factura INT
)
BEGIN
    DECLARE producto_alquilado INT DEFAULT 0;
    DECLARE cantidad_alquilada INT DEFAULT 0;
    DECLARE cantidad_actual INT DEFAULT 0;
    DECLARE cantidad_iterar INT DEFAULT 0;
    DECLARE contador INT DEFAULT 0;

    -- Cursor para iterar sobre los productos vendidos en la factura
    DECLARE cur_productos CURSOR FOR
    SELECT ad.id_producto, ad.cantidad
    FROM alquiler_disfraz ad
    WHERE ad.id_factura = p_id_factura;
    -- Handler para cerrar el cursor en caso de terminar
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET contador = cantidad_iterar;
    
    -- veces para iterar
    SELECT COUNT(ad.id_producto) INTO cantidad_iterar
    FROM alquiler_disfraz ad
    WHERE ad.id_factura = p_id_factura;

    -- invoco consulta iterable de datos productos, cantidades
    OPEN cur_productos;

    -- recorro los datos
    lectura_loop: LOOP

        -- Salir del loop si se han procesado todos los productos
        IF contador >= cantidad_iterar THEN
            LEAVE lectura_loop;
        END IF;

    -- Obtener el producto alquilado y la cantidad alquilado
        FETCH cur_productos INTO producto_alquilado, cantidad_alquilada;

        SELECT d.stock_alquiler INTO cantidad_actual
        FROM disfraces d
        WHERE d.id_producto = producto_alquilado;

        UPDATE disfraces 
        SET stock_alquiler = cantidad_actual - cantidad_alquilada
        WHERE id_producto = producto_alquilado;

        SET contador = contador + 1;
    END LOOP;
    CLOSE cur_productos;
END $$
DELIMITER ;

CALL actualizar_stock_alquiler_disfraces(@ultima_factura);

SELECT * FROM disfraces WHERE id_producto = 100;



-- Registrar compras a los proveedores y sus actualizacion al inventario de ventas

-- Registrar Factura de Proveedor --------------------------------------
DELIMITER $$
CREATE PROCEDURE registrar_factura_proveedor(
    IN p_fecha DATE,
    IN p_nit INT,
    OUT p_numero_factura_proveedor INT
)
BEGIN
    DECLARE valor_vacio DECIMAL(10,2) DEFAULT 0.00;
    INSERT INTO facturas_proveedor(fecha, total, nit)
    VALUES(p_fecha, valor_vacio, p_nit);
    SET p_numero_factura_proveedor = LAST_INSERT_ID();
END $$
DELIMITER ;

SET @ultima_factura_proveedor = 0;
CALL registrar_factura_proveedor('2024-10-28', 123456789, @ultima_factura_proveedor);

SELECT * FROM facturas_proveedor;


-- se registra compra_producto de la ultima factura  --------------------------------------
DELIMITER $$
CREATE PROCEDURE registrar_compra_producto(
    IN p_id_factura INT,
    IN p_id_producto VARCHAR(100),
    IN p_cantidad VARCHAR(100)
)
BEGIN
    DECLARE un_producto VARCHAR(100);
    DECLARE un_cantidad VARCHAR(100);
    productos_loop:LOOP
        IF p_id_producto = '' THEN
            LEAVE productos_loop;
        END IF;
    
        SET un_producto = SUBSTRING_INDEX(p_id_producto, ',', 1);
        SET un_cantidad = SUBSTRING_INDEX(p_cantidad, ',', 1);
        
        INSERT INTO compra_producto (id_factura_proveedor, id_producto, cantidad)
        VALUES (p_id_factura, CAST(un_producto AS UNSIGNED), CAST(un_cantidad AS UNSIGNED));

        SET p_id_producto = SUBSTRING(p_id_producto, LOCATE(',', p_id_producto)+1);
        SET p_cantidad = SUBSTRING(p_cantidad, LOCATE(',', p_cantidad)+1);

    END LOOP productos_loop;
END $$
DELIMITER ;

CALL registrar_compra_producto(@ultima_factura_proveedor, '1,2,15,100', '10,50,30,50');

SELECT * FROM compra_producto;


-- actualizar el valor factura_proveedor de la ultima factura ---------------------------
DELIMITER $$
CREATE PROCEDURE actualizar_valor_factura_proveedor(
    IN p_id_factura INT
)
BEGIN
    DECLARE valor_total_compra DECIMAL(10,2) DEFAULT 0.00;

-- Suma las compras
    SELECT SUM(p.costo * cp.cantidad) INTO valor_total_compra
    FROM compra_producto cp
    JOIN productos p ON cp.id_producto = p.id_producto
    WHERE cp.id_factura_proveedor = p_id_factura;

-- Actualizar total factura
    UPDATE facturas_proveedor
    SET total = valor_total_compra 
    WHERE id_factura_proveedor = p_id_factura;
END $$
DELIMITER ;

CALL actualizar_valor_factura_proveedor(@ultima_factura_proveedor);

SELECT * FROM facturas_proveedor;


-- actualizar sotck de compras con base a la ultima factura_proveedor -------------------
DELIMITER $$
CREATE PROCEDURE actualizar_compra_inventario(
    IN p_id_factura INT
)
BEGIN
    DECLARE categoria_modificar INT DEFAULT 0;
    DECLARE producto_comprado INT DEFAULT 0;
    DECLARE cantidad_comprada INT DEFAULT 0;
    DECLARE cantidad_actual INT DEFAULT 0;
    DECLARE cantidad_iterar INT DEFAULT 0;
    DECLARE contador INT DEFAULT 0;

    -- Cursor para iterar sobre los productos comprados en la factura
    DECLARE cur_productos CURSOR FOR
    SELECT cp.id_producto, cp.cantidad
    FROM compra_producto cp
    WHERE cp.id_factura_proveedor = p_id_factura;
    -- Handler para cerrar el cursor en caso de terminar
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET contador = cantidad_iterar;
    
    -- veces para iterar
    SELECT COUNT(cp.id_producto) INTO cantidad_iterar
    FROM compra_producto cp
    WHERE cp.id_factura_proveedor = p_id_factura;

    -- invoco consulta iterable de datos productos, cantidades
    OPEN cur_productos;

    -- recorro los datos
    lectura_loop: LOOP

        -- Salir del loop si se han procesado todos los productos
        IF contador >= cantidad_iterar THEN
            LEAVE lectura_loop;
        END IF;

    -- Obtener el producto vendido y la cantidad vendida
        FETCH cur_productos INTO producto_comprado, cantidad_comprada;

    -- Obtener la categoría del producto
        SELECT p.id_categoria INTO categoria_modificar
        FROM productos p
        WHERE p.id_producto = producto_comprado;

    -- Actualizar el stock según la categoría    
        CASE 
            WHEN categoria_modificar = 1 THEN
                SELECT m.stock INTO cantidad_actual
                FROM maquillaje m
                WHERE m.id_producto = producto_comprado;

                UPDATE maquillaje 
                SET stock = cantidad_actual + cantidad_comprada
                WHERE id_producto = producto_comprado;

            WHEN categoria_modificar = 2 THEN
                SELECT d.stock INTO cantidad_actual
                FROM decoraciones d
                WHERE d.id_producto = producto_comprado;

                UPDATE decoraciones 
                SET stock = cantidad_actual + cantidad_comprada
                WHERE id_producto = producto_comprado;

            WHEN categoria_modificar = 3 THEN
                SELECT a.stock INTO cantidad_actual
                FROM accesorios a
                WHERE a.id_producto = producto_comprado;

                UPDATE accesorios 
                SET stock = cantidad_actual + cantidad_comprada
                WHERE id_producto = producto_comprado;

            WHEN categoria_modificar = 4 THEN
                SELECT d.stock_venta INTO cantidad_actual
                FROM disfraces d
                WHERE d.id_producto = producto_comprado;

                UPDATE disfraces 
                SET stock_venta = cantidad_actual + cantidad_comprada
                WHERE id_producto = producto_comprado;
            ELSE
                SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'La categoria es incorrecta';
            END CASE;

        SET contador = contador + 1;
    END LOOP;
    CLOSE cur_productos;
END $$
DELIMITER ;

CALL actualizar_compra_inventario(@ultima_factura_proveedor);

SELECT p.id_producto, p.id_categoria FROM productos p WHERE p.id_producto = 1;
SELECT m.id_producto, m.stock FROM maquillaje m;




-- 12 actualizar estado_deposito segun fecha de entega
DELIMITER //

CREATE PROCEDURE procesar_devolucion_disfraz(IN p_id_factura INT)
BEGIN
    IF (SELECT COUNT(*) FROM alquiler_disfraz WHERE id_factura = p_id_factura) = 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Error: id_factura no existe';
    ELSE
        UPDATE alquiler_disfraz
        SET estado_deposito = CASE
            WHEN CURDATE() <= fecha_devolucion THEN 'Entregado'
            WHEN CURDATE() > fecha_devolucion THEN 'Cobrado'
			ELSE estado_deposito
		END
        WHERE id_factura = p_id_factura;
    END IF;
    
END//

DELIMITER ;

-- Llamada al procedimiento 
CALL procesar_devolucion_disfraz(49); 
SELECT * FROM alquiler_disfraz ;

-- 13 Registrar un nuevo proveedor 
DELIMITER //
CREATE PROCEDURE registrar_proveedor(
    IN nit BIGINT,
    IN nombre_empresa VARCHAR(100),
    IN nombre_contacto VARCHAR(100),
    IN telefono VARCHAR(100),
    IN correo VARCHAR(100),
    IN direccion VARCHAR(100),
    IN id_ciudad_pueblo INT,
    IN zipcode INT
)
BEGIN
    INSERT INTO proveedores (nit, nombre_empresa, nombre_contacto, telefono, correo, direccion, id_ciudad_pueblo, zipcode)
    VALUES (nit, nombre_empresa, nombre_contacto, telefono, correo, direccion, id_ciudad_pueblo, zipcode);
END//

DELIMITER ;

-- Llamada al procedimiento 
CALL registrar_proveedor(
    989898666,            
    'Boo',               
    'boo',               
    '3001234557',       
    'boo@maquillje.com', 
    'calle 13',         
    1,                   
    110011               
);

SELECT * FROM proveedores;

-- 14 Regisrar empleado 
DELIMITER //
CREATE PROCEDURE registrar_empleado(
    IN nombre VARCHAR(100) ,
    IN telefono VARCHAR(100)  ,
    IN correo VARCHAR(100) ,
    IN direccion VARCHAR(100) ,
    IN id_ciudad_pueblo INT ,
    IN zipcode INT,
    IN fecha_contratacion DATE,
    IN id_puesto_trabajo INT,
    IN estado ENUM('Activo','Inactivo')
)
BEGIN
	INSERT INTO empleados(nombre, telefono, correo, direccion, id_ciudad_pueblo, zipcode, fecha_contratacion, id_puesto_trabajo, estado)
    VALUE (nombre, telefono, correo, direccion, id_ciudad_pueblo, zipcode, fecha_contratacion, id_puesto_trabajo, estado);
END//
DELIMITER ;

-- Llamado procedimiento 
CALL registrar_empleado(
	'Juanito Alimaña',
    '3213331923',
    'Juanito2Alimaña@gmail.com',
    'calle siempreviva',
    1,
    1234,
    '2024-10-24',
    2,
    'Activo'
);

SELECT * FROM empleados;

-- 15 registrar producto
DELIMITER //
CREATE  PROCEDURE registrar_producto (
    nombre VARCHAR(255) ,
    descripcion TEXT,
    precio_venta DECIMAL(10, 2),
    id_categoria INT,
    id_marca INT,
    costo DECIMAL(10,2)
)
BEGIN
	INSERT INTO productos(nombre, descripcion, precio_venta, id_categoria,id_marca, costo)
    VALUES(nombre, descripcion, precio_venta, id_categoria,id_marca, costo);
END //
DELIMITER ;

-- Llamado procedimiento 
CALL registrar_producto(
	'Broncer',
    'Broncer para la cara',
    10.00,
    2,
    1,
    5.00
);

SELECT * FROM productos;

-- 16 registrar maquillaje 

DELIMITER //
CREATE PROCEDURE registrar_producto_maquillaje (
	id_producto INT,
    fecha_expiracion DATE ,
    id_tipo_maquillaje INT ,
    id_tono INT ,
    stock INT 
)
BEGIN
	DECLARE categoria_producto INT;

    
    SELECT productos.id_categoria INTO categoria_producto
    FROM productos
    WHERE productos.id_producto = id_producto;

    
    IF categoria_producto IS NULL THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Error.';
    ELSEIF categoria_producto != 1 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Error: el producto no pertenece a la categoría MAQUILLAJE.';
    END IF;

    
    INSERT INTO maquillaje (id_producto, fecha_expiracion, id_tipo_maquillaje, id_tono, stock)
    VALUES (id_producto, fecha_expiracion, id_tipo_maquillaje, id_tono, stock);
END //
DELIMITER ;
 
 -- llamado procedimiento
 CALL registrar_producto_maquillaje (
	142,
    '2027-10-24',
    1,
    1,
    20
 );
 SELECT * FROM maquillaje;
-- 17 aumentar un porcentaje los precios de producto segun categoria
 DELIMITER //
 CREATE PROCEDURE actualizar_precios_productos(
	IN porcentaje_aumento DECIMAL(5,2), 
    IN id_categoria INT)
BEGIN
	UPDATE productos
    SET productos.precio_venta = ROUND(precio_venta * (1 + (porcentaje_aumento / 100)), 2)
    WHERE productos.id_categoria = id_categoria;
END//
DELIMITER ;

-- llamado procedimiento 
CALL actualizar_precios_productos(10.00,1);
SELECT * FROM productos;
-- 18 reporte_ventas_periodo
DELIMITER // 
CREATE PROCEDURE reporte_ventas_periodo(
	IN fecha_inicio DATE,
    IN fecha_fin DATE 
)
BEGIN
	SELECT SUM(facturas.total) AS Total_vendido
    FROM facturas
    WHERE facturas.fecha BETWEEN fecha_inicio AND fecha_fin;

END//
DELIMITER ;

-- llamado procedimiento
CALL reporte_ventas_periodo ('2023-05-01', '2023-06-18');

-- 19 actualizar_estado_envio

DELIMITER //
CREATE PROCEDURE actualizar_estado_envio(IN id_envio INT)
BEGIN
 UPDATE envios
 SET estado = CASE
	WHEN DATEDIFF(CURDATE(),fecha_envio) >= 1 AND DATEDIFF(CURDATE(), fecha_envio) < 3 THEN 'Recogido'
    WHEN DATEDIFF(CURDATE(),fecha_envio) >= 3 AND DATEDIFF(CURDATE(), fecha_envio) < 10 THEN 'En transito'
    WHEN DATEDIFF(CURDATE(),fecha_envio) >= 10 THEN 'Entregado'
    ELSE estado
END
WHERE envios.id_envio = id_envio;
END//
DELIMITER ;

-- llamado procedimiento
CALL actualizar_estado_envio(18);

SELECT * FROM ENVIOS;

-- 20 crear_envio
DELIMITER //
CREATE PROCEDURE crear_envio(
	direccion_envio VARCHAR(100) ,
    id_ciudad_pueblo INT,
    zipcode INT,
    nit_transportadora BIGINT,
    fecha_envio DATE,
    id_factura INT
)
BEGIN
	IF fecha_envio < CURDATE() THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'La fecha de la factura no puede ser anterior a hoy';
    END IF;
	INSERT INTO envios (estado, direccion_envio, id_ciudad_pueblo, zipcode, nit_transportadora, fecha_envio, id_factura) 
	VALUES ('Preparacion', direccion_envio, id_ciudad_pueblo, zipcode, nit_transportadora, fecha_envio, id_factura) ;
END//
DELIMITER ;

-- Llamado procedimiento
CALL crear_envio(
	'CALLE 20',
    1,
    1111222,
    1234569,
    '2024-10-23',
    51
);
SELECT * FROM ENVIOS;



