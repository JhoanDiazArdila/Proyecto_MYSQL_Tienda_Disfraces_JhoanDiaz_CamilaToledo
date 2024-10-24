

CREATE DATABASE disfraces_doña_ruca; 

USE disfraces_doña_ruca;



-- 1. Tabla categorias
CREATE TABLE IF NOT EXISTS categorias (
    id_categoria INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) UNIQUE NOT NULL
);

-- 2. Tabla marcas
CREATE TABLE IF NOT EXISTS marcas (
    id_marca INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) UNIQUE NOT NULL
);

-- 3. Tabla tematicas
CREATE TABLE IF NOT EXISTS tematicas (
    id_tematica INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) UNIQUE NOT NULL
);

-- 4. Tabla colores
CREATE TABLE IF NOT EXISTS colores (
    id_color INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) UNIQUE NOT NULL
);

-- 5. Tabla tallas
CREATE TABLE IF NOT EXISTS tallas (
    id_talla INT AUTO_INCREMENT PRIMARY KEY,
    talla VARCHAR(100) UNIQUE NOT NULL
);

-- 6. Tabla materiales
CREATE TABLE IF NOT EXISTS materiales (
    id_material INT AUTO_INCREMENT PRIMARY KEY,
    material VARCHAR(100) UNIQUE NOT NULL
);

-- 7. Tabla tipos_accesorios
CREATE TABLE IF NOT EXISTS tipos_accesorios (
    id_tipo_accesorio INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) UNIQUE NOT NULL
);

-- 8. Tabla tipos_decoraciones
CREATE TABLE IF NOT EXISTS tipos_decoraciones (
    id_tipo_decoracion INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) UNIQUE NOT NULL
);

-- 9. Tabla tipos_maquillaje
CREATE TABLE IF NOT EXISTS tipos_maquillaje (
    id_tipo_maquillaje INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) UNIQUE NOT NULL
);

-- 10. Tabla tonos
CREATE TABLE IF NOT EXISTS tonos (
    id_tono INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) UNIQUE NOT NULL
);

-- 11. Tabla productos
CREATE TABLE IF NOT EXISTS productos (
    id_producto INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(255) NOT NULL,
    descripcion TEXT NOT NULL,
    precio_venta DECIMAL(10, 2)  NOT NULL,
    id_categoria INT  NOT NULL,
    id_marca INT  NOT NULL,
    costo DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (id_categoria) REFERENCES categorias(id_categoria),
    FOREIGN KEY (id_marca) REFERENCES marcas(id_marca)
);

-- 12. Tabla disfraces
CREATE TABLE IF NOT EXISTS disfraces (
    id_producto INT NOT NULL PRIMARY KEY,
    genero ENUM('Masculino', 'Femenino', 'Unisex'),
    tipo_usuario ENUM('Niños', 'Adultos'),
    id_tematica INT NOT NULL,
    id_color INT NOT NULL,
    id_talla INT NOT NULL,
    stock_venta INT NOT NULL,
    stock_alquiler INT NOT NULL,
    precio_alquiler DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (id_tematica) REFERENCES tematicas(id_tematica),
    FOREIGN KEY (id_color) REFERENCES colores(id_color),
    FOREIGN KEY (id_talla) REFERENCES tallas(id_talla),
    FOREIGN KEY (id_producto) REFERENCES productos(id_producto)
);

-- 13. Tabla accesorios
CREATE TABLE IF NOT EXISTS accesorios (
    id_producto INT NOT NULL PRIMARY KEY,
    tamaño VARCHAR(100) NOT NULL,
    id_material INT NOT NULL,
    id_tipo_accesorio INT NOT NULL,
    id_color INT NOT NULL,
    stock INT NOT NULL,
    FOREIGN KEY (id_material) REFERENCES materiales(id_material),
    FOREIGN KEY (id_tipo_accesorio) REFERENCES tipos_accesorios(id_tipo_accesorio),
    FOREIGN KEY (id_producto) REFERENCES productos(id_producto),
    FOREIGN KEY (id_color) REFERENCES colores(id_color)
);

-- 14. Tabla decoraciones
CREATE TABLE IF NOT EXISTS decoraciones (
    id_producto INT NOT NULL PRIMARY KEY,
    tamaño VARCHAR(100) NOT NULL,
    id_tipo_decoracion INT NOT NULL,
    id_color INT NOT NULL,
    stock INT NOT NULL,
    FOREIGN KEY (id_tipo_decoracion) REFERENCES tipos_decoraciones(id_tipo_decoracion),
    FOREIGN KEY (id_color) REFERENCES colores(id_color),
    FOREIGN KEY (id_producto) REFERENCES productos(id_producto)
);

