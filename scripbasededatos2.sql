-- Registrar Compra y Actualizar Stock
USE comerciardb
DELIMITER $$

CREATE PROCEDURE RegistrarCompra(
    IN p_cliente_id INT,
    IN p_producto_id INT,
    IN p_cantidad INT,
    IN p_total DECIMAL(10, 2),
    IN p_direccion VARCHAR(255)
)
BEGIN
    -- Verificar si el producto tiene stock suficiente
    DECLARE stock_actual INT;
    SELECT stock INTO stock_actual
    FROM Productos
    WHERE producto_id = p_producto_id;

    IF stock_actual >= p_cantidad THEN
        -- Registrar la compra
        INSERT INTO Compras (cliente_id, producto_id, cantidad, direccion, total, fecha_compra)
        VALUES (p_cliente_id, p_producto_id, p_cantidad, p_direccion, p_total, NOW());

        -- Actualizar el stock del producto
        UPDATE Productos
        SET stock = stock - p_cantidad
        WHERE producto_id = p_producto_id;
    ELSE
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Stock insuficiente para la compra.';
    END IF;
END$$

DELIMITER ;

-- Generar Reporte Mensual de Devoluciones

DELIMITER $$

CREATE PROCEDURE ReporteDevolucionesMensuales()
BEGIN
    SELECT 
        MONTH(fecha_devolucion) AS Mes,
        COUNT(*) AS Total_Devoluciones,
        SUM(cantidad) AS Total_Productos_Devueltos
    FROM Devoluciones
    WHERE YEAR(fecha_devolucion) = YEAR(NOW())
    GROUP BY MONTH(fecha_devolucion);
END$$

DELIMITER ;
-- Actualizar Inventario después de Devoluciones

DELIMITER $$

CREATE TRIGGER ActualizarInventarioDevolucion
AFTER INSERT ON Devoluciones
FOR EACH ROW
BEGIN
    -- Recuperar el producto relacionado con la compra devuelta
    DECLARE producto_relacionado INT;

    SELECT producto_id INTO producto_relacionado
    FROM Compras
    WHERE compra_id = NEW.compra_id;

    -- Actualizar el inventario del producto
    UPDATE Productos
    SET stock = stock + NEW.cantidad
    WHERE producto_id = producto_relacionado;
END$$

DELIMITER ;

-- Notificar cuando el Stock sea Bajo

DELIMITER $$

CREATE TRIGGER NotificarStockBajo
AFTER UPDATE ON Productos
FOR EACH ROW
BEGIN
    IF NEW.stock < 10 THEN
        INSERT INTO Notificaciones (mensaje, fecha)
        VALUES (
            CONCAT('El producto "', NEW.nombre, '" tiene stock bajo: ', NEW.stock),
            NOW()
        );
    END IF;
END$$

DELIMITER ;

-- Consultas Espaciales

-- Encontrar la Sucursal Más Cercana

SELECT nombre,
       ST_Distance(ubicacion, ST_GeomFromText('POINT(lat_cliente lon_cliente)')) AS distancia
FROM Sucursales
ORDER BY distancia ASC
LIMIT 1;



