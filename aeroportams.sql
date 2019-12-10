-- phpMyAdmin SQL Dump
-- version 4.2.7.1
-- http://www.phpmyadmin.net
--
-- Client :  127.0.0.1
-- Généré le :  Lun 09 Décembre 2019 à 22:04
-- Version du serveur :  5.6.20
-- Version de PHP :  5.5.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de données :  `aeroportams`
--

-- --------------------------------------------------------

--
-- Structure de la table `aeroport`
--

CREATE TABLE IF NOT EXISTS `aeroport` (
  `codeAer` varchar(10) NOT NULL,
  `nomAer` varchar(50) NOT NULL,
  `idVille` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `aeroport`
--

INSERT INTO `aeroport` (`codeAer`, `nomAer`, `idVille`) VALUES
('a1', 'Trudeau', 'v1'),
('a2', 'Mirabel', 'v1'),
('a3', 'Pearson', 'v2'),
('a4', 'Stanfield', 'v4'),
('a5', 'Jean Lesage', 'v3'),
('a6', 'Billy Bishop', 'v2');

-- --------------------------------------------------------

--
-- Structure de la table `calendrier`
--

CREATE TABLE IF NOT EXISTS `calendrier` (
  `codeCalendrier` varchar(10) NOT NULL,
  `dateCalendrier` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `calendrier`
--

INSERT INTO `calendrier` (`codeCalendrier`, `dateCalendrier`) VALUES
('cal1', '2018-12-09'),
('cal2', '2019-06-09'),
('cal3', '2019-12-09');

-- --------------------------------------------------------

--
-- Structure de la table `client`
--

CREATE TABLE IF NOT EXISTS `client` (
  `telClient` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `compagnie`
--

CREATE TABLE IF NOT EXISTS `compagnie` (
  `idCompagnie` varchar(10) NOT NULL,
  `nomCompagnie` varchar(50) NOT NULL,
  `adrCompagnie` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `compagnie`
--

INSERT INTO `compagnie` (`idCompagnie`, `nomCompagnie`, `adrCompagnie`) VALUES
('comp1', 'AIR CANADA', '1234, air canada'),
('comp2', 'AIR CHINA', '1234, air china'),
('comp3', 'AER LINGUS', '1234, aer lingus'),
('comp4', 'AIR TRANSAT', '1234, air transat'),
('comp5', 'AIR NORTH', '1234, Air North'),
('comp6', 'FIRST AIR', '1234, First Air'),
('comp7', 'AIR MIKISEW', '1234, Air Mikisew '),
('comp8', 'AIR INUIT', '1234, Air Inuit ');

-- --------------------------------------------------------

--
-- Structure de la table `notification`
--

CREATE TABLE IF NOT EXISTS `notification` (
  `idNotification` int(11) NOT NULL,
  `telClient` varchar(20) NOT NULL,
  `numVol` varchar(10) NOT NULL,
  `arret` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `usager` varchar(255) NOT NULL,
  `motdepasse` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `user`
--

INSERT INTO `user` (`usager`, `motdepasse`) VALUES
('admin', '123'),
('ams', '123');

-- --------------------------------------------------------

--
-- Structure de la table `ville`
--

CREATE TABLE IF NOT EXISTS `ville` (
  `idVille` varchar(10) NOT NULL,
  `nomVille` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `ville`
--

INSERT INTO `ville` (`idVille`, `nomVille`) VALUES
('v1', 'Montréal'),
('v2', 'Toronto'),
('v3', 'Québec'),
('v4', 'Halifax');

-- --------------------------------------------------------

--
-- Doublure de structure pour la vue `vol`
--
CREATE TABLE IF NOT EXISTS `vol` (
`volDepart` tinyint(1)
,`numVol` varchar(10)
,`idCompagnie` varchar(50)
,`codeAerDepart` varchar(50)
,`aeroportDestination` varchar(50)
,`heurePanifie` time
,`heureEstime` time
,`statutChange` varchar(20)
,`idVille` varchar(50)
,`dateVol` date
);
-- --------------------------------------------------------

--
-- Structure de la table `vol1`
--

CREATE TABLE IF NOT EXISTS `vol1` (
  `numVol` varchar(10) NOT NULL,
  `codeAerDepart` varchar(10) DEFAULT NULL,
  `dateVol` date DEFAULT NULL,
  `aeroportDestination` varchar(10) DEFAULT NULL,
  `heurePanifie` time DEFAULT NULL,
  `idCompagnie` varchar(10) DEFAULT NULL,
  `codeCalendrier` varchar(10) DEFAULT NULL,
  `volDepart` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `volajour`
--

CREATE TABLE IF NOT EXISTS `volajour` (
  `numVol` varchar(10) NOT NULL,
  `dateVol` date DEFAULT NULL,
  `heureEstime` time DEFAULT NULL,
  `statutChange` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la vue `vol`
--
DROP TABLE IF EXISTS `vol`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vol` AS select `v`.`volDepart` AS `volDepart`,`va`.`numVol` AS `numVol`,`c`.`nomCompagnie` AS `idCompagnie`,`a`.`nomAer` AS `codeAerDepart`,`a2`.`nomAer` AS `aeroportDestination`,`v`.`heurePanifie` AS `heurePanifie`,`va`.`heureEstime` AS `heureEstime`,`va`.`statutChange` AS `statutChange`,`vl`.`nomVille` AS `idVille`,`v`.`dateVol` AS `dateVol` from (((((`vol1` `v` join `volajour` `va` on((`v`.`numVol` = `va`.`numVol`))) join `aeroport` `a` on((`v`.`codeAerDepart` = `a`.`codeAer`))) join `aeroport` `a2` on((`v`.`aeroportDestination` = `a2`.`codeAer`))) join `ville` `vl` on((`a`.`idVille` = `vl`.`idVille`))) join `compagnie` `c` on((`v`.`idCompagnie` = `c`.`idCompagnie`))) where ((`v`.`dateVol` = curdate()) or (`v`.`dateVol` = (curdate() + 1)));

--
-- Index pour les tables exportées
--

--
-- Index pour la table `aeroport`
--
ALTER TABLE `aeroport`
 ADD PRIMARY KEY (`codeAer`), ADD KEY `idVille` (`idVille`);

--
-- Index pour la table `calendrier`
--
ALTER TABLE `calendrier`
 ADD PRIMARY KEY (`codeCalendrier`);

--
-- Index pour la table `client`
--
ALTER TABLE `client`
 ADD PRIMARY KEY (`telClient`);

--
-- Index pour la table `compagnie`
--
ALTER TABLE `compagnie`
 ADD PRIMARY KEY (`idCompagnie`);

--
-- Index pour la table `notification`
--
ALTER TABLE `notification`
 ADD PRIMARY KEY (`idNotification`), ADD KEY `telClient` (`telClient`), ADD KEY `numVol` (`numVol`);

--
-- Index pour la table `user`
--
ALTER TABLE `user`
 ADD PRIMARY KEY (`usager`);

--
-- Index pour la table `ville`
--
ALTER TABLE `ville`
 ADD PRIMARY KEY (`idVille`);

--
-- Index pour la table `vol1`
--
ALTER TABLE `vol1`
 ADD PRIMARY KEY (`numVol`), ADD KEY `codeAerDepart` (`codeAerDepart`), ADD KEY `idCompagnie` (`idCompagnie`), ADD KEY `codeCalendrier` (`codeCalendrier`), ADD KEY `codeAerDepart_2` (`codeAerDepart`), ADD KEY `aeroportDestination` (`aeroportDestination`), ADD KEY `idCompagnie_2` (`idCompagnie`), ADD KEY `codeCalendrier_2` (`codeCalendrier`);

--
-- Index pour la table `volajour`
--
ALTER TABLE `volajour`
 ADD PRIMARY KEY (`numVol`), ADD KEY `numVol` (`numVol`), ADD KEY `dateVol` (`dateVol`);

--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `aeroport`
--
ALTER TABLE `aeroport`
ADD CONSTRAINT `Aer_Vil` FOREIGN KEY (`idVille`) REFERENCES `ville` (`idVille`);

--
-- Contraintes pour la table `notification`
--
ALTER TABLE `notification`
ADD CONSTRAINT `Not_Cl` FOREIGN KEY (`telClient`) REFERENCES `client` (`telClient`),
ADD CONSTRAINT `Not_Vol` FOREIGN KEY (`numVol`) REFERENCES `vol1` (`numVol`);

--
-- Contraintes pour la table `vol1`
--
ALTER TABLE `vol1`
ADD CONSTRAINT `AerD_vol` FOREIGN KEY (`aeroportDestination`) REFERENCES `aeroport` (`codeAer`),
ADD CONSTRAINT `Vol_Aer` FOREIGN KEY (`codeAerDepart`) REFERENCES `aeroport` (`codeAer`),
ADD CONSTRAINT `Vol_Comp` FOREIGN KEY (`idCompagnie`) REFERENCES `compagnie` (`idCompagnie`),
ADD CONSTRAINT `vol1_ibfk_1` FOREIGN KEY (`codeCalendrier`) REFERENCES `calendrier` (`codeCalendrier`);

--
-- Contraintes pour la table `volajour`
--
ALTER TABLE `volajour`
ADD CONSTRAINT `VolA` FOREIGN KEY (`numVol`) REFERENCES `vol1` (`numVol`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