-- 15. Tabla maquillaje
CREATE TABLE IF NOT EXISTS maquillaje (
    id_producto INT NOT NULL PRIMARY KEY,
    fecha_expiracion DATE NOT NULL,
    id_tipo_maquillaje INT NOT NULL,
    id_tono INT NOT NULL,
    stock INT NOT NULL,
    FOREIGN KEY (id_tipo_maquillaje) REFERENCES tipos_maquillaje(id_tipo_maquillaje),
    FOREIGN KEY (id_tono) REFERENCES tonos(id_tono),
    FOREIGN KEY (id_producto) REFERENCES productos(id_producto)
);

-- 16. Tabla paises
CREATE TABLE IF NOT EXISTS paises (
    id_pais INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) UNIQUE NOT NULL
);

-- 17. Tabla departamentos_estados
CREATE TABLE IF NOT EXISTS departamentos_estados (
    id_departamento_estado INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    id_pais INT NOT NULL,
    FOREIGN KEY (id_pais) REFERENCES paises(id_pais)
);

-- 18. Tabla ciudades_pueblos
CREATE TABLE IF NOT EXISTS ciudades_pueblos (
    id_ciudad_pueblo INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    id_departamento_estado INT NOT NULL,
    FOREIGN KEY (id_departamento_estado) REFERENCES departamentos_estados(id_departamento_estado)
);

-- 19. Tabla areas_trabajos
CREATE TABLE IF NOT EXISTS areas_trabajos (
    id_area INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) UNIQUE NOT NULL
);

-- 20. Tabla puestos_trabajos
CREATE TABLE IF NOT EXISTS puestos_trabajos (
    id_puesto_trabajo INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) UNIQUE NOT NULL,
    descripcion TEXT NOT NULL,
    id_area INT NOT NULL,
    sueldo DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (id_area) REFERENCES areas_trabajos(id_area)
);

-- 21. Tabla empleados
CREATE TABLE IF NOT EXISTS empleados (
    id_empleado INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    telefono VARCHAR(100) UNIQUE NOT NULL,
    correo VARCHAR(100) UNIQUE NOT NULL,
    direccion VARCHAR(100) NOT NULL,
    id_ciudad_pueblo INT NOT NULL,
    zipcode INT NOT NULL,
    fecha_contratacion DATE NOT NULL,
    id_puesto_trabajo INT,
    estado ENUM('Activo','Inactivo'),
    FOREIGN KEY (id_ciudad_pueblo) REFERENCES ciudades_pueblos(id_ciudad_pueblo),
    FOREIGN KEY (id_puesto_trabajo) REFERENCES puestos_trabajos(id_puesto_trabajo)
);

-- 22. Tabla clientes
CREATE TABLE IF NOT EXISTS clientes (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    telefono VARCHAR(100) UNIQUE NOT NULL,
    correo VARCHAR(100) NOT NULL,
    direccion VARCHAR(100) NOT NULL,
    id_ciudad_pueblo INT NOT NULL,
    zipcode INT NOT NULL,
    estado ENUM('Activo','Inactivo') NOT NULL,
    vip BOOLEAN NOT NULL,
    FOREIGN KEY (id_ciudad_pueblo) REFERENCES ciudades_pueblos(id_ciudad_pueblo)
);

-- 23. Tabla metodos_pago
CREATE TABLE IF NOT EXISTS metodos_pago (
    id_metodo_pago INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) UNIQUE NOT NULL
);

-- 24. Tabla transacciones
CREATE TABLE IF NOT EXISTS transacciones (
    id_transacion INT AUTO_INCREMENT PRIMARY KEY,
    valor_total DECIMAL(10,2) NOT NULL,
    fecha_hora DATETIME NOT NULL,
    id_metodo_pago INT NOT NULL,
    FOREIGN KEY (id_metodo_pago) REFERENCES metodos_pago(id_metodo_pago)
);

-- 25. Tabla facturas
CREATE TABLE IF NOT EXISTS facturas (
    id_factura INT AUTO_INCREMENT PRIMARY KEY,
    fecha DATE NOT NULL,
    total DECIMAL (10,2) NOT NULL,
    id_cliente INT NOT NULL,
    id_transacion INT NOT NULL,
    id_empleado INT NOT NULL,
    FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente),
    FOREIGN KEY (id_transacion) REFERENCES transacciones(id_transacion),
    FOREIGN KEY (id_empleado) REFERENCES empleados(id_empleado)
);

