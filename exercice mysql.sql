-- --------------------------------------------------------
-- Hôte:                         127.0.0.1
-- Version du serveur:           8.0.32 - MySQL Community Server - GPL
-- SE du serveur:                Win64
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

-- Listage de la structure de table mysql1. musicien
CREATE TABLE IF NOT EXISTS `musicien` (
  `numeroRepresentation` int DEFAULT NULL,
  `nom` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`nom`),
  KEY `FK_musicien_representation` (`numeroRepresentation`),
  CONSTRAINT `FK_musicien_representation` FOREIGN KEY (`numeroRepresentation`) REFERENCES `representation` (`numeroRepresentation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Listage des données de la table mysql1.musicien : ~0 rows (environ)
INSERT INTO `musicien` (`numeroRepresentation`, `nom`) VALUES
	(1, 'Daniel'),
	(2, 'Laure');

-- Listage de la structure de table mysql1. programmer
CREATE TABLE IF NOT EXISTS `programmer` (
  `numeroRepresentation` int DEFAULT NULL,
  `date` datetime NOT NULL,
  `tarif` float DEFAULT NULL,
  PRIMARY KEY (`date`),
  KEY `FK_programmer_representation` (`numeroRepresentation`),
  CONSTRAINT `FK_programmer_representation` FOREIGN KEY (`numeroRepresentation`) REFERENCES `representation` (`numeroRepresentation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Listage des données de la table mysql1.programmer : ~0 rows (environ)
INSERT INTO `programmer` (`numeroRepresentation`, `date`, `tarif`) VALUES
	(2, '2023-02-21 20:00:00', 100),
	(1, '2023-02-23 02:00:00', 120);

-- Listage de la structure de table mysql1. representation
CREATE TABLE IF NOT EXISTS `representation` (
  `numeroRepresentation` int NOT NULL AUTO_INCREMENT,
  `titreReprensentation` varchar(150) DEFAULT NULL,
  `Lieu` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`numeroRepresentation`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Listage des données de la table mysql1.representation : ~0 rows (environ)
INSERT INTO `representation` (`numeroRepresentation`, `titreReprensentation`, `Lieu`) VALUES
	(1, 'U got That', 'Mulhouse'),
	(2, 'Never Gonna Give You Up', 'Strasbourg');

-- Listage de la structure de table mysql2. etudiant
CREATE TABLE IF NOT EXISTS `etudiant` (
  `id_etudiant` int NOT NULL AUTO_INCREMENT,
  `nom` varchar(255) NOT NULL,
  `prenom` varchar(255) NOT NULL,
  PRIMARY KEY (`id_etudiant`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Listage des données de la table mysql2.etudiant : ~2 rows (environ)
INSERT INTO `etudiant` (`id_etudiant`, `nom`, `prenom`) VALUES
	(1, 'Siegel', 'Djibril'),
	(2, 'Pasteur', 'Douglas');

-- Listage de la structure de table mysql2. evaluer
CREATE TABLE IF NOT EXISTS `evaluer` (
  `id_etudiant` int NOT NULL,
  `id_codemat` int NOT NULL,
  `date` datetime NOT NULL,
  `note` float DEFAULT NULL,
  PRIMARY KEY (`date`),
  KEY `FK__etudiant` (`id_etudiant`),
  KEY `FK__matiere` (`id_codemat`),
  CONSTRAINT `FK__etudiant` FOREIGN KEY (`id_etudiant`) REFERENCES `etudiant` (`id_etudiant`),
  CONSTRAINT `FK__matiere` FOREIGN KEY (`id_codemat`) REFERENCES `matiere` (`id_codemat`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Listage des données de la table mysql2.evaluer : ~2 rows (environ)
INSERT INTO `evaluer` (`id_etudiant`, `id_codemat`, `date`, `note`) VALUES
	(1, 1, '2023-02-23 11:50:11', 15),
	(2, 2, '2023-02-23 11:50:32', 3);

-- Listage de la structure de table mysql2. matiere
CREATE TABLE IF NOT EXISTS `matiere` (
  `id_codemat` int NOT NULL AUTO_INCREMENT,
  `libelle_mat` varchar(255) NOT NULL,
  `coeff_mat` int NOT NULL,
  PRIMARY KEY (`id_codemat`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Listage des données de la table mysql2.matiere : ~3 rows (environ)
INSERT INTO `matiere` (`id_codemat`, `libelle_mat`, `coeff_mat`) VALUES
	(1, 'mathematique', 5),
	(2, 'francais', 8),
	(3, 'chimie', 3);

-- Listage de la structure de table mysql3. acheter
CREATE TABLE IF NOT EXISTS `acheter` (
  `id_noFour` int NOT NULL,
  `id_noArt` int NOT NULL,
  `prixAchat` float NOT NULL,
  `delai` varchar(50) DEFAULT NULL,
  KEY `FK__fournisseurs` (`id_noFour`),
  KEY `FK__articles` (`id_noArt`),
  CONSTRAINT `FK__articles` FOREIGN KEY (`id_noArt`) REFERENCES `articles` (`id_noArt`),
  CONSTRAINT `FK__fournisseurs` FOREIGN KEY (`id_noFour`) REFERENCES `fournisseurs` (`id_noFour`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Listage des données de la table mysql3.acheter : ~0 rows (environ)
INSERT INTO `acheter` (`id_noFour`, `id_noArt`, `prixAchat`, `delai`) VALUES
	(2, 1, 5, '3'),
	(1, 2, 10.99, '5');

-- Listage de la structure de table mysql3. articles
CREATE TABLE IF NOT EXISTS `articles` (
  `id_noArt` int NOT NULL AUTO_INCREMENT,
  `libelle` varchar(255) NOT NULL,
  `stock` int DEFAULT NULL,
  `prixInvent` float DEFAULT NULL,
  PRIMARY KEY (`id_noArt`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Listage des données de la table mysql3.articles : ~0 rows (environ)
INSERT INTO `articles` (`id_noArt`, `libelle`, `stock`, `prixInvent`) VALUES
	(1, 'raclette', 13, 3.99),
	(2, 'ecouteurs', 5, 1.99);

-- Listage de la structure de table mysql3. fournisseurs
CREATE TABLE IF NOT EXISTS `fournisseurs` (
  `id_noFour` int NOT NULL AUTO_INCREMENT,
  `nomFour` varchar(255) NOT NULL,
  `adrFour` varchar(255) NOT NULL,
  `villeFour` varchar(255) NOT NULL,
  PRIMARY KEY (`id_noFour`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Listage des données de la table mysql3.fournisseurs : ~0 rows (environ)
INSERT INTO `fournisseurs` (`id_noFour`, `nomFour`, `adrFour`, `villeFour`) VALUES
	(1, 'Mactoys', '43 rue donne', 'Mulhouse'),
	(2, 'Hornells', '13 avenue Strasbourg', 'Mulhouse');

-- Listage de la structure de table mysql4. epreuve
CREATE TABLE IF NOT EXISTS `epreuve` (
  `id_numEpreuve` int NOT NULL AUTO_INCREMENT,
  `dateEpreuve` datetime NOT NULL,
  `lieu` varchar(255) NOT NULL,
  `id_codeMat` int NOT NULL,
  PRIMARY KEY (`id_numEpreuve`),
  KEY `FK_epreuve_matiere` (`id_codeMat`),
  CONSTRAINT `FK_epreuve_matiere` FOREIGN KEY (`id_codeMat`) REFERENCES `matiere` (`id_codeMat`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Listage des données de la table mysql4.epreuve : ~0 rows (environ)
INSERT INTO `epreuve` (`id_numEpreuve`, `dateEpreuve`, `lieu`, `id_codeMat`) VALUES
	(1, '2023-02-23 14:01:49', 'Lycée Camus', 2),
	(2, '2023-02-23 14:02:16', 'Lycée Albert', 1),
	(3, '2023-02-23 14:02:29', 'Lycée Lambert', 3);

-- Listage de la structure de table mysql4. etudiant
CREATE TABLE IF NOT EXISTS `etudiant` (
  `id_numEtudiant` int NOT NULL AUTO_INCREMENT,
  `nom` varchar(255) NOT NULL,
  `prenom` varchar(255) NOT NULL,
  `rue` varchar(255) NOT NULL,
  `cp` varchar(255) NOT NULL,
  `ville` varchar(255) NOT NULL,
  `dateNaiss` datetime NOT NULL,
  PRIMARY KEY (`id_numEtudiant`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Listage des données de la table mysql4.etudiant : ~0 rows (environ)
INSERT INTO `etudiant` (`id_numEtudiant`, `nom`, `prenom`, `rue`, `cp`, `ville`, `dateNaiss`) VALUES
	(1, 'Siegel', 'Djibril', '11 rue camanbert', '68', 'Muhlouse', '2004-02-23 13:59:37'),
	(2, 'Macdonal', 'Ronald', '54 avenue dort', '68', 'Mulhouse', '2005-02-23 14:00:25');

-- Listage de la structure de table mysql4. matiere
CREATE TABLE IF NOT EXISTS `matiere` (
  `id_codeMat` int NOT NULL AUTO_INCREMENT,
  `libelle` varchar(255) NOT NULL,
  `coef` float NOT NULL,
  PRIMARY KEY (`id_codeMat`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Listage des données de la table mysql4.matiere : ~0 rows (environ)
INSERT INTO `matiere` (`id_codeMat`, `libelle`, `coef`) VALUES
	(1, 'mathematique', 16),
	(2, 'francais', 18),
	(3, 'histoire', 12);

-- Listage de la structure de table mysql4. notation
CREATE TABLE IF NOT EXISTS `notation` (
  `note` float DEFAULT NULL,
  `id_numEtu` int NOT NULL,
  `id_numEpreuve` int NOT NULL,
  KEY `FK_notation_etudiant` (`id_numEtu`),
  KEY `FK_notation_epreuve` (`id_numEpreuve`),
  CONSTRAINT `FK_notation_epreuve` FOREIGN KEY (`id_numEpreuve`) REFERENCES `epreuve` (`id_numEpreuve`),
  CONSTRAINT `FK_notation_etudiant` FOREIGN KEY (`id_numEtu`) REFERENCES `etudiant` (`id_numEtudiant`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Listage des données de la table mysql4.notation : ~0 rows (environ)
INSERT INTO `notation` (`note`, `id_numEtu`, `id_numEpreuve`) VALUES
	(15, 1, 2),
	(9, 2, 3);

-- Listage de la structure de table mysql5. fournisseur
CREATE TABLE IF NOT EXISTS `fournisseur` (
  `id_numF` int NOT NULL AUTO_INCREMENT,
  `nomF` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL,
  `villeF` varchar(255) NOT NULL,
  PRIMARY KEY (`id_numF`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Listage des données de la table mysql5.fournisseur : ~0 rows (environ)
INSERT INTO `fournisseur` (`id_numF`, `nomF`, `status`, `villeF`) VALUES
	(1, 'Carrefour', 'Ouvert', 'Paris'),
	(2, 'Lecler', 'Fermer', 'Lyon');

-- Listage de la structure de table mysql5. livraison
CREATE TABLE IF NOT EXISTS `livraison` (
  `id_numP` int NOT NULL,
  `id_numU` int NOT NULL,
  `id_numF` int NOT NULL,
  `quantité` int NOT NULL,
  KEY `FK__produit` (`id_numP`),
  KEY `FK__usine` (`id_numU`),
  KEY `FK__fournisseur` (`id_numF`),
  CONSTRAINT `FK__fournisseur` FOREIGN KEY (`id_numF`) REFERENCES `fournisseur` (`id_numF`),
  CONSTRAINT `FK__produit` FOREIGN KEY (`id_numP`) REFERENCES `produit` (`id_numP`),
  CONSTRAINT `FK__usine` FOREIGN KEY (`id_numU`) REFERENCES `usine` (`id_numU`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Listage des données de la table mysql5.livraison : ~0 rows (environ)
INSERT INTO `livraison` (`id_numP`, `id_numU`, `id_numF`, `quantité`) VALUES
	(1, 1, 1, 7),
	(2, 1, 2, 3);

-- Listage de la structure de table mysql5. produit
CREATE TABLE IF NOT EXISTS `produit` (
  `id_numP` int NOT NULL AUTO_INCREMENT,
  `nomP` varchar(255) NOT NULL,
  `couleur` varchar(255) NOT NULL,
  `poids` varchar(255) NOT NULL,
  PRIMARY KEY (`id_numP`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Listage des données de la table mysql5.produit : ~0 rows (environ)
INSERT INTO `produit` (`id_numP`, `nomP`, `couleur`, `poids`) VALUES
	(1, 'chaussette', 'rouge', '0.2'),
	(2, 'doudou', 'vert', '0.3');

-- Listage de la structure de table mysql5. usine
CREATE TABLE IF NOT EXISTS `usine` (
  `id_numU` int NOT NULL AUTO_INCREMENT,
  `nomU` varchar(255) NOT NULL,
  `villeU` varchar(255) NOT NULL,
  PRIMARY KEY (`id_numU`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Listage des données de la table mysql5.usine : ~0 rows (environ)
INSERT INTO `usine` (`id_numU`, `nomU`, `villeU`) VALUES
	(1, 'Roberto', 'Strasbourg'),
	(2, 'Carlos', 'Monaco');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
