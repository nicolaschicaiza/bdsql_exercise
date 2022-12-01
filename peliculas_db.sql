-- MySQL dump 10.13  Distrib 8.0.30, for Linux (x86_64)
--
-- Host: localhost    Database: peliculas_db
-- ------------------------------------------------------
-- Server version	8.0.30

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
-- Table structure for table `TBL_ACTOR`
--

DROP TABLE IF EXISTS `TBL_ACTOR`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `TBL_ACTOR` (
  `id_actor` int NOT NULL,
  `nombre` varchar(30) DEFAULT NULL,
  `apellido` varchar(30) DEFAULT NULL,
  `id_pais_fk` int NOT NULL,
  PRIMARY KEY (`id_actor`),
  KEY `id_pais_fk` (`id_pais_fk`),
  CONSTRAINT `TBL_ACTOR_ibfk_1` FOREIGN KEY (`id_pais_fk`) REFERENCES `TBL_PAIS` (`id_pais`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TBL_ACTOR`
--

LOCK TABLES `TBL_ACTOR` WRITE;
/*!40000 ALTER TABLE `TBL_ACTOR` DISABLE KEYS */;
INSERT INTO `TBL_ACTOR` VALUES (1,'PENELOPE','GUINESS',52),(2,'JIM','MOSTEL',57),(3,'SCARLETT','BENING',57);
/*!40000 ALTER TABLE `TBL_ACTOR` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TBL_PAIS`
--

DROP TABLE IF EXISTS `TBL_PAIS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `TBL_PAIS` (
  `id_pais` int NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `capital` varchar(50) NOT NULL,
  `codigo` varchar(3) DEFAULT NULL,
  PRIMARY KEY (`id_pais`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TBL_PAIS`
--

LOCK TABLES `TBL_PAIS` WRITE;
/*!40000 ALTER TABLE `TBL_PAIS` DISABLE KEYS */;
INSERT INTO `TBL_PAIS` VALUES (52,'México','Ciudad de México','MEX'),(56,'Chile','Santiago','CHL'),(57,'Colombia','Bogota','COL'),(59,'Ecuador','Quito','ECU');
/*!40000 ALTER TABLE `TBL_PAIS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TBL_PELICULA`
--

DROP TABLE IF EXISTS `TBL_PELICULA`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `TBL_PELICULA` (
  `titulo` varchar(50) NOT NULL,
  `genero` varchar(30) DEFAULT NULL,
  `director` varchar(60) DEFAULT NULL,
  `id_pais_fk` int NOT NULL,
  PRIMARY KEY (`titulo`),
  KEY `id_pais_fk` (`id_pais_fk`),
  CONSTRAINT `TBL_PELICULA_ibfk_1` FOREIGN KEY (`id_pais_fk`) REFERENCES `TBL_PAIS` (`id_pais`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TBL_PELICULA`
--

LOCK TABLES `TBL_PELICULA` WRITE;
/*!40000 ALTER TABLE `TBL_PELICULA` DISABLE KEYS */;
INSERT INTO `TBL_PELICULA` VALUES ('Crónicas','suspenso','Sebastian Cordero',59),('Jailbrake packt','suspenso','David Alaba',56),('La historia del baúl rosado','ficción','Libia Stella Gómez',57),('Rio Seco','drama','Pedro Hernández',57);
/*!40000 ALTER TABLE `TBL_PELICULA` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TBL_PELICULA_ACTOR`
--

DROP TABLE IF EXISTS `TBL_PELICULA_ACTOR`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `TBL_PELICULA_ACTOR` (
  `titulo` varchar(50) NOT NULL,
  `id_actor` int NOT NULL,
  KEY `titulo` (`titulo`),
  KEY `id_actor` (`id_actor`),
  CONSTRAINT `TBL_PELICULA_ACTOR_ibfk_1` FOREIGN KEY (`titulo`) REFERENCES `TBL_PELICULA` (`titulo`),
  CONSTRAINT `TBL_PELICULA_ACTOR_ibfk_2` FOREIGN KEY (`id_actor`) REFERENCES `TBL_ACTOR` (`id_actor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TBL_PELICULA_ACTOR`
--

LOCK TABLES `TBL_PELICULA_ACTOR` WRITE;
/*!40000 ALTER TABLE `TBL_PELICULA_ACTOR` DISABLE KEYS */;
INSERT INTO `TBL_PELICULA_ACTOR` VALUES ('Crónicas',1),('Rio Seco',3),('La historia del baúl rosado',2);
/*!40000 ALTER TABLE `TBL_PELICULA_ACTOR` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-12-01  1:55:55
