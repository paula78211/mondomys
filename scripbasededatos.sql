-- Crear la base de datos
CREATE DATABASE ComerciarDB;

-- Usar la base de datos
USE ComerciarDB;

-- Crear la tabla Clientes
CREATE TABLE Clientes (
    cliente_id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(150) NOT NULL,
    correo VARCHAR(250) UNIQUE NOT NULL,
    telefono VARCHAR(20),
    ubicacion POINT NOT NULL, -- Coordenadas geográficas
    fecha_registro DATETIME DEFAULT CURRENT_TIMESTAMP,
    SPATIAL INDEX (ubicacion)
);

-- Crear la tabla Productos
CREATE TABLE Productos (
    producto_id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(150) NOT NULL,
    descripcion TEXT,
    precio DECIMAL(10, 2) NOT NULL,
    stock INT NOT NULL,
    fecha_creacion DATETIME DEFAULT CURRENT_TIMESTAMP
);

-- Crear la tabla Compras
CREATE TABLE Compras (
    compra_id INT AUTO_INCREMENT PRIMARY KEY,
    cliente_id INT NOT NULL,
    producto_id INT NOT NULL,
    cantidad INT NOT NULL,
    direccion VARCHAR(255) NOT NULL,
    total DECIMAL(10, 2) NOT NULL,
    fecha_compra DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (cliente_id) REFERENCES Clientes(cliente_id),
    FOREIGN KEY (producto_id) REFERENCES Productos(producto_id)
);


-- Crear la tabla Devoluciones
CREATE TABLE Devoluciones (
    devolucion_id INT AUTO_INCREMENT PRIMARY KEY,
    compra_id INT NOT NULL,
    fecha_devolucion DATETIME DEFAULT CURRENT_TIMESTAMP,
    asunto_devolucion VARCHAR(150) NOT NULL,
    motivo TEXT NOT NULL,
    cantidad INT NOT NULL,
    FOREIGN KEY (compra_id) REFERENCES Compras(compra_id)
);

-- Crear la tabla Sucursales
CREATE TABLE Sucursales (
    sucursal_id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(150) NOT NULL,
    ubicacion POINT NOT NULL, -- Coordenadas geográficas
    fecha_apertura DATETIME DEFAULT CURRENT_TIMESTAMP,
    SPATIAL INDEX (ubicacion)
);

-- Crear tabla Notificaciones (opcional para stock bajo)
CREATE TABLE Notificaciones (
    notificacion_id INT AUTO_INCREMENT PRIMARY KEY,
    mensaje TEXT NOT NULL,
    fecha DATETIME DEFAULT CURRENT_TIMESTAMP
);

-- Verificar estructura creada
SHOW TABLES;