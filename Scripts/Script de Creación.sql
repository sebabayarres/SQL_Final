-- Creación de la base de datos.

CREATE DATABASE RIFAS;

USE RIFAS;

-- Creación de tablas.

CREATE TABLE ubicaciones_venta (
id_ubicacion INT PRIMARY KEY AUTO_INCREMENT,
descripcion VARCHAR (100) NOT NULL
);

CREATE TABLE formas_de_contacto(
id_forma_contacto INT PRIMARY KEY AUTO_INCREMENT,
descripcion VARCHAR (50) NOT NULL
);

CREATE TABLE formas_pago (
id_forma_pago INT PRIMARY KEY AUTO_INCREMENT,
descripcion VARCHAR (50) NOT NULL
);

CREATE TABLE tipos_de_ventas (
id_tipo_de_venta INT PRIMARY KEY AUTO_INCREMENT,
descripcion VARCHAR (50) NOT NULL
);

CREATE TABLE compradores (
id_comprador INT PRIMARY KEY AUTO_INCREMENT,
nombre VARCHAR (50) NOT NULL,
apellido VARCHAR (50) NOT NULL,
email VARCHAR (50) NOT NULL UNIQUE,
documento VARCHAR (50) NOT NULL UNIQUE,
domicilio VARCHAR (50) NOT NULL, 
telefono VARCHAR (50) NOT NULL UNIQUE,
id_forma_contacto INT NOT NULL,
id_ubicacion INT NOT NULL,
FOREIGN KEY (id_forma_contacto) REFERENCES formas_de_contacto(id_forma_contacto),
FOREIGN KEY (id_ubicacion) REFERENCES ubicaciones_venta(id_ubicacion)
);

CREATE TABLE rifas (
id_rifa INT PRIMARY KEY AUTO_INCREMENT,
numero INT NOT NULL UNIQUE);

CREATE TABLE premios(
id_premio INT PRIMARY KEY AUTO_INCREMENT,
descripcion_premio VARCHAR (50) NOT NULL
);

CREATE TABLE detalle_premios (
id_detalle INT PRIMARY KEY AUTO_INCREMENT,
id_premio INT NOT NULL,
detalle VARCHAR (50) NOT NULL,
FOREIGN KEY (id_premio) REFERENCES premios(id_premio)
);

CREATE TABLE sorteos (
id_sorteo INT,
id_premio INT,
resultado INT,
PRIMARY KEY (id_sorteo, id_premio),
FOREIGN KEY (id_premio) REFERENCES premios(id_premio),
FOREIGN KEY (resultado) REFERENCES rifas(id_rifa)
);

CREATE TABLE ventas (
id_comprador INT,
id_rifa INT PRIMARY KEY,
tipo_de_venta INT,
forma_de_pago INT,
FOREIGN KEY (id_comprador) REFERENCES compradores(id_comprador),
FOREIGN KEY (id_rifa) REFERENCES rifas(id_rifa),
FOREIGN KEY (tipo_de_venta) REFERENCES tipos_de_ventas(id_tipo_de_venta),
FOREIGN KEY (forma_de_pago) REFERENCES formas_pago(id_forma_pago)
);

CREATE TABLE entrega_rifas (
id_entrega INT PRIMARY KEY AUTO_INCREMENT,
id_rifa INT,
numero INT NOT NULL UNIQUE,
fecha_entrega DATE,
FOREIGN KEY (id_rifa) REFERENCES rifas(id_rifa),
FOREIGN KEY (numero) REFERENCES rifas(numero)
);

CREATE TABLE auditoria_entregas (
id_auditoria_entregas INT PRIMARY KEY AUTO_INCREMENT,
id_entrega INT,
operacion VARCHAR (20) NOT NULL,
fecha TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
FOREIGN KEY (id_entrega) REFERENCES entrega_rifas(id_entrega)
);

