# Proyecto :japanese_ogre: Tienda de Disfraces -- DOÑA RUCA -- :older_woman:

## 🔗 Índice

| Índice | Título |
| --- | --- |
| 📍 | Descripción del Proyecto |
| 📦 | Funcionalidades Implementadas |
| 🛠️ | Instalación y Configuración  |
| 🛡️ | Roles de Usuario y Permisos |
| ⚙️ | Procedimientos, Funciones, Triggers y Eventos  |
| 🤝 | Contribuciones  |

# Descripción del Proyecto

## Tienda de Disfraces "Disfraces Doña Ruca"

El proyecto "Disfraces Doña Ruca" es un sistema de gestión de base de datos relacional, diseñado específicamente para la administración eficiente de una tienda de disfraces. Esta solución integral tiene como objetivo facilitar la organización y el manejo de información crítica relacionada con productos, clientes, empleados, proveedores y transacciones comerciales.

### Propósito de la Base de Datos

La base de datos se ha creado con el propósito de proporcionar una plataforma robusta que permita:

- **Optimizar la Gestión de Inventario:** La base de datos permite un seguimiento efectivo de la disponibilidad y características de los productos, incluyendo disfraces, accesorios y maquillaje. Esto incluye información detallada como el nombre del producto, descripción, precio de venta, costos, stock disponible para venta y alquiler, así como atributos específicos como tallas, colores y materiales.

- **Facilitar la Administración de Clientes y Empleados:** Se registra información relevante de clientes, como datos de contacto, dirección y estado (activo/inactivo), así como la información de los empleados, incluyendo roles, salarios y fechas de contratación. Esto ayuda a mejorar la atención al cliente y la gestión del personal.

- **Controlar Transacciones de Venta y Alquiler:** La base de datos permite realizar un seguimiento detallado de las transacciones, ya sean de ventas o alquileres. Esto incluye la generación de facturas y el control de pagos, facilitando la gestión financiera del negocio.

- **Administrar Proveedores y Compras:** Mantiene un registro actualizado de proveedores y sus respectivas facturas, lo que facilita el control de compras y la gestión de gastos operativos. Esta funcionalidad asegura que la tienda tenga acceso a los materiales y productos necesarios para su operación.

- **Gestionar Envíos y Logística:** Se incorporan mecanismos para gestionar los envíos de productos, así como el estado de cada envío y su vinculación con las facturas, mejorando así la experiencia del cliente.

### Funcionalidades Implementadas

