USE biblioteca;

DELIMITER $$

CREATE TRIGGER trg_auditoria_prestamo
AFTER INSERT ON prestamos
FOR EACH ROW
BEGIN
    INSERT INTO auditoria (accion, descripcion, fecha)
    VALUES (
        'Nuevo Prestamo',
        CONCAT('Se registró un préstamo para el usuario ID ', NEW.id_usuario),
        NOW()
    );
END$$

DELIMITER ;

DELIMITER $$

CREATE TRIGGER trg_actualizar_stock
AFTER INSERT ON detalle_prestamo
FOR EACH ROW
BEGIN
    UPDATE libros
    SET stock = stock - NEW.cantidad
    WHERE id_libro = NEW.id_libro;
END$$

DELIMITER ;