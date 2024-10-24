
USE disfraces_doña_ruca;


CREATE USER 'admin'@'localhost' IDENTIFIED BY 'admin_dueño';
GRANT ALL PRIVILEGES ON *.* TO 'admin'@'localhost' WITH GRANT OPTION;
FLUSH PRIVILEGES;
-- VENDEDOR-------------------VENDEDOR----------------VENDEDOR-----

CREATE USER 'vendedor'@'localhost' IDENTIFIED BY 'vendedor_ventas';
GRANT SELECT, INSERT, UPDATE ON disfraces_doña_ruca.clientes TO 'vendedor'@'localhost';
GRANT SELECT, INSERT, UPDATE ON disfraces_doña_ruca.facturas TO 'vendedor'@'localhost';
GRANT SELECT, INSERT, UPDATE ON disfraces_doña_ruca.transacciones TO 'vendedor'@'localhost';
GRANT SELECT, INSERT, UPDATE ON disfraces_doña_ruca.venta_producto TO 'vendedor'@'localhost';
GRANT SELECT, INSERT, UPDATE ON disfraces_doña_ruca.alquiler_disfraz TO 'vendedor'@'localhost';
GRANT SELECT, INSERT, UPDATE ON disfraces_doña_ruca.productos TO 'vendedor'@'localhost';
GRANT SELECT, INSERT, UPDATE ON disfraces_doña_ruca.disfraces TO 'vendedor'@'localhost';
GRANT SELECT, INSERT, UPDATE ON disfraces_doña_ruca.maquillaje TO 'vendedor'@'localhost';
GRANT SELECT, INSERT, UPDATE ON disfraces_doña_ruca.decoraciones TO 'vendedor'@'localhost';
GRANT SELECT, INSERT, UPDATE ON disfraces_doña_ruca.accesorios TO 'vendedor'@'localhost';
GRANT SELECT, INSERT ON disfraces_doña_ruca.tonos TO 'vendedor'@'localhost';
GRANT SELECT, INSERT ON disfraces_doña_ruca.tipos_maquillaje TO 'vendedor'@'localhost';
GRANT SELECT, INSERT ON disfraces_doña_ruca.tipos_decoraciones TO 'vendedor'@'localhost';
GRANT SELECT, INSERT ON disfraces_doña_ruca.materiales TO 'vendedor'@'localhost';
GRANT SELECT, INSERT ON disfraces_doña_ruca.tipos_accesorios TO 'vendedor'@'localhost';
GRANT SELECT, INSERT ON disfraces_doña_ruca.colores TO 'vendedor'@'localhost';
GRANT SELECT, INSERT ON disfraces_doña_ruca.tallas TO 'vendedor'@'localhost';
GRANT SELECT, INSERT ON disfraces_doña_ruca.tematicas TO 'vendedor'@'localhost';
FLUSH PRIVILEGES;

-- PROVEEDORES--------------PROVEEDORES--------------PROVEEDORES----------PROVEEDORES


CREATE USER 'encargado_proveedores'@'localhost' IDENTIFIED BY 'proveedores_provellendo';
GRANT SELECT, INSERT, UPDATE, DELETE ON disfraces_doña_ruca.proveedores TO 'encargado_proveedores'@'localhost';
GRANT SELECT, INSERT, UPDATE ON disfraces_doña_ruca.facturas_proveedores TO 'encargado_proveedores'@'localhost';
GRANT SELECT, INSERT, UPDATE ON disfraces_doña_ruca.compra_producto TO 'encargado_proveedores'@'localhost';
GRANT SELECT, INSERT ON disfraces_doña_ruca.ciudades_pueblos TO 'encargado_proveedores'@'localhost';
GRANT SELECT, INSERT ON disfraces_doña_ruca.departamentos_estados TO 'encargado_proveedores'@'localhost';
GRANT SELECT, INSERT ON disfraces_doña_ruca.paises TO 'encargado_proveedores'@'localhost';

FLUSH PRIVILEGES;

-- GERENTE ---------- GERENTE ---------- GERENTE ---------- GERENTE ----------


CREATE USER 'gerente'@'localhost' IDENTIFIED BY 'gerente_gerencioso';
GRANT SELECT, INSERT, UPDATE, DELETE ON disfraces_doña_ruca.tipos_gastos TO 'gerente'@'localhost';
GRANT SELECT, INSERT, UPDATE ON disfraces_doña_ruca.gastos_operativos TO 'gerente'@'localhost';
GRANT SELECT, INSERT, UPDATE, DELETE ON disfraces_doña_ruca.areas_trabajo TO 'gerente'@'localhost';
GRANT SELECT, INSERT, UPDATE, DELETE ON disfraces_doña_ruca.puestos_trabajos TO 'gerente'@'localhost';
GRANT SELECT, INSERT, UPDATE ON disfraces_doña_ruca.empleados TO 'gerente'@'localhost';
FLUSH PRIVILEGES;


-- ALMACEN--------- ALMACEN--------- ALMACEN--------- ALMACEN--------- 

CREATE USER 'encargado_almacen'@'localhost' IDENTIFIED BY 'almacen_almacenado';
GRANT SELECT, UPDATE, INSERT ON disfraces_doña_ruca.envios TO 'encargado_almacen'@'localhost';
GRANT SELECT ON disfraces_doña_ruca.facturas TO 'encargado_almacen'@'localhost';
GRANT SELECT ON disfraces_doña_ruca.transportadoras TO 'encargado_almacen'@'localhost';
GRANT SELECT, INSERT, UPDATE, DELETE ON disfraces_doña_ruca.productos TO 'vendedor'@'localhost';
GRANT SELECT, INSERT, UPDATE ON disfraces_doña_ruca.disfraces TO 'vendedor'@'localhost';
GRANT SELECT, INSERT, UPDATE ON disfraces_doña_ruca.maquillaje TO 'vendedor'@'localhost';
GRANT SELECT, INSERT, UPDATE ON disfraces_doña_ruca.decoraciones TO 'vendedor'@'localhost';
GRANT SELECT, INSERT, UPDATE ON disfraces_doña_ruca.accesorios TO 'vendedor'@'localhost';
GRANT SELECT, INSERT, UPDATE ON disfraces_doña_ruca.tonos TO 'vendedor'@'localhost';
GRANT SELECT, INSERT, UPDATE ON disfraces_doña_ruca.tipos_maquillaje TO 'vendedor'@'localhost';
GRANT SELECT, INSERT, UPDATE ON disfraces_doña_ruca.tipos_decoraciones TO 'vendedor'@'localhost';
GRANT SELECT, INSERT, UPDATE ON disfraces_doña_ruca.materiales TO 'vendedor'@'localhost';
GRANT SELECT, INSERT, UPDATE ON disfraces_doña_ruca.tipos_accesorios TO 'vendedor'@'localhost';
GRANT SELECT, INSERT, UPDATE ON disfraces_doña_ruca.colores TO 'vendedor'@'localhost';
GRANT SELECT, INSERT, UPDATE ON disfraces_doña_ruca.tallas TO 'vendedor'@'localhost';
GRANT SELECT, INSERT, UPDATE ON disfraces_doña_ruca.tematicas TO 'vendedor'@'localhost';
FLUSH PRIVILEGES;






