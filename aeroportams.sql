-- phpMyAdmin SQL Dump
-- version 4.2.7.1
-- http://www.phpmyadmin.net
--
-- Client :  127.0.0.1
-- Généré le :  Jeu 12 Décembre 2019 à 02:34
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
  `telClient` varchar(20) NOT NULL,
  `numVol` varchar(10) NOT NULL,
  `dateVol` date NOT NULL,
  `arret` tinyint(1) NOT NULL,
  `idNotification` int(11) DEFAULT NULL
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
  `dateVol` date NOT NULL DEFAULT '0000-00-00',
  `aeroportDestination` varchar(10) DEFAULT NULL,
  `heurePanifie` time DEFAULT NULL,
  `idCompagnie` varchar(10) DEFAULT NULL,
  `codeCalendrier` varchar(10) DEFAULT NULL,
  `volDepart` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `vol1`
--

INSERT INTO `vol1` (`numVol`, `codeAerDepart`, `dateVol`, `aeroportDestination`, `heurePanifie`, `idCompagnie`, `codeCalendrier`, `volDepart`) VALUES
('AMS100', 'a1', '2019-12-09', 'a2', '01:00:00', 'comp1', 'cal3', 1),
('AMS110', 'a2', '2019-12-09', 'a1', '01:10:00', 'comp2', 'cal3', 0),
('AMS120', 'a1', '2019-12-09', 'a4', '01:15:00', 'comp3', 'cal3', 1),
('AMS130', 'a4', '2019-12-09', 'a1', '16:10:00', 'comp4', 'cal3', 0),
('AMS140', 'a1', '2019-12-09', 'a6', '15:15:00', 'comp5', 'cal3', 1),
('AMS150', 'a3', '2019-12-09', 'a1', '13:10:00', 'comp6', 'cal3', 0),
('AMS160', 'a1', '2019-12-09', 'a3', '06:20:00', 'comp7', 'cal3', 1),
('AMS170', 'a2', '2019-12-09', 'a1', '16:40:00', 'comp8', 'cal3', 0),
('AMS180', 'a1', '2019-12-09', 'a4', '21:45:00', 'comp1', 'cal3', 1),
('AMS190', 'a3', '2019-12-09', 'a1', '20:15:00', 'comp2', 'cal3', 0),
('AMS200', 'a1', '2019-12-09', 'a6', '20:15:00', 'comp3', 'cal3', 1),
('AMS210', 'a2', '2019-12-10', 'a1', '20:15:00', 'comp4', 'cal3', 0),
('AMS220', 'a1', '2019-12-10', 'a2', '20:15:00', 'comp5', 'cal3', 1),
('AMS230', 'a5', '2019-12-10', 'a1', '20:15:00', 'comp6', 'cal3', 0),
('AMS240', 'a1', '2019-12-10', 'a5', '23:15:00', 'comp7', 'cal3', 1),
('AMS250', 'a4', '2019-12-10', 'a1', '23:15:00', 'comp8', 'cal3', 0),
('AMS260', 'a1', '2019-12-10', 'a4', '12:00:00', 'comp1', 'cal3', 1),
('AMS270', 'a4', '2019-12-10', 'a1', '12:00:00', 'comp1', 'cal3', 0),
('AMS280', 'a1', '2019-12-10', 'a3', '12:00:00', 'comp1', 'cal3', 1),
('AMS290', 'a4', '2019-12-10', 'a1', '12:00:00', 'comp4', 'cal3', 0),
('AMS300', 'a1', '2019-12-10', 'a6', '13:30:00', 'comp4', 'cal3', 1),
('AMS310', 'a5', '2019-12-09', 'a1', '13:30:00', 'comp4', 'cal3', 0),
('AMS320', 'a1', '2019-12-09', 'a3', '13:30:00', 'comp4', 'cal3', 1),
('AMS330', 'a5', '2019-12-09', 'a1', '13:30:00', 'comp2', 'cal3', 0),
('AMS340', 'a1', '2019-12-09', 'a4', '18:30:00', 'comp2', 'cal3', 1),
('AMS350', 'a5', '2019-12-09', 'a1', '18:30:00', 'comp2', 'cal3', 0),
('AMS360', 'a1', '2019-12-09', 'a5', '18:30:00', 'comp4', 'cal3', 1),
('AMS370', 'a6', '2019-12-09', 'a1', '18:30:00', 'comp1', 'cal3', 0),
('AMS380', 'a1', '2019-12-09', 'a4', '13:30:00', 'comp1', 'cal3', 1),
('AMS390', 'a6', '2019-12-09', 'a1', '13:30:00', 'comp5', 'cal3', 0),
('AMS400', 'a1', '2019-12-09', 'a4', '13:30:00', 'comp5', 'cal3', 1),
('AMS410', 'a3', '2019-12-10', 'a1', '10:30:00', 'comp1', 'cal3', 0),
('AMS420', 'a1', '2019-12-10', 'a3', '10:30:00', 'comp1', 'cal3', 1),
('AMS430', 'a3', '2019-12-10', 'a1', '10:45:00', 'comp1', 'cal3', 0),
('AMS440', 'a1', '2019-12-10', 'a5', '10:45:00', 'comp4', 'cal3', 1),
('AMS450', 'a3', '2019-12-10', 'a1', '10:45:00', 'comp4', 'cal3', 0),
('AMS460', 'a1', '2019-12-10', 'a5', '11:45:00', 'comp4', 'cal3', 1),
('AMS470', 'a4', '2019-12-10', 'a1', '11:45:00', 'comp2', 'cal3', 0),
('AMS480', 'a1', '2019-12-10', 'a2', '11:30:00', 'comp2', 'cal3', 1),
('AMS490', 'a4', '2019-12-10', 'a1', '11:30:00', 'comp2', 'cal3', 0),
('AMS500', 'a1', '2019-12-10', 'a6', '11:00:00', 'comp1', 'cal3', 1);

