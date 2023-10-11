CREATE DATABASE  IF NOT EXISTS `gimnasio` /*!40100 DEFAULT CHARACTER SET utf8mb3 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `gimnasio`;
-- MySQL dump 10.13  Distrib 8.0.33, for Win64 (x86_64)
--
-- Host: localhost    Database: gimnasio
-- ------------------------------------------------------
-- Server version	8.0.33

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
-- Table structure for table `actividades`
--

DROP TABLE IF EXISTS `actividades`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `actividades` (
  `id_actividad` int NOT NULL AUTO_INCREMENT,
  `actividad` varchar(100) NOT NULL,
  `descripcion` text,
  `dirigida_a` varchar(50) NOT NULL,
  `nivel` varchar(50) NOT NULL,
  `duracion` time NOT NULL,
  `resistencia` tinyint(1) NOT NULL,
  `fuerza` tinyint(1) NOT NULL,
  `velocidad` tinyint(1) NOT NULL,
  `coordinacion` tinyint(1) NOT NULL,
  `flexibilidad` tinyint(1) NOT NULL,
  `observaciones` text,
  PRIMARY KEY (`id_actividad`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `actividades`
--

LOCK TABLES `actividades` WRITE;
/*!40000 ALTER TABLE `actividades` DISABLE KEYS */;
/*!40000 ALTER TABLE `actividades` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empresas`
--

DROP TABLE IF EXISTS `empresas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `empresas` (
  `nif` varchar(50) NOT NULL,
  `nombre_empresa` varchar(100) NOT NULL,
  `telefono_contacto` varchar(50) NOT NULL,
  `persona_contacto` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `fecha_inicio_convenio` date NOT NULL,
  `fecha_fin_convenio` date NOT NULL,
  PRIMARY KEY (`nif`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empresas`
--

LOCK TABLES `empresas` WRITE;
/*!40000 ALTER TABLE `empresas` DISABLE KEYS */;
/*!40000 ALTER TABLE `empresas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `historico_planes`
--

DROP TABLE IF EXISTS `historico_planes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `historico_planes` (
  `id_socio` int NOT NULL,
  `tipo_socio` varchar(50) NOT NULL,
  `fecha_cambio` date NOT NULL,
  `plan_anterior` int NOT NULL,
  `plan_actual` int NOT NULL,
  `nif_empresa` varchar(50) NOT NULL,
  `tarjeta_acceso` varchar(50) NOT NULL,
  `fecha_alta_plan_anterior` date NOT NULL,
  `baja_definitiva` tinyint(1) NOT NULL,
  PRIMARY KEY (`id_socio`,`fecha_cambio`),
  KEY `plan_anterior` (`plan_anterior`),
  KEY `plan_actual` (`plan_actual`),
  KEY `nif_empresa` (`nif_empresa`),
  CONSTRAINT `historico_planes_ibfk_1` FOREIGN KEY (`id_socio`) REFERENCES `socio` (`id_socio`),
  CONSTRAINT `historico_planes_ibfk_2` FOREIGN KEY (`plan_anterior`) REFERENCES `planes` (`id`),
  CONSTRAINT `historico_planes_ibfk_3` FOREIGN KEY (`plan_actual`) REFERENCES `planes` (`id`),
  CONSTRAINT `historico_planes_ibfk_4` FOREIGN KEY (`nif_empresa`) REFERENCES `empresas` (`nif`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `historico_planes`
--

LOCK TABLES `historico_planes` WRITE;
/*!40000 ALTER TABLE `historico_planes` DISABLE KEYS */;
/*!40000 ALTER TABLE `historico_planes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `horarios`
--

DROP TABLE IF EXISTS `horarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `horarios` (
  `id_actividad` int NOT NULL,
  `sala` varchar(50) NOT NULL,
  `fecha` date NOT NULL,
  `hora` time NOT NULL,
  `monitor` int NOT NULL,
  `observaciones` text,
  PRIMARY KEY (`id_actividad`,`sala`,`fecha`,`hora`),
  CONSTRAINT `horarios_ibfk_1` FOREIGN KEY (`id_actividad`) REFERENCES `actividades` (`id_actividad`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `horarios`
--

LOCK TABLES `horarios` WRITE;
/*!40000 ALTER TABLE `horarios` DISABLE KEYS */;
/*!40000 ALTER TABLE `horarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `instalaciones`
--

DROP TABLE IF EXISTS `instalaciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `instalaciones` (
  `id_instalacion` int NOT NULL AUTO_INCREMENT,
  `zona` varchar(50) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `descripcion` text,
  `tamaño_m2` int DEFAULT NULL,
  `aforo` int DEFAULT NULL,
  PRIMARY KEY (`id_instalacion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `instalaciones`
--

LOCK TABLES `instalaciones` WRITE;
/*!40000 ALTER TABLE `instalaciones` DISABLE KEYS */;
/*!40000 ALTER TABLE `instalaciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `monitores`
--

DROP TABLE IF EXISTS `monitores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `monitores` (
  `id_monitor` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `apellido1` varchar(50) NOT NULL,
  `apellido2` varchar(50) DEFAULT NULL,
  `fecha_nacimiento` date NOT NULL,
  `formacion` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_monitor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `monitores`
--

LOCK TABLES `monitores` WRITE;
/*!40000 ALTER TABLE `monitores` DISABLE KEYS */;
/*!40000 ALTER TABLE `monitores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plan_actividades`
--

DROP TABLE IF EXISTS `plan_actividades`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `plan_actividades` (
  `id_plan` int NOT NULL,
  `id_actividad` int NOT NULL,
  PRIMARY KEY (`id_plan`,`id_actividad`),
  KEY `id_actividad` (`id_actividad`),
  CONSTRAINT `plan_actividades_ibfk_1` FOREIGN KEY (`id_plan`) REFERENCES `planes` (`id`),
  CONSTRAINT `plan_actividades_ibfk_2` FOREIGN KEY (`id_actividad`) REFERENCES `actividades` (`id_actividad`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plan_actividades`
--

LOCK TABLES `plan_actividades` WRITE;
/*!40000 ALTER TABLE `plan_actividades` DISABLE KEYS */;
/*!40000 ALTER TABLE `plan_actividades` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `planes`
--

DROP TABLE IF EXISTS `planes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `planes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `tipo` varchar(50) NOT NULL,
  `matricula_persona` varchar(50) NOT NULL,
  `cuota_mensual` decimal(8,2) NOT NULL,
  `descripcion` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `planes`
--

LOCK TABLES `planes` WRITE;
/*!40000 ALTER TABLE `planes` DISABLE KEYS */;
/*!40000 ALTER TABLE `planes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `seguimientos`
--

DROP TABLE IF EXISTS `seguimientos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `seguimientos` (
  `id_socio` int NOT NULL,
  `año` int NOT NULL,
  `semana` int NOT NULL,
  `estatura` decimal(5,2) DEFAULT NULL,
  `peso` decimal(5,2) DEFAULT NULL,
  `pulsaciones_reposo` int DEFAULT NULL,
  `saturacion_oxigeno` decimal(4,2) DEFAULT NULL,
  `porcentaje_grasa_corporal` decimal(5,2) DEFAULT NULL,
  `recomendaciones` text,
  PRIMARY KEY (`id_socio`,`año`,`semana`),
  CONSTRAINT `seguimientos_ibfk_1` FOREIGN KEY (`id_socio`) REFERENCES `socio` (`id_socio`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seguimientos`
--

LOCK TABLES `seguimientos` WRITE;
/*!40000 ALTER TABLE `seguimientos` DISABLE KEYS */;
/*!40000 ALTER TABLE `seguimientos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `socio`
--

DROP TABLE IF EXISTS `socio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `socio` (
  `id_socio` int NOT NULL AUTO_INCREMENT,
  `documento_identidad` varchar(50) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `apellido1` varchar(100) NOT NULL,
  `apellido2` varchar(100) NOT NULL,
  `sexo` char(1) NOT NULL,
  `fecha_nacimiento` date NOT NULL,
  `plan` int NOT NULL,
  `fecha_alta` date NOT NULL,
  `num_tarjeta_acceso` varchar(50) NOT NULL,
  `telefono` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `ciudad` varchar(100) NOT NULL,
  `codigo_postal` varchar(50) NOT NULL,
  `enfermedades` text,
  `observaciones` text,
  `activo` tinyint(1) NOT NULL,
  `tipo_socio` varchar(50) NOT NULL,
  PRIMARY KEY (`id_socio`),
  KEY `plan` (`plan`),
  CONSTRAINT `socio_ibfk_1` FOREIGN KEY (`plan`) REFERENCES `planes` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `socio`
--

LOCK TABLES `socio` WRITE;
/*!40000 ALTER TABLE `socio` DISABLE KEYS */;
/*!40000 ALTER TABLE `socio` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-04-24  0:28:45