CREATE TABLE auditoria_compradores (
id_auditoria_compradores INT PRIMARY KEY AUTO_INCREMENT,
id_comprador INT,
operacion VARCHAR (20),
campo_modificado VARCHAR (50),
valor_anterior VARCHAR (50),
valor_nuevo VARCHAR (50),
fecha TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
FOREIGN KEY (id_comprador) REFERENCES compradores (id_comprador)
);

CREATE TABLE auditoria_ventas (
id_auditoria_ventas INT AUTO_INCREMENT PRIMARY KEY,
operacion VARCHAR (20),
id_comprador INT,
id_rifa INT,
fecha TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
FOREIGN KEY (id_comprador) REFERENCES compradores(id_comprador),
FOREIGN KEY (id_rifa) REFERENCES rifas(id_rifa)
);

CREATE TABLE fechas_sorteos (
id_sorteo INT,
id_premio INT,
fecha_sorteo DATE NOT NULL,
PRIMARY KEY (id_sorteo, id_premio),
FOREIGN KEY (id_sorteo, id_premio) REFERENCES sorteos(id_sorteo, id_premio)
);


-- Creación de vistas

CREATE VIEW resultados AS
SELECT
s.id_sorteo,
s.id_premio,
r.numero AS numero_ganador,
c.nombre,
c.apellido
FROM sorteos s
LEFT JOIN rifas r ON s.resultado = r.id_rifa
LEFT JOIN ventas v ON r.id_rifa = v.id_rifa
LEFT JOIN compradores c ON v.id_comprador = c.id_comprador;

CREATE VIEW rifa_por_comprador AS
SELECT 
r.numero,
c.nombre,
c.apellido
FROM rifas r
LEFT JOIN ventas v ON r.id_rifa = v.id_rifa
LEFT JOIN compradores c ON v.id_comprador = c.id_comprador;

CREATE VIEW rifas_sin_entregar AS 
SELECT
c.id_comprador,
c.nombre,
c.apellido,
c.domicilio,
c.telefono,
r.id_rifa,
r.numero
FROM compradores c
JOIN ventas v ON c.id_comprador = v.id_comprador
JOIN rifas r ON v.id_rifa = r.id_rifa
LEFT JOIN entrega_rifas e ON r.id_rifa = e.id_rifa
WHERE 
e.fecha_entrega IS NULL;

CREATE VIEW premios_y_ganadores AS 
SELECT 
p.id_premio,
p.descripcion_premio,
r.numero AS numero_rifa,
c.nombre,
c.apellido
FROM premios p
JOIN sorteos s ON p.id_premio = s.id_premio
JOIN rifas r ON s.resultado = r.id_rifa
JOIN ventas v ON r.id_rifa = v.id_rifa
JOIN compradores c ON v.id_comprador = c.id_comprador;

CREATE VIEW rifas_sin_vender AS
SELECT
r.id_rifa,
r.numero 
FROM rifas r
LEFT JOIN ventas v ON r.id_rifa = v.id_rifa
WHERE v.id_rifa IS NULL;

-- Creación de funciones.

DELIMITER //

CREATE FUNCTION contar_rifas_vendidas()
RETURNS INT
DETERMINISTIC
READS SQL DATA
BEGIN
	DECLARE total INT;
	SELECT COUNT(*) INTO total FROM ventas;
	RETURN total;
END //

DELIMITER ;

DELIMITER //
CREATE FUNCTION contar_rifas_entregadas()
RETURNS INT
DETERMINISTIC
READS SQL DATA
BEGIN
DECLARE total_entregadas INT;

SELECT COUNT(DISTINCT id_rifa)
INTO total_entregadas
FROM entrega_rifas
WHERE fecha_entrega IS NOT NULL;

RETURN total_entregadas;

END // 

DELIMITER ;

-- Creación de Stored Procedures.

DELIMITER //

CREATE PROCEDURE obtener_ventas_por_forma_de_pago (IN forma INT)
BEGIN
	SELECT
    v.id_comprador,
    v.id_rifa,
    v.forma_de_pago,
    c.nombre,
    c.apellido
FROM ventas v
JOIN compradores c ON v.id_comprador = c.id_comprador 
WHERE v.forma_de_pago = forma;
END//

