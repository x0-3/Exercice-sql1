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


-- Dumping database structure for exo5 sql1
CREATE DATABASE IF NOT EXISTS `exo5 sql1` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `exo5 sql1`;

-- Dumping structure for table exo5 sql1.fournisseur
CREATE TABLE IF NOT EXISTS `fournisseur` (
  `numF` int NOT NULL AUTO_INCREMENT,
  `nomF` varchar(255) DEFAULT NULL,
  `statut` varchar(255) DEFAULT NULL,
  `villeF` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`numF`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table exo5 sql1.fournisseur: ~4 rows (approximately)
INSERT INTO `fournisseur` (`numF`, `nomF`, `statut`, `villeF`) VALUES
	(1, 'Vader Industries', 'ouvert', 'Stanley'),
	(2, 'Kowalski and Co', 'fermer', 'Carson City'),
	(3, 'Building Schmuilding', 'fermer', 'Mulhouse'),
	(4, 'Renovation X', 'ouvert', 'Carson City'),
	(5, 'The Eleventh Tower', 'ouvert', 'Stockton'),
	(6, 'Unlimited', 'ouver', 'Shreveport');

-- Dumping structure for table exo5 sql1.livraison
CREATE TABLE IF NOT EXISTS `livraison` (
  `numP` int DEFAULT NULL,
  `numU` int DEFAULT NULL,
  `numF` int DEFAULT NULL,
  `quantite` int DEFAULT NULL,
  KEY `FK__produit` (`numP`),
  KEY `FK_livraison_usine` (`numU`),
  KEY `FK_livraison_fournisseur` (`numF`),
  CONSTRAINT `FK__produit` FOREIGN KEY (`numP`) REFERENCES `produit` (`numP`),
  CONSTRAINT `FK_livraison_fournisseur` FOREIGN KEY (`numF`) REFERENCES `fournisseur` (`numF`),
  CONSTRAINT `FK_livraison_usine` FOREIGN KEY (`numU`) REFERENCES `usine` (`numU`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table exo5 sql1.livraison: ~5 rows (approximately)
INSERT INTO `livraison` (`numP`, `numU`, `numF`, `quantite`) VALUES
	(2, 4, 4, 67),
	(4, 2, 3, 87),
	(5, 1, 2, 67),
	(3, 3, 5, 5),
	(1, 3, 1, 45);

-- Dumping structure for table exo5 sql1.produit
CREATE TABLE IF NOT EXISTS `produit` (
  `numP` int NOT NULL AUTO_INCREMENT,
  `nomP` varchar(255) DEFAULT NULL,
  `couleur` varchar(255) DEFAULT NULL,
  `poids` int DEFAULT NULL,
  PRIMARY KEY (`numP`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table exo5 sql1.produit: ~5 rows (approximately)
INSERT INTO `produit` (`numP`, `nomP`, `couleur`, `poids`) VALUES
	(1, 'Vasilisa', 'noir', 5),
	(2, 'Vagrant', 'rouge', 74),
	(3, 'Jamil', 'jaune', 35),
	(4, 'Valuable', 'vert', 57),
	(5, 'Victory', 'violet', 54);

-- Dumping structure for table exo5 sql1.usine
CREATE TABLE IF NOT EXISTS `usine` (
  `numU` int NOT NULL AUTO_INCREMENT,
  `nomU` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `villeU` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`numU`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table exo5 sql1.usine: ~4 rows (approximately)
INSERT INTO `usine` (`numU`, `nomU`, `villeU`) VALUES
	(1, 'Devito and Co', 'Stockton'),
	(2, 'Sparrow Industries', 'Corpus Christi'),
	(3, 'Phil Devito Associates', 'Saint Louis'),
	(4, 'Usine Schmusine', 'Stockton');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
