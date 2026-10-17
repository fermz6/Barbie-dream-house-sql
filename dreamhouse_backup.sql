-- MariaDB dump 10.19  Distrib 10.4.28-MariaDB, for osx10.10 (x86_64)
--
-- Host: localhost    Database: dreamhouse_db
-- ------------------------------------------------------
-- Server version	10.4.28-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Current Database: `dreamhouse_db`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `dreamhouse_db` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;

USE `dreamhouse_db`;

--
-- Table structure for table `actuators`
--

DROP TABLE IF EXISTS `actuators`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `actuators` (
  `device_id` int(11) NOT NULL,
  `current_state` varchar(50) DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  PRIMARY KEY (`device_id`),
  CONSTRAINT `fk_actuator_device` FOREIGN KEY (`device_id`) REFERENCES `dreamhouse_devices` (`device_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `actuators`
--

LOCK TABLES `actuators` WRITE;
/*!40000 ALTER TABLE `actuators` DISABLE KEYS */;
INSERT INTO `actuators` VALUES (2,NULL,NULL),(4,NULL,NULL),(6,NULL,NULL),(7,NULL,NULL),(9,NULL,NULL),(11,NULL,NULL),(13,NULL,NULL),(15,NULL,NULL),(17,NULL,NULL),(18,NULL,NULL),(20,NULL,NULL);
/*!40000 ALTER TABLE `actuators` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `commands`
--

DROP TABLE IF EXISTS `commands`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `commands` (
  `command_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `device_id` int(11) NOT NULL,
  `value_command` varchar(50) NOT NULL,
  `command_source` varchar(20) NOT NULL,
  `command_status` varchar(20) NOT NULL DEFAULT 'PENDING',
  `time_command` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`command_id`),
  KEY `fk_command_user` (`user_id`),
  KEY `fk_command_actuator` (`device_id`),
  CONSTRAINT `fk_command_actuator` FOREIGN KEY (`device_id`) REFERENCES `actuators` (`device_id`),
  CONSTRAINT `fk_command_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `commands`
--

LOCK TABLES `commands` WRITE;
/*!40000 ALTER TABLE `commands` DISABLE KEYS */;
INSERT INTO `commands` VALUES (1,NULL,2,'ON','AUTOMATIC','COMPLETED','2026-10-16 21:16:46');
/*!40000 ALTER TABLE `commands` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dreamhouse_devices`
--

DROP TABLE IF EXISTS `dreamhouse_devices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dreamhouse_devices` (
  `device_id` int(11) NOT NULL AUTO_INCREMENT,
  `room_id` int(11) NOT NULL,
  `device_name` varchar(50) NOT NULL,
  `device_type` varchar(50) NOT NULL,
  PRIMARY KEY (`device_id`),
  KEY `fk_device_room` (`room_id`),
  CONSTRAINT `fk_device_room` FOREIGN KEY (`room_id`) REFERENCES `dreamhouse_rooms` (`room_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dreamhouse_devices`
--

LOCK TABLES `dreamhouse_devices` WRITE;
/*!40000 ALTER TABLE `dreamhouse_devices` DISABLE KEYS */;
INSERT INTO `dreamhouse_devices` VALUES (1,1,'Bedroom LDR','Sensor'),(2,1,'Bedroom LED','Actuator'),(3,2,'Kitchen Stove Button','Sensor'),(4,2,'Kitchen LED Stove','Actuator'),(5,2,'Kitchen Oven Push Button','Sensor'),(6,2,'Kitchen Oven LED','Actuator'),(7,2,'Kitchen Oven Buzzer','Actuator'),(8,3,'Bathroom LDR','Sensor'),(9,3,'Bathroom LED','Actuator'),(10,4,'Living Room BME280','Sensor'),(11,4,'Living Room LED temperature','Actuator'),(12,5,'VL5L0X Distance','Sensor'),(13,5,'Garage Servo Motor','Actuator'),(14,6,'Rain Sensor','Sensor'),(15,6,'Garden Servo Motor','Actuator'),(16,7,'RFID Reader','Sensor'),(17,7,'Elevator Motor','Actuator'),(18,7,'Oled display Welcome','Actuator'),(19,7,'Push Button','Sensor'),(20,7,'Buzzer','Actuator');
/*!40000 ALTER TABLE `dreamhouse_devices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dreamhouse_rooms`
--

DROP TABLE IF EXISTS `dreamhouse_rooms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dreamhouse_rooms` (
  `room_id` int(11) NOT NULL AUTO_INCREMENT,
  `room_name` varchar(50) NOT NULL,
  PRIMARY KEY (`room_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dreamhouse_rooms`
--

LOCK TABLES `dreamhouse_rooms` WRITE;
/*!40000 ALTER TABLE `dreamhouse_rooms` DISABLE KEYS */;
INSERT INTO `dreamhouse_rooms` VALUES (1,'Bedroom'),(2,'Kitchen'),(3,'Bathroom'),(4,'Living Room'),(5,'Garage'),(6,'Garden'),(7,'Entrance');
/*!40000 ALTER TABLE `dreamhouse_rooms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rfid_cards`
--

DROP TABLE IF EXISTS `rfid_cards`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rfid_cards` (
  `card_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `rfid_uid` varchar(50) NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`card_id`),
  UNIQUE KEY `rfid_uid` (`rfid_uid`),
  KEY `fk_rfid_user` (`user_id`),
  CONSTRAINT `fk_rfid_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rfid_cards`
--

LOCK TABLES `rfid_cards` WRITE;
/*!40000 ALTER TABLE `rfid_cards` DISABLE KEYS */;
INSERT INTO `rfid_cards` VALUES (1,1,'A01663341',1),(2,2,'A01663244',1),(3,3,'BARBIE123',0);
/*!40000 ALTER TABLE `rfid_cards` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sensor_readings`
--

DROP TABLE IF EXISTS `sensor_readings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sensor_readings` (
  `reading_id` int(11) NOT NULL AUTO_INCREMENT,
  `device_id` int(11) NOT NULL,
  `measurement_type` varchar(30) NOT NULL,
  `reading_value` decimal(10,2) NOT NULL,
  `unit` varchar(10) NOT NULL,
  `time_reading` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`reading_id`),
  KEY `fk_reading_sensor` (`device_id`),
  CONSTRAINT `fk_reading_sensor` FOREIGN KEY (`device_id`) REFERENCES `sensors` (`device_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sensor_readings`
--

LOCK TABLES `sensor_readings` WRITE;
/*!40000 ALTER TABLE `sensor_readings` DISABLE KEYS */;
INSERT INTO `sensor_readings` VALUES (1,1,'Light',100.00,'raw','2026-10-16 21:16:46');
/*!40000 ALTER TABLE `sensor_readings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sensors`
--

DROP TABLE IF EXISTS `sensors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sensors` (
  `device_id` int(11) NOT NULL,
  PRIMARY KEY (`device_id`),
  CONSTRAINT `fk_sensor_device` FOREIGN KEY (`device_id`) REFERENCES `dreamhouse_devices` (`device_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sensors`
--

LOCK TABLES `sensors` WRITE;
/*!40000 ALTER TABLE `sensors` DISABLE KEYS */;
INSERT INTO `sensors` VALUES (1),(3),(5),(8),(10),(12),(14),(16),(19);
/*!40000 ALTER TABLE `sensors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Fernanda'),(2,'Vanessa'),(3,'Barbie');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-10-16 23:04:38
