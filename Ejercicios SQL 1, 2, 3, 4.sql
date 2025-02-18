SELECT Usuarios.nombre AS Usuario, Productos.nombre AS Producto, Pedidos.cantidad
FROM Pedidos
INNER JOIN Usuarios ON Pedidos.usuario_id = Usuarios.id
INNER JOIN Productos ON Pedidos.producto_id = Productos.id;
´esto es un texto. Quiero probar´

