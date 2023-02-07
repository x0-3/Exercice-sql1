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


-- Dumping database structure for exo4 sql1
CREATE DATABASE IF NOT EXISTS `exo4 sql1` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `exo4 sql1`;

-- Dumping structure for table exo4 sql1.epreuve
CREATE TABLE IF NOT EXISTS `epreuve` (
  `numEpreuve` int NOT NULL AUTO_INCREMENT,
  `codeMat` char(255) DEFAULT NULL,
  `dateEpreuve` date DEFAULT NULL,
  `lieu` char(255) DEFAULT NULL,
  PRIMARY KEY (`numEpreuve`),
  KEY `FK_epreuve_matiere` (`codeMat`),
  CONSTRAINT `FK_epreuve_matiere` FOREIGN KEY (`codeMat`) REFERENCES `matiere` (`codeMat`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table exo4 sql1.epreuve: ~5 rows (approximately)
INSERT INTO `epreuve` (`numEpreuve`, `codeMat`, `dateEpreuve`, `lieu`) VALUES
	(1, 'A', '2023-03-30', 'Harlan'),
	(2, 'B', '2014-02-10', 'Harlan'),
	(3, 'C', '2014-01-21', 'Hustonville'),
	(4, 'B', '2014-05-15', 'Ithaca'),
	(5, 'A', '2023-11-27', 'Albuquerque');

-- Dumping structure for table exo4 sql1.etudiant
CREATE TABLE IF NOT EXISTS `etudiant` (
  `numEtu` int NOT NULL AUTO_INCREMENT,
  `nom` char(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '',
  `prenom` char(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '',
  `dateNaiss` date NOT NULL,
  `rue` char(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `cp` char(255) DEFAULT NULL,
  `ville` char(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`numEtu`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table exo4 sql1.etudiant: ~10 rows (approximately)
INSERT INTO `etudiant` (`numEtu`, `nom`, `prenom`, `dateNaiss`, `rue`, `cp`, `ville`) VALUES
	(1, 'Levine', 'Priya', '1996-01-05', '363 Farland Avenue', '78055', 'Medina Lake'),
	(2, 'Bird', 'Liberty', '1996-04-08', '3750 Hoffman Avenue', '11206', 'Lyon'),
	(3, 'Stevens', 'Salman', '1997-05-15', '2283 Jett Lane', '92507', 'Riverside'),
	(4, 'Melton', 'Leia', '1997-06-25', '2826 Lewis Street', '60172', 'Roselle'),
	(5, 'Gibson', 'Velma', '1997-07-14', '2434 Copperhead Road', '06032', 'Lyon'),
	(6, 'Martin', 'Issac', '1997-07-18', '1519 Bel Meadow Drive', '90017', 'Los Angeles'),
	(7, 'Durand', 'Cian', '1997-11-20', '550 Honeysuckle Lane', '98101', 'Seattle'),
	(8, 'Aleksander', 'Richmond', '1998-08-17', '3960 Thorn Street', '82716', 'Gillette'),
	(9, 'Eugene', 'Hess', '1999-07-05', '1519 Bel Meadow Drive', '90017', 'Los Angeles'),
	(10, 'Dupont', 'Miles', '2000-05-09', '550 Honeysuckle Lane', '98101', 'Lyon');

-- Dumping structure for table exo4 sql1.matiere
CREATE TABLE IF NOT EXISTS `matiere` (
  `codeMat` char(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'A',
  `libelle` char(255) DEFAULT NULL,
  `coef` float DEFAULT NULL,
  PRIMARY KEY (`codeMat`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table exo4 sql1.matiere: ~3 rows (approximately)
INSERT INTO `matiere` (`codeMat`, `libelle`, `coef`) VALUES
	('A', 'math', 8),
	('B', 'francais', 10),
	('C', 'SVT', 14);

-- Dumping structure for table exo4 sql1.notation
CREATE TABLE IF NOT EXISTS `notation` (
  `numEtu` int DEFAULT NULL,
  `note` float DEFAULT NULL,
  `codeMat` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT 'A',
  KEY `FK_notation_etudiant` (`numEtu`),
  KEY `FK_notation_matiere` (`codeMat`),
  CONSTRAINT `FK_notation_etudiant` FOREIGN KEY (`numEtu`) REFERENCES `etudiant` (`numEtu`),
  CONSTRAINT `FK_notation_matiere` FOREIGN KEY (`codeMat`) REFERENCES `matiere` (`codeMat`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table exo4 sql1.notation: ~14 rows (approximately)
INSERT INTO `notation` (`numEtu`, `note`, `codeMat`) VALUES
	(8, 19, 'A'),
	(2, 10, 'B'),
	(10, 3, 'A'),
	(7, 8, 'B'),
	(9, 20, 'A'),
	(6, 17, 'C'),
	(1, 0, 'A'),
	(5, 17, 'C'),
	(4, 9, 'A'),
	(3, 11, 'B'),
	(6, 20, 'A'),
	(5, 15, 'B'),
	(2, 12, 'B'),
	(10, 2, 'B');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
