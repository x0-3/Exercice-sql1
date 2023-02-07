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


-- Dumping database structure for exo1 sql1
CREATE DATABASE IF NOT EXISTS `exo1 sql1` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `exo1 sql1`;

-- Dumping structure for table exo1 sql1.musicien
CREATE TABLE IF NOT EXISTS `musicien` (
  `Nom` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `N°representation` int DEFAULT NULL,
  PRIMARY KEY (`Nom`),
  KEY `FK_musicien_representations` (`N°representation`),
  CONSTRAINT `FK_musicien_representations` FOREIGN KEY (`N°representation`) REFERENCES `representations` (`N°representation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table exo1 sql1.musicien: ~2 rows (approximately)
INSERT INTO `musicien` (`Nom`, `N°representation`) VALUES
	('musician 2', 1),
	('musician 1', 2);

-- Dumping structure for table exo1 sql1.programmer
CREATE TABLE IF NOT EXISTS `programmer` (
  `Date` date NOT NULL,
  `N°representation` int NOT NULL,
  `Tarif` int DEFAULT NULL,
  PRIMARY KEY (`Date`),
  KEY `FK_programmer_representations` (`N°representation`),
  CONSTRAINT `FK_programmer_representations` FOREIGN KEY (`N°representation`) REFERENCES `representations` (`N°representation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table exo1 sql1.programmer: ~2 rows (approximately)
INSERT INTO `programmer` (`Date`, `N°representation`, `Tarif`) VALUES
	('2014-09-14', 1, 156),
	('2023-02-02', 2, 57);

-- Dumping structure for table exo1 sql1.representations
CREATE TABLE IF NOT EXISTS `representations` (
  `N°representation` int NOT NULL AUTO_INCREMENT,
  `Titre_representation` varchar(255) DEFAULT NULL,
  `Representation` varchar(255) DEFAULT NULL,
  `Lieu` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`N°representation`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table exo1 sql1.representations: ~0 rows (approximately)
INSERT INTO `representations` (`N°representation`, `Titre_representation`, `Representation`, `Lieu`) VALUES
	(1, 'Titre', 'Presenteation', 'la bas'),
	(2, 'representation 2', 'idon\'t know yet', 'l\'opéra Bastille');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
