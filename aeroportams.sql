-- phpMyAdmin SQL Dump
-- version 4.2.7.1
-- http://www.phpmyadmin.net
--
-- Client :  127.0.0.1
-- Généré le :  Jeu 05 Décembre 2019 à 22:38
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
('a4', 'Stanfield', 'v4');

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
('cal1', '2019-12-04'),
('cal2', '2019-12-05'),
('cal3', '2019-12-05'),
('cal4', '2019-12-05');

-- --------------------------------------------------------

--
-- Structure de la table `client`
--

CREATE TABLE IF NOT EXISTS `client` (
  `telClient` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `client`
--

INSERT INTO `client` (`telClient`) VALUES
('(514) 321-7659'),
('(514) 765-2314');

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
('comp1', 'AIR CANADA', 'adresse1'),
('comp2', 'AIR CHINA', 'adresse2'),
('comp3', 'AER LINGUS', 'adresse3'),
('comp4', 'BRUSSELS AIRLINES', 'adresse4');

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
  `usager` varchar(20) NOT NULL,
  `motdepasse` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `user`
--

INSERT INTO `user` (`usager`, `motdepasse`) VALUES
('admin', '123');

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
  `codeAerDepart` varchar(10) NOT NULL,
  `dateVol` date NOT NULL,
  `aeroportDestination` varchar(10) NOT NULL,
  `heurePanifie` time NOT NULL,
  `idCompagnie` varchar(10) NOT NULL,
  `codeCalendrier` varchar(10) NOT NULL,
  `volDepart` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `vol1`
--

INSERT INTO `vol1` (`numVol`, `codeAerDepart`, `dateVol`, `aeroportDestination`, `heurePanifie`, `idCompagnie`, `codeCalendrier`, `volDepart`) VALUES
('A33077', 'a1', '2019-12-05', 'a2', '06:00:00', 'comp2', 'cal2', 1),
('AC781', 'a2', '2019-12-04', 'a3', '04:20:06', 'comp4', 'cal3', 1),
('AC8904', 'a1', '2019-12-04', 'a2', '03:07:13', 'comp1', 'cal1', 0),
('AM637', 'a2', '2019-12-05', 'a2', '07:00:00', 'comp3', 'cal3', 1),
('LH6561', 'a3', '2019-12-05', 'a1', '10:08:15', 'comp1', 'cal1', 0),
('SN9596', 'a1', '2019-12-04', 'a3', '09:00:00', 'comp2', 'cal1', 0);

-- --------------------------------------------------------

--
-- Structure de la table `vol2`
--

CREATE TABLE IF NOT EXISTS `vol2` (
  `volDepart` tinyint(1) NOT NULL,
  `numVol` varchar(10) NOT NULL,
  `idCompagnie` varchar(50) NOT NULL,
  `codeAerDepart` varchar(50) NOT NULL,
  `aeroportDestination` varchar(50) NOT NULL,
  `heurePanifie` time NOT NULL,
  `heureEstime` time NOT NULL,
  `statutChange` varchar(20) NOT NULL,
  `idVille` varchar(50) NOT NULL,
  `dateVol` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `vol2`
--

INSERT INTO `vol2` (`volDepart`, `numVol`, `idCompagnie`, `codeAerDepart`, `aeroportDestination`, `heurePanifie`, `heureEstime`, `statutChange`, `idVille`, `dateVol`) VALUES
(1, 'A33077', 'AIR CHINA', 'Trudeau', 'Mirabel', '06:00:00', '08:15:21', 'Retardé', 'Montréal', '2019-12-05'),
(0, 'AC8904', 'AIR CANADA', 'Trudeau', 'Mirabel', '03:07:13', '07:00:00', 'arrivé', 'Montréal', '2019-12-04'),
(1, 'AC781', 'BRUSSELS AIRLINES', 'Mirabel', 'Pearson', '04:20:06', '05:00:00', 'Retardé', 'Montréal', '2019-12-04'),
(1, 'AM637', 'AER LINGUS', 'Mirabel', 'Mirabel', '07:00:00', '12:32:00', 'retardé', 'Montréal', '2019-12-05');

-- --------------------------------------------------------

--
-- Structure de la table `volajour`
--

CREATE TABLE IF NOT EXISTS `volajour` (
  `numVol` varchar(10) NOT NULL,
  `heureEstime` time NOT NULL,
  `statutChange` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `volajour`
--

INSERT INTO `volajour` (`numVol`, `heureEstime`, `statutChange`) VALUES
('A33077', '08:15:21', 'Retardé'),
('AC781', '05:00:00', 'Retardé'),
('AC8904', '07:00:00', 'arrivé'),
('AM637', '12:32:00', 'retardé');

-- --------------------------------------------------------

--
-- Structure de la vue `vol`
--
DROP TABLE IF EXISTS `vol`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vol` AS select `v`.`volDepart` AS `volDepart`,`va`.`numVol` AS `numVol`,`c`.`nomCompagnie` AS `idCompagnie`,`a`.`nomAer` AS `codeAerDepart`,`a2`.`nomAer` AS `aeroportDestination`,`v`.`heurePanifie` AS `heurePanifie`,`va`.`heureEstime` AS `heureEstime`,`va`.`statutChange` AS `statutChange`,`vl`.`nomVille` AS `idVille`,`v`.`dateVol` AS `dateVol` from (((((`vol1` `v` join `volajour` `va` on((`v`.`numVol` = `va`.`numVol`))) join `aeroport` `a` on((`v`.`codeAerDepart` = `a`.`codeAer`))) join `aeroport` `a2` on((`v`.`aeroportDestination` = `a2`.`codeAer`))) join `ville` `vl` on((`a`.`idVille` = `vl`.`idVille`))) join `compagnie` `c` on((`v`.`idCompagnie` = `c`.`idCompagnie`)));

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
 ADD PRIMARY KEY (`numVol`), ADD KEY `numVol` (`numVol`);

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
