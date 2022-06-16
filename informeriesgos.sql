-- MariaDB dump 10.19  Distrib 10.4.24-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: informeriesgos
-- ------------------------------------------------------
-- Server version	10.4.24-MariaDB

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
-- Table structure for table `proyecto`
--

DROP TABLE IF EXISTS `proyecto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `proyecto` (
  `ID_P` int(11) NOT NULL AUTO_INCREMENT,
  `NombreP` varchar(50) NOT NULL,
  `Correo` varchar(50) DEFAULT NULL,
  `Area` varchar(50) NOT NULL,
  `Opinion` set('Si','No') NOT NULL,
  PRIMARY KEY (`ID_P`),
  KEY `ID` (`Correo`),
  CONSTRAINT `proyecto_ibfk_1` FOREIGN KEY (`Correo`) REFERENCES `usuario` (`Correo`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=131 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proyecto`
--

LOCK TABLES `proyecto` WRITE;
/*!40000 ALTER TABLE `proyecto` DISABLE KEYS */;
INSERT INTO `proyecto` VALUES (83,'Oramed Pharmaceuticals Inc.','user@gmail.com','Health Care',''),(84,'Merus Labs International Inc.','user@gmail.com','Health Care',''),(92,'Katz','user@gmail.com','Jewelry','No'),(95,'Avista Healthcare Public Acquisition Corp.','user@gmail.com','Finance','Si'),(96,'Sutherland Asset Management Corporation','user@gmail.com','Consumer Services','Si'),(97,'Lexington Realty Trust','user@gmail.com','n/a','Si'),(98,'Yext, Inc.','user@gmail.com','Technology','Si'),(99,'Greenlight Reinsurance, Ltd.','user@gmail.com','Finance','Si'),(100,'Ability Inc.','user@gmail.com','Finance','Si'),(101,'Cambium Learning Group, Inc.','user@gmail.com','Consumer Services','Si'),(102,'Ashford Hospitality Prime, Inc.','user@gmail.com','n/a','Si'),(103,'Anheuser-Busch Inbev SA','user@gmail.com','Consumer Non-Durables','Si'),(104,'WisdomTree U.S. SmallCap Quality Dividend Growth F','user@gmail.com','n/a','Si'),(105,'PowerShares S&P SmallCap Health Care Portfolio','user@gmail.com','n/a','Si'),(106,'Optical Cable Corporation','user@gmail.com','Basic Industries','Si'),(107,'Hyster-Yale Materials Handling, Inc.','user@gmail.com','Capital Goods','Si'),(108,'Central Federal Corporation','user@gmail.com','Finance','Si'),(109,'TravelCenters of America LLC','user@gmail.com','Consumer Durables','Si'),(110,'KeyCorp','user@gmail.com','Finance','Si'),(111,'PS Business Parks, Inc.','user@gmail.com','Consumer Services','Si'),(112,'Cumberland Pharmaceuticals Inc.','user@gmail.com','Health Care','Si'),(113,'BlackRock Utility and Infrastructure Trust','user@gmail.com','n/a','Si'),(116,'CU Bancorp (CA)','user@gmail.com','Finance','Si'),(117,'Flaherty & Crumrine Total Return Fund Inc','user@gmail.com','n/a','Si'),(118,'Comtech Telecommunications Corp.','user@gmail.com','Technology','Si'),(119,'Charter Communications, Inc.','user@gmail.com','Consumer Services','Si'),(121,'Comstock Holding Companies, Inc.','user@gmail.com','Capital Goods','No'),(122,'Oramed Pharmaceuticals Inc.','user@gmail.com','Health Care','No'),(123,'Merus Labs International Inc.','user@gmail.com','Health Care','No'),(124,'Radius Health, Inc.','user@gmail.com','Health Care','No'),(125,'Littelfuse, Inc.','user@gmail.com','Consumer Durables','No'),(126,'Pegasystems Inc.','user@gmail.com','Technology','No'),(127,'Federated Premier Intermediate Municipal Income Fu','user@gmail.com','n/a','No'),(128,'Insys Therapeutics, Inc.','user@gmail.com','Health Care','No'),(129,'SAExploration Holdings, Inc.','user@gmail.com','Energy','No'),(130,'Merus Labs International Inc.','user@gmail.com','Health Care','No');
/*!40000 ALTER TABLE `proyecto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `riesgos`
--

DROP TABLE IF EXISTS `riesgos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `riesgos` (
  `ID_R` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(100) NOT NULL,
  `Descripcion` text DEFAULT NULL,
  `Probabilidad` int(1) NOT NULL,
  `Impacto` int(1) NOT NULL,
  `Tipo` varchar(50) DEFAULT NULL,
  `Comentario` varchar(550) DEFAULT NULL,
  `ID_P` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID_R`),
  KEY `ID_P` (`ID_P`),
  CONSTRAINT `riesgos_ibfk_1` FOREIGN KEY (`ID_P`) REFERENCES `proyecto` (`ID_P`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=267 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `riesgos`
--

LOCK TABLES `riesgos` WRITE;
/*!40000 ALTER TABLE `riesgos` DISABLE KEYS */;
INSERT INTO `riesgos` VALUES (103,'Finance','ante ipsum primis in faucibus orci luctus et ultrices posuere',7,7,'Major Banks',NULL,92),(163,'Capital Goods','habitasse platea dictumst maecenas ut massa',7,9,'Industrial Machinery/Components',NULL,128),(165,'Technology','mi integer ac neque duis bibendum morbi non',1,9,'EDP Services',NULL,125),(167,'n/a','molestie lorem quisque',5,9,'n/a',NULL,129),(168,'Finance','ut erat id',7,3,'Property-Casualty Insurers',NULL,130),(170,'n/a','odio cras mi pede malesuada in imperdiet et commodo',9,3,'n/a',NULL,127),(171,'Consumer Services','parturient montes nascetur ridiculus mus vivamus vestibulum sagittis sapien',1,3,'Other Specialty Stores',NULL,128),(172,'Public Utilities','eros viverra eget congue',1,7,'Natural Gas Distribution',NULL,123),(173,'Public Utilities','id mauris vulputate',7,1,'Electric Utilities: Central',NULL,130),(174,'n/a','faucibus orci luctus et ultrices posuere cubilia curae',3,1,'n/a',NULL,124),(175,'Capital Goods','mi in porttitor pede justo eu',7,5,'Railroads',NULL,124),(176,'n/a','varius integer ac leo pellentesque ultrices mattis odio donec',9,7,'n/a',NULL,121),(177,'Finance','in ante',9,5,'Major Banks',NULL,128),(178,'Transportation','amet consectetuer',1,7,'Air Freight/Delivery Services',NULL,127),(179,'n/a','malesuada in',9,7,'n/a',NULL,126),(180,'Capital Goods','est et tempus',1,7,'Biotechnology: Laboratory Analytical Instruments',NULL,129),(181,'Consumer Services','erat fermentum justo nec condimentum neque sapien placerat',5,7,'Real Estate Investment Trusts',NULL,125),(182,'Consumer Services','pede ac diam cras pellentesque volutpat dui maecenas tristique est',1,7,'Real Estate Investment Trusts',NULL,125),(183,'Health Care','suspendisse potenti cras in purus eu magna vulputate luctus',9,9,'Biotechnology: Biological Products (No Diagnostic ',NULL,124),(184,'Finance','dolor sit amet consectetuer adipiscing elit',7,7,'Business Services',NULL,124),(185,'n/a','diam in magna bibendum',1,1,'n/a',NULL,129),(186,'Health Care','amet eros suspendisse accumsan',9,1,'Medical/Dental Instruments',NULL,122),(187,'Consumer Services','porta volutpat erat quisque erat eros',9,3,'Restaurants',NULL,128),(188,'Technology','curabitur in',9,1,'Telecommunications Equipment',NULL,128),(189,'n/a','donec quis orci eget orci vehicula condimentum curabitur in libero',1,1,'n/a',NULL,123),(190,'Technology','odio elementum eu',7,9,'Professional Services',NULL,123),(192,'n/a','eget congue eget semper rutrum nulla',7,3,'n/a',NULL,128),(193,'n/a','in quis justo maecenas rhoncus',9,5,'n/a',NULL,128),(194,'Finance','accumsan tortor quis turpis sed ante vivamus tortor duis mattis',5,5,'Major Banks',NULL,121),(195,'Transportation','at turpis a pede posuere nonummy integer',5,1,'Trucking Freight/Courier Services',NULL,121),(196,'Finance','erat tortor sollicitudin mi sit',3,9,'Property-Casualty Insurers',NULL,127),(197,'Finance','sit amet',9,9,'Business Services',NULL,124),(198,'Technology','luctus et ultrices posuere',3,7,'Computer Software: Prepackaged Software',NULL,126),(199,'Finance','eleifend donec ut dolor morbi vel lectus',1,7,'Investment Managers',NULL,130),(201,'Health Care','risus dapibus augue vel accumsan',5,9,'Major Pharmaceuticals',NULL,123),(202,'n/a','quis augue luctus',1,1,'n/a',NULL,124),(203,'Consumer Services','tempor turpis nec euismod scelerisque quam turpis adipiscing lorem',1,9,'Other Consumer Services',NULL,124),(204,'Capital Goods','non mattis pulvinar nulla pede ullamcorper augue',1,9,'Wholesale Distributors',NULL,129),(205,'n/a','metus aenean fermentum donec ut mauris eget massa',1,9,'n/a',NULL,129),(206,'Consumer Services','in faucibus orci luctus et ultrices',5,1,'Restaurants',NULL,126),(207,'Capital Goods','nullam molestie nibh in lectus pellentesque',3,5,'Biotechnology: Laboratory Analytical Instruments',NULL,122),(208,'Technology','ac enim in tempor turpis nec euismod scelerisque',5,1,'Semiconductors',NULL,126),(209,'Capital Goods','sodales scelerisque mauris',9,5,'Homebuilding',NULL,126),(210,'Technology','in lectus pellentesque',9,1,'Diversified Commercial Services',NULL,122),(211,'Technology','eleifend donec ut dolor morbi vel lectus in',3,1,'Computer Manufacturing',NULL,126),(212,'Health Care','tempus semper est quam pharetra magna ac consequat',7,9,'Medical/Nursing Services',NULL,123),(213,'Health Care','sociis natoque penatibus et magnis dis',9,7,'Major Pharmaceuticals',NULL,130),(214,'n/a','magna vulputate luctus cum sociis natoque penatibus',3,7,'n/a',NULL,128),(215,'Consumer Services','ut erat curabitur gravida nisi at',9,7,'Real Estate Investment Trusts',NULL,122),(216,'Public Utilities','quam sollicitudin vitae',3,3,'Telecommunications Equipment',NULL,123),(217,'Consumer Services','tristique fusce congue',9,9,'Office Equipment/Supplies/Services',NULL,121),(218,'n/a','nibh ligula nec',5,5,'n/a',NULL,125),(219,'n/a','ultrices phasellus id sapien in sapien iaculis congue',5,3,'n/a',NULL,128),(220,'Consumer Services','libero quis orci nullam',7,7,'Clothing/Shoe/Accessory Stores',NULL,124),(221,'Finance','aenean lectus pellentesque eget nunc donec quis',7,5,'Major Banks',NULL,122),(222,'n/a','vel ipsum praesent blandit lacinia erat vestibulum sed magna at',7,9,'n/a',NULL,127),(223,'Health Care','vitae mattis nibh',9,9,'Medical/Nursing Services',NULL,121),(224,'Technology','integer non velit donec diam neque vestibulum',3,9,'Computer Software: Prepackaged Software',NULL,125),(225,'Finance','elementum pellentesque quisque porta',7,1,'Finance: Consumer Services',NULL,129),(226,'n/a','in hac habitasse platea dictumst morbi vestibulum',7,7,'n/a',NULL,122),(227,'Capital Goods','turpis sed ante vivamus tortor duis mattis egestas metus aenean',1,7,'Wholesale Distributors',NULL,127),(228,'n/a','adipiscing molestie hendrerit at',1,1,'n/a',NULL,128),(229,'Health Care','donec posuere',1,7,'Major Pharmaceuticals',NULL,128),(230,'n/a','nisi volutpat eleifend',3,3,'n/a',NULL,124),(231,'Public Utilities','augue vestibulum rutrum rutrum neque aenean auctor',7,1,'Telecommunications Equipment',NULL,130),(232,'Health Care','dui maecenas tristique est',1,7,'Hospital/Nursing Management',NULL,125),(233,'Consumer Services','magna at nunc commodo',7,9,'Broadcasting',NULL,129),(234,'Technology','mauris ullamcorper',9,7,'Computer Software: Prepackaged Software',NULL,127),(236,'Finance','est risus auctor',9,1,'Commercial Banks',NULL,122),(238,'Finance','vulputate nonummy maecenas tincidunt lacus',7,5,'Property-Casualty Insurers',NULL,127),(239,'Consumer Services','ultrices posuere cubilia curae mauris viverra diam vitae quam suspendisse',9,5,'Television Services',NULL,123),(240,'Health Care','quis orci nullam molestie nibh in lectus pellentesque at nulla',7,5,'Major Pharmaceuticals',NULL,126),(241,'Public Utilities','et ultrices posuere cubilia curae duis faucibus accumsan',3,1,'Power Generation',NULL,126),(242,'n/a','nulla tellus in sagittis dui vel nisl',3,7,'n/a',NULL,129),(243,'Finance','in felis',3,5,'Investment Managers',NULL,128),(244,'Health Care','tincidunt in leo maecenas pulvinar lobortis est phasellus sit amet',1,1,'Biotechnology: Biological Products (No Diagnostic ',NULL,126),(245,'Health Care','consequat ut nulla sed',1,3,'Biotechnology: Biological Products (No Diagnostic ',NULL,129),(246,'n/a','orci luctus et ultrices posuere',9,7,'n/a',NULL,122),(247,'Consumer Services','cras in purus eu magna vulputate luctus',3,5,'Real Estate Investment Trusts',NULL,124),(248,'n/a','vel augue vestibulum ante ipsum primis in faucibus orci luctus',1,3,'n/a',NULL,125),(249,'Basic Industries','pretium iaculis diam erat fermentum justo nec',7,5,'Aluminum',NULL,122),(250,'Capital Goods','nunc purus phasellus in felis donec semper sapien a libero',7,3,'Industrial Machinery/Components',NULL,130),(252,'Technology','a suscipit nulla elit ac nulla sed vel enim sit',9,5,'Semiconductors',NULL,121),(253,'Health Care','lectus in quam fringilla rhoncus mauris enim leo',3,3,'Biotechnology: Biological Products (No Diagnostic ',NULL,121),(255,'Consumer Services','justo in blandit ultrices',9,9,'Consumer Electronics/Video Chains',NULL,130),(256,'Consumer Services','nulla pede ullamcorper augue',5,5,'RETAIL: Building Materials',NULL,123),(257,'Health Care','ac leo pellentesque ultrices',7,9,'Biotechnology: Biological Products (No Diagnostic ',NULL,121),(258,'Capital Goods','libero nullam sit amet turpis',7,3,'Industrial Machinery/Components',NULL,128),(259,'Health Care','pede ac',7,7,'Biotechnology: Biological Products (No Diagnostic ',NULL,127),(260,'Health Care','venenatis lacinia aenean sit amet justo morbi ut',1,7,'Major Pharmaceuticals',NULL,127),(261,'Technology','pede posuere nonummy',5,5,'Computer Software: Prepackaged Software',NULL,127),(262,'Consumer Services','vel augue vestibulum ante ipsum primis in',9,7,'Clothing/Shoe/Accessory Stores',NULL,126),(263,'Health Care','non mauris ',1,3,'Hospital/Nursing Management',NULL,92),(264,'Capital Goods','nunc nisl duis bibendum felis sed interdum venenatis turpis enim ',7,1,'Industrial Specialties',NULL,92),(265,'Technology','risus auctor sed tristique in tempus sit amet ',3,5,'Computer Software: Prepackaged Software','zxasdasd',95),(266,'Health Care','venenatis lacinia aenean sit amet justo ',5,3,'Major Pharmaceuticals','asdasd',95);
/*!40000 ALTER TABLE `riesgos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `solicitud`
--

DROP TABLE IF EXISTS `solicitud`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `solicitud` (
  `ID_R` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(100) NOT NULL,
  `Descripcion` text NOT NULL,
  `Probabilidad` int(1) NOT NULL,
  `Impacto` int(1) NOT NULL,
  `Tipo` varchar(50) NOT NULL,
  `ID_P` int(11) NOT NULL,
  PRIMARY KEY (`ID_R`),
  KEY `ID_P` (`ID_P`),
  CONSTRAINT `solicitud_ibfk_1` FOREIGN KEY (`ID_P`) REFERENCES `proyecto` (`ID_P`)
) ENGINE=InnoDB AUTO_INCREMENT=192 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `solicitud`
--

LOCK TABLES `solicitud` WRITE;
/*!40000 ALTER TABLE `solicitud` DISABLE KEYS */;
INSERT INTO `solicitud` VALUES (42,'Health Care','venenatis lacinia aenean sit amet justo',5,3,'Major Pharmaceuticals',95),(44,'Finance','nisl nunc',3,9,'Commercial Banks',113),(45,'n/a','ligula in lacus curabitur at ipsum ac tellus',7,5,'n/a',108),(46,'n/a','velit vivamus vel nulla eget eros elementum pellentesque quisque',9,3,'n/a',113),(47,'Energy','aliquam lacus morbi quis',3,5,'Oil & Gas Production',104),(48,'Consumer Services','eu orci mauris lacinia sapien quis libero nullam sit amet',3,9,'Professional Services',116),(49,'Finance','lorem integer tincidunt ante vel ipsum praesent blandit',1,3,'Major Banks',99),(50,'Technology','erat nulla tempus vivamus in felis eu sapien cursus',7,9,'Professional Services',117),(51,'n/a','orci luctus et ultrices posuere cubilia curae donec pharetra',5,1,'n/a',119),(52,'Finance','vel sem sed sagittis nam congue risus semper porta',3,7,'Major Banks',109),(53,'Consumer Non-Durables','justo eu massa',3,7,'Apparel',110),(54,'Finance','risus praesent lectus vestibulum quam sapien',9,1,'Savings Institutions',112),(55,'Technology','orci eget orci vehicula condimentum',3,7,'Semiconductors',117),(56,'Consumer Services','vehicula condimentum',5,3,'Clothing/Shoe/Accessory Stores',98),(57,'Capital Goods','ut odio cras',9,3,'Industrial Machinery/Components',112),(58,'n/a','pede justo lacinia eget tincidunt eget tempus',9,7,'n/a',119),(61,'Health Care','sapien sapien non mi integer',1,3,'Medical/Dental Instruments',119),(63,'Basic Industries','eros elementum pellentesque quisque porta volutpat erat quisque',3,3,'Paper',96),(64,'Basic Industries','vestibulum quam sapien varius ut blandit',9,5,'Precious Metals',118),(65,'Consumer Non-Durables','bibendum imperdiet nullam orci pede venenatis',1,1,'Electronic Components',117),(66,'n/a','iaculis diam erat fermentum justo nec condimentum neque sapien placerat',7,7,'n/a',106),(67,'n/a','faucibus cursus',9,3,'n/a',99),(68,'Health Care','ut dolor morbi vel lectus in quam',1,7,'Major Pharmaceuticals',96),(69,'Consumer Services','non lectus aliquam sit amet diam in magna',7,7,'Telecommunications Equipment',100),(70,'Consumer Services','sed justo pellentesque viverra pede ac',1,5,'Catalog/Specialty Distribution',103),(71,'Consumer Non-Durables','lorem ipsum dolor sit amet',9,7,'Electronic Components',99),(72,'n/a','varius ut blandit non interdum in ante vestibulum ante',1,5,'n/a',112),(74,'Consumer Services','eu est congue elementum in hac',7,5,'Newspapers/Magazines',98),(75,'Finance','in blandit ultrices enim lorem ipsum dolor',3,7,'Major Banks',113),(76,'Consumer Services','vestibulum sagittis sapien cum sociis',7,7,'Other Specialty Stores',116),(77,'Consumer Non-Durables','nunc proin at turpis a pede posuere nonummy',1,7,'Packaged Foods',106),(78,'Health Care','pellentesque eget nunc donec',3,1,'Hospital/Nursing Management',95),(79,'Health Care','potenti cras in purus',1,7,'Medical/Dental Instruments',119),(81,'Finance','accumsan tortor quis turpis sed ante vivamus',9,7,'Savings Institutions',97),(83,'Technology','pede posuere nonummy integer non velit donec diam neque',1,9,'Radio And Television Broadcasting And Communicatio',113),(84,'n/a','diam id ornare imperdiet sapien urna pretium',7,3,'n/a',110),(85,'Public Utilities','consequat varius integer ac leo pellentesque',9,3,'Telecommunications Equipment',100),(87,'n/a','habitasse platea dictumst maecenas',5,5,'n/a',103),(89,'Health Care','id pretium iaculis diam erat fermentum justo',9,3,'Major Pharmaceuticals',112),(90,'Finance','mi nulla ac enim',7,3,'Savings Institutions',112),(91,'Capital Goods','ullamcorper augue a suscipit nulla elit ac nulla sed',3,3,'Metal Fabrications',98),(92,'Technology','ut erat id mauris',5,1,'Computer Manufacturing',93),(95,'Finance','nisl nunc',3,9,'Commercial Banks',113),(96,'n/a','ligula in lacus curabitur at ipsum ac tellus',7,5,'n/a',108),(97,'n/a','velit vivamus vel nulla eget eros elementum pellentesque quisque',9,3,'n/a',113),(98,'Energy','aliquam lacus morbi quis',3,5,'Oil & Gas Production',104),(99,'Consumer Services','eu orci mauris lacinia sapien quis libero nullam sit amet',3,9,'Professional Services',116),(100,'Finance','lorem integer tincidunt ante vel ipsum praesent blandit',1,3,'Major Banks',99),(101,'Technology','erat nulla tempus vivamus in felis eu sapien cursus',7,9,'Professional Services',117),(102,'n/a','orci luctus et ultrices posuere cubilia curae donec pharetra',5,1,'n/a',119),(103,'Finance','vel sem sed sagittis nam congue risus semper porta',3,7,'Major Banks',109),(104,'Consumer Non-Durables','justo eu massa',3,7,'Apparel',110),(105,'Finance','risus praesent lectus vestibulum quam sapien',9,1,'Savings Institutions',112),(106,'Technology','orci eget orci vehicula condimentum',3,7,'Semiconductors',117),(107,'Consumer Services','vehicula condimentum',5,3,'Clothing/Shoe/Accessory Stores',98),(108,'Capital Goods','ut odio cras',9,3,'Industrial Machinery/Components',112),(109,'n/a','pede justo lacinia eget tincidunt eget tempus',9,7,'n/a',119),(111,'Technology','risus auctor sed tristique in tempus sit amet',3,5,'Computer Software: Prepackaged Software',95),(112,'Health Care','sapien sapien non mi integer',1,3,'Medical/Dental Instruments',119),(114,'Basic Industries','eros elementum pellentesque quisque porta volutpat erat quisque',3,3,'Paper',96),(115,'Basic Industries','vestibulum quam sapien varius ut blandit',9,5,'Precious Metals',118),(116,'Consumer Non-Durables','bibendum imperdiet nullam orci pede venenatis',1,1,'Electronic Components',117),(117,'n/a','iaculis diam erat fermentum justo nec condimentum neque sapien placerat',7,7,'n/a',106),(118,'n/a','faucibus cursus',9,3,'n/a',99),(119,'Health Care','ut dolor morbi vel lectus in quam',1,7,'Major Pharmaceuticals',96),(120,'Consumer Services','non lectus aliquam sit amet diam in magna',7,7,'Telecommunications Equipment',100),(121,'Consumer Services','sed justo pellentesque viverra pede ac',1,5,'Catalog/Specialty Distribution',103),(122,'Consumer Non-Durables','lorem ipsum dolor sit amet',9,7,'Electronic Components',99),(123,'n/a','varius ut blandit non interdum in ante vestibulum ante',1,5,'n/a',112),(124,'Technology','posuere cubilia curae donec pharetra',3,1,'EDP Services',94),(125,'Consumer Services','eu est congue elementum in hac',7,5,'Newspapers/Magazines',98),(126,'Finance','in blandit ultrices enim lorem ipsum dolor',3,7,'Major Banks',113),(127,'Consumer Services','vestibulum sagittis sapien cum sociis',7,7,'Other Specialty Stores',116),(128,'Consumer Non-Durables','nunc proin at turpis a pede posuere nonummy',1,7,'Packaged Foods',106),(129,'Health Care','pellentesque eget nunc donec',3,1,'Hospital/Nursing Management',95),(130,'Health Care','potenti cras in purus',1,7,'Medical/Dental Instruments',119),(132,'Finance','accumsan tortor quis turpis sed ante vivamus',9,7,'Savings Institutions',97),(134,'Technology','pede posuere nonummy integer non velit donec diam neque',1,9,'Radio And Television Broadcasting And Communicatio',113),(135,'n/a','diam id ornare imperdiet sapien urna pretium',7,3,'n/a',110),(136,'Public Utilities','consequat varius integer ac leo pellentesque',9,3,'Telecommunications Equipment',100),(138,'n/a','habitasse platea dictumst maecenas',5,5,'n/a',103),(139,'Consumer Services','sit amet turpis elementum ligula vehicula consequat morbi a ipsum',3,1,'Restaurants',94),(140,'Health Care','id pretium iaculis diam erat fermentum justo',9,3,'Major Pharmaceuticals',112),(141,'Finance','mi nulla ac enim',7,3,'Savings Institutions',112),(142,'Capital Goods','ullamcorper augue a suscipit nulla elit ac nulla sed',3,3,'Metal Fabrications',98),(143,'Consumer Durables','vel dapibus at diam nam tristique tortor eu',7,9,'Telecommunications Equipment',94),(144,'Finance','proin eu mi nulla ac enim',3,9,'Savings Institutions',98),(145,'Consumer Services','lacus at turpis donec posuere',1,3,'Real Estate Investment Trusts',119),(146,'Health Care','lacus at velit vivamus vel nulla eget eros elementum pellentesque',9,7,'Major Pharmaceuticals',100),(147,'Consumer Services','pellentesque ultrices mattis odio',7,7,'Real Estate Investment Trusts',99),(148,'Consumer Durables','volutpat sapien arcu sed augue aliquam',1,7,'Automotive Aftermarket',95),(149,'n/a','mattis pulvinar nulla pede ullamcorper augue a suscipit nulla',9,7,'n/a',102),(150,'Consumer Services','ipsum ac tellus semper interdum mauris ullamcorper purus sit',1,5,'Real Estate',99),(151,'Finance','tristique est et tempus',7,1,'Property-Casualty Insurers',101),(152,'Health Care','mi integer ac neque duis bibendum morbi',7,7,'Medical/Dental Instruments',111),(154,'n/a','molestie lorem quisque ut',5,9,'n/a',104),(155,'Finance','in quam fringilla',1,9,'Investment Bankers/Brokers/Service',100),(156,'Energy','ante ipsum primis in faucibus orci luctus',1,5,'Integrated oil Companies',93),(157,'Consumer Non-Durables','blandit mi in porttitor',9,1,'Apparel',112),(158,'Consumer Services','vitae ipsum aliquam non',3,7,'Other Specialty Stores',98),(159,'n/a','ac consequat metus sapien ut nunc vestibulum ante',7,9,'n/a',96),(160,'Finance','quis tortor id nulla ultrices',5,3,'Property-Casualty Insurers',116),(161,'Finance','eu interdum',5,7,'Commercial Banks',98),(162,'n/a','magna vestibulum',3,7,'n/a',108),(163,'Consumer Non-Durables','vel dapibus',7,9,'Farming/Seeds/Milling',103),(164,'Finance','ut ultrices vel augue',9,1,'Investment Managers',119),(166,'n/a','adipiscing elit proin',7,7,'n/a',116),(167,'Health Care','libero convallis eget eleifend luctus ultricies eu nibh quisque id',7,1,'Medical/Nursing Services',118),(168,'Consumer Non-Durables','donec posuere metus vitae ipsum aliquam',5,7,'Beverages (Production/Distribution)',93),(169,'Public Utilities','felis fusce posuere felis sed lacus morbi sem',7,7,'Electric Utilities: Central',94),(170,'Consumer Services','lobortis sapien sapien non mi integer ac neque',7,3,'Services-Misc. Amusement & Recreation',97),(171,'n/a','et commodo vulputate justo in blandit ultrices enim lorem',9,1,'n/a',116),(172,'Consumer Services','in libero ut',1,3,'Clothing/Shoe/Accessory Stores',109),(174,'Consumer Services','volutpat dui maecenas tristique est',9,1,'Real Estate Investment Trusts',116),(175,'Consumer Services','volutpat dui',9,5,'Motor Vehicles',108),(176,'Technology','nulla mollis molestie lorem quisque ut erat curabitur gravida',9,3,'EDP Services',101),(177,'Finance','dui luctus',9,3,'Major Banks',108),(178,'Health Care','quam nec dui luctus rutrum nulla tellus',3,9,'Major Pharmaceuticals',119),(179,'n/a','elementum nullam varius nulla facilisi cras non velit',7,1,'n/a',107),(180,'Consumer Non-Durables','augue vel accumsan tellus nisi eu orci mauris lacinia sapien',7,9,'Packaged Foods',94),(181,'Public Utilities','vestibulum ante',3,3,'Telecommunications Equipment',96),(184,'Health Care','accumsan tortor quis turpis',9,3,'Major Pharmaceuticals',96),(186,'Consumer Services','magna ac',7,5,'Real Estate Investment Trusts',104),(187,'Finance','donec quis orci eget orci vehicula',7,7,'Commercial Banks',103),(188,'Energy','vitae mattis nibh ligula nec sem duis',5,7,'Coal Mining',100),(189,'n/a','volutpat erat',1,5,'n/a',107),(190,'Finance','ipsum ac tellus',9,9,'Finance Companies',94),(191,'Miscellaneous','iaculis diam erat fermentum justo nec condimentum neque sapien',5,1,'Business Services',117);
/*!40000 ALTER TABLE `solicitud` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuario` (
  `Correo` varchar(50) NOT NULL,
  `Contrasena` varchar(16) NOT NULL,
  `Admin` tinyint(1) NOT NULL,
  PRIMARY KEY (`Correo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES ('admin@gmail.com','1111',1),('user@gmail.com','2222',0);
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-06-15 18:33:39
