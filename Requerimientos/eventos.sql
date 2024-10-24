
-- EVENTOS ------- EVENTOS ------- EVENTOS ------- EVENTOS ------- EVENTOS -------



-- 1. Borrar facturas de mas de 2 años

CREATE EVENT borrar_facturas_antiguas
ON SCHEDULE EVERY 1 MONTH
STARTS '2024-11-01 10:00:00'
DO
BEGIN
    DELETE FROM facturas 
    WHERE fecha < NOW() - INTERVAL 1 YEAR;
END;

-- 2. Actualizar estado clientes inactivos

CREATE EVENT actualizarestado_clientess
ON SCHEDULE EVERY 1 MONTH
STARTS '2024-11-01 10:00:00'
DO
BEGIN
    UPDATE clientes SET estado = 'Inactivo'
    WHERE id_cliente NOT IN (
        SELECT id_cliente 
        FROM facturas 
        WHERE fecha > NOW() - INTERVAL 1 YEAR
    );
END;


-- 3. Borrar proveedores donde no hay compras por mas de 2 años
CREATE EVENT borrar_proveedores_sin_compras
ON SCHEDULE EVERY 1 MONTH
STARTS '2024-11-01 10:00:00'
DO
BEGIN
    DELETE FROM proveedores 
    WHERE nit NOT IN(
        SELECT nit 
        FROM facturas_proveedor 
        WHERE fecha > NOW() - INTERVAL 2 YEAR
    );
END;


-- 4. Borrar facturas de mas de 3 años para depurar datos
CREATE EVENT borrar_compras
ON SCHEDULE EVERY 1 WEEK
STARTS '2024-11-01 10:00:00'
DO
BEGIN
    DELETE FROM facturas_proveedor 
    WHERE fecha < NOW() - INTERVAL 3 YEAR;
END;

-- 5. Limpiar tabla de pedidos de productos a proveedores
CREATE EVENT limpiar_pedidos_compras
ON SCHEDULE EVERY 2 WEEK
STARTS '2024-11-01 10:00:00'
DO
BEGIN
    DELETE FROM compra_producto
    WHERE fecha < NOW() - INTERVAL 2 YEAR;
END;

-- 6. Actualizar clientes VIP
CREATE EVENT actualizar_clientes_vip
ON SCHEDULE EVERY 1 WEEK
STARTS '2024-11-01 10:00:00'
DO
BEGIN
    UPDATE clientes 
    SET vip = CASE
        WHEN (SELECT SUM(f.total)
                FROM facturas f
                JOIN clientes c ON f.id_cliente = c.id_cliente
            )> 10000.00 THEN 1 
        WHEN (SELECT COUNT(f.id_cliente) 
                FROM facturas f
                WHERE f.fecha > NOW() - INTERVAL 9 MONTH
            )> 3 THEN 1
        ELSE 0
    END CASE;
END;

-- 7. Cobrar deposito 1 dia despues de la fecha de devolucion
CREATE EVENT cobrar_deposito
ON SCHEDULE EVERY 1 DAY
DO
BEGIN
    UPDATE alquiler_disfraz
    SET estado_deposito = 'Cobrado'
    WHERE fecha_devolucion < CURDATE()
        AND estado_deposito != 'Entregado';
END;

-- 8. Desactivar clientes inactivos después de 1 año y medio
CREATE EVENT desactivar_cliente_inactivo
ON SCHEDULE EVERY 1 MONTH
DO
BEGIN
    UPDATE clientes c
    SET estado = 'Inactivo'
    WHERE c.id_cliente NOT IN(
        SELECT f.id_cliente
        FROM facturas f
        WHERE f.fecha >= NOW() - INTERVAL 18 MONTH 
            AND estado = 'Activo'
    );
END;


-- 9. Enviar alerta por expiración de maquillaje
CREATE EVENT alerta_producto_expirado
ON SCHEDULE EVERY 1 DAY
DO
BEGIN
    UPDATE maquillaje
    SET stock = 0  
    WHERE fecha_expiracion = CURDATE();
END;


-- 10. Actualizacion de envios cuando van mas de 3 semanas
CREATE EVENT actualizar_envios
ON SCHEDULE EVERY 1 DAY
DO
BEGIN
    UPDATE envios
    SET estado = 'Entregado'
    WHERE fecha_envio < CURDATE() - INTERVAL 3 WEEK
        AND estado NOT IN ('Entregado','Preparacion');
END;


-- 11. Bajar precio a productos no vendidos en mas de 6 meses
CREATE EVENT bajar_precio_productos
ON SCHEDULE EVERY 1 WEEK
DO
BEGIN
    UPDATE productos
    SET precio_venta = precio_venta * 0.6
    WHERE id_producto NOT IN(
        SELECT vp.id_producto
        FROM venta_producto vp 
        JOIN facturas f ON vp.id_factura = f.id_factura
        WHERE f.fecha >= NOW() - INTERVAL 6 MONTH
    );
END;


-- 12. Aplicar descuentos de temporada en productos por Halloween
CREATE EVENT aplicar_descuentos_temporada
ON SCHEDULE EVERY 1 YEAR 
START '2024-10-01 00:00:00'
DO
BEGIN
    UPDATE productos
    SET precio_venta = precio_venta * 0.85
    WHERE id_producto IN (
        SELECT d.id_producto
        FROM disfraces d
        JOIN tematicas t ON d.id_tematica = d.id_tematica
        WHERE t.nombre = 'Villanos'
    );
