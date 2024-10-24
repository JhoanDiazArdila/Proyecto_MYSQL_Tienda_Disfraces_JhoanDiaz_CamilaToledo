
-- --------------------------------------------------------------------------

DELIMITER $$
CREATE TRIGGER before_insert_productos
BEFORE INSERT ON productos FOR EACH ROW 
BEGIN 
    IF NEW.precio_venta <= 0 THEN
        SET NEW.precio_venta = 100.00;
    END IF;
END $$
DELIMITER ;

-- --------------------------------------------------------------------------
DELIMITER $$
CREATE TRIGGER before_insert_facturas
BEFORE INSERT ON facturas FOR EACH ROW 
BEGIN 
    IF NEW.fecha < CURDATE() THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'La fecha no puede ser menor a la fecha actual';
    END IF;
END $$
DELIMITER ;


-- --------------------------------------------------------------------------
DELIMITER $$
CREATE TRIGGER after_insert_cliente
AFTER INSERT ON clientes FOR EACH ROW
BEGIN 
    INSERT INTO logs (mensaje,fecha)
    VALUES (CONCAT('Se inserto un nuevo cliente ',NEW.nombre,' a las ', NOW()));
END $$
DELIMITER ;

-- --------------------------------------------------------------------------
DELIMITER $$
CREATE TRIGGER before_delete_cliente
BEFORE DELETE ON clientes FOR EACH ROW
BEGIN
    IF OLD.estado = 'Activo' THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'No se puede eliminar un cliente activo';
    END IF;
END;

-- --------------------------------------------------------------------------
DELIMITER $$
CREATE TRIGGER after_update_cliente
AFTER UPDATE ON clientes FOR EACH ROW
BEGIN
    INSERT INTO logs (mensaje,fecha)
    VALUES (CONCAT('Se modifico un cliente a las ', NOW()));
END $$
DELIMITER ;

-- --------------------------------------------------------------------------
DELIMITER $$
CREATE TRIGGER after_insert_gasto_operativo
AFTER INSERT ON gastos_operativos FOR EACH ROW
BEGIN
    INSERT INTO logs(mensaje,fecha)
    VALUES (CONCAT('Se inserto un nuevo gasto operativo a las ', NOW()));
END $$
DELIMITER ;

-- --------------------------------------------------------------------------
DELIMITER $$
CREATE TRIGGER actualizar_inventario_alquiler
AFTER INSERT ON alquiler_disfraz FOR EACH ROW
BEGIN
    UPDATE disfraces
    SET stock_alquiler = stock_alquiler - NEW.cantidad
    WHERE id_producto = NEW.id_producto;
END $$
DELIMITER ;

-- --------------------------------------------------------------------------
DELIMITER $$
CREATE TRIGGER actualizar_inventario_compra
AFTER INSERT ON compra_producto FOR EACH ROW
BEGIN
    DECLARE categoria INT DEFAULT 0;
    SELECT p.id_categoria INTO categoria
    FROM compra_producto cp
    JOIN productos p ON cp.id_producto = p.id_producto
    WHERE p.id_producto = NEW.id_producto;
    CASE 
        WHEN categoria = 1 THEN
            UPDATE maquillaje
            SET stock = stock + NEW.cantidad
            WHERE id_producto = NEW.id_producto;
        WHEN categoria = 2 THEN
            UPDATE decoraciones
            SET stock = stock + NEW.cantidad
            WHERE id_producto = NEW.id_producto;
        WHEN categoria = 3 THEN
            UPDATE accesorios
            SET stock = stock + NEW.cantidad
            WHERE id_producto = NEW.id_producto;
        WHEN categoria = 4 THEN
            UPDATE disfraces
            SET stock_venta = stock_venta + NEW.cantidad
            WHERE id_producto = NEW.id_producto;
        ELSE
            SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'La categoria es incorrecta';
    END CASE;
END $$
DELIMITER ;


