USE biblioteca;

DELIMITER $$

CREATE PROCEDURE registrar_prestamo(
    IN p_id_usuario INT,
    IN p_fecha_prestamo DATE,
    IN p_fecha_limite DATE,
    IN p_estado VARCHAR(20)
)
BEGIN
    INSERT INTO prestamos(
        id_usuario,
        fecha_prestamo,
        fecha_limite,
        estado
    )
    VALUES(
        p_id_usuario,
        p_fecha_prestamo,
        p_fecha_limite,
        p_estado
    );
END$$

DELIMITER ;