-- 26. Tabla alquiler_disfraz
CREATE TABLE IF NOT EXISTS alquiler_disfraz (
    id_factura INT NOT NULL,
    id_producto INT NOT NULL, 
    fecha_alquiler DATE NOT NULL,
    fecha_devolucion DATE NOT NULL,
    valor_deposito DECIMAL(10,2) NOT NULL,
    cantidad INT NOT NULL,
    estado_deposito ENUM('Pendiente','Entregado','Cobrado') NOT NULL,
    FOREIGN KEY (id_factura) REFERENCES facturas(id_factura),
    FOREIGN KEY (id_producto) REFERENCES disfraces(id_producto),
    PRIMARY KEY (id_factura, id_producto)
);

-- 27. Tabla proveedores
CREATE TABLE IF NOT EXISTS proveedores (
    nit BIGINT PRIMARY KEY,
    nombre_empresa VARCHAR(100) UNIQUE NOT NULL,
    nombre_contacto VARCHAR(100) NOT NULL,
    telefono VARCHAR(100) UNIQUE NOT NULL,
    correo VARCHAR(100) UNIQUE NOT NULL,
    direccion VARCHAR(100) NOT NULL,
    id_ciudad_pueblo INT NOT NULL,
    zipcode INT NOT NULL,
    FOREIGN KEY (id_ciudad_pueblo) REFERENCES ciudades_pueblos(id_ciudad_pueblo)
);

-- 28. Tabla facturas_proveedor
CREATE TABLE IF NOT EXISTS facturas_proveedor (
    id_factura_proveedor INT AUTO_INCREMENT PRIMARY KEY,
    fecha DATE NOT NULL,
    total DECIMAL(10,2) NOT NULL,
    nit BIGINT NOT NULL,
    FOREIGN KEY (nit) REFERENCES proveedores(nit)
);

-- 29. Tabla transportadoras
CREATE TABLE IF NOT EXISTS transportadoras (
    nit_transportadora BIGINT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    telefono VARCHAR(100) UNIQUE NOT NULL,
    correo VARCHAR(100) UNIQUE NOT NULL
);

-- 30. Tabla envios
CREATE TABLE IF NOT EXISTS envios (
    id_envio INT AUTO_INCREMENT PRIMARY KEY,
    estado ENUM('Preparacion','Recogido','En transito','Entregado') NOT NULL,
    direccion_envio VARCHAR(100) NOT NULL,
    id_ciudad_pueblo INT NOT NULL,
    zipcode INT NOT NULL,
    nit_transportadora BIGINT NOT NULL,
    fecha_envio DATE NOT NULL,
    id_factura INT NOT NULL,
    FOREIGN KEY (id_ciudad_pueblo) REFERENCES ciudades_pueblos(id_ciudad_pueblo),
    FOREIGN KEY (nit_transportadora) REFERENCES transportadoras(nit_transportadora),
    FOREIGN KEY (id_factura) REFERENCES facturas(id_factura)
);

-- 31. Tabla tipos_gastos
CREATE TABLE IF NOT EXISTS tipos_gastos (
    id_tipo_gasto INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) UNIQUE NOT NULL 
);

-- 32. Tabla Gastos_operativos
CREATE TABLE IF NOT EXISTS gastos_operativos (
    id_gasto INT AUTO_INCREMENT PRIMARY KEY,
    id_tipo_gasto INT NOT NULL,
    descripcion TEXT,
    fecha_pago DATE NOT NULL,
    valor DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (id_tipo_gasto) REFERENCES tipos_gastos(id_tipo_gasto)
);

-- 33. Tabla compra_producto
CREATE TABLE IF NOT EXISTS compra_producto (
    id_factura_proveedor INT NOT NULL,
    id_producto INT NOT NULL,
    cantidad INT NOT NULL,
    FOREIGN KEY (id_factura_proveedor) REFERENCES facturas_proveedor(id_factura_proveedor),
    FOREIGN KEY (id_producto) REFERENCES productos(id_producto),
    PRIMARY KEY (id_factura_proveedor, id_producto)
);

-- 34. Tabla venta_producto
CREATE TABLE IF NOT EXISTS venta_producto (
    id_factura INT NOT NULL,
    id_producto INT NOT NULL,
    cantidad INT NOT NULL,
    FOREIGN KEY (id_factura) REFERENCES facturas(id_factura),
    FOREIGN KEY (id_producto) REFERENCES productos(id_producto),
    PRIMARY KEY (id_factura, id_producto)
);
