-- --------------------------------------------------------------------------
DELIMITER $$
CREATE TRIGGER actualizar_inventario_venta
AFTER INSERT ON venta_producto FOR EACH ROW
BEGIN
    DECLARE categoria INT DEFAULT 0;
    SELECT p.id_categoria INTO categoria
    FROM venta_producto vp
    JOIN productos p ON vp.id_producto = p.id_producto
    WHERE p.id_producto = NEW.id_producto;
    CASE 
        WHEN categoria = 1 THEN
            UPDATE maquillaje
            SET stock = stock - NEW.cantidad
            WHERE id_producto = NEW.id_producto;
        WHEN categoria = 2 THEN
            UPDATE decoraciones
            SET stock = stock - NEW.cantidad
            WHERE id_producto = NEW.id_producto;
        WHEN categoria = 3 THEN
            UPDATE accesorios
            SET stock = stock - NEW.cantidad
            WHERE id_producto = NEW.id_producto;
        WHEN categoria = 4 THEN
            UPDATE disfraces
            SET stock_venta = stock_venta - NEW.cantidad
            WHERE id_producto = NEW.id_producto;
        ELSE
            SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'La categoria es incorrecta';
    END CASE;
END $$
DELIMITER ;
-- --------------------------------------------------------------------------

DELIMITER $$
CREATE TRIGGER actualizar_valor_factura
AFTER INSERT ON venta_producto FOR EACH ROW
BEGIN
    DECLARE precio DECIMAL(10,2) DEFAULT 0.00;
    SELECT p.precio_venta INTO precio
    FROM productos p
    WHERE p.id_producto = NEW.id_producto;

    UPDATE factura
    SET total = total + (precio * NEW.cantidad)
    WHERE id_factura = NEW.id_factura;
END $$
DELIMITER ;
-- --------------------------------------------------------------------------


DELIMITER $$
CREATE TRIGGER actualizar_valor_factura_alquiler
AFTER INSERT ON alquiler_disfraz FOR EACH ROW
BEGIN

    DECLARE precio_final DECIMAL(10,2) DEFAULT 0.00;

    WITH x AS(
    SELECT DATEDIFF(ad.fecha_alquiler, ad.fecha_devolucion) AS dias,
            d.precio_alquiler
    FROM alquiler_disfraz ad
    JOIN disfraces d ON ad.id_producto = d.id_producto
    WHERE ad.id_factura = NEW.id_factura
    )
    SELECT SUM(x.dias * x.precio_alquiler) INTO precio_final FROM x;

    UPDATE factura
    SET total = total + (precio_final * NEW.cantidad)
    WHERE id_factura = NEW.id_factura;
END $$
DELIMITER ;

-- --------------------------------------------------------------------------


DELIMITER $$
CREATE TRIGGER actualizar_valor_factura_proveedor
AFTER INSERT ON compra_producto FOR EACH ROW
BEGIN
    DECLARE precio DECIMAL(10,2) DEFAULT 0.00;
    SELECT p.costo INTO precio
    FROM productos p
    WHERE p.id_producto = NEW.id_producto;

    UPDATE facturas_proveedores
    SET total = total + (precio * NEW.cantidad)
    WHERE id_factura = NEW.id_factura_proveedor;
END $$
DELIMITER ;
-- --------------------------------------------------------------------------

DELIMITER $$
CREATE TRIGGER actualizar_estado_envio
AFTER INSERT ON envios FOR EACH ROW
BEGIN
    UPDATE envios
    SET estado = 'Preparacion'
    WHERE id_factura = NEW.id_factura;
END $$
DELIMITER ;
-- --------------------------------------------------------------------------

DELIMITER $$
CREATE TRIGGER restriccion_fecha_factura
BEFORE INSERT ON transacciones FOR EACH ROW
BEGIN 
    IF NEW.fecha_hora < NOW()- INTERVAL 1 DAY THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'La fecha no puede ser menor al dia de ayer, Debe ser bajo supervision la venta';
    END IF;
END $$
DELIMITER ;

-- --------------------------------------------------------------------------

DELIMITER $$
CREATE TRIGGER validacion_pago_factura
BEFORE INSERT ON envios FOR EACH ROW
BEGIN
    DECLARE pago_factura DECIMAL(10,2) DEFAULT 0.00;
    DECLARE pago_transaccion DECIMAL(10,2) DEFAULT 0.00;

    SELECT f.total, 
            t.valor_total INTO pago_factura, pago_transaccion
    FROM facturas f
    JOIN transacciones t ON f.id_transacion = t.id_transacion
    WHERE f.id_factura = NEW.id_factura;

    IF pago_factura != pago_transaccion THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El pago de la factura no coincide los articulos no pueden ser enviados';
    END IF;
END $$
DELIMITER ;


-- ------------------------

DELIMITER $$
CREATE TRIGGER detener_adicion_tallas
BEFORE INSERT ON tallas FOR EACH ROW
BEGIN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Todas las tallas se encuentran contempladas';
END $$
DELIMITER ;








