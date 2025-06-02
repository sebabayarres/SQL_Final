-- MySQL dump 10.13  Distrib 9.3.0, for macos15 (arm64)
--
-- Host: localhost    Database: RIFAS
-- ------------------------------------------------------
-- Server version	9.3.0

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `auditoria_compradores`
--

DROP TABLE IF EXISTS `auditoria_compradores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auditoria_compradores` (
  `id_auditoria_compradores` int NOT NULL AUTO_INCREMENT,
  `id_comprador` int DEFAULT NULL,
  `operacion` varchar(20) DEFAULT NULL,
  `campo_modificado` varchar(50) DEFAULT NULL,
  `valor_anterior` varchar(50) DEFAULT NULL,
  `valor_nuevo` varchar(50) DEFAULT NULL,
  `fecha` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_auditoria_compradores`),
  KEY `id_comprador` (`id_comprador`),
  CONSTRAINT `auditoria_compradores_ibfk_1` FOREIGN KEY (`id_comprador`) REFERENCES `compradores` (`id_comprador`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auditoria_compradores`
--

LOCK TABLES `auditoria_compradores` WRITE;
/*!40000 ALTER TABLE `auditoria_compradores` DISABLE KEYS */;
/*!40000 ALTER TABLE `auditoria_compradores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auditoria_entregas`
--

DROP TABLE IF EXISTS `auditoria_entregas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auditoria_entregas` (
  `id_auditoria_entregas` int NOT NULL AUTO_INCREMENT,
  `id_entrega` int DEFAULT NULL,
  `operacion` varchar(20) NOT NULL,
  `fecha` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_auditoria_entregas`),
  KEY `id_entrega` (`id_entrega`),
  CONSTRAINT `auditoria_entregas_ibfk_1` FOREIGN KEY (`id_entrega`) REFERENCES `entrega_rifas` (`id_entrega`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auditoria_entregas`
--

LOCK TABLES `auditoria_entregas` WRITE;
/*!40000 ALTER TABLE `auditoria_entregas` DISABLE KEYS */;
INSERT INTO `auditoria_entregas` VALUES (1,1,'INSERT','2025-06-02 22:19:56'),(2,2,'INSERT','2025-06-02 22:19:56'),(3,3,'INSERT','2025-06-02 22:19:56'),(4,4,'INSERT','2025-06-02 22:19:56'),(5,5,'INSERT','2025-06-02 22:19:56'),(6,6,'INSERT','2025-06-02 22:19:56'),(7,7,'INSERT','2025-06-02 22:19:56'),(8,8,'INSERT','2025-06-02 22:19:56'),(9,9,'INSERT','2025-06-02 22:19:56'),(10,10,'INSERT','2025-06-02 22:19:56'),(11,11,'INSERT','2025-06-02 22:19:56'),(12,12,'INSERT','2025-06-02 22:19:56'),(13,13,'INSERT','2025-06-02 22:19:56'),(14,14,'INSERT','2025-06-02 22:19:56'),(15,15,'INSERT','2025-06-02 22:19:56'),(16,16,'INSERT','2025-06-02 22:19:56'),(17,17,'INSERT','2025-06-02 22:19:56'),(18,18,'INSERT','2025-06-02 22:19:56'),(19,19,'INSERT','2025-06-02 22:19:56'),(20,20,'INSERT','2025-06-02 22:19:56'),(21,21,'INSERT','2025-06-02 22:19:56'),(22,22,'INSERT','2025-06-02 22:19:56'),(23,23,'INSERT','2025-06-02 22:19:56'),(24,24,'INSERT','2025-06-02 22:19:56'),(25,25,'INSERT','2025-06-02 22:19:56'),(26,26,'INSERT','2025-06-02 22:19:56'),(27,27,'INSERT','2025-06-02 22:19:56'),(28,28,'INSERT','2025-06-02 22:19:56'),(29,29,'INSERT','2025-06-02 22:19:56'),(30,30,'INSERT','2025-06-02 22:19:56');
/*!40000 ALTER TABLE `auditoria_entregas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auditoria_ventas`
--

DROP TABLE IF EXISTS `auditoria_ventas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auditoria_ventas` (
  `id_auditoria_ventas` int NOT NULL AUTO_INCREMENT,
  `operacion` varchar(20) DEFAULT NULL,
  `id_comprador` int DEFAULT NULL,
  `id_rifa` int DEFAULT NULL,
  `fecha` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_auditoria_ventas`),
  KEY `id_comprador` (`id_comprador`),
  KEY `id_rifa` (`id_rifa`),
  CONSTRAINT `auditoria_ventas_ibfk_1` FOREIGN KEY (`id_comprador`) REFERENCES `compradores` (`id_comprador`),
  CONSTRAINT `auditoria_ventas_ibfk_2` FOREIGN KEY (`id_rifa`) REFERENCES `rifas` (`id_rifa`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auditoria_ventas`
--

LOCK TABLES `auditoria_ventas` WRITE;
/*!40000 ALTER TABLE `auditoria_ventas` DISABLE KEYS */;
INSERT INTO `auditoria_ventas` VALUES (1,'INSERT',1,1,'2025-06-02 22:19:56'),(2,'INSERT',2,2,'2025-06-02 22:19:56'),(3,'INSERT',3,3,'2025-06-02 22:19:56'),(4,'INSERT',4,4,'2025-06-02 22:19:56'),(5,'INSERT',5,5,'2025-06-02 22:19:56'),(6,'INSERT',6,6,'2025-06-02 22:19:56'),(7,'INSERT',7,7,'2025-06-02 22:19:56'),(8,'INSERT',8,8,'2025-06-02 22:19:56'),(9,'INSERT',9,9,'2025-06-02 22:19:56'),(10,'INSERT',10,10,'2025-06-02 22:19:56'),(11,'INSERT',11,11,'2025-06-02 22:19:56'),(12,'INSERT',12,12,'2025-06-02 22:19:56'),(13,'INSERT',13,13,'2025-06-02 22:19:56'),(14,'INSERT',14,14,'2025-06-02 22:19:56'),(15,'INSERT',15,15,'2025-06-02 22:19:56'),(16,'INSERT',16,16,'2025-06-02 22:19:56'),(17,'INSERT',17,17,'2025-06-02 22:19:56'),(18,'INSERT',18,18,'2025-06-02 22:19:56'),(19,'INSERT',19,19,'2025-06-02 22:19:56'),(20,'INSERT',20,20,'2025-06-02 22:19:56'),(21,'INSERT',7,21,'2025-06-02 22:19:56'),(22,'INSERT',7,22,'2025-06-02 22:19:56'),(23,'INSERT',5,23,'2025-06-02 22:19:56'),(24,'INSERT',1,24,'2025-06-02 22:19:56'),(25,'INSERT',16,25,'2025-06-02 22:19:56'),(26,'INSERT',11,26,'2025-06-02 22:19:56'),(27,'INSERT',10,27,'2025-06-02 22:19:56'),(28,'INSERT',3,28,'2025-06-02 22:19:56'),(29,'INSERT',15,29,'2025-06-02 22:19:56'),(30,'INSERT',17,30,'2025-06-02 22:19:56');
/*!40000 ALTER TABLE `auditoria_ventas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `compradores`
--

DROP TABLE IF EXISTS `compradores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `compradores` (
  `id_comprador` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `apellido` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `documento` varchar(50) NOT NULL,
  `domicilio` varchar(50) NOT NULL,
  `telefono` varchar(50) NOT NULL,
  `id_forma_contacto` int NOT NULL,
  `id_ubicacion` int NOT NULL,
  PRIMARY KEY (`id_comprador`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `documento` (`documento`),
  UNIQUE KEY `telefono` (`telefono`),
  KEY `id_forma_contacto` (`id_forma_contacto`),
  KEY `id_ubicacion` (`id_ubicacion`),
  CONSTRAINT `compradores_ibfk_1` FOREIGN KEY (`id_forma_contacto`) REFERENCES `formas_de_contacto` (`id_forma_contacto`),
  CONSTRAINT `compradores_ibfk_2` FOREIGN KEY (`id_ubicacion`) REFERENCES `ubicaciones_venta` (`id_ubicacion`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `compradores`
--

LOCK TABLES `compradores` WRITE;
/*!40000 ALTER TABLE `compradores` DISABLE KEYS */;
INSERT INTO `compradores` VALUES (1,'Juan','Perez','juanperez@mail.com','29930291','Agraciada 3092','99392992',1,1),(2,'Juan','Garcia','juangarcia@mail.com','52448914','Bulevar Artigas 1246','99009550',2,1),(3,'Pedro','Rodriguez','pedrorodrigues@mail.com','10742855','Avenida 18 de Julio 1530','99380258',3,1),(4,'Ana','Gonzalez','anagonzalez@mail.com','47311786','Rambla Republica del Peru 1021','98823295',2,1),(5,'Maria','Fernandez','mariafernandez@mail.com','15868443','Canelones 1345','99397228',5,1),(6,'Gonzalo','Lopez','gonzalolopez@mail.com','41792332','Jackson 890','98007061',3,1),(7,'Victoria','Martinez','victoriamartinez@mail.com','25152843','Joaquin Requena 711','99817881',4,1),(8,'Valentina','Perez','valentinaperez@mail.com','16599626','Juan Paullier 1234','98130591',5,1),(9,'Martina','Sanchez','martinasanchez@mail.com','32259285','Rivera 3205','98363945',2,1),(10,'Clara','Ramirez','clararamirez@mail.com','19297540','Colonia 2048','98558883',3,1),(11,'Ricardo','Torres','ricardotorres@mail.com','52731792','San Jose 1680','99651452',4,1),(12,'Mariana','Diaz','marianadiaz@mail.com','11228154','Avenida Brasil 4567','99160405',5,1),(13,'Jorge','Gomez','jorgegomez@mail.com','55506297','Bulevar Artigas 1144','99060398',3,1),(14,'Luis','Alvarez','luisalvarez@mail.com','56708006','Millan 3010','98541361',2,1),(15,'Jose','Herrera','joseherrera@mail.com','17509857','Luis Alberto de Herrera 920','99308590',2,1),(16,'Fernando','Vargas','fernandovargas@mail.com','58517445','General Flores 2120','99457794',4,1),(17,'Martin','Castro','martincastro@mail.com','58340844','Ejido 545','98181292',4,1),(18,'Bruno','Morales','brunomorales@mail.com','28466704','Agraciada 3991','98468268',3,1),(19,'Lucia','Mendoza','luciamendoza@mail.com','38028589','Garibaldi 1508','98012539',2,1),(20,'Juana','Ortega','juanaortega@mail.com','39139439','Mercedes 999','99023986',1,1);
/*!40000 ALTER TABLE `compradores` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trg_auditoria_compradores_update` AFTER UPDATE ON `compradores` FOR EACH ROW BEGIN
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
    
    END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `detalle_premios`
--

DROP TABLE IF EXISTS `detalle_premios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `detalle_premios` (
  `id_detalle` int NOT NULL AUTO_INCREMENT,
  `id_premio` int NOT NULL,
  `detalle` varchar(50) NOT NULL,
  PRIMARY KEY (`id_detalle`),
  KEY `id_premio` (`id_premio`),
  CONSTRAINT `detalle_premios_ibfk_1` FOREIGN KEY (`id_premio`) REFERENCES `premios` (`id_premio`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalle_premios`
--

LOCK TABLES `detalle_premios` WRITE;
/*!40000 ALTER TABLE `detalle_premios` DISABLE KEYS */;
INSERT INTO `detalle_premios` VALUES (1,1,'Apartamento de un dormitorio en torre Sea Garden'),(2,2,'Citroen C3'),(3,3,'Viaje de 7 noches todo incluido en Punta Cana'),(4,4,'Microondas, Heladera, Cocina y Lavarropas'),(5,5,'Television Samsung de 55 pulgadas'),(6,6,'Computadora Macbook Air M4'),(7,7,'Celular iPhone 16'),(8,8,'Bicicleta Rodado 16'),(9,9,'Gift Card por un valor de 7.000');
/*!40000 ALTER TABLE `detalle_premios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `entrega_rifas`
--

DROP TABLE IF EXISTS `entrega_rifas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `entrega_rifas` (
  `id_entrega` int NOT NULL AUTO_INCREMENT,
  `id_rifa` int DEFAULT NULL,
  `numero` int NOT NULL,
  `fecha_entrega` date DEFAULT NULL,
  PRIMARY KEY (`id_entrega`),
  UNIQUE KEY `numero` (`numero`),
  KEY `id_rifa` (`id_rifa`),
  CONSTRAINT `entrega_rifas_ibfk_1` FOREIGN KEY (`id_rifa`) REFERENCES `rifas` (`id_rifa`),
  CONSTRAINT `entrega_rifas_ibfk_2` FOREIGN KEY (`numero`) REFERENCES `rifas` (`numero`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entrega_rifas`
--

LOCK TABLES `entrega_rifas` WRITE;
/*!40000 ALTER TABLE `entrega_rifas` DISABLE KEYS */;
INSERT INTO `entrega_rifas` VALUES (1,1,6392,'2025-04-03'),(2,2,7764,'2025-04-29'),(3,3,29311,'2025-04-12'),(4,4,26778,'2025-05-12'),(5,5,9956,'2025-05-27'),(6,6,17189,'2025-05-30'),(7,7,23766,'2025-04-01'),(8,8,15484,'2025-04-28'),(9,9,3324,'2025-05-28'),(10,10,18593,'2025-05-19'),(11,11,9627,NULL),(12,12,10611,NULL),(13,13,7536,NULL),(14,14,14744,NULL),(15,15,21288,NULL),(16,16,19939,NULL),(17,17,17434,NULL),(18,18,23307,NULL),(19,19,21489,NULL),(20,20,25868,NULL),(21,21,558,NULL),(22,22,18261,NULL),(23,23,24935,NULL),(24,24,18886,NULL),(25,25,446,NULL),(26,26,16659,NULL),(27,27,31209,NULL),(28,28,4767,NULL),(29,29,6470,NULL),(30,30,26162,NULL);
/*!40000 ALTER TABLE `entrega_rifas` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `auditoria_entrega_insert` AFTER INSERT ON `entrega_rifas` FOR EACH ROW BEGIN 
    INSERT INTO auditoria_entregas (id_entrega, operacion)
    VALUES (NEW.id_entrega, 'INSERT');
    END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `fechas_sorteos`
--

DROP TABLE IF EXISTS `fechas_sorteos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fechas_sorteos` (
  `id_sorteo` int NOT NULL,
  `id_premio` int NOT NULL,
  `fecha_sorteo` date NOT NULL,
  PRIMARY KEY (`id_sorteo`,`id_premio`),
  CONSTRAINT `fechas_sorteos_ibfk_1` FOREIGN KEY (`id_sorteo`, `id_premio`) REFERENCES `sorteos` (`id_sorteo`, `id_premio`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fechas_sorteos`
--

LOCK TABLES `fechas_sorteos` WRITE;
/*!40000 ALTER TABLE `fechas_sorteos` DISABLE KEYS */;
INSERT INTO `fechas_sorteos` VALUES (1,1,'2025-04-25'),(1,2,'2025-04-25'),(1,3,'2025-04-25'),(1,4,'2025-04-25'),(1,5,'2025-04-25'),(1,6,'2025-04-25'),(1,7,'2025-04-25'),(1,8,'2025-04-25'),(1,9,'2025-04-25'),(2,1,'2025-05-30'),(2,2,'2025-05-30'),(2,3,'2025-05-30'),(2,4,'2025-05-30'),(2,5,'2025-05-30'),(2,6,'2025-05-30'),(2,7,'2025-05-30'),(2,8,'2025-05-30'),(2,9,'2025-05-30'),(3,1,'2025-06-27'),(3,2,'2025-06-27'),(3,3,'2025-06-27'),(3,4,'2025-06-27'),(3,5,'2025-06-27'),(3,6,'2025-06-27'),(3,7,'2025-06-27'),(3,8,'2025-06-27'),(3,9,'2025-06-27');
/*!40000 ALTER TABLE `fechas_sorteos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `formas_de_contacto`
--

DROP TABLE IF EXISTS `formas_de_contacto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `formas_de_contacto` (
  `id_forma_contacto` int NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(50) NOT NULL,
  PRIMARY KEY (`id_forma_contacto`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `formas_de_contacto`
--

LOCK TABLES `formas_de_contacto` WRITE;
/*!40000 ALTER TABLE `formas_de_contacto` DISABLE KEYS */;
INSERT INTO `formas_de_contacto` VALUES (1,'WhatsApp'),(2,'Instagram'),(3,'Telefono'),(4,'Email'),(5,'Presencial');
/*!40000 ALTER TABLE `formas_de_contacto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `formas_pago`
--

DROP TABLE IF EXISTS `formas_pago`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `formas_pago` (
  `id_forma_pago` int NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(50) NOT NULL,
  PRIMARY KEY (`id_forma_pago`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `formas_pago`
--

LOCK TABLES `formas_pago` WRITE;
/*!40000 ALTER TABLE `formas_pago` DISABLE KEYS */;
INSERT INTO `formas_pago` VALUES (1,'Debito'),(2,'Credito'),(3,'Transferencia'),(4,'Efectivo');
/*!40000 ALTER TABLE `formas_pago` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `premios`
--

DROP TABLE IF EXISTS `premios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `premios` (
  `id_premio` int NOT NULL AUTO_INCREMENT,
  `descripcion_premio` varchar(50) NOT NULL,
  PRIMARY KEY (`id_premio`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `premios`
--

LOCK TABLES `premios` WRITE;
/*!40000 ALTER TABLE `premios` DISABLE KEYS */;
INSERT INTO `premios` VALUES (1,'Apartamento'),(2,'Auto'),(3,'Viaje'),(4,'Electrodomesticos'),(5,'Television'),(6,'Computadora'),(7,'Celular'),(8,'Bicicleta'),(9,'Gift Card');
/*!40000 ALTER TABLE `premios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `premios_y_ganadores`
--

DROP TABLE IF EXISTS `premios_y_ganadores`;
/*!50001 DROP VIEW IF EXISTS `premios_y_ganadores`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `premios_y_ganadores` AS SELECT 
 1 AS `id_premio`,
 1 AS `descripcion_premio`,
 1 AS `numero_rifa`,
 1 AS `nombre`,
 1 AS `apellido`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `resultados`
--

DROP TABLE IF EXISTS `resultados`;
/*!50001 DROP VIEW IF EXISTS `resultados`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `resultados` AS SELECT 
 1 AS `id_sorteo`,
 1 AS `id_premio`,
 1 AS `numero_ganador`,
 1 AS `nombre`,
 1 AS `apellido`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `rifa_por_comprador`
--

DROP TABLE IF EXISTS `rifa_por_comprador`;
/*!50001 DROP VIEW IF EXISTS `rifa_por_comprador`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `rifa_por_comprador` AS SELECT 
 1 AS `numero`,
 1 AS `nombre`,
 1 AS `apellido`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `rifas`
--

DROP TABLE IF EXISTS `rifas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rifas` (
  `id_rifa` int NOT NULL AUTO_INCREMENT,
  `numero` int NOT NULL,
  PRIMARY KEY (`id_rifa`),
  UNIQUE KEY `numero` (`numero`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rifas`
--

LOCK TABLES `rifas` WRITE;
/*!40000 ALTER TABLE `rifas` DISABLE KEYS */;
INSERT INTO `rifas` VALUES (25,446),(21,558),(9,3324),(28,4767),(1,6392),(29,6470),(13,7536),(2,7764),(11,9627),(5,9956),(12,10611),(14,14744),(8,15484),(26,16659),(6,17189),(17,17434),(22,18261),(10,18593),(24,18886),(16,19939),(15,21288),(19,21489),(18,23307),(7,23766),(23,24935),(20,25868),(30,26162),(4,26778),(3,29311),(27,31209);
/*!40000 ALTER TABLE `rifas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `rifas_sin_entregar`
--

DROP TABLE IF EXISTS `rifas_sin_entregar`;
/*!50001 DROP VIEW IF EXISTS `rifas_sin_entregar`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `rifas_sin_entregar` AS SELECT 
 1 AS `id_comprador`,
 1 AS `nombre`,
 1 AS `apellido`,
 1 AS `domicilio`,
 1 AS `telefono`,
 1 AS `id_rifa`,
 1 AS `numero`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `rifas_sin_vender`
--

DROP TABLE IF EXISTS `rifas_sin_vender`;
/*!50001 DROP VIEW IF EXISTS `rifas_sin_vender`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `rifas_sin_vender` AS SELECT 
 1 AS `id_rifa`,
 1 AS `numero`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `sorteos`
--

DROP TABLE IF EXISTS `sorteos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sorteos` (
  `id_sorteo` int NOT NULL,
  `id_premio` int NOT NULL,
  `resultado` int DEFAULT NULL,
  PRIMARY KEY (`id_sorteo`,`id_premio`),
  KEY `id_premio` (`id_premio`),
  KEY `resultado` (`resultado`),
  CONSTRAINT `sorteos_ibfk_1` FOREIGN KEY (`id_premio`) REFERENCES `premios` (`id_premio`),
  CONSTRAINT `sorteos_ibfk_2` FOREIGN KEY (`resultado`) REFERENCES `rifas` (`id_rifa`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sorteos`
--

LOCK TABLES `sorteos` WRITE;
/*!40000 ALTER TABLE `sorteos` DISABLE KEYS */;
INSERT INTO `sorteos` VALUES (1,1,1),(1,2,2),(1,3,3),(1,4,4),(1,5,5),(1,6,6),(1,7,7),(1,8,8),(1,9,9),(2,1,10),(2,2,11),(2,7,12),(2,4,13),(2,6,15),(2,8,17),(3,1,19),(3,2,20),(3,3,21),(2,9,22),(3,4,22),(3,5,23),(3,6,24),(3,7,25),(3,8,26),(2,3,27),(3,9,27),(2,5,30);
/*!40000 ALTER TABLE `sorteos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipos_de_ventas`
--

DROP TABLE IF EXISTS `tipos_de_ventas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipos_de_ventas` (
  `id_tipo_de_venta` int NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(50) NOT NULL,
  PRIMARY KEY (`id_tipo_de_venta`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipos_de_ventas`
--

LOCK TABLES `tipos_de_ventas` WRITE;
/*!40000 ALTER TABLE `tipos_de_ventas` DISABLE KEYS */;
INSERT INTO `tipos_de_ventas` VALUES (1,'Presencial'),(2,'Online');
/*!40000 ALTER TABLE `tipos_de_ventas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ubicaciones_venta`
--

DROP TABLE IF EXISTS `ubicaciones_venta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ubicaciones_venta` (
  `id_ubicacion` int NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(100) NOT NULL,
  PRIMARY KEY (`id_ubicacion`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ubicaciones_venta`
--

LOCK TABLES `ubicaciones_venta` WRITE;
/*!40000 ALTER TABLE `ubicaciones_venta` DISABLE KEYS */;
INSERT INTO `ubicaciones_venta` VALUES (1,'Montevideo'),(2,'Canelones'),(3,'San Jose'),(4,'Rocha'),(5,'Maldonado'),(6,'Durazno'),(7,'Cerro Largo'),(8,'Treinta y Tres'),(9,'Lavalleja'),(10,'Soriano'),(11,'Flores'),(12,'Florida'),(13,'Colonia'),(14,'Salto'),(15,'Paysandu'),(16,'Artigas'),(17,'Rivera'),(18,'Tacuarembo'),(19,'Rio Negro');
/*!40000 ALTER TABLE `ubicaciones_venta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ventas`
--

DROP TABLE IF EXISTS `ventas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ventas` (
  `id_comprador` int DEFAULT NULL,
  `id_rifa` int NOT NULL,
  `tipo_de_venta` int DEFAULT NULL,
  `forma_de_pago` int DEFAULT NULL,
  PRIMARY KEY (`id_rifa`),
  KEY `id_comprador` (`id_comprador`),
  KEY `tipo_de_venta` (`tipo_de_venta`),
  KEY `forma_de_pago` (`forma_de_pago`),
  CONSTRAINT `ventas_ibfk_1` FOREIGN KEY (`id_comprador`) REFERENCES `compradores` (`id_comprador`),
  CONSTRAINT `ventas_ibfk_2` FOREIGN KEY (`id_rifa`) REFERENCES `rifas` (`id_rifa`),
  CONSTRAINT `ventas_ibfk_3` FOREIGN KEY (`tipo_de_venta`) REFERENCES `tipos_de_ventas` (`id_tipo_de_venta`),
  CONSTRAINT `ventas_ibfk_4` FOREIGN KEY (`forma_de_pago`) REFERENCES `formas_pago` (`id_forma_pago`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ventas`
--

LOCK TABLES `ventas` WRITE;
/*!40000 ALTER TABLE `ventas` DISABLE KEYS */;
INSERT INTO `ventas` VALUES (1,1,2,1),(2,2,1,4),(3,3,1,2),(4,4,2,2),(5,5,1,1),(6,6,1,3),(7,7,2,4),(8,8,2,2),(9,9,1,1),(10,10,2,1),(11,11,1,4),(12,12,2,2),(13,13,2,4),(14,14,1,1),(15,15,1,1),(16,16,2,4),(17,17,1,4),(18,18,1,4),(19,19,1,1),(20,20,2,2),(7,21,2,1),(7,22,2,3),(5,23,1,3),(1,24,1,3),(16,25,2,4),(11,26,1,4),(10,27,2,4),(3,28,2,3),(15,29,1,4),(17,30,1,4);
/*!40000 ALTER TABLE `ventas` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `insert_ventas` AFTER INSERT ON `ventas` FOR EACH ROW BEGIN
	INSERT INTO auditoria_ventas (
		operacion,
		id_comprador,
		id_rifa)
	VALUES ('INSERT', NEW.id_comprador, NEW.id_rifa);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `update_ventas` AFTER UPDATE ON `ventas` FOR EACH ROW BEGIN
INSERT INTO auditoria_ventas (
operacion,
id_comprador,
id_rifa)
VALUES ('UPDATE', NEW.id_comprador, NEW.id_rifa);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `delete_ventas` AFTER DELETE ON `ventas` FOR EACH ROW BEGIN
	INSERT INTO auditoria_ventas (
	operacion,
	id_comprador,
	id_rifa)
VALUES ('DELETE', OLD.id_comprador, OLD.id_rifa);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `premios_y_ganadores`
--

/*!50001 DROP VIEW IF EXISTS `premios_y_ganadores`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `premios_y_ganadores` AS select `p`.`id_premio` AS `id_premio`,`p`.`descripcion_premio` AS `descripcion_premio`,`r`.`numero` AS `numero_rifa`,`c`.`nombre` AS `nombre`,`c`.`apellido` AS `apellido` from ((((`premios` `p` join `sorteos` `s` on((`p`.`id_premio` = `s`.`id_premio`))) join `rifas` `r` on((`s`.`resultado` = `r`.`id_rifa`))) join `ventas` `v` on((`r`.`id_rifa` = `v`.`id_rifa`))) join `compradores` `c` on((`v`.`id_comprador` = `c`.`id_comprador`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `resultados`
--

/*!50001 DROP VIEW IF EXISTS `resultados`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `resultados` AS select `s`.`id_sorteo` AS `id_sorteo`,`s`.`id_premio` AS `id_premio`,`r`.`numero` AS `numero_ganador`,`c`.`nombre` AS `nombre`,`c`.`apellido` AS `apellido` from (((`sorteos` `s` left join `rifas` `r` on((`s`.`resultado` = `r`.`id_rifa`))) left join `ventas` `v` on((`r`.`id_rifa` = `v`.`id_rifa`))) left join `compradores` `c` on((`v`.`id_comprador` = `c`.`id_comprador`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `rifa_por_comprador`
--

/*!50001 DROP VIEW IF EXISTS `rifa_por_comprador`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `rifa_por_comprador` AS select `r`.`numero` AS `numero`,`c`.`nombre` AS `nombre`,`c`.`apellido` AS `apellido` from ((`rifas` `r` left join `ventas` `v` on((`r`.`id_rifa` = `v`.`id_rifa`))) left join `compradores` `c` on((`v`.`id_comprador` = `c`.`id_comprador`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `rifas_sin_entregar`
--

/*!50001 DROP VIEW IF EXISTS `rifas_sin_entregar`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `rifas_sin_entregar` AS select `c`.`id_comprador` AS `id_comprador`,`c`.`nombre` AS `nombre`,`c`.`apellido` AS `apellido`,`c`.`domicilio` AS `domicilio`,`c`.`telefono` AS `telefono`,`r`.`id_rifa` AS `id_rifa`,`r`.`numero` AS `numero` from (((`compradores` `c` join `ventas` `v` on((`c`.`id_comprador` = `v`.`id_comprador`))) join `rifas` `r` on((`v`.`id_rifa` = `r`.`id_rifa`))) left join `entrega_rifas` `e` on((`r`.`id_rifa` = `e`.`id_rifa`))) where (`e`.`fecha_entrega` is null) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `rifas_sin_vender`
--

/*!50001 DROP VIEW IF EXISTS `rifas_sin_vender`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `rifas_sin_vender` AS select `r`.`id_rifa` AS `id_rifa`,`r`.`numero` AS `numero` from (`rifas` `r` left join `ventas` `v` on((`r`.`id_rifa` = `v`.`id_rifa`))) where (`v`.`id_rifa` is null) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-06-02 19:28:06