![Imagen de WhatsApp 2024-10-24 a las 09 30 17_c91927cd](https://github.com/user-attachments/assets/7b00c134-616c-4d53-b48b-ccc323bb1ce6)

La base de datos "Disfraces Doña Ruca" se compone de una serie de tablas interrelacionadas que permiten una gestión eficaz de la información. Algunas de las tablas más relevantes incluyen:

- **productos:** Almacena información detallada sobre cada producto, incluyendo disfraces, accesorios y maquillaje.
- **disfraces:** Contiene información específica sobre disfraces, como género, tipo de usuario y stock disponible.
- **accesorios:** Registra información sobre los accesorios disponibles, sus materiales y stock.
- **clientes:** Gestiona la información de los clientes, facilitando el seguimiento de transacciones y la atención personalizada.
- **empleados:** Permite la gestión del personal, incluyendo roles y permisos.
- **transacciones:** Documenta cada transacción realizada, vinculándola con el método de pago y el empleado que la gestionó.
- **facturas:** Genera facturas asociadas a las transacciones, garantizando una correcta documentación financiera.

Esta estructura relacional asegura la integridad y consistencia de los datos, permitiendo realizar consultas complejas y obtener información crítica para la toma de decisiones estratégicas en el negocio.


## Instalación y Configuración 🛠️

Para configurar el entorno y ejecutar la base de datos "Disfraces Doña Ruca", sigue los siguientes pasos:

### Requisitos del Sistema 🖥️

- **Sistema Operativo:** Linux
- **Software Necesario:**
  - MySQL versión X.X
  - MySQL Workbench

### Pasos para la Configuración 📋

1. **Instalación de MySQL:**
   - Asegúrate de tener MySQL instalado en tu sistema. Puedes instalarlo usando el gestor de paquetes de tu distribución de Linux. Por ejemplo, en Ubuntu:
     ```bash
     sudo apt update
     sudo apt install mysql-server
     ```

2. **Instalación de MySQL Workbench:**
   - Descarga e instala MySQL Workbench desde [aquí](https://dev.mysql.com/downloads/workbench/).

3. **Acceso a MySQL:**
   - Abre una terminal y accede a MySQL utilizando:
     ```bash
     mysql -u root -p
     ```

4. **Ejecución del archivo `ddl.sql`:**
   - Abre MySQL Workbench y conecta a tu servidor MySQL.
   - Crea una nueva consulta y ejecuta el siguiente comando para generar la estructura de la base de datos:
     ```sql
     SOURCE /ruta/a/tu/ddl.sql;
     ```
   - Esto creará todas las tablas necesarias para el proyecto "Disfraces Doña Ruca". 🎉

5. **Carga de Datos Iniciales con `dml.sql`:**
   - Después de ejecutar `ddl.sql`, ejecuta el siguiente comando para cargar los datos iniciales:
     ```sql
     SOURCE /ruta/a/tu/dml.sql;
     ```

6. **Ejecución de Consultas, Procedimientos, Funciones, Eventos y Triggers:**
   - Puedes ejecutar consultas SQL directamente en MySQL Workbench. Asegúrate de que cada consulta se ejecute de forma individual para evitar conflictos. ⚠️
   - Al final de cada procedimiento, función o trigger en tus archivos SQL, encontrarás ejemplos de llamadas y comprobaciones para verificar su funcionamiento.



## Roles de Usuario y Permisos 🛡️

El sistema cuenta con los siguientes roles de usuario, cada uno con permisos específicos:

### 1. Usuario Admin 🧑‍💼
- **Usuario:** admin
- **Contraseña:** admin_dueño
- **Permisos:**
  - Tiene todos los privilegios sobre todas las bases de datos y tablas (.*).
  - Puede conceder permisos a otros usuarios con la opción GRANT OPTION.

### 2. Usuario Vendedor 💰
- **Usuario:** vendedor
- **Contraseña:** vendedor_ventas
- **Permisos:**
  - Permisos para realizar operaciones de selección, inserción y actualización sobre las tablas relacionadas con clientes, facturas, transacciones, productos y más.

### 3. Usuario Encargado de Proveedores 🏢
- **Usuario:** encargado_proveedores
- **Contraseña:** proveedores_provellendo
- **Permisos:**
  - Puede realizar selección, inserción, actualización y eliminación de registros en las tablas relacionadas con proveedores y productos comprados.
  - También tiene permisos para insertar datos en las tablas de localización como ciudades, departamentos y países.

### 4. Usuario Gerente 📊
- **Usuario:** gerente
- **Contraseña:** gerente_gerencioso
- **Permisos:**
  - Puede seleccionar, insertar, actualizar y eliminar datos relacionados con los gastos operativos, áreas de trabajo, y puestos de trabajo.
  - Tiene acceso a las tablas de empleados y control de gastos.

### 5. Usuario Encargado de Almacén 📦
- **Usuario:** encargado_almacen
- **Contraseña:** almacen_almacenado
- **Permisos:**
  - Puede seleccionar, insertar, actualizar y eliminar registros de productos, envíos, transportadoras, y otras tablas relacionadas con la gestión de inventarios y almacenes.

### Pasos Generales para Crear Usuarios y Asignarles Roles 📝

1. **Crear un Usuario:**
   - Utiliza el comando `CREATE USER` para crear un nuevo usuario con su respectiva contraseña.

   ```sql
   CREATE USER 'nuevo_usuario'@'localhost' IDENTIFIED BY 'nueva_contraseña';
GRANT SELECT, INSERT, UPDATE ON base_de_datos.* TO 'nuevo_usuario'@'localhost';
FLUSH PRIVILEGES;


## Procedimientos, Funciones, Triggers y Eventos ⚙️

En el sistema se han implementado diversos procedimientos almacenados, funciones, triggers y eventos para garantizar la integridad de los datos y la automatización de procesos. A continuación, se explican brevemente:

### Triggers (Disparadores) 🔔

#### Trigger: `before_insert_facturas`
Este trigger se activa antes de que se inserte un nuevo registro en la tabla **facturas**. Su propósito es validar que la fecha del nuevo registro (NEW.fecha) no sea anterior a la fecha actual.

```sql
DELIMITER $$
CREATE TRIGGER before_insert_facturas
BEFORE INSERT ON facturas FOR EACH ROW 
BEGIN 
    IF NEW.fecha < CURDATE() THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'La fecha no puede ser menor a la fecha actual';
    END IF;
END $$
DELIMITER ;


## Contribuciones 🤝

El proyecto "Disfraces Doña Ruca" fue desarrollado en colaboración por:

- **Jhoan Sebastián Díaz Ardila**: 50% del desarrollo 💻
- **María Camila Díaz Toledo**: 50% del desarrollo 💻

Ambos integrantes trabajaron de manera equitativa para asegurar el éxito del proyecto. 🌟


