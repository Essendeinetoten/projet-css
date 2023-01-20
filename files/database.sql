-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : mer. 18 jan. 2023 à 11:22
-- Version du serveur : 8.0.31
-- Version de PHP : 8.0.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `database`
--

-- --------------------------------------------------------

--
-- Structure de la table `cart`
--

DROP TABLE IF EXISTS `cart`;
CREATE TABLE IF NOT EXISTS `cart` (
  `CartID` int NOT NULL AUTO_INCREMENT,
  `CustomerID` int NOT NULL,
  `ItemID` int NOT NULL,
  `Quantity` int NOT NULL,
  PRIMARY KEY (`CartID`),
  KEY `CustomerID` (`CustomerID`),
  KEY `ItemID` (`ItemID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;

--
-- Déchargement des données de la table `cart`
--

INSERT INTO `cart` (`CartID`, `CustomerID`, `ItemID`, `Quantity`) VALUES
(4, 1, 1, 1);

-- --------------------------------------------------------

--
-- Structure de la table `category`
--

DROP TABLE IF EXISTS `category`;
CREATE TABLE IF NOT EXISTS `category` (
  `CategoryID` int NOT NULL,
  `Name` varchar(50) NOT NULL,
  PRIMARY KEY (`CategoryID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Déchargement des données de la table `category`
--

INSERT INTO `category` (`CategoryID`, `Name`) VALUES
(1, 'Ameublement'),
(2, 'Décoration'),
(3, 'Vaisselle'),
(4, 'Rangements'),
(5, 'Casseroles, plats et poêles'),
(6, 'Electroménager'),
(7, 'Couteaux et ustensiles de cuisine'),
(8, 'Accessoires de nettoyage');

-- --------------------------------------------------------

--
-- Structure de la table `item`
--

DROP TABLE IF EXISTS `item`;
CREATE TABLE IF NOT EXISTS `item` (
  `ItemID` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(50) NOT NULL,
  `SubCategoryID` int NOT NULL,
  `Picture` text NOT NULL,
  `Price` double NOT NULL,
  `Description` varchar(500) NOT NULL,
  `Quantity` int NOT NULL,
  `BuyerID` int DEFAULT NULL,
  `StarRate` double NOT NULL,
  `SellerID` int DEFAULT NULL,
  PRIMARY KEY (`ItemID`),
  KEY `BuyerID` (`BuyerID`),
  KEY `SellerID` (`SellerID`),
  KEY `SubCategoryID` (`SubCategoryID`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb3;

--
-- Déchargement des données de la table `item`
--

INSERT INTO `item` (`ItemID`, `Name`, `SubCategoryID`, `Picture`, `Price`, `Description`, `Quantity`, `BuyerID`, `StarRate`, `SellerID`) VALUES
(1, 'Lot de casseroles en inox', 1, 'casseroles.jpg', 49.9, 'Un lot de 7 casseroles en inox neuves', 15, NULL, 3.2, NULL),
(2, 'Kit de poêles en téflon', 2, 'poeles.jpg', 39.9, 'Un kit de 3 poêles en téflon neuves', 7, NULL, 3.6, NULL),
(3, 'Meuble de rangement noir', 14, 'tiroirs.png', 359.9, 'Meuble de rangement avec tiroirs. Design pixel perfect.', 1, NULL, 4.4, NULL),
(4, 'Kit ustensiles dorés 1', 23, 'ustenciles_or.png', 19.9, 'Kit d\'ustensiles de cuisine en inox plaqué doré.', 30, NULL, 3.9, NULL),
(5, 'Lot de casseroles en inox', 1, 'casseroles.jpg', 49.9, 'Un lot de 7 casseroles en inox neuves', 25, NULL, 3.2, NULL),
(6, 'Kit ustensiles dorés 2', 23, 'ustenciles_or.png', 19.9, 'Kit d\'ustensiles de cuisine en inox plaqué doré.', 1, NULL, 3.9, NULL),
(7, 'Kit ustensiles dorés 3', 23, 'ustenciles_or.png', 19.9, 'Kit d\'ustensiles de cuisine en inox plaqué doré.', 0, NULL, 3.9, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `subcategory`
--

DROP TABLE IF EXISTS `subcategory`;
CREATE TABLE IF NOT EXISTS `subcategory` (
  `SubCategoryID` int NOT NULL,
  `Name` varchar(50) NOT NULL,
  `CategoryID` int NOT NULL,
  PRIMARY KEY (`SubCategoryID`),
  KEY `CategoryID` (`CategoryID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Déchargement des données de la table `subcategory`
--

INSERT INTO `subcategory` (`SubCategoryID`, `Name`, `CategoryID`) VALUES
(1, 'Casseroles', 5),
(2, 'Poêles', 5),
(3, 'Plats', 5),
(4, 'Table', 1),
(5, 'Chaise', 1),
(6, 'Évier', 1),
(7, 'Four', 1),
(8, 'Plantes', 2),
(9, 'Luminaires', 2),
(10, 'Décorations diverses', 2),
(11, 'Couverts', 3),
(12, 'Assiettes', 3),
(13, 'Tasses', 3),
(14, 'Tiroirs', 4),
(15, 'Étagères', 4),
(16, 'Armoires', 4),
(17, 'Paniers', 4),
(18, 'Réfrigérateur', 6),
(19, 'Lave-vaisselle', 6),
(20, 'Micro-ondes', 6),
(21, 'Grille-pain', 6),
(22, 'Couteaux', 7),
(23, 'Kits inox', 7),
(24, 'Kits acier', 7),
(25, 'Kits silicone', 7),
(26, 'Kits bois', 7),
(27, 'Kit nettoyage évier', 8),
(28, 'Kit nettoyage sol', 8),
(29, 'Kit nettoyage cuisinière', 8);

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `UserID` int NOT NULL AUTO_INCREMENT,
  `FirstName` varchar(50) NOT NULL,
  `Name` varchar(50) NOT NULL,
  `BirthDate` date NOT NULL,
  `Address1` varchar(100) NOT NULL,
  `Address2` varchar(100) NOT NULL,
  `PostalCode` varchar(50) NOT NULL,
  `City` varchar(50) NOT NULL,
  `Country` varchar(50) NOT NULL,
  `Phone` int NOT NULL,
  `Email` varchar(50) NOT NULL,
  `Password` varchar(50) NOT NULL,
  `admin` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`UserID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`UserID`, `FirstName`, `Name`, `BirthDate`, `Address1`, `Address2`, `PostalCode`, `City`, `Country`, `Phone`, `Email`, `Password`, `admin`) VALUES
(1, 'louis', 'legendre', '2000-03-08', '1 square du bocage', 'appart 14', '49000', '', 'France', 781690627, 'louis@gmail.com', 'network', 0);

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `cart_ibfk_1` FOREIGN KEY (`CustomerID`) REFERENCES `user` (`UserID`),
  ADD CONSTRAINT `cart_ibfk_2` FOREIGN KEY (`ItemID`) REFERENCES `item` (`ItemID`);

--
-- Contraintes pour la table `item`
--
ALTER TABLE `item`
  ADD CONSTRAINT `item_ibfk_2` FOREIGN KEY (`BuyerID`) REFERENCES `user` (`UserID`),
  ADD CONSTRAINT `item_ibfk_4` FOREIGN KEY (`SellerID`) REFERENCES `user` (`UserID`),
  ADD CONSTRAINT `item_ibfk_5` FOREIGN KEY (`SubCategoryID`) REFERENCES `subcategory` (`SubCategoryID`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Contraintes pour la table `subcategory`
--
ALTER TABLE `subcategory`
  ADD CONSTRAINT `subcategory_ibfk_1` FOREIGN KEY (`CategoryID`) REFERENCES `category` (`CategoryID`) ON DELETE RESTRICT ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