-- --------------------------------------------------------

--
-- Structure de la table `volajour`
--

CREATE TABLE IF NOT EXISTS `volajour` (
  `numVol` varchar(10) NOT NULL,
  `dateVol` date NOT NULL,
  `heureEstime` time DEFAULT NULL,
  `statutChange` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `volajour`
--

INSERT INTO `volajour` (`numVol`, `dateVol`, `heureEstime`, `statutChange`) VALUES
('AMS100', '2019-12-09', '01:00:00', 'Depart'),
('AMS110', '2019-12-09', '01:10:00', 'Arrivé'),
('AMS120', '2019-12-09', '01:15:00', 'Depart'),
('AMS130', '2019-12-09', '16:10:00', 'Arrivé'),
('AMS140', '2019-12-09', '15:15:00', 'Depart'),
('AMS150', '2019-12-09', '13:10:00', 'Arrivé'),
('AMS160', '2019-12-09', '06:20:00', 'Depart'),
('AMS170', '2019-12-09', '16:40:00', 'Arrivé'),
('AMS180', '2019-12-09', '21:45:00', 'Depart'),
('AMS190', '2019-12-09', '20:15:00', 'Arrivé'),
('AMS200', '2019-12-09', '20:15:00', 'Depart'),
('AMS210', '2019-12-10', '20:15:00', 'Arrivé'),
('AMS220', '2019-12-10', '20:15:00', 'Depart'),
('AMS230', '2019-12-10', '20:15:00', 'Arrivé'),
('AMS240', '2019-12-10', '23:15:00', 'Depart'),
('AMS250', '2019-12-10', '23:15:00', 'Arrivé'),
('AMS260', '2019-12-10', '12:00:00', 'Depart'),
('AMS270', '2019-12-10', '12:00:00', 'Arrivé'),
('AMS280', '2019-12-10', '12:00:00', 'Depart'),
('AMS290', '2019-12-10', '12:00:00', 'Arrivé'),
('AMS300', '2019-12-10', '13:30:00', 'Depart'),
('AMS310', '2019-12-09', '13:30:00', 'Arrivé'),
('AMS320', '2019-12-09', '13:30:00', 'Depart'),
('AMS330', '2019-12-09', '13:30:00', 'Arrivé'),
('AMS340', '2019-12-09', '18:30:00', 'Depart'),
('AMS350', '2019-12-09', '18:30:00', 'Arrivé'),
('AMS360', '2019-12-09', '18:30:00', 'Depart'),
('AMS370', '2019-12-09', '18:30:00', 'Arrivé'),
('AMS380', '2019-12-09', '13:30:00', 'Depart'),
('AMS390', '2019-12-09', '13:30:00', 'Arrivé'),
('AMS400', '2019-12-09', '13:30:00', 'Depart'),
('AMS410', '2019-12-10', '10:30:00', 'Arrivé'),
('AMS420', '2019-12-10', '10:30:00', 'Depart'),
('AMS430', '2019-12-10', '10:45:00', 'Arrivé'),
('AMS440', '2019-12-10', '10:45:00', 'Depart'),
('AMS450', '2019-12-10', '10:45:00', 'Arrivé'),
('AMS460', '2019-12-10', '11:45:00', 'Depart'),
('AMS470', '2019-12-10', '11:45:00', 'Arrivé'),
('AMS480', '2019-12-10', '11:30:00', 'Depart'),
('AMS490', '2019-12-10', '11:30:00', 'Arrivé'),
('AMS500', '2019-12-10', '11:00:00', 'Depart');

-- --------------------------------------------------------

--
-- Structure de la vue `vol`
--
DROP TABLE IF EXISTS `vol`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vol` AS select `v`.`volDepart` AS `volDepart`,`va`.`numVol` AS `numVol`,`c`.`nomCompagnie` AS `idCompagnie`,`a`.`nomAer` AS `codeAerDepart`,`a2`.`nomAer` AS `aeroportDestination`,`v`.`heurePanifie` AS `heurePanifie`,`va`.`heureEstime` AS `heureEstime`,`va`.`statutChange` AS `statutChange`,`vl`.`nomVille` AS `idVille`,`v`.`dateVol` AS `dateVol` from (((((`vol1` `v` join `volajour` `va` on(((`v`.`numVol` = `va`.`numVol`) and (`v`.`dateVol` = `va`.`dateVol`)))) join `aeroport` `a` on((`v`.`codeAerDepart` = `a`.`codeAer`))) join `aeroport` `a2` on((`v`.`aeroportDestination` = `a2`.`codeAer`))) join `ville` `vl` on((`a`.`idVille` = `vl`.`idVille`))) join `compagnie` `c` on((`v`.`idCompagnie` = `c`.`idCompagnie`))) where ((`v`.`dateVol` = curdate()) or (`v`.`dateVol` = (curdate() + 1)));

--
-- Index pour les tables exportées
--

--
-- Index pour la table `aeroport`
--
ALTER TABLE `aeroport`
 ADD PRIMARY KEY (`codeAer`), ADD KEY `codeAer` (`codeAer`), ADD KEY `idVille` (`idVille`);

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
 ADD PRIMARY KEY (`telClient`,`numVol`,`dateVol`), ADD KEY `telClient` (`telClient`);

--
-- Index pour la table `ville`
--
ALTER TABLE `ville`
 ADD PRIMARY KEY (`idVille`);

--
-- Index pour la table `vol1`
--
ALTER TABLE `vol1`
 ADD PRIMARY KEY (`numVol`,`dateVol`), ADD KEY `codeAerDepart` (`codeAerDepart`), ADD KEY `aeroportDestination` (`aeroportDestination`), ADD KEY `idCompagnie` (`idCompagnie`), ADD KEY `codeCalendrier` (`codeCalendrier`);

--
-- Index pour la table `volajour`
--
ALTER TABLE `volajour`
 ADD PRIMARY KEY (`numVol`,`dateVol`), ADD KEY `dateVol` (`dateVol`), ADD KEY `numVol` (`numVol`);

--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `aeroport`
--
ALTER TABLE `aeroport`
ADD CONSTRAINT `FK_Aer_Ville` FOREIGN KEY (`idVille`) REFERENCES `ville` (`idVille`);

--
-- Contraintes pour la table `notification`
--
ALTER TABLE `notification`
ADD CONSTRAINT `Client_Not` FOREIGN KEY (`telClient`) REFERENCES `client` (`telClient`);

--
-- Contraintes pour la table `vol1`
--
ALTER TABLE `vol1`
ADD CONSTRAINT `Vol_AerD` FOREIGN KEY (`codeAerDepart`) REFERENCES `aeroport` (`codeAer`),
ADD CONSTRAINT `Vol_AerDes` FOREIGN KEY (`aeroportDestination`) REFERENCES `aeroport` (`codeAer`),
ADD CONSTRAINT `Vol_Cal` FOREIGN KEY (`codeCalendrier`) REFERENCES `calendrier` (`codeCalendrier`),
ADD CONSTRAINT `Vol_Comp` FOREIGN KEY (`idCompagnie`) REFERENCES `compagnie` (`idCompagnie`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