END;


-- 13. Restaura stock de alquiler despues de devolucion
CREATE EVENT restar_stock_alquiler
ON SCHEDULE EVERY 1 DAY
DO
BEGIN
    DECLARE cantidad_devuelta INT DEFAULT 0;
    DECLARE cantidad_actual INT DEFAULT 0;
    DECLARE producto_alquilado INT DEFAULT 0;

    DECLARE cur_productos CURSOR FOR
    SELECT ad.id_producto, ad.cantidad
    FROM alquiler_disfraz ad
    WHERE ad.estado_deposito = 'Entregado';
    -- Handler para cerrar el cursor en caso de terminar
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET producto_alquilado = NULL;

    OPEN cur_productos;
    lectura_loop: LOOP
        FETCH cur_productos INTO producto_alquilado, cantidad_devuelta;

        SELECT d.stock_alquiler INTO cantidad_actual
        FROM disfraces d
        WHERE d.id_producto = producto_alquilado;

        UPDATE disfraces 
        SET stock_alquiler = cantidad_actual + cantidad_devuelta
        WHERE id_producto = producto_alquilado;

    END LOOP;
    CLOSE cur_productos;
END;


-- 14. mostrar alerta de transacciones diferentes al valor de factura

CREATE TABLE IF NOT EXISTS alertas(
    id INT AUTO_INCREMENT PRIMARY KEY,
    alerta TEXT NOT NULL,
    fecha_hora DATETIME NOT NULL
);


CREATE EVENT mostrar_alertas_transacciones
ON SCHEDULE EVERY 4 HOUR
DO
BEGIN
    DECLARE p_id_factura INT;
    DECLARE p_id_transaccion INT;
    DECLARE p_valor_transaccion DECIMAL(10, 2);
    DECLARE p_valor_total DECIMAL(10, 2);
    DECLARE alerta_msg VARCHAR(255);
    
    -- Seleccionamos las transacciones que no coinciden con el valor de la factura
    DECLARE cur_alertas CURSOR FOR
    SELECT t.id_transacion AS 'ID transaccion', 
            t.valor_total AS 'valor transaccion', 
            f.id_factura AS 'ID factura',
            f.total AS 'valor factura'
    FROM facturas f
    JOIN  transacciones t ON f.id_transacion = t.id_transacion
    WHERE t.valor_total != f.total;
    
    -- Manejo para cerrar el cursor cuando no haya más filas
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET p_id_transaccion = NULL;
    -- Abre el cursor
    OPEN cur_alertas;

    lectura_loop: LOOP

        FETCH cur_alertas INTO p_id_transaccion, p_valor_transaccion, p_id_factura, p_valor_total;

        IF p_id_transaccion IS NULL THEN
            LEAVE lectura_loop;
        END IF;

        INSERT INTO alertas (alerta,fecha_hora)
        VALUES (CONCAT('La transacción con ID ',p_id_transaccion,' por valor',p_valor_transaccion,' no coincide con el valor de la factura ',p_id_factura,' por valor ',p_valor_total),NOW());
    END LOOP;

    CLOSE cur_alertas;
END;


-- 15. Bloquear clientes VIP si no realizan compras en 2 año
CREATE EVENT IF NOT EXISTS bloquear_clientes_vip
ON SCHEDULE EVERY 1 MONTH
DO
BEGIN
    UPDATE clientes
    SET vip = 0
    WHERE id_cliente IN(
        SELECT id_cliente 
        FROM facturas 
        WHERE fecha < CURDATE() - INTERVAL 2 YEAR
            AND vip = 1;
    );
END;

-- 16. Recalcular venta de productos según inflación anual
CREATE EVENT IF NOT EXISTS recalcular_costos_productos
ON SCHEDULE EVERY 1 YEAR
DO
BEGIN
    UPDATE productos
    SET precio_venta = precio_venta * 1.05; --aplico un 5%
END;


-- 17. Eliminar transacciones canceladas
CREATE EVENT IF NOT EXISTS eliminar_transacciones_canceladas
ON SCHEDULE EVERY 1 DAY
DO
BEGIN
    DELETE FROM transacciones
    WHERE id_transacion IN (
        SELECT id_transacion
        FROM transacciones
        WHERE valor_total = 0.00
    );

-- 18. Eliminar transacciones de mas de 3 años
CREATE EVENT IF NOT EXISTS eliminar_transacciones_antiguas
ON SCHEDULE EVERY 1 MONTH
DO
BEGIN
    DELETE FROM transacciones
    WHERE fecha_hora < NOW() - INTERVAL 3 YEAR;
END;


-- 19. Aumentar sueldo en 5% cada año
CREATE EVENT IF NOT EXISTS aumento_sueldo
ON SCHEDULE EVERY 1 YEAR
START '2025-01-01 00:00:00'
DO
BEGIN
    UPDATE puestos_trabajos
    SET sueldo = sueldo * 1.05;
END;

-- 20. Actualizar estado de envío a "En transito" 2 dia despues de fecha envio
CREATE EVENT IF NOT EXISTS actualizar_estado_envio_transito
ON SCHEDULE EVERY 1 DAY
DO
BEGIN
    UPDATE envios
    SET estado = 'En transito'
    WHERE fecha_envio + INTERVAL 2 DAY = CURDATE();
END;

