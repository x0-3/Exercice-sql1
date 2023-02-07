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


-- Dumping database structure for exo2 sql1
CREATE DATABASE IF NOT EXISTS `exo2 sql1` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `exo2 sql1`;

-- Dumping structure for table exo2 sql1.etudiant
CREATE TABLE IF NOT EXISTS `etudiant` (
  `N°etudiant` int NOT NULL AUTO_INCREMENT,
  `nom` varchar(255) DEFAULT NULL,
  `prenom` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`N°etudiant`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table exo2 sql1.etudiant: ~2 rows (approximately)
INSERT INTO `etudiant` (`N°etudiant`, `nom`, `prenom`) VALUES
	(1, 'mark', 'tylier'),
	(2, 'steven', 'truc');

-- Dumping structure for table exo2 sql1.evaluer
CREATE TABLE IF NOT EXISTS `evaluer` (
  `N°etudiant` int DEFAULT NULL,
  `codemat` int DEFAULT NULL,
  `date` date NOT NULL,
  `note` int DEFAULT NULL,
  PRIMARY KEY (`date`),
  KEY `FK_evaluer_etudiant` (`N°etudiant`),
  KEY `FK_evaluer_matiere` (`codemat`),
  CONSTRAINT `FK_evaluer_etudiant` FOREIGN KEY (`N°etudiant`) REFERENCES `etudiant` (`N°etudiant`),
  CONSTRAINT `FK_evaluer_matiere` FOREIGN KEY (`codemat`) REFERENCES `matiere` (`codemat`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table exo2 sql1.evaluer: ~3 rows (approximately)
INSERT INTO `evaluer` (`N°etudiant`, `codemat`, `date`, `note`) VALUES
	(1, 2, '2023-02-02', 13),
	(1, 1, '2023-02-12', 16),
	(2, 1, '2023-03-02', 17);

-- Dumping structure for table exo2 sql1.matiere
CREATE TABLE IF NOT EXISTS `matiere` (
  `codemat` int NOT NULL AUTO_INCREMENT,
  `libellemat` varchar(255) DEFAULT NULL,
  `coefmat` int DEFAULT NULL,
  PRIMARY KEY (`codemat`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table exo2 sql1.matiere: ~2 rows (approximately)
INSERT INTO `matiere` (`codemat`, `libellemat`, `coefmat`) VALUES
	(1, 'math', 1),
	(2, 'francais', 3);

-- Dumping structure for view exo2 sql1.moyennegeneral
-- Creating temporary table to overcome VIEW dependency errors
CREATE TABLE `moyennegeneral` (
	`nom` VARCHAR(255) NULL COLLATE 'utf8mb4_0900_ai_ci',
	`prenom` VARCHAR(255) NULL COLLATE 'utf8mb4_0900_ai_ci',
	`moyenne` DECIMAL(14,4) NULL
) ENGINE=MyISAM;

-- Dumping structure for view exo2 sql1.moyenne_eleve
-- Creating temporary table to overcome VIEW dependency errors
CREATE TABLE `moyenne_eleve` (
	`nom` VARCHAR(255) NULL COLLATE 'utf8mb4_0900_ai_ci',
	`prenom` VARCHAR(255) NULL COLLATE 'utf8mb4_0900_ai_ci',
	`coefmat` INT(10) NULL,
	`libellemat` VARCHAR(255) NULL COLLATE 'utf8mb4_0900_ai_ci',
	`moyenne` DECIMAL(14,4) NULL
) ENGINE=MyISAM;

-- Dumping structure for view exo2 sql1.moyennegeneral
-- Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `moyennegeneral`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `moyennegeneral` AS select `etudiant`.`nom` AS `nom`,`etudiant`.`prenom` AS `prenom`,avg(`evaluer`.`note`) AS `moyenne` from (`evaluer` join `etudiant`) where (`evaluer`.`N°etudiant` = `etudiant`.`N°etudiant`) group by `etudiant`.`nom`,`etudiant`.`prenom`;

-- Dumping structure for view exo2 sql1.moyenne_eleve
-- Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `moyenne_eleve`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `moyenne_eleve` AS select `etudiant`.`nom` AS `nom`,`etudiant`.`prenom` AS `prenom`,`matiere`.`coefmat` AS `coefmat`,`matiere`.`libellemat` AS `libellemat`,avg(`evaluer`.`note`) AS `moyenne` from ((`etudiant` join `evaluer`) join `matiere`) where ((`etudiant`.`N°etudiant` = `evaluer`.`N°etudiant`) and (`evaluer`.`codemat` = `matiere`.`codemat`)) group by `etudiant`.`nom`,`etudiant`.`prenom`,`matiere`.`libellemat`,`matiere`.`coefmat`;

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
