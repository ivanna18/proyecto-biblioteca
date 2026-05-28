USE biblioteca;

-- Consulta JOIN
SELECT
u.nombre AS usuario,
l.titulo AS libro,
p.estado
FROM usuarios u
JOIN prestamos p
ON u.id_usuario = p.id_usuario
JOIN detalle_prestamo d
ON p.id_prestamo = d.id_prestamo
JOIN libros l
ON d.id_libro = l.id_libro;

-- Usuarios con préstamos activos
SELECT nombre
FROM usuarios
WHERE id_usuario IN (
    SELECT id_usuario
    FROM prestamos
    WHERE estado = 'Activo'
);

-- Cantidad de préstamos por usuario
SELECT
u.nombre,
COUNT(p.id_prestamo) AS total_prestamos
FROM usuarios u
JOIN prestamos p
ON u.id_usuario = p.id_usuario
GROUP BY u.nombre
ORDER BY total_prestamos DESC;

-- Libros más solicitados
SELECT
l.titulo,
SUM(d.cantidad) AS veces_prestado
FROM libros l
JOIN detalle_prestamo d
ON l.id_libro = d.id_libro
GROUP BY l.titulo
ORDER BY veces_prestado DESC;