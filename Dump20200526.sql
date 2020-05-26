-- MySQL dump 10.13  Distrib 8.0.20, for Win64 (x86_64)
--
-- Host: localhost    Database: myproject
-- ------------------------------------------------------
-- Server version	8.0.20

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
-- Table structure for table `ad_place`
--

DROP TABLE IF EXISTS `ad_place`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ad_place` (
  `Place_ID` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `AD_ID` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `AD_Name` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `Company_ID` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `AD_Contant` text CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `Place_Date` date NOT NULL,
  `Place_Days` int NOT NULL,
  PRIMARY KEY (`Place_ID`),
  KEY `AD_Place_FK` (`AD_ID`),
  KEY `AD_Place_FK1` (`Company_ID`),
  CONSTRAINT `AD_Place_FK` FOREIGN KEY (`AD_ID`) REFERENCES `advertisement` (`AD_ID`),
  CONSTRAINT `AD_Place_FK1` FOREIGN KEY (`Company_ID`) REFERENCES `company_list` (`Company_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ad_place`
--

LOCK TABLES `ad_place` WRITE;
/*!40000 ALTER TABLE `ad_place` DISABLE KEYS */;
/*!40000 ALTER TABLE `ad_place` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `advertisement`
--

DROP TABLE IF EXISTS `advertisement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `advertisement` (
  `AD_ID` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `Plan_Name` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `Plan_Content` text CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`AD_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `advertisement`
--

LOCK TABLES `advertisement` WRITE;
/*!40000 ALTER TABLE `advertisement` DISABLE KEYS */;
/*!40000 ALTER TABLE `advertisement` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `article`
--

DROP TABLE IF EXISTS `article`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `article` (
  `Article_ID` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `Member_ID` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `Title` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `Content` text CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`Article_ID`),
  KEY `Article_FK` (`Member_ID`),
  CONSTRAINT `Article_FK` FOREIGN KEY (`Member_ID`) REFERENCES `member` (`Member_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `article`
--

LOCK TABLES `article` WRITE;
/*!40000 ALTER TABLE `article` DISABLE KEYS */;
/*!40000 ALTER TABLE `article` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `company_list`
--

DROP TABLE IF EXISTS `company_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `company_list` (
  `Company_ID` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `Company_Name` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `Contact_Person` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `Address` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `Phone` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`Company_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `company_list`
--

LOCK TABLES `company_list` WRITE;
/*!40000 ALTER TABLE `company_list` DISABLE KEYS */;
/*!40000 ALTER TABLE `company_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `delivery`
--

DROP TABLE IF EXISTS `delivery`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `delivery` (
  `Delivery_ID` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `Date` date NOT NULL,
  `Total_Price` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `Progress` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `LP_ID` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`Delivery_ID`),
  KEY `Delivery_FK` (`LP_ID`),
  CONSTRAINT `Delivery_FK` FOREIGN KEY (`LP_ID`) REFERENCES `logistics_provider` (`LP_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `delivery`
--

LOCK TABLES `delivery` WRITE;
/*!40000 ALTER TABLE `delivery` DISABLE KEYS */;
/*!40000 ALTER TABLE `delivery` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `delivery_detail`
--

DROP TABLE IF EXISTS `delivery_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `delivery_detail` (
  `Delivery_ID` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `Detail_ID` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `Product_ID` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `Price` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `Amount` int NOT NULL,
  PRIMARY KEY (`Detail_ID`),
  KEY `Delivery_Detail_FK` (`Delivery_ID`),
  KEY `Delivery_Detail_FK1` (`Product_ID`),
  CONSTRAINT `Delivery_Detail_FK` FOREIGN KEY (`Delivery_ID`) REFERENCES `delivery` (`Delivery_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `Delivery_Detail_FK1` FOREIGN KEY (`Product_ID`) REFERENCES `product` (`Product_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `delivery_detail`
--

LOCK TABLES `delivery_detail` WRITE;
/*!40000 ALTER TABLE `delivery_detail` DISABLE KEYS */;
/*!40000 ALTER TABLE `delivery_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `logistics_provider`
--

DROP TABLE IF EXISTS `logistics_provider`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `logistics_provider` (
  `LP_ID` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `LP_Name` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `Contact_Person` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `Address` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `Phone` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`LP_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `logistics_provider`
--

LOCK TABLES `logistics_provider` WRITE;
/*!40000 ALTER TABLE `logistics_provider` DISABLE KEYS */;
/*!40000 ALTER TABLE `logistics_provider` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `member`
--

DROP TABLE IF EXISTS `member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `member` (
  `Member_ID` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `Member_Name` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `Gender` text CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `Address` text CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `Phone` text CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`Member_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `member`
--

LOCK TABLES `member` WRITE;
/*!40000 ALTER TABLE `member` DISABLE KEYS */;
/*!40000 ALTER TABLE `member` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order`
--

DROP TABLE IF EXISTS `order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order` (
  `Order_ID` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `Total_Price` int NOT NULL,
  `Member_ID` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `Delivery_ID` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`Order_ID`),
  KEY `Order_FK` (`Member_ID`),
  KEY `Order_FK1` (`Delivery_ID`),
  CONSTRAINT `Order_FK` FOREIGN KEY (`Member_ID`) REFERENCES `member` (`Member_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `Order_FK1` FOREIGN KEY (`Delivery_ID`) REFERENCES `delivery` (`Delivery_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order`
--

LOCK TABLES `order` WRITE;
/*!40000 ALTER TABLE `order` DISABLE KEYS */;
/*!40000 ALTER TABLE `order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_detail`
--

DROP TABLE IF EXISTS `order_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_detail` (
  `Order_ID` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `Detail_ID` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `Product_ID` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `Price` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `Amount` int NOT NULL,
  PRIMARY KEY (`Detail_ID`),
  KEY `Order_Detail_FK` (`Order_ID`),
  KEY `Order_Detail_FK1` (`Product_ID`),
  CONSTRAINT `Order_Detail_FK` FOREIGN KEY (`Order_ID`) REFERENCES `order` (`Order_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `Order_Detail_FK1` FOREIGN KEY (`Product_ID`) REFERENCES `product` (`Product_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_detail`
--

LOCK TABLES `order_detail` WRITE;
/*!40000 ALTER TABLE `order_detail` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `packing_detail`
--

DROP TABLE IF EXISTS `packing_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `packing_detail` (
  `Packing_ID` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `Detail_ID` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `Product_ID` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `Price` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `Amount` int NOT NULL,
  PRIMARY KEY (`Detail_ID`),
  KEY `Packing_Detail_FK` (`Packing_ID`),
  KEY `Packing_Detail_FK1` (`Product_ID`),
  CONSTRAINT `Packing_Detail_FK` FOREIGN KEY (`Packing_ID`) REFERENCES `packing_list` (`Packing_ID`),
  CONSTRAINT `Packing_Detail_FK1` FOREIGN KEY (`Product_ID`) REFERENCES `product` (`Product_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `packing_detail`
--

LOCK TABLES `packing_detail` WRITE;
/*!40000 ALTER TABLE `packing_detail` DISABLE KEYS */;
/*!40000 ALTER TABLE `packing_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `packing_list`
--

DROP TABLE IF EXISTS `packing_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `packing_list` (
  `Packing_ID` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `Packing_Date` date NOT NULL,
  `Total_Price` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `LP_ID` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `Member_ID` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `Order_ID` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`Packing_ID`),
  KEY `Packing_List_FK` (`LP_ID`),
  KEY `Packing_List_FK1` (`Member_ID`),
  KEY `Packing_List_FK2` (`Order_ID`),
  CONSTRAINT `Packing_List_FK` FOREIGN KEY (`LP_ID`) REFERENCES `logistics_provider` (`LP_ID`),
  CONSTRAINT `Packing_List_FK1` FOREIGN KEY (`Member_ID`) REFERENCES `member` (`Member_ID`),
  CONSTRAINT `Packing_List_FK2` FOREIGN KEY (`Order_ID`) REFERENCES `order` (`Order_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `packing_list`
--

LOCK TABLES `packing_list` WRITE;
/*!40000 ALTER TABLE `packing_list` DISABLE KEYS */;
/*!40000 ALTER TABLE `packing_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment_detail`
--

DROP TABLE IF EXISTS `payment_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payment_detail` (
  `Payment_ID` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `Payment_Method` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `Price` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `Date` date NOT NULL,
  `Member_ID` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`Payment_ID`),
  KEY `Payment_Detail_FK` (`Member_ID`),
  CONSTRAINT `Payment_Detail_FK` FOREIGN KEY (`Member_ID`) REFERENCES `member` (`Member_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment_detail`
--

LOCK TABLES `payment_detail` WRITE;
/*!40000 ALTER TABLE `payment_detail` DISABLE KEYS */;
/*!40000 ALTER TABLE `payment_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `Product_ID` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `Name` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `Type` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `Price` int NOT NULL,
  `Manufacturer` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `System` int NOT NULL,
  `Image` text CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `Screen_Size` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `Storage` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`Product_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_detail`
--

DROP TABLE IF EXISTS `product_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_detail` (
  `Product_ID` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `Detail_ID` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `Spec_Name` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `Spec_Para` float NOT NULL,
  `Unit` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`Detail_ID`),
  KEY `Product_ID` (`Product_ID`),
  CONSTRAINT `Product_Detail_FK` FOREIGN KEY (`Product_ID`) REFERENCES `product` (`Product_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_detail`
--

LOCK TABLES `product_detail` WRITE;
/*!40000 ALTER TABLE `product_detail` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `search_record`
--

DROP TABLE IF EXISTS `search_record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `search_record` (
  `Date_Time` datetime NOT NULL,
  `Member_ID` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `Search_Content` text CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`Date_Time`),
  KEY `Search_Record_FK` (`Member_ID`),
  CONSTRAINT `Search_Record_FK` FOREIGN KEY (`Member_ID`) REFERENCES `member` (`Member_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `search_record`
--

LOCK TABLES `search_record` WRITE;
/*!40000 ALTER TABLE `search_record` DISABLE KEYS */;
/*!40000 ALTER TABLE `search_record` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-05-26  7:58:30
