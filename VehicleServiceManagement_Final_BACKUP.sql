-- MySQL dump 10.13  Distrib 8.0.46, for Win64 (x86_64)
--
-- Host: localhost    Database: vehicle_service_db
-- ------------------------------------------------------
-- Server version	8.0.46

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
-- Table structure for table `bills`
--

DROP TABLE IF EXISTS `bills`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bills` (
  `bill_id` int NOT NULL AUTO_INCREMENT,
  `job_card_id` int NOT NULL,
  `subtotal` decimal(10,2) NOT NULL DEFAULT '0.00',
  `tax` decimal(10,2) NOT NULL DEFAULT '0.00',
  `discount` decimal(10,2) NOT NULL DEFAULT '0.00',
  `total_amount` decimal(10,2) NOT NULL DEFAULT '0.00',
  `bill_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`bill_id`),
  UNIQUE KEY `job_card_id` (`job_card_id`),
  CONSTRAINT `bills_ibfk_1` FOREIGN KEY (`job_card_id`) REFERENCES `job_cards` (`job_card_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bills`
--

LOCK TABLES `bills` WRITE;
/*!40000 ALTER TABLE `bills` DISABLE KEYS */;
INSERT INTO `bills` VALUES (1,1,2400.00,432.00,100.00,2732.00,'2026-10-08 15:12:07'),(2,2,3000.00,540.00,150.00,3390.00,'2026-10-08 15:12:07'),(3,3,4000.00,720.00,200.00,4520.00,'2026-10-08 15:12:07'),(4,4,1500.00,270.00,0.00,1770.00,'2026-10-10 11:01:02');
/*!40000 ALTER TABLE `bills` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customers` (
  `customer_id` int NOT NULL AUTO_INCREMENT,
  `customer_name` varchar(100) NOT NULL,
  `phone` varchar(15) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`customer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers`
--

LOCK TABLES `customers` WRITE;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
INSERT INTO `customers` VALUES (1,'Rahul Sharma','9876543210','rahul@gmail.com','Mumbai','2026-10-08 14:44:41'),(2,'Amit Patil','9876543211','amit@gmail.com','Navi Mumbai','2026-10-08 14:44:41'),(3,'Sneha Joshi','9876543212','sneha@gmail.com','Thane','2026-10-08 14:44:41'),(4,'Test Customer','9000000000','test.customer@example.com','Mumbai','2026-10-10 10:14:31');
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `job_cards`
--

DROP TABLE IF EXISTS `job_cards`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `job_cards` (
  `job_card_id` int NOT NULL AUTO_INCREMENT,
  `vehicle_id` int NOT NULL,
  `mechanic_id` int DEFAULT NULL,
  `complaint` varchar(500) NOT NULL,
  `inspection_notes` varchar(1000) DEFAULT NULL,
  `service_date` date NOT NULL,
  `status` varchar(30) DEFAULT 'RECEIVED',
  `estimated_cost` decimal(10,2) DEFAULT '0.00',
  PRIMARY KEY (`job_card_id`),
  KEY `vehicle_id` (`vehicle_id`),
  KEY `mechanic_id` (`mechanic_id`),
  CONSTRAINT `job_cards_ibfk_1` FOREIGN KEY (`vehicle_id`) REFERENCES `vehicles` (`vehicle_id`),
  CONSTRAINT `job_cards_ibfk_2` FOREIGN KEY (`mechanic_id`) REFERENCES `mechanics` (`mechanic_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job_cards`
--

LOCK TABLES `job_cards` WRITE;
/*!40000 ALTER TABLE `job_cards` DISABLE KEYS */;
INSERT INTO `job_cards` VALUES (1,1,1,'Engine oil change and general servicing','Engine checked. Oil level low. Brake condition normal.','2026-10-08','IN_PROGRESS',2500.00),(2,2,2,'AC not cooling properly','AC refrigerant level checked. Electrical connections need inspection.','2026-10-08','ASSIGNED',3500.00),(3,3,3,'Brake noise while driving','Front brake pads worn and require replacement.','2026-10-08','RECEIVED',4200.00),(4,2,4,'Customer reports vibration while braking','Initial inspection required. Check brake pads and discs','2026-10-10','RECEIVED',1500.00);
/*!40000 ALTER TABLE `job_cards` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mechanics`
--

DROP TABLE IF EXISTS `mechanics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mechanics` (
  `mechanic_id` int NOT NULL AUTO_INCREMENT,
  `mechanic_name` varchar(100) NOT NULL,
  `phone` varchar(15) DEFAULT NULL,
  `specialization` varchar(100) DEFAULT NULL,
  `experience_years` int DEFAULT '0',
  `status` varchar(20) DEFAULT 'ACTIVE',
  PRIMARY KEY (`mechanic_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mechanics`
--

LOCK TABLES `mechanics` WRITE;
/*!40000 ALTER TABLE `mechanics` DISABLE KEYS */;
INSERT INTO `mechanics` VALUES (1,'Amit Jadhav','9876501111','Engine & General Service',5,'AVAILABLE'),(2,'Rohit Patil','9876502222','Electrical & Diagnostics',4,'AVAILABLE'),(3,'Sagar More','9876503333','Brakes & Suspension',6,'AVAILABLE'),(4,'Test Mechanic','9874563210','General Service',2,'AVAILABLE');
/*!40000 ALTER TABLE `mechanics` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `parts`
--

DROP TABLE IF EXISTS `parts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `parts` (
  `part_id` int NOT NULL AUTO_INCREMENT,
  `part_name` varchar(100) NOT NULL,
  `part_number` varchar(50) DEFAULT NULL,
  `category` varchar(50) DEFAULT NULL,
  `unit_price` decimal(10,2) NOT NULL,
  `stock_quantity` int DEFAULT '0',
  `reorder_level` int DEFAULT '5',
  PRIMARY KEY (`part_id`),
  UNIQUE KEY `part_number` (`part_number`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `parts`
--

LOCK TABLES `parts` WRITE;
/*!40000 ALTER TABLE `parts` DISABLE KEYS */;
INSERT INTO `parts` VALUES (1,'Engine Oil 5W-30','EO-5W30-001','Lubricants',850.00,20,5),(2,'Oil Filter','OF-001','Filters',350.00,15,5),(3,'Air Filter','AF-001','Filters',600.00,10,5),(4,'Brake Pads Front','BP-F-001','Brakes',1800.00,8,5),(5,'AC Refrigerant Gas','ACG-001','AC',1200.00,12,5),(6,'Spark Plug','SP-001','Engine',450.00,20,5);
/*!40000 ALTER TABLE `parts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `parts_used`
--

DROP TABLE IF EXISTS `parts_used`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `parts_used` (
  `part_used_id` int NOT NULL AUTO_INCREMENT,
  `job_card_id` int NOT NULL,
  `part_id` int NOT NULL,
  `quantity` int NOT NULL,
  `unit_price` decimal(10,2) NOT NULL,
  `total_price` decimal(10,2) NOT NULL,
  PRIMARY KEY (`part_used_id`),
  KEY `job_card_id` (`job_card_id`),
  KEY `part_id` (`part_id`),
  CONSTRAINT `parts_used_ibfk_1` FOREIGN KEY (`job_card_id`) REFERENCES `job_cards` (`job_card_id`),
  CONSTRAINT `parts_used_ibfk_2` FOREIGN KEY (`part_id`) REFERENCES `parts` (`part_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `parts_used`
--

LOCK TABLES `parts_used` WRITE;
/*!40000 ALTER TABLE `parts_used` DISABLE KEYS */;
INSERT INTO `parts_used` VALUES (1,1,1,1,850.00,850.00),(2,1,2,1,350.00,350.00),(3,2,5,1,1200.00,1200.00),(4,3,4,1,1800.00,1800.00);
/*!40000 ALTER TABLE `parts_used` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payments`
--

DROP TABLE IF EXISTS `payments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payments` (
  `payment_id` int NOT NULL AUTO_INCREMENT,
  `bill_id` int NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `payment_method` varchar(30) NOT NULL,
  `transaction_id` varchar(100) DEFAULT NULL,
  `payment_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `payment_status` varchar(20) DEFAULT 'SUCCESS',
  PRIMARY KEY (`payment_id`),
  KEY `bill_id` (`bill_id`),
  CONSTRAINT `payments_ibfk_1` FOREIGN KEY (`bill_id`) REFERENCES `bills` (`bill_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payments`
--

LOCK TABLES `payments` WRITE;
/*!40000 ALTER TABLE `payments` DISABLE KEYS */;
INSERT INTO `payments` VALUES (1,1,2732.00,'UPI','UPI-10001','2026-10-08 15:14:20','SUCCESS'),(2,2,3390.00,'CASH',NULL,'2026-10-08 15:14:20','SUCCESS'),(3,3,4520.00,'CARD','CARD-10001','2026-10-08 15:14:20','SUCCESS'),(4,4,1770.00,'CASH',NULL,'2026-10-10 11:05:55','SUCCESS');
/*!40000 ALTER TABLE `payments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `services`
--

DROP TABLE IF EXISTS `services`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `services` (
  `service_id` int NOT NULL AUTO_INCREMENT,
  `service_name` varchar(100) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `standard_price` decimal(10,2) NOT NULL,
  PRIMARY KEY (`service_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `services`
--

LOCK TABLES `services` WRITE;
/*!40000 ALTER TABLE `services` DISABLE KEYS */;
INSERT INTO `services` VALUES (1,'Engine Oil Change','Engine oil replacement with basic inspection',1200.00),(2,'General Service','Complete vehicle inspection and routine servicing',2500.00),(3,'AC Service','AC inspection, cleaning and refrigerant check',1800.00),(4,'Brake Service','Brake inspection and brake pad service',2200.00),(5,'Wheel Alignment','Wheel alignment and balancing service',1000.00);
/*!40000 ALTER TABLE `services` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` varchar(30) NOT NULL DEFAULT 'RECEPTIONIST',
  `full_name` varchar(100) NOT NULL,
  `status` varchar(20) DEFAULT 'ACTIVE',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'admin','admin123','ADMIN','System Administrator','ACTIVE','2026-10-08 15:15:40'),(2,'reception','recep123','RECEPTIONIST','Reception Staff','ACTIVE','2026-10-08 15:15:40'),(3,'mechanic1','mech123','MECHANIC','Amit Jadhav','ACTIVE','2026-10-08 15:15:40'),(4,'manager','manager123','MANAGER','Service Manager','ACTIVE','2026-10-08 15:15:40');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vehicles`
--

DROP TABLE IF EXISTS `vehicles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vehicles` (
  `vehicle_id` int NOT NULL AUTO_INCREMENT,
  `customer_id` int NOT NULL,
  `registration_number` varchar(20) NOT NULL,
  `brand` varchar(50) NOT NULL,
  `model` varchar(50) NOT NULL,
  `fuel_type` varchar(20) DEFAULT NULL,
  `manufacturing_year` int DEFAULT NULL,
  `color` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`vehicle_id`),
  UNIQUE KEY `registration_number` (`registration_number`),
  KEY `customer_id` (`customer_id`),
  CONSTRAINT `vehicles_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`customer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vehicles`
--

LOCK TABLES `vehicles` WRITE;
/*!40000 ALTER TABLE `vehicles` DISABLE KEYS */;
INSERT INTO `vehicles` VALUES (1,1,'MH01AB1234','Maruti Suzuki','Swift','PETROL',2022,'White'),(2,2,'MH04CD5678','Hyundai','Creta','DIESEL',2021,'Black'),(3,3,'MH05EF9012','Honda','City','PETROL',2023,'Red'),(4,2,'MH02XX9999','Tata','Nexon','PETROL',2024,'Blue');
/*!40000 ALTER TABLE `vehicles` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-10-10 18:06:49
