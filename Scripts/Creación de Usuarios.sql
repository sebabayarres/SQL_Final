CREATE USER 'read'@'localhost' IDENTIFIED BY 'usuario123';
GRANT SELECT ON RIFAS.* TO 'read'@'localhost';

CREATE USER 'admin'@'localhost' IDENTIFIED BY 'admin123';
GRANT ALL PRIVILEGES ON RIFAS.* TO 'admin'@'localhost' WITH GRANT OPTION;

CREATE USER 'readwrite'@'localhost' IDENTIFIED BY 'readwrite123';
GRANT SELECT, INSERT, UPDATE, DELETE ON RIFAS.* TO 'read'@'localhost';
