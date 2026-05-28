USE biblioteca;

CREATE ROLE admin;
CREATE ROLE bibliotecario;
CREATE ROLE consulta;

GRANT ALL PRIVILEGES
ON biblioteca.*
TO admin;

GRANT SELECT, INSERT, UPDATE
ON biblioteca.*
TO bibliotecario;

GRANT SELECT
ON biblioteca.*
TO consulta;

CREATE USER 'usuario_admin'@'localhost'
IDENTIFIED BY 'admin123';

CREATE USER 'usuario_biblio'@'localhost'
IDENTIFIED BY 'biblio123';

CREATE USER 'usuario_consulta'@'localhost'
IDENTIFIED BY 'consulta123';

GRANT admin TO 'usuario_admin'@'localhost';
GRANT bibliotecario TO 'usuario_biblio'@'localhost';
GRANT consulta TO 'usuario_consulta'@'localhost';

SET DEFAULT ROLE admin
TO 'usuario_admin'@'localhost';

SET DEFAULT ROLE bibliotecario
TO 'usuario_biblio'@'localhost';

SET DEFAULT ROLE consulta
TO 'usuario_consulta'@'localhost';