-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : ven. 10 déc. 2021 à 05:22
-- Version du serveur :  10.4.19-MariaDB
-- Version de PHP : 7.3.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `gestcmd`
--

-- --------------------------------------------------------

--
-- Structure de la table `commande`
--

CREATE TABLE `commande` (
  `idCmd` int(11) NOT NULL,
  `dateCmd` date DEFAULT NULL,
  `idUtil` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `commande`
--

INSERT INTO `commande` (`idCmd`, `dateCmd`, `idUtil`) VALUES
(1, '2021-12-07', 37),
(2, '2021-12-08', 40),
(3, '2021-12-09', 40),
(25, '2021-12-10', 37),
(26, '2021-12-10', 37),
(27, '2021-12-10', 37),
(28, '2021-12-10', 37),
(29, '2021-12-10', 37),
(30, '2021-12-10', 37);

-- --------------------------------------------------------

--
-- Structure de la table `lignedecommande`
--

CREATE TABLE `lignedecommande` (
  `idLigneCmd` int(11) NOT NULL,
  `quantite` int(11) NOT NULL,
  `idCmd` int(11) NOT NULL,
  `idProd` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `lignedecommande`
--

INSERT INTO `lignedecommande` (`idLigneCmd`, `quantite`, `idCmd`, `idProd`) VALUES
(1, 3, 1, 3),
(2, 8, 2, 4),
(3, 4, 3, 1),
(4, 9, 2, 2);

-- --------------------------------------------------------

--
-- Structure de la table `produit`
--

CREATE TABLE `produit` (
  `idProd` int(11) NOT NULL,
  `nomProd` varchar(255) DEFAULT NULL,
  `prixProd` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `produit`
--

INSERT INTO `produit` (`idProd`, `nomProd`, `prixProd`) VALUES
(1, 'jeux de voiture', 500),
(2, 'Poupée', 59),
(3, 'Palais', 1200),
(4, 'Pistoler', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `utilisateur`
--

CREATE TABLE `utilisateur` (
  `idUtil` int(11) NOT NULL,
  `nomUtil` varchar(255) DEFAULT NULL,
  `passwordUtil` varchar(255) DEFAULT NULL,
  `adresseUtil` varchar(255) DEFAULT NULL,
  `emailUtil` varchar(255) DEFAULT NULL,
  `typeUtil` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `utilisateur`
--

INSERT INTO `utilisateur` (`idUtil`, `nomUtil`, `passwordUtil`, `adresseUtil`, `emailUtil`, `typeUtil`) VALUES
(34, 'TLEMZI', '', 'Tanger', 'tlemzi@gmail.com', 1),
(37, 'fatima', '123', 'tanger', 'fatima.tlemzi@etu.uae.ac.ma', 2),
(38, 'fatima', '123', 'Agadir', 'fatimatlemzi1@gmail.com', 2),
(40, 'fatima', '12', 'tg', 'tmlz', 2);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `commande`
--
ALTER TABLE `commande`
  ADD PRIMARY KEY (`idCmd`),
  ADD KEY `idUtil` (`idUtil`);

--
-- Index pour la table `lignedecommande`
--
ALTER TABLE `lignedecommande`
  ADD PRIMARY KEY (`idLigneCmd`),
  ADD KEY `idCmd` (`idCmd`),
  ADD KEY `idProd` (`idProd`);

--
-- Index pour la table `produit`
--
ALTER TABLE `produit`
  ADD PRIMARY KEY (`idProd`);

--
-- Index pour la table `utilisateur`
--
ALTER TABLE `utilisateur`
  ADD PRIMARY KEY (`idUtil`),
  ADD UNIQUE KEY `emailUtil` (`emailUtil`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `commande`
--
ALTER TABLE `commande`
  MODIFY `idCmd` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT pour la table `lignedecommande`
--
ALTER TABLE `lignedecommande`
  MODIFY `idLigneCmd` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT pour la table `produit`
--
ALTER TABLE `produit`
  MODIFY `idProd` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT pour la table `utilisateur`
--
ALTER TABLE `utilisateur`
  MODIFY `idUtil` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `commande`
--
ALTER TABLE `commande`
  ADD CONSTRAINT `commande_ibfk_1` FOREIGN KEY (`idUtil`) REFERENCES `utilisateur` (`idUtil`) ON DELETE CASCADE;

--
-- Contraintes pour la table `lignedecommande`
--
ALTER TABLE `lignedecommande`
  ADD CONSTRAINT `lignedecommande_ibfk_1` FOREIGN KEY (`idCmd`) REFERENCES `commande` (`idCmd`) ON DELETE CASCADE,
  ADD CONSTRAINT `lignedecommande_ibfk_2` FOREIGN KEY (`idProd`) REFERENCES `produit` (`idProd`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
