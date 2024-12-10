INSERT INTO Clientes (nombre, correo, telefono, ubicacion)
VALUES
('Ana Pérez', 'ana.perez@gmail.com', '3001234567', POINT(-74.082, 4.609)),
('Carlos García', 'carlos.garcia@gmail.com', '3109876543', POINT(-74.087, 4.612)),
('María Torres', 'maria.torres@gmail.com', '3145678901', POINT(-74.081, 4.610)),
('Luis Martínez', 'luis.martinez@gmail.com', '3201231234', POINT(-74.083, 4.611)),
('Sofía López', 'sofia.lopez@gmail.com', '3156789123', POINT(-74.089, 4.613));
INSERT INTO Productos (nombre, descripcion, precio, stock)
VALUES
('Termo KWAI 500ml', 'Termo de acero inoxidable con diseño ergonómico', 35.99, 50),
('Camiseta KWAI', 'Camiseta de algodón, disponible en varias tallas', 20.50, 100),
('Mochila KWAI', 'Mochila compacta y resistente al agua', 45.00, 30),
('Audífonos KWAI', 'Audífonos Bluetooth con cancelación de ruido', 60.75, 25),
('Botella KWAI', 'Botella térmica, mantiene la temperatura por 12 horas', 25.00, 75);
INSERT INTO Compras (cliente_id, producto_id, cantidad, direccion, total)
VALUES
(1, 1, 2, 'Carrera 45 # 22-10, Bogotá', 71.98),
(2, 3, 1, 'Calle 10 # 15-30, Bogotá', 45.00),
(3, 5, 3, 'Av. Ciudad de Cali # 90-20, Bogotá', 75.00),
(4, 2, 5, 'Calle 80 # 30-45, Bogotá', 102.50),
(5, 4, 1, 'Carrera 50 # 60-12, Bogotá', 60.75);

INSERT INTO Devoluciones (compra_id, asunto_devolucion, motivo, cantidad)
VALUES
(1, 'Producto defectuoso', 'El termo llegó con una abolladura', 1),
(3, 'Talla incorrecta', 'La camiseta no coincide con la talla solicitada', 1),
(5, 'Producto equivocado', 'Se entregaron audífonos diferentes al pedido', 1);
INSERT INTO Devoluciones (compra_id, asunto_devolucion, motivo, cantidad)
VALUES
(1, 'Producto defectuoso', 'El termo llegó con una abolladura', 1),
(3, 'Talla incorrecta', 'La camiseta no coincide con la talla solicitada', 1),
(5, 'Producto equivocado', 'Se entregaron audífonos diferentes al pedido', 1);
INSERT INTO Devoluciones (compra_id, asunto_devolucion, motivo, cantidad)
VALUES
(1, 'Producto defectuoso', 'El termo llegó con una abolladura', 1),
(3, 'Talla incorrecta', 'La camiseta no coincide con la talla solicitada', 1),
(5, 'Producto equivocado', 'Se entregaron audífonos diferentes al pedido', 1);
INSERT INTO Sucursales (nombre, ubicacion)
VALUES
('Sucursal Norte', POINT(-74.074, 4.712)),
('Sucursal Centro', POINT(-74.072, 4.608)),
('Sucursal Occidente', POINT(-74.082, 4.657));