-- =====================================
-- CREAR TABLA CLIENTES (Si no existe. Ya la cree en ejercicios anteriores)
-- =====================================
CREATE TABLE IF NOT EXISTS Clientes (
    id INT PRIMARY KEY,
    nombre VARCHAR(100)
);

-- Insertar un cliente
INSERT INTO Clientes (id, nombre) VALUES (8, 'John');

-- Actualizar nombre del cliente
UPDATE Clientes SET nombre = 'John Doe' WHERE id = 8;

-- Leer todos los clientes
SELECT * FROM Clientes;

-- =====================================
-- CREAR TABLA PRODUCTOS (Si no existe. Ya la cree en ejercicios anteriores)
-- =====================================
CREATE TABLE IF NOT EXISTS Productos (
    id INT PRIMARY KEY,
    nombre VARCHAR(100)
);

-- Insertar un producto
INSERT INTO Productos (id, nombre) VALUES (8, 'Camisa');

-- Actualizar el nombre del producto
UPDATE Productos SET nombre = 'Pantalón' WHERE id = 8;

-- Leer todos los productos
SELECT * FROM Productos;

-- =====================================
-- CREAR TABLA PEDIDOS (Si no existe. Ya la cree en ejercicios anteriores)
-- =====================================
CREATE TABLE IF NOT EXISTS Pedidos (
    id INT PRIMARY KEY,
    cliente_id INT,
    FOREIGN KEY (cliente_id) REFERENCES Clientes(id)
);

-- Insertar un pedido
INSERT INTO Pedidos (id, cliente_id) VALUES (1, 1);

-- Actualizar cliente_id del pedido
UPDATE Pedidos SET cliente_id = 2 WHERE id = 1;

-- Leer todos los pedidos
SELECT * FROM Pedidos;

-- =====================================
-- CREAR TABLA DETALLES DE PEDIDOS (Si no existe. Ya la cree en ejercicios anteriores)
-- =====================================
CREATE TABLE IF NOT EXISTS DetallesPedido (
    pedido_id INT,
    producto_id INT,
    cantidad INT,
    PRIMARY KEY (pedido_id, producto_id),
    FOREIGN KEY (pedido_id) REFERENCES Pedidos(id),
    FOREIGN KEY (producto_id) REFERENCES Productos(id)
);

-- Insertar detalle de pedido
INSERT INTO DetallesPedido (pedido_id, producto_id, cantidad) VALUES (1, 1, 2);

-- Actualizar cantidad del detalle de pedido
UPDATE DetallesPedido SET cantidad = 3 WHERE pedido_id = 1 AND producto_id = 1;

--  Leer todos los detalles de pedido
SELECT * FROM DetallesPedido;

-- =====================================
-- CONSULTAS CON JOIN
-- =====================================

-- Obtener todos los clientes y sus pedidos (INNER JOIN)
SELECT Clientes.nombre, Pedidos.id AS pedido_id 
FROM Clientes
INNER JOIN Pedidos ON Clientes.id = Pedidos.cliente_id;

-- Obtener todos los clientes y sus pedidos (LEFT JOIN)
SELECT Clientes.nombre, Pedidos.id AS pedido_id 
FROM Clientes
LEFT JOIN Pedidos ON Clientes.id = Pedidos.cliente_id;

-- Obtener todos los productos y los detalles de pedido (INNER JOIN)
SELECT Productos.nombre, DetallesPedido.cantidad 
FROM Productos
INNER JOIN DetallesPedido ON Productos.id = DetallesPedido.producto_id;

-- Obtener todos los productos y los detalles de pedido (LEFT JOIN)
SELECT Productos.nombre, COALESCE(DetallesPedido.cantidad, 0) AS cantidad 
FROM Productos
LEFT JOIN DetallesPedido ON Productos.id = DetallesPedido.producto_id;

-- =====================================
-- MODIFICACIONES EN CLIENTES
-- =====================================

-- Agregar columna "telefono"
ALTER TABLE Clientes ADD COLUMN telefono VARCHAR(15);

-- 📌 Modificar la columna "telefono" a tipo entero
ALTER TABLE Clientes MODIFY COLUMN telefono INT;

-- Eliminar la columna "telefono"
ALTER TABLE Clientes DROP COLUMN telefono;

-- Renombrar tabla "Clientes" a "Usuarios"
ALTER TABLE Clientes RENAME TO Usuarios;

-- Renombrar columna "nombre" a "nombre_completo"
ALTER TABLE Usuarios CHANGE nombre nombre_completo VARCHAR(100);

--  Agregar clave primaria a la columna "id" en la tabla "Usuarios"
ALTER TABLE Usuarios ADD PRIMARY KEY (id);

