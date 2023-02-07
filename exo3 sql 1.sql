-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               8.0.30 - MySQL Community Server - GPL
-- Server OS:                    Win64
-- HeidiSQL Version:             12.1.0.6537
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for exo3 sql1
CREATE DATABASE IF NOT EXISTS `exo3 sql1` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `exo3 sql1`;

-- Dumping structure for table exo3 sql1.acheter
CREATE TABLE IF NOT EXISTS `acheter` (
  `noFour` int DEFAULT NULL,
  `noArt` int DEFAULT NULL,
  `prixAchat` int DEFAULT NULL,
  `delai` int DEFAULT NULL,
  KEY `FK__fournisseurs` (`noFour`),
  KEY `FK_acheter_articles` (`noArt`),
  CONSTRAINT `FK__fournisseurs` FOREIGN KEY (`noFour`) REFERENCES `fournisseurs` (`noFour`),
  CONSTRAINT `FK_acheter_articles` FOREIGN KEY (`noArt`) REFERENCES `articles` (`noArt`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table exo3 sql1.acheter: ~5 rows (approximately)
INSERT INTO `acheter` (`noFour`, `noArt`, `prixAchat`, `delai`) VALUES
	(3, 4, 34, 23),
	(2, 5, 23, 56),
	(3, 1, 43, 67),
	(1, 3, 54, 5),
	(2, 2, 65, 36);

-- Dumping structure for table exo3 sql1.articles
CREATE TABLE IF NOT EXISTS `articles` (
  `noArt` int NOT NULL AUTO_INCREMENT,
  `libelle` varchar(255) DEFAULT NULL,
  `stock` int DEFAULT NULL,
  `prixInvent` int DEFAULT NULL,
  PRIMARY KEY (`noArt`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table exo3 sql1.articles: ~4 rows (approximately)
INSERT INTO `articles` (`noArt`, `libelle`, `stock`, `prixInvent`) VALUES
	(1, 'Meadoways', 46, 34),
	(2, 'Willowlands', 2, 144),
	(3, 'The Willows', 677, 78),
	(4, 'The Primroses', 65, 32),
	(5, 'Beechlands', 5, 235);

-- Dumping structure for table exo3 sql1.fournisseurs
CREATE TABLE IF NOT EXISTS `fournisseurs` (
  `noFour` int NOT NULL AUTO_INCREMENT,
  `nomFour` varchar(255) DEFAULT NULL,
  `adrFour` varchar(255) DEFAULT NULL,
  `villeFour` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`noFour`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table exo3 sql1.fournisseurs: ~2 rows (approximately)
INSERT INTO `fournisseurs` (`noFour`, `nomFour`, `adrFour`, `villeFour`) VALUES
	(1, 'Plumb Industries', '2569 Shobe Lane', 'Gypsum'),
	(2, 'STE Lakeman Unlimited', '4651 Walnut Street', 'Vicksburg'),
	(3, 'Donaldson and Co', '', '');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