DELIMITER ;

DELIMITER //

CREATE PROCEDURE obtener_ventas_por_tipo(IN tipo INT)
BEGIN
	SELECT
	v.id_comprador,
    v.id_rifa,
    c.nombre,
    c.apellido,
    v.tipo_de_venta
FROM ventas v
JOIN compradores c ON v.id_comprador = c.id_comprador
WHERE v.tipo_de_venta = tipo;
END //

DELIMITER ;

-- Creación de triggers

DELIMITER //

CREATE TRIGGER insert_ventas
AFTER INSERT ON ventas
FOR EACH ROW
BEGIN
	INSERT INTO auditoria_ventas (
		operacion,
		id_comprador,
		id_rifa)
	VALUES ('INSERT', NEW.id_comprador, NEW.id_rifa);
END //

DELIMITER ;

DELIMITER //

CREATE TRIGGER update_ventas
AFTER UPDATE ON ventas
FOR EACH ROW
BEGIN
INSERT INTO auditoria_ventas (
operacion,
id_comprador,
id_rifa)
VALUES ('UPDATE', NEW.id_comprador, NEW.id_rifa);
END //

DELIMITER ;

DELIMITER //

CREATE TRIGGER delete_ventas
AFTER DELETE ON ventas
FOR EACH ROW
BEGIN
	INSERT INTO auditoria_ventas (
	operacion,
	id_comprador,
	id_rifa)
VALUES ('DELETE', OLD.id_comprador, OLD.id_rifa);
END //

DELIMITER ;



DELIMITER //

CREATE TRIGGER trg_auditoria_compradores_update
AFTER UPDATE ON compradores
FOR EACH ROW
BEGIN
	IF OLD.nombre <> NEW.nombre THEN
    INSERT INTO auditoria_compradores (id_comprador, operacion, campo_modificado, valor_anterior, valor_nuevo)
    VALUES (OLD.id_comprador, 'UPDATE','nombre',OLD.nombre, NEW.nombre);
    END IF;
    
    IF OLD.apellido <> NEW.apellido THEN 
    INSERT INTO auditoria_compradores (id_comprador, operacion, campo_modificado, valor_anterior, valor_nuevo)
    VALUES (OLD.id_comprador, 'UPDATE','apellido',OLD.apellido, NEW.apellido);
    END IF;
    
     IF OLD.email <> NEW.email THEN 
    INSERT INTO auditoria_compradores (id_comprador, operacion, campo_modificado, valor_anterior, valor_nuevo)
    VALUES (OLD.id_comprador, 'UPDATE','email',OLD.email, NEW.email);
    END IF;
    
    IF OLD.documento <> NEW.documento THEN 
    INSERT INTO auditoria_compradores (id_comprador, operacion, campo_modificado, valor_anterior, valor_nuevo)
    VALUES (OLD.id_comprador, 'UPDATE','documento',OLD.documento, NEW.documento);
    END IF;
    
    IF OLD.domicilio <> NEW.domicilio THEN 
    INSERT INTO auditoria_compradores (id_comprador, operacion, campo_modificado, valor_anterior, valor_nuevo)
    VALUES (OLD.id_comprador, 'UPDATE','domicilio',OLD.domicilio, NEW.domicilio);
    END IF;
    
      IF OLD.telefono <> NEW.telefono THEN 
    INSERT INTO auditoria_compradores (id_comprador, operacion, campo_modificado, valor_anterior, valor_nuevo)
    VALUES (OLD.id_comprador, 'UPDATE','telefono',OLD.telefono, NEW.telefono);
    END IF;
    
    END //
    
    DELIMITER ;
    
    DELIMITER //
    
    CREATE TRIGGER auditoria_entrega_insert
    AFTER INSERT ON entrega_rifas
    FOR EACH ROW
    BEGIN 
    INSERT INTO auditoria_entregas (id_entrega, operacion)
    VALUES (NEW.id_entrega, 'INSERT');
    END //
    
    DELIMITER ;
    
