-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: todoparrillas
-- ------------------------------------------------------
-- Server version	8.0.34

-- Se han agregado todas las tablas correspondientes al proyecto "todoparrillas-Ribot":
	-- Choferes
	-- Clientes
    -- Proveedorees
    -- Ventas
	-- Entregas
    -- Productos
    -- Log_Auditoria
-- Ademas tambien se han guardado los Procedures, funciones y triggers.

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `choferes`
--

DROP TABLE IF EXISTS `choferes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `choferes` (
  `id_chofer` int NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `telefono` int NOT NULL,
  `direccion` varchar(255) DEFAULT NULL,
  `vehiculo` varchar(255) DEFAULT NULL,
  `patente` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_chofer`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `choferes`
--

LOCK TABLES `choferes` WRITE;
/*!40000 ALTER TABLE `choferes` DISABLE KEYS */;
INSERT INTO `choferes` VALUES (1,'Fabian Quintero',1192845721,'Pedro Lozano 2294','Ford F100 roja modelo 1998','BAE293'),(2,'Ricardo Montaner',1182743819,'Av. Alvarez Jonte 1233','Fiat Fiorino blanca modelo 2007','HEA856'),(3,'Benito Flores',1192848392,'Colombo 2389','Ford CAM F4000 blanca modelo 2018','MAM294'),(4,'Antonio Gonzales',1192843719,'Emilio Mitre 1294','Ford Transit blanca modelo 1983','RAP923'),(5,'Roberto Carlos',1198285923,'Av. Roca 1463','Citroen Berlingo gris modelo 2005','DAO259');
/*!40000 ALTER TABLE `choferes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clientes`
--

DROP TABLE IF EXISTS `clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clientes` (
  `id_cliente` int NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `telefono` int NOT NULL,
  `direccion` varchar(255) NOT NULL,
  PRIMARY KEY (`id_cliente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientes`
--

LOCK TABLES `clientes` WRITE;
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
INSERT INTO `clientes` VALUES (1,'Roman Martinez',1192846371,'Irigoyen 2456 dpto A'),(2,'Gary Medel',1184750236,'Nahuel Huapi 234 SIN TIMBRE'),(3,'Gabriel Batistuta',1182751209,'Sanabria 2834'),(4,'Facundo Arana',1184624859,'Carlos Carranza 2483'),(5,'Gabriela Mistral',1184362542,'Cesar Diaz 2244 timbre abajo'),(7,'Alberto',12365482,'Av Siempre viva');
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `entregas`
--

DROP TABLE IF EXISTS `entregas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `entregas` (
  `id_entrega` int NOT NULL,
  `id_venta` int NOT NULL,
  `id_chofer` int NOT NULL,
  `fecha_entrega` date DEFAULT NULL,
  PRIMARY KEY (`id_entrega`),
  KEY `id_venta` (`id_venta`),
  KEY `id_chofer` (`id_chofer`),
  CONSTRAINT `entregas_ibfk_1` FOREIGN KEY (`id_venta`) REFERENCES `ventas` (`id_venta`),
  CONSTRAINT `entregas_ibfk_2` FOREIGN KEY (`id_chofer`) REFERENCES `choferes` (`id_chofer`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entregas`
--

LOCK TABLES `entregas` WRITE;
/*!40000 ALTER TABLE `entregas` DISABLE KEYS */;
INSERT INTO `entregas` VALUES (1,4,3,'2023-08-15'),(2,3,5,'2023-08-18'),(3,1,2,'2023-08-22'),(4,2,1,'2023-08-25'),(5,5,4,'2023-08-28');
/*!40000 ALTER TABLE `entregas` ENABLE KEYS */;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trg_After_Modifica_Entrega` AFTER UPDATE ON `entregas` FOR EACH ROW begin
    insert into LOG_AUDITORIA (CAMPONUEVO_CAMPOANTERIOR, NOMBRE_DE_ACCION, NOMBRE_TABLA, USUARIO, FECHA_UPD_INS_DEL, HORA_UPD_INS_DEL) values (concat('Dato nuevo: id_entrega: ', new.id_entrega, ' id_venta: ', new.id_venta, ' id_chofer: ', new.id_chofer, ' fecha_entrega: ', new.fecha_entrega, ' // Dato viejo: id_entrega: ', old.id_entrega, ' id_venta: ', old.id_venta, ' id_chofer: ', old.id_chofer, ' fecha_entrega: ', old.fecha_entrega), 'update', 'entregas', current_user(), current_date(), now());
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `log_auditoria`
--

DROP TABLE IF EXISTS `log_auditoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `log_auditoria` (
  `ID_LOG` int NOT NULL AUTO_INCREMENT,
  `CAMPONUEVO_CAMPOANTERIOR` varchar(500) DEFAULT NULL,
  `NOMBRE_DE_ACCION` varchar(10) DEFAULT NULL,
  `NOMBRE_TABLA` varchar(50) DEFAULT NULL,
  `USUARIO` varchar(100) DEFAULT NULL,
  `FECHA_UPD_INS_DEL` date DEFAULT NULL,
  `HORA_UPD_INS_DEL` time DEFAULT NULL,
  PRIMARY KEY (`ID_LOG`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `log_auditoria`
--

LOCK TABLES `log_auditoria` WRITE;
/*!40000 ALTER TABLE `log_auditoria` DISABLE KEYS */;
INSERT INTO `log_auditoria` VALUES (1,'Dato nuevo: id_entrega: 2 id_venta: 3 id_chofer: 5 fecha_entrega: 2023-08-18 // Dato viejo: id_entrega: 2 id_venta: 3 id_chofer: 5 fecha_entrega: 2023-08-18','update','entregas','root@localhost','2023-11-27','20:19:29'),(2,'Dato viejo: id_proveedor: 1 nombre: Hierro CORT telefono: 1129584723 direccion: Av. Marcelo T. de Alvear 2295 comentario: Daniel. Perfileria de hierro. No trabajan Acero Inoxidable.','delete','proveedores','root@localhost','2023-11-27','20:19:29');
/*!40000 ALTER TABLE `log_auditoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productos`
--

DROP TABLE IF EXISTS `productos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `productos` (
  `id_producto` int NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `precio` int NOT NULL,
  `stock` int DEFAULT NULL,
  PRIMARY KEY (`id_producto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productos`
--

LOCK TABLES `productos` WRITE;
/*!40000 ALTER TABLE `productos` DISABLE KEYS */;
INSERT INTO `productos` VALUES (1,'Barbacoa Argentina',10000,5),(2,'Flama Asador',15000,10),(3,'Portatil Clasica',8000,26),(4,'QBO',25000,3),(5,'Gas',24550,13),(6,'Brasero',5000,23);
/*!40000 ALTER TABLE `productos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proveedores`
--

DROP TABLE IF EXISTS `proveedores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `proveedores` (
  `id_proveedor` int NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `telefono` int DEFAULT NULL,
  `direccion` varchar(255) NOT NULL,
  `comentario` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_proveedor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proveedores`
--

LOCK TABLES `proveedores` WRITE;
/*!40000 ALTER TABLE `proveedores` DISABLE KEYS */;
INSERT INTO `proveedores` VALUES (2,'Indartubo',1195827406,'Av. San Martin 991','Martin. Tubos más barato. Demora en la entrega. Pago 30/60.'),(3,'Aceros Mitre',1143569286,'Av. Mitre 2351','Alberto. Chapa de disponibilidad rapida. Pago al contado.'),(4,'FAMIC',1194623531,'Av. Alvarez Thomas 1200','Javier. Chapa y perfileria de Inoxidable. Caro pero entrega al momento.'),(5,'Chatarra Lopez',1192835241,'Av. Hipolito Irigoyen 941','Roberto. Compra venta de chatarra. Suele tener buen material');
/*!40000 ALTER TABLE `proveedores` ENABLE KEYS */;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trg_Before_Elimina_Proveedor` BEFORE DELETE ON `proveedores` FOR EACH ROW begin
	insert into LOG_AUDITORIA (CAMPONUEVO_CAMPOANTERIOR, NOMBRE_DE_ACCION, NOMBRE_TABLA, USUARIO, FECHA_UPD_INS_DEL, HORA_UPD_INS_DEL) values (concat('Dato viejo: id_proveedor: ', old.id_proveedor, ' nombre: ', old.nombre, ' telefono: ', old.telefono, ' direccion: ', old.direccion, ' comentario: ', old.comentario), 'delete', 'proveedores', current_user(), current_date(), now());
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `ventas`
--

DROP TABLE IF EXISTS `ventas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ventas` (
  `id_venta` int NOT NULL,
  `numero_factura` int NOT NULL,
  `id_cliente` int NOT NULL,
  `total` int DEFAULT NULL,
  `estado_pago` varchar(255) NOT NULL,
  PRIMARY KEY (`id_venta`),
  KEY `id_cliente` (`id_cliente`),
  CONSTRAINT `ventas_ibfk_1` FOREIGN KEY (`id_cliente`) REFERENCES `clientes` (`id_cliente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ventas`
--

LOCK TABLES `ventas` WRITE;
/*!40000 ALTER TABLE `ventas` DISABLE KEYS */;
INSERT INTO `ventas` VALUES (1,399,2,50000,'Pendiente de Pago'),(2,394,1,41000,'Paga Contraentrega'),(3,378,4,32900,'Pagado Targeta de Credito'),(4,389,5,20000,'Pagado Efectivo'),(5,391,3,21000,'Pendiente de Pago');
/*!40000 ALTER TABLE `ventas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `vw_clientes_deudores`
--

DROP TABLE IF EXISTS `vw_clientes_deudores`;
/*!50001 DROP VIEW IF EXISTS `vw_clientes_deudores`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_clientes_deudores` AS SELECT 
 1 AS `nombre`,
 1 AS `telefono`,
 1 AS `direccion`,
 1 AS `numero_factura`,
 1 AS `total`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_entregas_impagas`
--

DROP TABLE IF EXISTS `vw_entregas_impagas`;
/*!50001 DROP VIEW IF EXISTS `vw_entregas_impagas`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_entregas_impagas` AS SELECT 
 1 AS `id_entrega`,
 1 AS `id_chofer`,
 1 AS `fecha_entrega`,
 1 AS `total`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_productos_stock_critico`
--

DROP TABLE IF EXISTS `vw_productos_stock_critico`;
/*!50001 DROP VIEW IF EXISTS `vw_productos_stock_critico`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_productos_stock_critico` AS SELECT 
 1 AS `id_producto`,
 1 AS `nombre`,
 1 AS `precio`,
 1 AS `stock`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_proveedores_chapa`
--

DROP TABLE IF EXISTS `vw_proveedores_chapa`;
/*!50001 DROP VIEW IF EXISTS `vw_proveedores_chapa`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_proveedores_chapa` AS SELECT 
 1 AS `id_proveedor`,
 1 AS `nombre`,
 1 AS `telefono`,
 1 AS `direccion`,
 1 AS `comentario`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_ventas`
--

DROP TABLE IF EXISTS `vw_ventas`;
/*!50001 DROP VIEW IF EXISTS `vw_ventas`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_ventas` AS SELECT 
 1 AS `id_venta`,
 1 AS `numero_factura`,
 1 AS `id_cliente`,
 1 AS `total`,
 1 AS `estado_pago`*/;
SET character_set_client = @saved_cs_client;

--
-- Dumping events for database 'todoparrillas'
--

--
-- Dumping routines for database 'todoparrillas'
--
/*!50003 DROP FUNCTION IF EXISTS `fn_IVA_Pagado` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fn_IVA_Pagado`(iva decimal(4,2), id_venta int) RETURNS int
    DETERMINISTIC
begin
		 declare iva_Pagado int ;
		 set iva_Pagado =  
				(	
				select distinct total * iva 
				from ventas
				where ventas.id_venta = id_venta
				);
		return  iva_Pagado;   
	end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fn_Nombre_Cliente` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fn_Nombre_Cliente`(id_cliente int) RETURNS varchar(255) CHARSET utf8mb4
    DETERMINISTIC
begin
		 declare nombre_cliente VARCHAR(255) ;
		 set nombre_cliente =  
				(	
				select nombre
				from clientes
				where clientes.id_cliente = id_cliente
				);
		return  nombre_cliente;
	end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_Insertar` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_Insertar`(
										in p_Id_Cliente INT,
										in p_Nombre VARCHAR(255),
										in p_Telefono INT,
										in p_Direccion VARCHAR(255),
										out p_Mensaje VARCHAR(255)
									)
begin
		if p_Id_Cliente = null or p_Nombre = '' or p_Telefono = null or p_direccion = '' then
			set p_Mensaje = CONCAT('ERROR: Faltan datos. Recuerde que el orden de insert es id_cliente, nombre, telefono y direccion');
            
			else
				insert into clientes values (p_Id_Cliente, p_Nombre, p_Telefono, p_Direccion);
		end if;
	end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_Procedimiento_Orden` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_Procedimiento_Orden`(
												in columna VARCHAR(50),
												in orden VARCHAR(10),
												out p_Id_Cliente INT,
												out p_Nombre VARCHAR(255),
												out p_Telefono INT,
												out p_Direccion VARCHAR(255),
                                                out p_Mensaje VARCHAR(255)
											)
begin
		if orden = 'desc' then
			select * 
			into p_Id_Cliente, p_Nombre, p_Telefono, p_Direccion
			from clientes
			order by columna desc
            limit 1;
            
			elseif orden = 'asc' then
				select id_cliente, nombre, telefono, direccion
				into p_Id_Cliente, p_Nombre, p_Telefono, p_Direccion
				from clientes
				order by columna asc
                limit 1;
                
			else
				set p_Mensaje = CONCAT('ERROR: el tipo de ordenamiento',orden,' no forma parte de lo posible.');
		end if;
	end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `vw_clientes_deudores`
--

/*!50001 DROP VIEW IF EXISTS `vw_clientes_deudores`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_clientes_deudores` AS select `clientes`.`nombre` AS `nombre`,`clientes`.`telefono` AS `telefono`,`clientes`.`direccion` AS `direccion`,`ventas`.`numero_factura` AS `numero_factura`,`ventas`.`total` AS `total` from (`ventas` join `clientes` on((`clientes`.`id_cliente` = `ventas`.`id_cliente`))) where (not((`ventas`.`estado_pago` like '%Pagado%'))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_entregas_impagas`
--

/*!50001 DROP VIEW IF EXISTS `vw_entregas_impagas`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_entregas_impagas` AS select `entregas`.`id_entrega` AS `id_entrega`,`entregas`.`id_chofer` AS `id_chofer`,`entregas`.`fecha_entrega` AS `fecha_entrega`,`ventas`.`total` AS `total` from (`entregas` join `ventas` on((`ventas`.`id_venta` = `entregas`.`id_venta`))) where (not((`ventas`.`estado_pago` like '%Pagado%'))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_productos_stock_critico`
--

/*!50001 DROP VIEW IF EXISTS `vw_productos_stock_critico`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_productos_stock_critico` AS select `productos`.`id_producto` AS `id_producto`,`productos`.`nombre` AS `nombre`,`productos`.`precio` AS `precio`,`productos`.`stock` AS `stock` from `productos` where (`productos`.`stock` <= 5) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_proveedores_chapa`
--

/*!50001 DROP VIEW IF EXISTS `vw_proveedores_chapa`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_proveedores_chapa` AS select `proveedores`.`id_proveedor` AS `id_proveedor`,`proveedores`.`nombre` AS `nombre`,`proveedores`.`telefono` AS `telefono`,`proveedores`.`direccion` AS `direccion`,`proveedores`.`comentario` AS `comentario` from `proveedores` where (`proveedores`.`comentario` like '%Chapa%') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_ventas`
--

/*!50001 DROP VIEW IF EXISTS `vw_ventas`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_ventas` AS select `ventas`.`id_venta` AS `id_venta`,`ventas`.`numero_factura` AS `numero_factura`,`ventas`.`id_cliente` AS `id_cliente`,`ventas`.`total` AS `total`,`ventas`.`estado_pago` AS `estado_pago` from `ventas` where (`ventas`.`estado_pago` like '%Pagado%') */;
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

-- Dump completed on 2023-12-05 11:05:15
