-- phpMyAdmin SQL Dump
-- version 4.7.3
-- https://www.phpmyadmin.net/
--
-- Hôte : vignesetyiadmin.mysql.db
-- Généré le :  mer. 04 juil. 2018 à 15:09
-- Version du serveur :  5.6.39-log
-- Version de PHP :  5.6.36

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `vignesetyiadmin`
--

-- --------------------------------------------------------

--
-- Structure de la table `actualites`
--

CREATE TABLE `actualites` (
  `idActualite` int(11) NOT NULL,
  `titreActualite` varchar(50) NOT NULL,
  `contenuActualite` text NOT NULL,
  `dateActualite` date NOT NULL,
  `idPhoto` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `actualites`
--

INSERT INTO `actualites` (`idActualite`, `titreActualite`, `contenuActualite`, `dateActualite`, `idPhoto`) VALUES
(1, 'Ouverture prochaine du site', 'Le site de vignes & gourmandises ouvrira prochainement, vous pourrez découvrir tous nos produits et les commander depuis le site.', '2017-05-31', NULL),
(2, 'Promotions', 'Promotions ouverture du site', '2017-09-07', NULL),
(3, 'Epicerie fine', 'Ce site est encore encours de construction, il n\'est donc pas possible de commander nos produits d\'épicerie fine pour le moment.', '2017-11-01', NULL);

--
-- Déclencheurs `actualites`
--
DELIMITER $$
CREATE TRIGGER `InsertActualites(Majuscule&Date)` BEFORE INSERT ON `actualites` FOR EACH ROW BEGIN
	SET new.titreActualite = concat(UPPER(Substring(new.titreActualite, 1, 1)), LOWER(Substring(new.titreActualite, 2))); 
    IF (INSTR(new.titreActualite,'-') != 0) THEN
    	SET new.titreActualite = concat(concat(UPPER(Substring(new.titreActualite, 1, 1)), LOWER(Substring(new.titreActualite, 2, INSTR(new.titreActualite,'-')-1))), concat(UPPER(Substring(new.titreActualite, INSTR(new.titreActualite,'-')+1, 1)), LOWER(Substring(new.titreActualite, INSTR(new.titreActualite,'-')+2))));
    END IF;
    SET new.contenuActualite = concat(UPPER(Substring(new.contenuActualite, 1, 1)), LOWER(Substring(new.contenuActualite, 2)));
    SET new.dateActualite = curdate();
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `UpdateActualites(Majuscule)` BEFORE UPDATE ON `actualites` FOR EACH ROW BEGIN
	SET new.titreActualite = concat(UPPER(Substring(new.titreActualite, 1, 1)), LOWER(Substring(new.titreActualite, 2))); 
    IF (INSTR(new.titreActualite,'-') != 0) THEN
    	SET new.titreActualite = concat(concat(UPPER(Substring(new.titreActualite, 1, 1)), LOWER(Substring(new.titreActualite, 2, INSTR(new.titreActualite,'-')-1))), concat(UPPER(Substring(new.titreActualite, INSTR(new.titreActualite,'-')+1, 1)), LOWER(Substring(new.titreActualite, INSTR(new.titreActualite,'-')+2))));
    END IF;
    SET new.contenuActualite = concat(UPPER(Substring(new.contenuActualite, 1, 1)), LOWER(Substring(new.contenuActualite, 2)));
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Structure de la table `avisutilisateur`
--

CREATE TABLE `avisutilisateur` (
  `idAvis` int(11) NOT NULL,
  `nomUtilisateur` varchar(50) NOT NULL,
  `dateAvis` date NOT NULL,
  `titreAvis` varchar(50) NOT NULL,
  `descriptionAvis` text NOT NULL,
  `confirmationAvis` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déclencheurs `avisutilisateur`
--
DELIMITER $$
CREATE TRIGGER `InsertAvisUtilisateur(Majuscule&Date)` BEFORE INSERT ON `avisutilisateur` FOR EACH ROW BEGIN

	SET new.nomUtilisateur = concat(UPPER(Substring(new.nomUtilisateur, 1, 1)), LOWER(Substring(new.nomUtilisateur, 2))); 
    
    IF (INSTR(new.nomUtilisateur,'-') != 0) THEN
    	SET new.nomUtilisateur = concat(concat(UPPER(Substring(new.nomUtilisateur, 1, 1)), LOWER(Substring(new.nomUtilisateur, 2, INSTR(new.nomUtilisateur,'-')-1))), concat(UPPER(Substring(new.nomUtilisateur, INSTR(new.nomUtilisateur,'-')+1, 1)), LOWER(Substring(new.nomUtilisateur, INSTR(new.nomUtilisateur,'-')+2))));
    END IF;
        
    SET new.titreAvis = concat(UPPER(Substring(new.titreAvis, 1, 1)), LOWER(Substring(new.titreAvis, 2)));
    
    IF (INSTR(new.titreAvis,'-') != 0) THEN
    	SET new.titreAvis = concat(concat(UPPER(Substring(new.titreAvis, 1, 1)), LOWER(Substring(new.titreAvis, 2, INSTR(new.titreAvis,'-')-1))), concat(UPPER(Substring(new.titreAvis, INSTR(new.titreAvis,'-')+1, 1)), LOWER(Substring(new.titreAvis, INSTR(new.titreAvis,'-')+2))));
    END IF;
             
    SET new.descriptionAvis = concat(UPPER(Substring(new.descriptionAvis, 1, 1)), LOWER(Substring(new.descriptionAvis, 2)));
    
    SET new.dateAvis = curdate();
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `UpdateAvisUtilisateur (Majuscule)` BEFORE UPDATE ON `avisutilisateur` FOR EACH ROW BEGIN

	SET new.nomUtilisateur = concat(UPPER(Substring(new.nomUtilisateur, 1, 1)), LOWER(Substring(new.nomUtilisateur, 2))); 
    
    IF (INSTR(new.nomUtilisateur,'-') != 0) THEN
    	SET new.nomUtilisateur = concat(concat(UPPER(Substring(new.nomUtilisateur, 1, 1)), LOWER(Substring(new.nomUtilisateur, 2, INSTR(new.nomUtilisateur,'-')-1))), concat(UPPER(Substring(new.nomUtilisateur, INSTR(new.nomUtilisateur,'-')+1, 1)), LOWER(Substring(new.nomUtilisateur, INSTR(new.nomUtilisateur,'-')+2))));
    END IF;
        
    SET new.titreAvis = concat(UPPER(Substring(new.titreAvis, 1, 1)), LOWER(Substring(new.titreAvis, 2)));
    
    IF (INSTR(new.titreAvis,'-') != 0) THEN
    	SET new.titreAvis = concat(concat(UPPER(Substring(new.titreAvis, 1, 1)), LOWER(Substring(new.titreAvis, 2, INSTR(new.titreAvis,'-')-1))), concat(UPPER(Substring(new.titreAvis, INSTR(new.titreAvis,'-')+1, 1)), LOWER(Substring(new.titreAvis, INSTR(new.titreAvis,'-')+2))));
    END IF;
             
    SET new.descriptionAvis = concat(UPPER(Substring(new.descriptionAvis, 1, 1)), LOWER(Substring(new.descriptionAvis, 2)));
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Structure de la table `categorie`
--

CREATE TABLE `categorie` (
  `idCategorie` int(3) NOT NULL,
  `libelleCategorie` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `categorie`
--

INSERT INTO `categorie` (`idCategorie`, `libelleCategorie`) VALUES
(1, 'Spiritueux'),
(2, 'Effervescent'),
(3, 'Vin'),
(4, 'Cidre'),
(5, 'Bière'),
(6, 'Salé'),
(7, 'Sucré'),
(8, 'Thé'),
(9, 'Café'),
(12, 'Condiments'),
(15, 'Provençaux'),
(16, 'Divers');

--
-- Déclencheurs `categorie`
--
DELIMITER $$
CREATE TRIGGER `InsertCategorie(Majuscule)` BEFORE INSERT ON `categorie` FOR EACH ROW BEGIN
	SET new.libelleCategorie = concat(UPPER(Substring(new.libelleCategorie, 1, 1)), LOWER(Substring(new.libelleCategorie, 2))); 
    
    IF (INSTR(new.libelleCategorie,'-') != 0) THEN
    	SET new.libelleCategorie = concat(concat(UPPER(Substring(new.libelleCategorie, 1, 1)), LOWER(Substring(new.libelleCategorie, 2, INSTR(new.libelleCategorie,'-')-1))), concat(UPPER(Substring(new.libelleCategorie, INSTR(new.libelleCategorie,'-')+1, 1)), LOWER(Substring(new.libelleCategorie, INSTR(new.libelleCategorie,'-')+2))));
    END IF;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `UpdateCategorie(Majuscule)` BEFORE UPDATE ON `categorie` FOR EACH ROW BEGIN
	SET new.libelleCategorie = concat(UPPER(Substring(new.libelleCategorie, 1, 1)), LOWER(Substring(new.libelleCategorie, 2))); 
    
    IF (INSTR(new.libelleCategorie,'-') != 0) THEN
    	SET new.libelleCategorie = concat(concat(UPPER(Substring(new.libelleCategorie, 1, 1)), LOWER(Substring(new.libelleCategorie, 2, INSTR(new.libelleCategorie,'-')-1))), concat(UPPER(Substring(new.libelleCategorie, INSTR(new.libelleCategorie,'-')+1, 1)), LOWER(Substring(new.libelleCategorie, INSTR(new.libelleCategorie,'-')+2))));
    END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Structure de la table `client`
--

CREATE TABLE `client` (
  `idClient` int(11) NOT NULL,
  `nomClient` varchar(50) NOT NULL,
  `prenomClient` varchar(50) NOT NULL,
  `adresseClient` varchar(200) NOT NULL,
  `villeClient` varchar(80) NOT NULL,
  `codePostalClient` int(5) NOT NULL,
  `telephoneClient` varchar(50) DEFAULT NULL,
  `mailClient` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `client`
--

INSERT INTO `client` (`idClient`, `nomClient`, `prenomClient`, `adresseClient`, `villeClient`, `codePostalClient`, `telephoneClient`, `mailClient`) VALUES
(1, 'PAQUET', 'Thibault', '15 boulevard albert 1er', 'Rennees', 35200, NULL, 'test.test@gmail.fr'),
(2, 'MOIR', 'Geuil', '29 rue fselgl', 'Bruz', 35170, '', 'rachel.mouriec@orange.fr'),
(3, 'MOURIEC', 'Bhi', '29 rueli', 'Bruz', 35170, '0678281871', 'rachel.mouriec@club-internet.fr'),
(4, 'LELU', 'Awen', '11 rue de la foucherais', 'Vezin', 35132, '0620788001', 'lelu.awen@hacari.org'),
(5, 'DIRAT', 'Stephanie', '24 rue antichan', 'Lectoure', 32700, '0603674314', 'dirat.stephanie@orange.fr'),
(6, 'LELU', 'Awen', '11 rue de la foucherais', 'Vezin le coquet', 35132, NULL, 'lelu.awen@hacari.org');

--
-- Déclencheurs `client`
--
DELIMITER $$
CREATE TRIGGER `InsertClient` BEFORE INSERT ON `client` FOR EACH ROW BEGIN

	SET new.nomClient = UPPER(new.nomClient); 
    
    SET new.prenomClient = concat(UPPER(Substring(new.prenomclient, 1, 1)), LOWER(Substring(new.prenomclient, 2)));
    
     SET new.adresseClient = concat(UPPER(Substring(new.adresseClient, 1, 1)), LOWER(Substring(new.adresseClient, 2)));
     
     SET new.villeClient = concat(UPPER(Substring(new.villeClient, 1, 1)), LOWER(Substring(new.villeClient, 2)));
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `UpdateClient` BEFORE UPDATE ON `client` FOR EACH ROW BEGIN

	SET new.nomClient = UPPER(new.nomClient); 
    
    SET new.prenomClient = concat(UPPER(Substring(new.prenomclient, 1, 1)), LOWER(Substring(new.prenomclient, 2)));
    
     SET new.adresseClient = concat(UPPER(Substring(new.adresseClient, 1, 1)), LOWER(Substring(new.adresseClient, 2)));
     
     SET new.villeClient = concat(UPPER(Substring(new.villeClient, 1, 1)), LOWER(Substring(new.villeClient, 2)));
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Structure de la table `commande`
--

CREATE TABLE `commande` (
  `idCommande` int(11) NOT NULL,
  `idClient` int(11) NOT NULL,
  `dateCommande` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `fraisDePort` decimal(5,2) NOT NULL,
  `montantCommande` decimal(5,2) NOT NULL,
  `panierGarniCommande` tinyint(1) NOT NULL DEFAULT '0',
  `payerCommande` tinyint(1) NOT NULL DEFAULT '0',
  `envoyerCommande` tinyint(1) NOT NULL DEFAULT '0',
  `archiverCommande` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `commande`
--

INSERT INTO `commande` (`idCommande`, `idClient`, `dateCommande`, `fraisDePort`, `montantCommande`, `panierGarniCommande`, `payerCommande`, `envoyerCommande`, `archiverCommande`) VALUES
(1, 1, '2017-08-22 10:08:11', '8.50', '5.50', 1, 1, 1, 0),
(2, 2, '2017-09-24 17:56:53', '12.90', '48.45', 0, 0, 0, 0),
(3, 3, '2018-01-05 16:33:48', '8.50', '7.95', 0, 1, 0, 0),
(4, 3, '2018-01-05 16:37:11', '8.50', '52.00', 0, 1, 0, 0),
(5, 3, '2018-01-05 16:39:01', '8.50', '40.50', 0, 1, 0, 0),
(6, 3, '2018-02-19 16:28:10', '18.90', '72.90', 0, 0, 0, 0),
(7, 4, '2018-04-12 19:18:31', '8.50', '3.50', 0, 0, 0, 0),
(8, 5, '2018-05-04 14:01:42', '8.50', '10.50', 0, 1, 0, 0),
(9, 6, '2018-06-01 13:48:04', '8.50', '7.95', 0, 0, 0, 0),
(10, 6, '2018-06-06 13:52:32', '8.50', '3.50', 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Structure de la table `evenement`
--

CREATE TABLE `evenement` (
  `idEvenement` int(11) NOT NULL,
  `nomEvenement` varchar(50) NOT NULL,
  `descriptionEvenement` text NOT NULL,
  `lieuEvenement` text NOT NULL,
  `dateEvenement` date NOT NULL,
  `heureDebutEvenement` time NOT NULL,
  `imageCouvertureEvenement` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `evenement`
--

INSERT INTO `evenement` (`idEvenement`, `nomEvenement`, `descriptionEvenement`, `lieuEvenement`, `dateEvenement`, `heureDebutEvenement`, `imageCouvertureEvenement`) VALUES
(1, 'Soirée dégustation rhum avec chants marins', 'Une soirée pour découvrir notre gamme de rhum accompagné par des chants marins', 'Laillé', '2017-03-02', '20:00:00', NULL),
(2, 'Visite chateauneuf du pape', 'Visite domaine alain jaume', 'CHATEAUNEUF DU PAPE', '2016-08-13', '15:00:00', NULL),
(3, 'Du vin et des gourmandises', 'La passion et le partage', 'Laille', '2016-03-03', '14:00:00', NULL),
(4, 'Soirée avec guillaume joubin ancien sommelier de l', 'Soirée à themes rhone', 'Laillé', '2016-05-19', '19:30:00', NULL),
(5, 'Soirée avec pascal pochon chocolatier st malo', 'Dégustation de chocolats  \r\naccords mets et vin', 'Laillé', '2016-06-04', '17:00:00', NULL),
(6, 'Visite pichon longueville bordeaux', 'Rencontre avec les vignerons à bordeaux \r\n', 'Bordeaux', '2015-09-11', '16:00:00', NULL),
(7, 'Salon de paris', 'Dégustations alcools fort', 'Paris', '2016-10-10', '09:00:00', NULL),
(8, 'Salon vignes et vilaine', 'Salon de la loire', 'Laillé', '2016-11-25', '09:00:00', NULL),
(9, 'Rencontre avec monsieur rety ', 'Rencontre avec monsieur rety( vigneron\r\ndomaine rety)le domaine rety vient de recevoir 3 étoiles dans le nouveau guide\r\nhachette des vins 2018.le vin rouge primé est le cote du roussillon l\'insolente\r\nmillésimé 2015 qui a reçu une note de 5 sur 5 soit 3 étoiles vin exceptionnel.', 'Melesse', '2017-09-11', '17:30:00', NULL),
(10, 'Soirée champagnes jean despret', 'Dégustation de la gamme jean despret', 'Laillé', '2017-11-18', '19:30:00', NULL),
(12, 'Soirée domaine rety', 'Animation du vigneron monsieur rety et découverte des vins du domaine.', 'Laillé', '2017-12-08', '19:30:00', NULL),
(13, 'Salon des vignerons indépendants rennes', '300exposants', 'Rennes', '2018-01-28', '09:30:00', NULL),
(14, 'Salon des vignerons indépendants rennes', '300exposants', 'Rennes', '2018-01-28', '09:30:00', NULL),
(15, 'Salon des vignerons indépendants rennes', '300 exposants', 'Rennes', '2018-01-28', '09:30:00', NULL),
(16, 'Salon des vignerons indépendants rennes', '300 exposants', 'Rennes', '2018-01-28', '09:30:00', NULL),
(17, 'Salon des vignerons indépendants rennes', '300 exposants', 'Rennes', '2018-01-28', '09:30:00', NULL),
(18, 'Salon des vignerons indépendants rennes', '300exposants', 'Rennes', '2018-01-28', '09:30:00', NULL),
(19, 'Salon des vignerons indépendants rennes', '300exposants', 'Rennes', '2018-01-28', '09:30:00', NULL),
(20, 'Le salon des vins de loire 2018', '300 exposants vins de loire 2018.', 'Angers', '2018-02-05', '09:00:00', NULL),
(21, 'Salon vignocaves rennes 2018', 'Rencontre avec les vignerons (70 vignerons)', 'Rennes', '2018-03-05', '09:00:00', NULL),
(22, 'Salon de la bières artisanale saint-Malo', '52 exposants', 'Saint-Malo', '2018-03-25', '13:00:00', NULL),
(23, 'Salon de la bières rennes 2018', 'Dégustations de bières du monde.(40 exposants).', 'Rennes', '2018-04-09', '10:00:00', NULL),
(24, 'Dégustation de rhums-Et whiskys chateau d\\\'apigné', 'Dégustation et cour sur le rhums et whiskys\r\n8 rhums/8 whiskys.', 'le Rheu', '2018-04-16', '09:30:00', NULL),
(25, 'Dégustation de bières artisanales brasserie du ton', 'Découverte de bières artisanales et chants marins', 'Laillé', '2018-06-14', '19:30:00', NULL);

--
-- Déclencheurs `evenement`
--
DELIMITER $$
CREATE TRIGGER `InsertEvenement(Majuscule)` BEFORE INSERT ON `evenement` FOR EACH ROW BEGIN

	SET new.nomEvenement = concat(UPPER(Substring(new.nomEvenement, 1, 1)), LOWER(Substring(new.nomEvenement, 2))); 
    
    IF (INSTR(new.nomEvenement,'-') != 0) THEN
    	SET new.nomEvenement = concat(concat(UPPER(Substring(new.nomEvenement, 1, 1)), LOWER(Substring(new.nomEvenement, 2, INSTR(new.nomEvenement,'-')-1))), concat(UPPER(Substring(new.nomEvenement, INSTR(new.nomEvenement,'-')+1, 1)), LOWER(Substring(new.nomEvenement, INSTR(new.nomEvenement,'-')+2))));
    END IF;
        
    SET new.descriptionEvenement = concat(UPPER(Substring(new.descriptionEvenement, 1, 1)), LOWER(Substring(new.descriptionEvenement, 2)));
    
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `UpdateEvenement(Majuscule)` BEFORE UPDATE ON `evenement` FOR EACH ROW BEGIN

	SET new.nomEvenement = concat(UPPER(Substring(new.nomEvenement, 1, 1)), LOWER(Substring(new.nomEvenement, 2))); 
    
    IF (INSTR(new.nomEvenement,'-') != 0) THEN
    	SET new.nomEvenement = concat(concat(UPPER(Substring(new.nomEvenement, 1, 1)), LOWER(Substring(new.nomEvenement, 2, INSTR(new.nomEvenement,'-')-1))), concat(UPPER(Substring(new.nomEvenement, INSTR(new.nomEvenement,'-')+1, 1)), LOWER(Substring(new.nomEvenement, INSTR(new.nomEvenement,'-')+2))));
    END IF;
        
    SET new.descriptionEvenement = concat(UPPER(Substring(new.descriptionEvenement, 1, 1)), LOWER(Substring(new.descriptionEvenement, 2)));
    
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Structure de la table `fraisdeport`
--

CREATE TABLE `fraisdeport` (
  `poidsMinFraisDePort` decimal(5,2) NOT NULL,
  `poidsMaxFraisDePort` decimal(5,2) NOT NULL,
  `prixFraisDePort` decimal(5,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `fraisdeport`
--

INSERT INTO `fraisdeport` (`poidsMinFraisDePort`, `poidsMaxFraisDePort`, `prixFraisDePort`) VALUES
('0.00', '1.00', '7.50'),
('1.00', '2.00', '8.50'),
('2.00', '5.00', '12.90'),
('5.00', '10.00', '18.90'),
('10.00', '30.00', '26.90');

-- --------------------------------------------------------

--
-- Structure de la table `link_commande_produit`
--

CREATE TABLE `link_commande_produit` (
  `idCommande` int(11) NOT NULL,
  `idProduit` int(11) NOT NULL,
  `quantiteProduit` int(11) NOT NULL,
  `montantProduit` decimal(5,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `link_commande_produit`
--

INSERT INTO `link_commande_produit` (`idCommande`, `idProduit`, `quantiteProduit`, `montantProduit`) VALUES
(1, 5, 1, '5.50'),
(2, 9, 1, '40.50'),
(2, 192, 1, '7.95'),
(3, 192, 1, '7.95'),
(4, 10, 1, '52.00'),
(5, 9, 1, '40.50'),
(6, 13, 1, '3.50'),
(6, 108, 4, '11.60'),
(6, 127, 2, '11.50'),
(7, 13, 1, '3.50'),
(8, 172, 1, '10.50'),
(9, 192, 1, '7.95'),
(10, 13, 1, '3.50');

-- --------------------------------------------------------

--
-- Structure de la table `link_photo_evenement`
--

CREATE TABLE `link_photo_evenement` (
  `idPhoto` int(11) NOT NULL,
  `idEvenement` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `link_photo_evenement`
--

INSERT INTO `link_photo_evenement` (`idPhoto`, `idEvenement`) VALUES
(169, 1),
(170, 1),
(171, 1),
(172, 1),
(443, 2),
(444, 2),
(445, 2),
(446, 2),
(454, 3),
(455, 4),
(456, 5),
(457, 6),
(458, 7),
(459, 8),
(472, 9),
(481, 10),
(483, 12),
(512, 13),
(513, 14),
(514, 15),
(515, 17),
(516, 18),
(517, 20),
(518, 21),
(519, 22),
(520, 23),
(521, 24),
(522, 25);

-- --------------------------------------------------------

--
-- Structure de la table `link_photo_produit`
--

CREATE TABLE `link_photo_produit` (
  `idPhoto` int(11) NOT NULL,
  `idProduit` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `link_photo_produit`
--

INSERT INTO `link_photo_produit` (`idPhoto`, `idProduit`) VALUES
(8, 5),
(9, 6),
(10, 7),
(11, 8),
(12, 9),
(13, 10),
(14, 11),
(15, 12),
(16, 13),
(17, 14),
(18, 15),
(20, 17),
(21, 18),
(22, 19),
(23, 20),
(26, 23),
(27, 24),
(28, 25),
(29, 26),
(30, 27),
(173, 28),
(174, 29),
(175, 30),
(176, 31),
(177, 32),
(179, 34),
(180, 35),
(181, 36),
(182, 37),
(183, 38),
(184, 39),
(185, 40),
(186, 41),
(187, 42),
(188, 43),
(189, 44),
(190, 45),
(191, 46),
(192, 47),
(193, 48),
(194, 49),
(195, 50),
(196, 51),
(197, 52),
(198, 53),
(199, 54),
(200, 55),
(201, 56),
(202, 57),
(203, 58),
(204, 59),
(205, 60),
(206, 61),
(207, 62),
(208, 63),
(209, 64),
(210, 66),
(211, 67),
(212, 68),
(213, 69),
(214, 70),
(215, 71),
(216, 72),
(217, 73),
(218, 74),
(219, 75),
(220, 76),
(221, 77),
(222, 78),
(223, 79),
(224, 80),
(225, 81),
(226, 82),
(227, 83),
(228, 84),
(229, 85),
(230, 86),
(231, 87),
(233, 89),
(234, 90),
(242, 101),
(243, 102),
(244, 103),
(245, 104),
(246, 105),
(247, 106),
(248, 107),
(249, 108),
(250, 110),
(251, 111),
(476, 112),
(253, 113),
(254, 114),
(255, 115),
(256, 116),
(257, 117),
(258, 118),
(259, 119),
(260, 120),
(261, 121),
(262, 122),
(265, 125),
(266, 126),
(267, 127),
(268, 128),
(269, 129),
(270, 131),
(271, 132),
(272, 133),
(273, 134),
(274, 135),
(275, 136),
(276, 137),
(277, 138),
(278, 139),
(279, 140),
(280, 141),
(281, 142),
(282, 143),
(283, 144),
(284, 145),
(285, 146),
(286, 148),
(287, 149),
(288, 150),
(289, 151),
(292, 154),
(293, 155),
(294, 156),
(295, 157),
(296, 158),
(297, 159),
(298, 160),
(299, 161),
(300, 162),
(301, 163),
(302, 164),
(303, 165),
(304, 166),
(305, 167),
(307, 169),
(309, 171),
(310, 172),
(311, 173),
(312, 174),
(313, 175),
(316, 178),
(317, 179),
(318, 180),
(319, 181),
(320, 182),
(321, 183),
(322, 184),
(323, 185),
(324, 186),
(325, 187),
(326, 188),
(327, 189),
(328, 190),
(329, 191),
(330, 192),
(331, 193),
(332, 194),
(333, 195),
(335, 197),
(511, 198),
(337, 199),
(338, 200),
(339, 201),
(340, 202),
(341, 203),
(342, 204),
(344, 206),
(345, 207),
(346, 208),
(347, 209),
(348, 210),
(353, 211),
(354, 212),
(355, 213),
(356, 214),
(357, 215),
(358, 216),
(359, 217),
(360, 218),
(361, 219),
(362, 220),
(363, 221),
(364, 222),
(365, 223),
(366, 224),
(367, 225),
(368, 226),
(369, 227),
(370, 228),
(371, 229),
(372, 230),
(373, 231),
(375, 232),
(376, 233),
(377, 234),
(378, 235),
(379, 236),
(380, 237),
(381, 238),
(382, 239),
(383, 240),
(385, 241),
(386, 242),
(387, 243),
(388, 244),
(389, 245),
(390, 246),
(391, 247),
(392, 248),
(393, 249),
(394, 250),
(395, 251),
(396, 252),
(397, 253),
(398, 254),
(399, 255),
(400, 256),
(401, 257),
(402, 258),
(403, 259),
(404, 260),
(405, 261),
(406, 262),
(407, 263),
(408, 264),
(409, 265),
(410, 266),
(411, 267),
(412, 268),
(413, 269),
(414, 270),
(415, 271),
(416, 272),
(417, 273),
(418, 274),
(421, 277),
(422, 278),
(423, 279),
(424, 280),
(425, 281),
(426, 282),
(427, 283),
(428, 284),
(429, 285),
(430, 286),
(431, 287),
(432, 288),
(433, 289),
(434, 290),
(435, 291),
(436, 292),
(437, 293),
(438, 294),
(439, 295),
(440, 296),
(442, 298),
(447, 299),
(448, 300),
(469, 301),
(470, 302),
(471, 303),
(473, 304),
(468, 305),
(461, 307),
(462, 308),
(463, 309),
(464, 310),
(475, 312),
(477, 313),
(478, 314),
(479, 315),
(480, 316),
(484, 317),
(485, 318),
(486, 319),
(487, 320),
(488, 321),
(489, 322),
(490, 323),
(491, 324),
(492, 325),
(493, 326),
(494, 327),
(495, 328),
(496, 329),
(497, 330),
(498, 331),
(499, 332),
(500, 333),
(501, 334),
(502, 335),
(503, 336),
(504, 337),
(505, 338),
(506, 339),
(507, 340),
(509, 342),
(510, 343);

-- --------------------------------------------------------

--
-- Structure de la table `niveau`
--

CREATE TABLE `niveau` (
  `idNiveau` int(2) NOT NULL,
  `libelleNiveau` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `niveau`
--

INSERT INTO `niveau` (`idNiveau`, `libelleNiveau`) VALUES
(1, 'administrateur');

-- --------------------------------------------------------

--
-- Structure de la table `photo`
--

CREATE TABLE `photo` (
  `idPhoto` int(11) NOT NULL,
  `nomPhoto` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `photo`
--

INSERT INTO `photo` (`idPhoto`, `nomPhoto`) VALUES
(5, 'Skumen-India-pale-ale0.JPG'),
(6, 'Skumen-Pale-ale0.JPG'),
(7, 'Skumen-Amber-ale1.JPG'),
(8, 'Skumen-Rye-india-pale-al0.JPG'),
(9, 'Biere Tri Martolod.JPG'),
(10, 'Gin Mare.JPG'),
(11, 'Tequila Corralejo.JPG'),
(12, 'Chateau-De-laubade1.JPG'),
(13, 'Chateau de Laubade.JPG'),
(14, 'Beaujolais Blanc.JPG'),
(15, 'Ustersbacher-Urhell0.JPG'),
(16, 'Cidre-coat-Albret0.JPG'),
(17, 'Monthoux0.JPG'),
(18, 'Chignin-Bergeron0.JPG'),
(19, 'Domaine-Les-esquirots0.JPG'),
(20, 'Domaine-De-perhus0.JPG'),
(21, 'Les-Hauts-de-montrouge0.JPG'),
(22, 'Skumen-Amber-Ale0.JPG'),
(23, 'Skumen-Amber-Ale1.JPG'),
(26, 'Skumen-Wheat-India-Pale-Ale0.JPG'),
(27, 'Skumen-Pale-Ale0.JPG'),
(28, 'Perle-Cote-de-Provence0.JPG'),
(29, 'Moulin-a-vent0.JPG'),
(30, 'Fleurie0.JPG'),
(137, 'Soirée dégustation rhum avec chants marins0.JPG'),
(138, 'Soirée dégustation rhum avec chants marins1.JPG'),
(139, 'Soirée dégustation rhum avec chants marins2.JPG'),
(140, 'Soirée dégustation rhum avec chants marins3.JPG'),
(141, 'Soirée dégustation rhum avec chants marins0.JPG'),
(142, 'Soirée dégustation rhum avec chants marins1.JPG'),
(143, 'Soirée dégustation rhum avec chants marins2.JPG'),
(144, 'Soirée dégustation rhum avec chants marins3.JPG'),
(145, 'Soirée dégustation rhum avec chants marins0.JPG'),
(146, 'Soirée dégustation rhum avec chants marins1.JPG'),
(147, 'Soirée dégustation rhum avec chants marins2.JPG'),
(148, 'Soirée dégustation rhum avec chants marins3.JPG'),
(149, 'Soirée dégustation rhum avec chants marins0.JPG'),
(150, 'Soirée dégustation rhum avec chants marins1.JPG'),
(151, 'Soirée dégustation rhum avec chants marins2.JPG'),
(152, 'Soirée dégustation rhum avec chants marins3.JPG'),
(153, 'Soiree-degustation-rhum-avec-chants-marins0.JPG'),
(154, 'Soiree-degustation-rhum-avec-chants-marins1.JPG'),
(155, 'Soiree-degustation-rhum-avec-chants-marins2.JPG'),
(156, 'Soiree-degustation-rhum-avec-chants-marins3.JPG'),
(157, 'Soiree-degustation-rhum-avec-chants-marins0.JPG'),
(158, 'Soiree-degustation-rhum-avec-chants-marins1.JPG'),
(159, 'Soiree-degustation-rhum-avec-chants-marins2.JPG'),
(160, 'Soiree-degustation-rhum-avec-chants-marins3.JPG'),
(161, 'Soiree-degustation-rhum-avec-chants-marins0.JPG'),
(162, 'Soiree-degustation-rhum-avec-chants-marins1.JPG'),
(163, 'Soiree-degustation-rhum-avec-chants-marins2.JPG'),
(164, 'Soiree-degustation-rhum-avec-chants-marins3.JPG'),
(165, 'Soiree-degustation-rhum-avec-chants-marins0.JPG'),
(166, 'Soiree-degustation-rhum-avec-chants-marins1.JPG'),
(167, 'Soiree-degustation-rhum-avec-chants-marins2.JPG'),
(168, 'Soiree-degustation-rhum-avec-chants-marins3.JPG'),
(169, 'Soiree-degustation-rhum-avec-chants-marins0.JPG'),
(170, 'Soiree-degustation-rhum-avec-chants-marins1.JPG'),
(171, 'Soiree-degustation-rhum-avec-chants-marins2.JPG'),
(172, 'Soiree-degustation-rhum-avec-chants-marins3.JPG'),
(173, 'Brin-d\'or-domaine-de-la-grange0.JPG'),
(174, 'Vieilles-Vignes-Domaine-de-la-grange0.JPG'),
(175, 'Biere-Sainte-Colombe-Blonde0.JPG'),
(176, 'Biere-Sainte-Colombe-Blonde1.JPG'),
(177, 'Biere-Sainte-colombe-blanche0.JPG'),
(178, 'Biere-Sainte-Colombe-Doree0.JPG'),
(179, 'Biere-Sainte-Colombe-Ambree0.JPG'),
(180, 'Cognac-Ragnaud-Sabourin-N100.JPG'),
(181, 'Cognac-Ragnaud-Sabourin-N200.JPG'),
(182, 'Ter\'Raz0.JPG'),
(183, 'Ter\'Raz1.JPG'),
(184, 'Tarani-Millesime-20150.JPG'),
(185, 'Tarani-Millesime-20151.JPG'),
(186, 'Domaine-Martin-Faudot-Cepage-Chardonnay0.JPG'),
(187, 'Domaine-Martin-Faudot-Cepage-Trousseau0.JPG'),
(188, 'Vin-de-paille-de-Martin-Faudot-en-Arbois0.JPG'),
(189, 'Biere-Philomenn-Blonde0.JPG'),
(190, 'Biere-Philomenn-Triple0.JPG'),
(191, 'Biere-Philomenn-Blanche0.JPG'),
(192, 'Biere-Philomenn-Blonde1.JPG'),
(193, 'Biere-Philomenn-Rousse0.JPG'),
(194, 'Pack-Biere-Philomenn-0.JPG'),
(195, 'Duck-Triple0.JPG'),
(196, 'Biere-Duck-Blonde0.JPG'),
(197, 'Biere-D0.JPG'),
(198, 'Biere-Duck-Bretagne0.JPG'),
(199, 'Biere-Duck-Bretagne1.JPG'),
(200, 'Biere-Trompe-Souris-Blonde0.JPG'),
(201, 'Biere-Trompe-Souris-Blonde1.JPG'),
(202, 'Rhum-Don-Papa0.JPG'),
(203, 'Rhum-Diplomatico0.JPG'),
(204, 'Rhum-Angostura0.JPG'),
(205, 'Rhum-Matusalem0.JPG'),
(206, 'Rhum-Botran0.JPG'),
(207, 'Rhum-Agricole-HSE0.JPG'),
(208, 'Rhum-Arrange-Mangue-Letchis-Reunion0.JPG'),
(209, 'Rhum-Arrange-Menthe-Citron-Vert0.JPG'),
(210, 'Rhum-Arrange-ananas-victoria-fruit-de-la-passion0.JPG'),
(211, 'Rhum-Arrange-Fruit-de-la-passion0.JPG'),
(212, 'Rhum-Arrange-Mangue-Fruit-de-la-passion0.JPG'),
(213, 'Rhum-Arrange-Ananas-Victoria-Mangue0.JPG'),
(214, 'Rhum-Arrange-Ananas-Victoria0.JPG'),
(215, 'Rhum-Arrange-Punch-de-Noel0.JPG'),
(216, 'Rhum-Arrange-Piment-Espelette0.JPG'),
(217, 'Rhum-Arrange-Vanille-Reunion0.JPG'),
(218, 'Rhum-Arrange-Fraise-Framboise0.JPG'),
(219, 'Rhum-Arrange-Noix-de-coco0.JPG'),
(220, 'Rhum-Arrange-Orange-Cafe0.JPG'),
(221, 'Rhum-Arrange-Gingembre-Citron0.JPG'),
(222, 'Rhum-Arrange-Vanille-Cafe-Bourbon-Pointu-bio0.JPG'),
(223, 'Whisky-The-Irishman0.JPG'),
(224, 'Whisky-Black-Bottle0.JPG'),
(225, 'Whisky-Tokinoka0.JPG'),
(226, 'Whisky-Deanston0.JPG'),
(227, 'Whisky-The-Six-Isles0.JPG'),
(228, 'Whisky-Mac-Namara0.JPG'),
(229, 'Whisky-Glengoyne0.JPG'),
(230, 'Whisky-Tobermory0.JPG'),
(231, 'Whisky-Bunnahabhain0.JPG'),
(232, 'Whisky-Port-Charlotte0.JPG'),
(233, 'Whisky-Woodford-Reserve0.JPG'),
(234, 'Whisky-Ledaig0.JPG'),
(235, 'Domaine-Brazilier-vin-mousseux-brut0.JPG'),
(236, 'Domaine-Brazilier-vin-mousseux-rose0.JPG'),
(241, 'Domaine-De-l\'ete-cremant-de-loire0.JPG'),
(242, 'Chateau-Lalande0.JPG'),
(243, 'Domaine-Les-Barthes0.JPG'),
(244, 'Louis-Eschenauer0.JPG'),
(245, 'Domaines-du-Chateau-de-Riquewihr-Les-sorcieres0.JPG'),
(246, 'Dopff--Irion-Cuvee-Rene-Dopff-Gewurztraminer0.JPG'),
(247, 'Dopff--irion-cuvee-rene-dopff-pinot-gris0.JPG'),
(248, 'Dopff--irion-cuvee-rene-dopff-Riesling0.JPG'),
(249, 'Dopff--Irion-Blanc-de-Blancs-Brut0.JPG'),
(250, 'Champagne-Jean-Despret-0.JPG'),
(251, 'Champagne-Larnaudie-Hirault0.JPG'),
(252, 'Champagne-Larnaudie-Hirault-Rose0.JPG'),
(253, 'Champagne-Mailly0.JPG'),
(254, 'Champagne-Mailly1.JPG'),
(255, 'Champagne-Mailly2.JPG'),
(256, 'Champagne-Arlenoble0.JPG'),
(257, 'Champagne-Arlenoble1.JPG'),
(258, 'Champagne-Arlenoble2.JPG'),
(259, 'Champagne-Lenoble-Les-aventures0.JPG'),
(260, 'Champagne-Lenoble-Rose0.JPG'),
(261, 'Champagne-Paul-Bara-0.JPG'),
(262, 'Champagne-Bailly-Lapierre0.JPG'),
(263, 'Champagne-Dopff--irion0.JPG'),
(264, 'Champagne-Chateau-de-passavent0.JPG'),
(265, 'Champagne-Domaine-des-Sanzay0.JPG'),
(266, 'Champagne-Domaine-des-Sanzay-Rose0.JPG'),
(267, 'Champagne-prosecco0.JPG'),
(268, 'Champagne-Ruinart0.JPG'),
(269, 'Champagne-Ruinart1.JPG'),
(270, 'Nuits-Saint-Georges-Les-brulees0.JPG'),
(271, 'Chablis-cuvee-emeraude0.JPG'),
(272, 'Chablis-Premier-Cru0.JPG'),
(273, 'Saint-Veran0.JPG'),
(274, 'Pouilly-Fuisse-La-collonge0.JPG'),
(275, 'Cote-de-nuits-villages0.JPG'),
(276, 'Marsanay0.JPG'),
(277, 'Gevrey-Chambertin0.JPG'),
(278, 'Marsanay1.JPG'),
(279, 'Il-Meridiane0.JPG'),
(280, 'Barbera-D\'asti0.JPG'),
(281, 'Opal-Ridge0.JPG'),
(282, 'Terra-0.JPG'),
(283, 'bodega-Tamari0.JPG'),
(284, 'Coto-Vintage0.JPG'),
(285, 'Footprint0.JPG'),
(286, 'Chateau-des-Matards0.JPG'),
(287, 'Chateau-Macay0.JPG'),
(288, 'Chateau-Mayne-Vieil0.JPG'),
(289, 'Chateau-Haut-Selve0.JPG'),
(290, 'Vieux-Chateau-Cachet0.JPG'),
(291, 'Chateau-La-Chapelle-aux-moines0.JPG'),
(292, 'Chateau-Fourcas-Hosten0.JPG'),
(293, 'Les-cedres-D\'Hostex0.JPG'),
(294, 'Chapelle-de-Potensac-0.JPG'),
(295, 'Chateau-La-Fleur-des-Rouzes0.JPG'),
(296, 'Chateau-Lalande-Borie-0.JPG'),
(297, 'Chateau-Segur-De-Cabanac0.JPG'),
(298, 'Chateau-Clauzet0.JPG'),
(299, 'Chateau-Tour-Pibran0.JPG'),
(300, 'Vivens0.JPG'),
(301, 'Les-hauts-du-Tertre0.JPG'),
(302, 'Chateau-Bouscaut0.JPG'),
(303, 'Chateau-des-Matards1.JPG'),
(304, 'Castelnau0.JPG'),
(305, 'Chateau-Clauzet1.JPG'),
(306, 'Chateau-Haut-Selve1.JPG'),
(307, 'Chateau-Saint-Genes0.JPG'),
(308, 'Chateau-Franc-Cantenac0.JPG'),
(309, 'L\'impusilf0.JPG'),
(310, 'Partage0.JPG'),
(311, 'Domaine-La-tour-Penedesses0.JPG'),
(312, 'Domaine-La-tour-Penedesses-Faugeres0.JPG'),
(313, 'Chateau-Haut-Gleon-Corbieres0.JPG'),
(314, 'Chateau-Glenum-Le-rose-de-la-Marquise0.JPG'),
(315, 'Domaine-des-Maels-Minervois0.JPG'),
(316, 'Domaine-La-croix-Sainte-Eulalie0.JPG'),
(317, 'Domaine-La-cr0.JPG'),
(318, 'Domaine-La-croix-Sainte-Eulalie1.JPG'),
(319, 'Domaine-La-croix-Sainte-Eulalie-Saint-Chinian0.JPG'),
(320, 'Gres-De-Monpellier-Chateau-d\'Assas0.JPG'),
(321, 'Chardonnay-Rouquet\'s0.JPG'),
(322, 'Viognier-Rouquet\'s0.JPG'),
(323, 'Mas-Belles-Eaux0.JPG'),
(324, 'Chateau-Belles-Eaux-0.JPG'),
(325, 'Chinion0.JPG'),
(326, 'Reuilly-0.JPG'),
(327, 'Quincy0.JPG'),
(328, 'Domaines-des-Forges-Sauvignon0.JPG'),
(329, 'Domaines-des-Forges-Chardonnay0.JPG'),
(330, 'Domaines-des-Forges-L\'audace0.JPG'),
(331, 'Le-Moulin-du-gue-du-domaine-des-forges0.JPG'),
(332, 'Les-3C-du-domaines-des-Forges0.JPG'),
(333, 'Delice-d\'ete0.JPG'),
(334, 'Domaine-des-Sanzay-0.JPG'),
(335, 'Chateau-de-Passavant0.JPG'),
(336, 'Reuilly-1.JPG'),
(337, 'Reserve-Grand-Veneur0.JPG'),
(338, 'Domaine-Grand-Veneur-Les-Champauvins0.JPG'),
(339, 'Roquedon-Lirac0.JPG'),
(340, 'Grande-Garrigue0.JPG'),
(341, 'Terrasses-de-Montmirail-Gigondas0.JPG'),
(342, 'Domaine-Grand-Veneur-Blanc-de-Viognier0.JPG'),
(343, 'Reserve-0.JPG'),
(344, 'Le-cretace-Tavel0.JPG'),
(345, 'Chateau-Mont-Redon0.JPG'),
(346, 'Chateau-Mont-Redon1.JPG'),
(347, 'Domaine-Mathieu-Chateauneuf-du-pape0.JPG'),
(348, 'Crozes-Hermitage-0.JPG'),
(349, 'Mini-Madeleine-Citron0.JPG'),
(350, 'Mini-Madeleine-Citron0.JPG'),
(351, 'Mini-Madeleine-Citron0.JPG'),
(352, 'Mini-Madeleine-Citron0.JPG'),
(353, 'Mini-Madeleine-Citron0.JPG'),
(354, 'Cookie0.JPG'),
(355, 'Meringues0.JPG'),
(356, 'Croquants-Pommes-Caramel-Amandes0.JPG'),
(357, 'Croquants-Pepites-de-chocolat-et-ecorces-d\'orange0.JPG'),
(358, 'Les-croquants-Caramel0.JPG'),
(359, 'Le-Craquant-au-Caramel-Sale0.JPG'),
(360, 'Noisettes-aux-trois-chocolats0.JPG'),
(361, 'Noisettes-aux-trois-chocolats1.JPG'),
(362, 'Carres-Chocolat-Noir0.JPG'),
(363, 'Tablette-Chocolat-Lait0.JPG'),
(364, 'Maxi-Tablette0.JPG'),
(365, 'Chocolat-au-lait0.JPG'),
(366, 'Chocolat-noir0.JPG'),
(367, 'Palets-Chocolat-Noir-Piment-d\'espelette0.JPG'),
(368, 'Palets-Chocolat-Blanc-Piment-d\'espelette0.JPG'),
(369, 'Palets-Chocolat-Lait0.JPG'),
(370, 'Palets-Chocolat-Noir-0.JPG'),
(371, 'Tablette-Chocolat-Noir-700.JPG'),
(372, 'Tablette-Chocolat-Noir-740.JPG'),
(373, 'Confiture-Framboise-a-la-violette0.JPG'),
(374, 'Confiture-Il-etait-une-fois-fraise,-Framboise,-Cerise,-Groseille0.JPG'),
(375, 'Confiture-Fraise0.JPG'),
(376, 'Confiture-Fraise-au-Coquelicot0.JPG'),
(377, 'Confiture-Rhubarbe-et-Cassis0.JPG'),
(378, 'Confiture-Fraise-au-Coquelicot1.JPG'),
(379, 'Joli-mois-de-Mai-fraise,-passion,-feve-de-tonka0.JPG'),
(380, '1,2,3-Soleil-Orange,-Citron,-Pomelos0.JPG'),
(381, 'Clementine-de-Corse0.JPG'),
(382, 'Automne-Coing,-Pomme,-Poire,-epices0.JPG'),
(383, 'Cerise-Noire0.JPG'),
(384, 'Il-etait-une-fois-fraise,-framboise,-cerise,-groseille0.JPG'),
(385, 'Il-etait-une-fois-fraise,-framboise,-cerise,-groseille0.JPG'),
(386, 'Miel-de-Chataignier0.JPG'),
(387, 'Miel-de-Fleurs0.JPG'),
(388, 'Miel-de-Bruyeres-Erica0.JPG'),
(389, 'Miel-de-Fleurs1.JPG'),
(390, 'Miel-de-Chataignier1.JPG'),
(391, 'Miel-de-Ble-Noir0.JPG'),
(392, 'Tagliatelle-Nature0.JPG'),
(393, 'Fettucine-au-piment-d\'espelette0.JPG'),
(394, 'Risone-nature0.JPG'),
(395, 'Likenn-Nature0.JPG'),
(396, 'Rozenn-Nature0.JPG'),
(397, 'Feltuccine-au-Sarrasin0.JPG'),
(398, 'Feltuccine-aux-cepes0.JPG'),
(399, 'Feltuccine-au-noir-de-Sepia0.JPG'),
(400, 'Likenn-aux-5-saveurs0.JPG'),
(401, 'Rillettes-de-Hareng-Fume-aux-tomates-Confites0.JPG'),
(402, 'Rillettes-de-St-Jacques-aux-algues0.JPG'),
(403, 'Rillettes-de-maquereau-fume-au-poivre0.JPG'),
(404, 'Rillettes-de-bar-sauvage-a-la-fleur-de-sel0.JPG'),
(405, 'Rillettes-de-saumon-aux-algues0.JPG'),
(406, 'Rillettes-de-sardine0.JPG'),
(407, 'Soupe-de-poissons0.JPG'),
(408, 'Soupe-3-poissons-aux-algues0.JPG'),
(409, 'Bisque-de-langoustine-aux-algues0.JPG'),
(410, 'Salicornes-en-marinade0.JPG'),
(411, 'Saveurs-d\'artichaut-du-leon0.JPG'),
(412, 'Saveurs-de-chou-fleur-a-l\'andouille0.JPG'),
(413, 'Saveurs-de-petit-pois0.JPG'),
(414, 'Saveurs-de-potimarron-du-Leon0.JPG'),
(415, 'Saveurs-de-tomates-confites0.JPG'),
(416, 'Rillettes-de-St-Jacques-au-Lard0.JPG'),
(417, 'Tartare-d\'Algues0.JPG'),
(418, 'Rillettes-de-Lotte-aux-Agrumes0.JPG'),
(419, 'Rillettes-de-Maquereaux-\"facon-Boucane\"0.JPG'),
(420, 'Rillettes-de-Maquereaux-\"facon-Boucane\"1.JPG'),
(421, 'Rillettes-de-Maquereaux-facon-Boucane0.JPG'),
(422, 'Rillettes-de-sardines-aux-tomates-confites0.JPG'),
(423, 'Cuisses-de-canard-Confites0.JPG'),
(424, 'Cassoulet-au-confit-de-canard0.JPG'),
(425, 'Foie-gras-de-canard-entier-a-la-fleur-de-sel0.JPG'),
(426, 'Bloc-de-foie-gras-de-canard0.JPG'),
(427, 'Delice-de-canard-0.JPG'),
(428, 'Terrine-d\'oie-aux-fruits-rouges0.JPG'),
(429, 'Terrine-de-pintade-aux-girolles0.JPG'),
(430, 'Rillettes-de-canard-au-foie-gras0.JPG'),
(431, 'Rillettes-d\'oie0.JPG'),
(432, 'Pate-a-l\'andouille0.JPG'),
(433, 'Rillettes-de-porcs0.JPG'),
(434, 'Rillettes-au-wakame0.JPG'),
(435, 'Rillettes-au-cidre0.JPG'),
(436, 'Rillettes-au-wakame1.JPG'),
(437, 'Rillettes-pur-autruche0.JPG'),
(438, 'Rillettes-pur-autruche-aux-algues0.JPG'),
(439, 'Rillettes-pur-autruche-au-pommeau-de-Bretagne0.JPG'),
(440, 'Rillettes-de-canard-au-magret-fume0.JPG'),
(441, 'TEst0.jpg'),
(442, 'Cremant-de-Loire0.JPG'),
(443, 'VISITE-CHATEAUNEUF-DU-PAPE0.JPG'),
(444, 'VISITE-CHATEAUNEUF-DU-PAPE1.JPG'),
(445, 'VISITE-CHATEAUNEUF-DU-PAPE2.JPG'),
(446, 'VISITE-CHATEAUNEUF-DU-PAPE3.JPG'),
(447, 'WHISKY-FLATNOSE0.JPG'),
(448, 'rhum-Naga0.JPG'),
(449, 'CLAIRETTE-DE-DIE0.JPG'),
(450, 'FUJI-SANROKU0.JPG'),
(451, 'NAGA0.JPG'),
(452, 'Domaine-Rety-2015-L\'insolente-Roussillon0.JPG'),
(453, 'REUILLY-BLANC0.JPG'),
(454, 'Du-vin-et-des-Gourmandises0.JPG'),
(455, 'Soiree-avec-Guillaume-Joubin-Ancien-Sommelier-de-L\\\'Elysee0.JPG'),
(456, 'Soiree-avec-Pascal-Pochon-Chocolatier-STMalo0.JPG'),
(457, 'Visite-Pichon-Longueville-Bordeaux0.JPG'),
(458, 'Salon-de-Paris0.JPG'),
(459, 'Salon-Vignes-et-Vilaine0.JPG'),
(460, '-Pauillac-Tour-Pibran-6-bouteilles-75cl-dont-2-gratuites0.JPG'),
(461, 'Rhum-Coloma-8-Ans0.JPG'),
(462, 'Bunnahabhain-Toiteach0.JPG'),
(463, 'Flatnose-Blended-Malt0.JPG'),
(464, 'RHUM-CENTENARIO-20-ANS0.JPG'),
(465, 'test0.jpg'),
(466, 'Test0.jpg'),
(467, 'Test0.jpg'),
(468, 'Reuilly-Blanc0.JPG'),
(469, 'Clairette-De-die0.JPG'),
(470, 'Fuji-Sanroku-japonais0.JPG'),
(471, 'Rhum-Naga-indonesie0.JPG'),
(472, 'Rencontre-avec-Monsieur-Rety-0.JPG'),
(473, 'Domaine-Rety-2015-l\'insolente-Roussillon-3-etoiles-guide-hachette-20180.JPG'),
(474, 'Champagne-Larnaudie-Hirault-Rose-Guide-Hachette-20180.JPG'),
(475, 'Magnum-Domaine-RETY-2016-Souffle-D\'Or0.JPG'),
(476, 'Champagne-Larnaudie-Hirault-Rose-Guide-Hachette-20180.JPG'),
(477, '6-bouteilles-75cl-Graves-Haut-Selve-dont-2-offertes0.JPG'),
(478, '6-bouteilles-75cl-Chinien-Bergeron-dont-2-offertes0.JPG'),
(479, '6-bouteilles-75cl-Fourcas-Hostein(Listrac-Medoc)-dont-2-offertes0.JPG'),
(480, '6-bouteilles-75cl-Corbieres-Haut-Gleon-dont-2-offertes0.JPG'),
(481, 'Soiree-Champagne-Jean-Despret0.JPG'),
(482, 'Soiree-Domaine-Rety0.JPG'),
(483, 'Soiree-Domaine-Rety0.JPG'),
(484, 'VENTOUX-0.JPG'),
(485, 'Lirac-rouge-Chateau-Mont-Redon0.JPG'),
(486, 'Chateauneuf-du-Pape-Blanc-Mont-Redon0.JPG'),
(487, 'Syrah-100%-Jean-Luc-Colombo0.JPG'),
(488, 'Cornas-Jean-Luc-Colombo0.JPG'),
(489, 'Cote-Rotie-Jean-Luc-Colombo0.JPG'),
(490, 'Chateau-La-Mijane0.JPG'),
(491, 'LALANDE-DE-POMEROL1.JPG'),
(492, 'SAINT-Emilion-Grand-Cru-Classe-20150.JPG'),
(493, 'Pomerol-Chateau-La-Croix0.JPG'),
(494, 'Moulis-Chateau-Mauvesin-Barton0.JPG'),
(495, 'Saint-Veran-Chateau-de-Beauregard0.JPG'),
(496, 'Vire-Clesse-Joseph-Burrier0.JPG'),
(497, 'Chinon-rouge-Bernard-Baudry0.JPG'),
(498, 'Chinon-Blanc-Bernard-Baudry0.JPG'),
(499, 'FIXIN-ROUGE0.JPG'),
(500, 'Roussanne-blanc0.JPG'),
(501, 'Roussanne-blanc1.JPG'),
(502, 'Minervois-rouge-Le-Clos-du-Pech-Laurie0.JPG'),
(503, 'Minervois-rouge-Domaine-des-Maels0.JPG'),
(504, 'Domaine-Rety-Souffle-D\'or0.JPG'),
(505, 'Legacy-Roussillon-blanc0.JPG'),
(506, 'Champagne-Jacquesson0.JPG'),
(507, 'WRITERS-TEARS0.JPG'),
(508, 'Coloma-15-ANS0.JPG'),
(509, 'Diplomatico-collection-0.JPG'),
(510, 'Coloma-15-ANS1.JPG'),
(511, 'Saumur-Champigny-domaine-des-sanzay1.JPG'),
(512, 'Salon-des-Vignerons-Independants-Rennes0.JPG'),
(513, 'Salon-des-Vignerons-Independants-Rennes0.JPG'),
(514, 'Salon-des-Vignerons-Independants-Rennes0.JPG'),
(515, 'Salon-des-Vignerons-Independants-Rennes0.JPG'),
(516, 'Salon-des-Vignerons-Independants-Rennes0.JPG'),
(517, 'Le-Salon-Des-Vins-de-Loire-20180.JPG'),
(518, 'Salon-Vignocaves-Rennes-20180.JPG'),
(519, 'Salon-de-la-Biere-artisanale-Saint-Malo0.JPG'),
(520, 'Salon-de-la-Bieres-Rennes-20180.JPG'),
(521, 'Degustation-de-Rhums-et-Whiskys-au-Chateau-D\\\'apigne0.JPG'),
(522, 'Degustation-de-Bieres-Artisanales-Brasserie-du-Tonnelier-et-Chants-Marins0.JPG');

-- --------------------------------------------------------

--
-- Structure de la table `produit`
--

CREATE TABLE `produit` (
  `idProduit` int(5) NOT NULL,
  `nomProduit` varchar(100) NOT NULL,
  `typeProduit` varchar(20) NOT NULL,
  `prixProduit` decimal(5,2) NOT NULL,
  `stockProduit` int(3) NOT NULL,
  `poidsBrutProduit` decimal(5,2) NOT NULL,
  `categorieProduit` int(3) DEFAULT NULL,
  `sousCategorieProduit` int(3) DEFAULT NULL,
  `lieuProductionProduit` varchar(100) DEFAULT NULL,
  `marqueProduit` varchar(100) DEFAULT NULL,
  `contenanceProduit` varchar(10) DEFAULT NULL,
  `poidsNetProduit` varchar(10) DEFAULT NULL,
  `descriptionProduit` text,
  `avisCommercantProduit` text,
  `dateAjoutProduit` date NOT NULL,
  `dateFinProduit` date DEFAULT NULL,
  `dateDebutPromotionProduit` date DEFAULT NULL,
  `dateFinPromotionProduit` date DEFAULT NULL,
  `prixPromotionProduit` decimal(5,2) DEFAULT NULL,
  `etatProduit` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `produit`
--

INSERT INTO `produit` (`idProduit`, `nomProduit`, `typeProduit`, `prixProduit`, `stockProduit`, `poidsBrutProduit`, `categorieProduit`, `sousCategorieProduit`, `lieuProductionProduit`, `marqueProduit`, `contenanceProduit`, `poidsNetProduit`, `descriptionProduit`, `avisCommercantProduit`, `dateAjoutProduit`, `dateFinProduit`, `dateDebutPromotionProduit`, `dateFinPromotionProduit`, `prixPromotionProduit`, `etatProduit`) VALUES
(5, 'Skumen Rye indiapale ale issu de la culture biologique 75cl', 'alcool', '5.50', 0, '1.32', 5, 3, 'Acigné', 'Skumen', '75CL', NULL, 'Issu de la culture biologique', '', '2017-05-30', NULL, NULL, NULL, '0.00', 1),
(6, 'Bière Tri martolod 33cl', 'alcool', '2.40', 8, '0.55', 5, 4, '', 'Tri Martolod', '33cl', NULL, 'Brassée à  concarneau (29).', '', '2017-05-30', NULL, NULL, NULL, '0.00', 1),
(7, 'Gin Mare', 'alcool', '36.00', 1, '1.25', 1, 16, '', '', '500ml', NULL, '', '', '2017-05-30', NULL, NULL, NULL, '0.00', 1),
(8, 'Tequila Corralejo mexique', 'alcool', '37.00', 2, '1.25', 1, 15, '', '', '70cl', NULL, '', '', '2017-05-30', NULL, NULL, NULL, '0.00', 1),
(9, ' Armagnac château laubade', 'alcool', '41.00', 1, '1.25', 1, 14, '', '', '70cl', NULL, '', '', '2017-05-30', NULL, NULL, NULL, '0.00', 1),
(10, ' Armagnac château de laubade hors d\'âge', 'alcool', '52.00', 0, '1.25', 1, 14, '', '', '70cl', NULL, '', '', '2017-05-30', NULL, NULL, NULL, '0.00', 1),
(11, 'Beaujolais Blanc', 'alcool', '12.00', 12, '1.25', 3, 5, 'Domaine Du vissoux', '', '75CL', NULL, 'Cépage chardonnay\r\naccords::foie gras, poissons et apéritif.', '', '2017-05-30', NULL, NULL, NULL, '0.00', 1),
(12, 'Ustersbacher  50cl bière belge', 'alcool', '3.50', 0, '0.56', 5, 3, '', '', '50cl', NULL, '', '', '2017-05-30', NULL, NULL, NULL, '0.00', 1),
(13, 'Cidre coat-Albret brut', 'alcool', '3.50', 4, '1.25', 4, NULL, '', '', '75cl', NULL, '', '', '2017-05-30', NULL, NULL, NULL, '0.00', 1),
(14, 'Roussette De savoie', 'alcool', '13.30', 6, '1.25', 3, 6, '', '', '75CL', NULL, 'Accords:raclette ,fondue de fromages,apéritif,charcuterie', '', '2017-05-30', NULL, NULL, NULL, '0.00', 1),
(15, 'Chignin Bergeron savoie', 'alcool', '15.90', 6, '8.00', 3, 6, '', '', '75cl', NULL, 'Aromes puissants d\'abricots et de pain grillé.\r\nun foie gras poêlé accompagnera parfaitement un tel vin.', '', '2017-05-30', NULL, NULL, NULL, '0.00', 1),
(16, 'Domaine Les esquirots', 'alcool', '5.90', 0, '1.25', 3, 7, '', '', '0.75CL', NULL, '', '', '2017-05-30', NULL, NULL, NULL, '0.00', 0),
(17, 'Domaine De perhus', 'alcool', '6.20', 6, '1.25', 3, 7, '', '', '75CL', NULL, 'Cépages:gros manseng.\r\n arômes de fruits bien murs: ananas -mangue.\r\naccords :foie gras ,apéritif, dessert.', '', '2017-05-30', NULL, NULL, NULL, '0.00', 1),
(18, 'Les Hauts de montrouge moelleux', 'alcool', '7.20', 6, '1.25', 3, 7, '', '', '75CL', NULL, 'Accords:apéritif,foie gras,dessert chocolat', '', '2017-05-30', NULL, NULL, NULL, '0.00', 1),
(19, 'Skumen Amber ale issu de la culture biologique 33cl', 'alcool', '2.80', 0, '0.56', 5, 1, 'Acigné', 'Skumen', '33cl', NULL, 'Produit issu de l\'agriculture biologique', '', '2017-05-30', NULL, NULL, NULL, '0.00', 1),
(20, 'Skumen Amber ale 75cl', 'alcool', '5.50', 2, '1.32', 5, 1, 'Acigné', 'Skumen', '75CL', NULL, 'Issu de la culture biologique', '', '2017-05-30', NULL, NULL, NULL, '0.00', 1),
(23, 'Skumen Wheat india pale ale issu de la culture biologique 75cl', 'alcool', '5.50', 0, '1.32', 5, 2, 'Acigné', 'Skumen', '75CL', NULL, 'Issu de la culture biologique', '', '2017-05-30', NULL, NULL, NULL, '0.00', 1),
(24, 'Skumen Pale ale blonde issu de la culturebiologique 75cl', 'alcool', '5.50', 2, '1.32', 5, 3, 'Acigné', 'Skumen', '75CL', NULL, 'Issu de la culture biologique', '', '2017-05-30', NULL, NULL, NULL, '0.00', 1),
(25, 'Perle De roseline rosé', 'alcool', '7.40', 18, '1.25', 3, 8, '', '', '75CL', NULL, 'Accords :charcuterie, apéritif,salade.', '', '2017-05-30', NULL, NULL, NULL, '0.00', 1),
(26, 'Moulin-À-vent 2014', 'alcool', '12.30', 24, '1.25', 3, 5, '', '', '75CL', NULL, 'Accords:plat épicé', '', '2017-05-30', NULL, NULL, NULL, '0.00', 1),
(27, 'Fleurie ', 'alcool', '11.80', 24, '1.25', 3, 5, '', '', '75CL', NULL, '', '', '2017-05-30', NULL, NULL, NULL, '0.00', 1),
(28, ' Muscadet brin d\'or domaine de la grange', 'alcool', '5.90', 6, '1.25', 3, 9, '', '', '75cl', NULL, '', '', '2017-05-31', NULL, NULL, NULL, '0.00', 1),
(29, ' Muscadet vieilles vignes domaine de la grange', 'alcool', '6.75', 8, '1.25', 3, 9, '', '', '75cl', NULL, 'Accords :poisson en sauce.', '', '2017-05-31', NULL, NULL, NULL, '0.00', 1),
(30, 'Bière Sainte colombe blonde 33cl', 'alcool', '2.40', 0, '0.56', 5, 3, '', 'Sainte  olombre', '33cl', NULL, 'Brassée à ste colombe (35).', '', '2017-05-31', NULL, NULL, NULL, '0.00', 1),
(31, 'Bière Sainte colombe blonde 75cl', 'alcool', '4.20', 0, '1.32', 5, 3, '', '', '75CL', NULL, 'Brassée à ste colombe (35).', '', '2017-05-31', NULL, NULL, NULL, '0.00', 1),
(32, 'Bière Sainte colombe blanche 75cl', 'alcool', '4.20', 0, '1.32', 5, 2, '', '', '75cl', NULL, 'Brassée à ste colombe (35).', '', '2017-05-31', NULL, NULL, NULL, '0.00', 1),
(33, 'Bière Sainte colombe dorée', 'alcool', '2.40', 0, '0.56', 5, NULL, '', '', '', NULL, '', '', '2017-05-31', NULL, NULL, NULL, '0.00', 0),
(34, 'Bière Sainte colombe ambrée 75cl', 'alcool', '4.20', 0, '1.32', 5, 1, '', '', '75cl', NULL, 'Brassée à ste colombe (35).', '', '2017-05-31', NULL, NULL, NULL, '0.00', 1),
(35, 'Cognac ragnaud-Sabourin n°10', 'alcool', '47.00', 0, '1.25', 1, 10, '', '', '70cl', NULL, '', '', '2017-06-18', NULL, NULL, NULL, '0.00', 1),
(36, 'Cognac ragnaud-Sabourin n°20', 'alcool', '62.00', 0, '1.25', 1, 10, '', '', '70CL', NULL, '', '', '2017-06-18', NULL, NULL, NULL, '0.00', 1),
(37, 'Ter\'raz Rouge 2015', 'alcool', '4.95', 24, '1.25', 3, 43, '', '', '75CL', NULL, 'Accords:barbecue,charcuterie,apéritif.\r\n', '', '2017-06-18', NULL, NULL, NULL, '0.00', 1),
(38, 'Ter \'raz blanc', 'alcool', '4.95', 12, '1.25', 3, 45, '', '', '75CL', NULL, '', '', '2017-06-18', NULL, NULL, NULL, '0.00', 1),
(39, 'Tarani Rose  millésime 2015', 'alcool', '4.95', 12, '1.25', 3, 44, '', '', '75CL', NULL, 'Accord:apéritif.', '', '2017-06-18', NULL, NULL, NULL, '0.00', 1),
(40, 'Tarani Rouge millésime 2015', 'alcool', '4.95', 12, '1.25', 3, 44, '', '', '75CL', NULL, '', '', '2017-06-18', NULL, NULL, NULL, '0.00', 1),
(41, 'Domaine Martin faudot cépage chardonnay', 'alcool', '10.60', 22, '1.25', 3, 11, '', '', '75CL', NULL, 'Accord:poisson ,conté 24 mois', '', '2017-06-18', NULL, NULL, NULL, '0.00', 1),
(42, 'Domaine Martin faudot cépage trousseau 2012', 'alcool', '12.50', 20, '1.25', 3, 11, '', '', '75CL', NULL, 'Accord:petit gibiers,caille', '', '2017-06-18', NULL, NULL, NULL, '0.00', 1),
(43, 'Vin De paille  martin faudot en arbois', 'alcool', '32.00', 2, '1.25', 3, 11, '', '', '50CL', NULL, 'Accod:conté 24 mois ', '', '2017-06-18', NULL, NULL, NULL, '0.00', 1),
(44, 'Bière Philomenn blonde 33cl', 'alcool', '2.50', 8, '0.56', 5, 3, 'Treguier', '', '33cl', NULL, 'Brassée à tréguier (22).', '', '2017-06-18', NULL, NULL, NULL, '0.00', 1),
(45, 'Bière Philomenn triple 33cl', 'alcool', '2.50', 2, '0.56', 5, 1, '', '', '33cl', NULL, 'Brassée à tréguier (22).', '', '2017-06-18', NULL, NULL, NULL, '0.00', 1),
(46, 'Bière Philomenn blanche 33cl', 'alcool', '2.50', 0, '0.56', 5, 2, 'Acigne', 'Skumenn', '33cl', NULL, 'Brassée à tréguier (22).', '', '2017-06-18', NULL, NULL, NULL, '0.00', 1),
(47, 'Bière Philomenn blonde 75cl', 'alcool', '4.50', 6, '1.32', 5, 3, '', '', '75cl', NULL, 'Brassée à tréguier (22).', '', '2017-06-18', NULL, NULL, NULL, '0.00', 1),
(48, 'Bière Philomenn rousse 75cl', 'alcool', '4.50', 10, '1.32', 5, 12, '', '', '75cl', NULL, 'Brassée à tréguier (22).', '', '2017-06-18', NULL, NULL, NULL, '0.00', 1),
(49, 'Pack Bière philomenn ', 'alcool', '8.00', 0, '1.68', 5, NULL, '', '', '33cl', NULL, 'Pack de 3 bières philomenn avec une bière blonde, une bière brune et une bière triple', '', '2017-06-18', NULL, NULL, NULL, '0.00', 1),
(50, 'Duck Triple', 'alcool', '5.50', 0, '1.32', 5, 3, '', '', '75cl', NULL, '', '', '2017-06-18', NULL, NULL, NULL, '0.00', 1),
(51, 'Bière Duck blonde 75cl', 'alcool', '5.50', 0, '1.32', 5, 3, '', '', '75cl', NULL, '', '', '2017-06-18', NULL, NULL, NULL, '0.00', 1),
(52, 'Bière Duck blonde 33cl', 'alcool', '3.10', 0, '0.56', 5, 3, '', '', '33cl', NULL, '', '', '2017-06-18', NULL, NULL, NULL, '0.00', 1),
(53, 'Bière Duck bretagne  rousse75cl', 'alcool', '5.50', 0, '1.32', 5, 12, '', '', '75cl', NULL, '', '', '2017-06-18', NULL, NULL, NULL, '0.00', 1),
(54, 'Bière Duck bretagne rousse 33cl', 'alcool', '3.10', 0, '0.56', 5, 12, '', '', '33cl', NULL, '', '', '2017-06-18', NULL, NULL, NULL, '0.00', 1),
(55, 'Bière Trompe souris blonde 75cl', 'alcool', '5.50', 0, '1.32', 5, 3, '', '', '75cl', NULL, 'Brassée à la chapelle basse mer (44).', '', '2017-06-18', NULL, NULL, NULL, '0.00', 1),
(56, 'Bière Trompe souris blonde 33cl', 'alcool', '3.10', 0, '0.56', 5, 3, '', '', '33cl', NULL, 'Brassée à la chapelle basse mer (44).', '', '2017-06-18', NULL, NULL, NULL, '0.00', 1),
(57, 'Rhum Don papa philippines', 'alcool', '42.00', 4, '1.96', 1, 13, '', '', '70CL', NULL, 'Bouche :notes de vanille', '', '2017-06-18', NULL, NULL, NULL, '0.00', 1),
(58, 'Rhum Diplomatico vénezuela', 'alcool', '42.00', 4, '1.96', 1, 13, '', '', '70CL', NULL, 'Au départ moelleux ,voire sirupeux,il prend une incontestable vigueur aromatique en se développant en bouche.\r\nla palette aromatique, d\'une grande intensité, est particulièrement diversifiée fruits secs et compotés, caramel au beurre ,miel tout en étant très fondue et bien équilibrée.\r\n', '', '2017-06-18', NULL, NULL, NULL, '0.00', 1),
(59, 'Rhum Angostura 1919 tobago', 'alcool', '45.00', 3, '1.96', 1, 13, '', '', '70CL', NULL, 'Marqué par les notes de vanille,de caramel\r\nau beurre salé et de fruits tropicaux,c\'est\r\nun rhum très doux et presque moelleux.', '', '2017-06-18', NULL, NULL, NULL, '0.00', 1),
(60, 'Rhum Matusalem 15 ans cuba', 'alcool', '42.00', 3, '1.96', 1, 13, '', '', '70CL', NULL, 'La bouche onctueuse et suave est marquée\r\npar des notes étonnantes de caramel,vanille,oranges confites et feuille\r\nde cigare fraiches.\r\n', '', '2017-06-18', NULL, NULL, NULL, '0.00', 1),
(61, 'Rhum Botran 15 ans guatemala', 'alcool', '36.00', 3, '1.96', 1, 13, '', '', '70cl', NULL, 'Bouche: des notes de café,cacao', '', '2017-06-18', NULL, NULL, NULL, '0.00', 1),
(62, 'Rhum Agricole hse martinique', 'alcool', '51.00', 4, '1.96', 1, 13, 'Martinique', '', '70cl', NULL, 'Bouche:amande grillé.\r\npur jus de canne', '', '2017-06-18', NULL, NULL, NULL, '0.00', 1),
(63, 'Rhum Arrangé mangue letchis reunion', 'alcool', '30.00', 1, '1.96', 1, 13, '', 'Rhum Metiss', '70CL', NULL, '', '', '2017-06-18', NULL, NULL, NULL, '0.00', 1),
(64, 'Rhum Arrangé menthe citron vert', 'alcool', '28.50', 1, '1.96', 1, 13, '', 'Rhum Metiss', '70CL', NULL, '', '', '2017-06-18', NULL, NULL, NULL, '0.00', 1),
(66, 'Rhum Arrangé ananas victoria fruit de la passion', 'alcool', '28.50', 1, '1.96', 1, 13, '', 'Rhum Metiss', '70CL', NULL, '', '', '2017-06-18', NULL, NULL, NULL, '0.00', 1),
(67, 'Rhum Arrangé fruit de la passion reunion', 'alcool', '28.50', 2, '1.96', 1, 13, '', 'Rhum Metiss', '70CL', NULL, '', '', '2017-06-18', NULL, NULL, NULL, '0.00', 1),
(68, 'Rhum Arrangé mangue fruit de la passion reunion', 'alcool', '28.50', 3, '1.96', 1, 13, '', 'Rhum Metiss', '70CL', NULL, '', '', '2017-06-18', NULL, NULL, NULL, '0.00', 1),
(69, 'Rhum Arrangé ananas victoria mangue reunion', 'alcool', '28.50', 1, '1.96', 1, 13, '', 'Rhum Metiss', '70CL', NULL, '', '', '2017-06-18', NULL, NULL, NULL, '0.00', 1),
(70, 'Rhum Arrangé ananas victoria reunion', 'alcool', '28.50', 1, '1.96', 1, 13, '', 'Rhum Metiss', '70CL', NULL, '', '', '2017-06-18', NULL, NULL, NULL, '0.00', 1),
(71, 'Rhum Arrangé punch de noël', 'alcool', '28.50', 0, '1.96', 1, 13, '', 'Rhum Metiss', '70CL', NULL, '', '', '2017-06-18', NULL, NULL, NULL, '0.00', 1),
(72, 'Rhum Arrangé piment espelette reunion', 'alcool', '28.50', 2, '1.96', 1, 13, '', 'Rhum Metiss', '70CL', NULL, '', '', '2017-06-18', NULL, NULL, NULL, '0.00', 1),
(73, 'Rhum Arrangé vanille réunion', 'alcool', '28.50', 3, '1.96', 1, 13, '', 'Rhum Metiss', '70CL', NULL, '', '', '2017-06-18', NULL, NULL, NULL, '0.00', 1),
(74, 'Rhum Arrangé fraise framboise reunion', 'alcool', '28.50', 2, '1.96', 1, 13, '', 'Rhum Metiss', '70CL', NULL, '', '', '2017-06-18', NULL, NULL, NULL, '0.00', 1),
(75, 'Rhum Arrangé noix de coco reunion', 'alcool', '28.50', 2, '1.96', 1, 13, '', 'Rhum Metiss', '70CL', NULL, '', '', '2017-06-18', NULL, NULL, NULL, '0.00', 1),
(76, 'Rhum Arrangé orange café reunion', 'alcool', '28.50', 1, '1.96', 1, 13, '', 'Rhum Metiss', '70CL', NULL, '', '', '2017-06-18', NULL, NULL, NULL, '0.00', 1),
(77, 'Rhum Arrangé gingembre citron reunion', 'alcool', '28.50', 1, '1.96', 1, 13, '', 'Rhum Metiss', '70CL', NULL, '', '', '2017-06-18', NULL, NULL, NULL, '0.00', 1),
(78, 'Rhum Arrangé vanille café bourbon pointu bio', 'alcool', '28.50', 3, '1.96', 1, 13, '', '', '70CL', NULL, 'Rhum arrangé réunion', '', '2017-06-18', NULL, NULL, NULL, '0.00', 1),
(79, 'Whisky The irishman irlandais', 'alcool', '38.00', 1, '1.96', 1, 18, '', '', '70CL', NULL, 'Bouche: note fruité.', '', '2017-06-18', NULL, NULL, NULL, '0.00', 1),
(80, 'Whisky Black bottle ecossais', 'alcool', '31.00', 3, '1.44', 1, 18, '', '', '70CL', NULL, 'Bouche:moelleuse et fruitée avec des saveurs subtilement équilibrées de fumée\r\nsuivies de bois tendre et de miel de bruyère.', '', '2017-06-18', NULL, NULL, NULL, '0.00', 1),
(81, 'Whisky Tokinoka japonais', 'alcool', '31.00', 6, '1.44', 1, 18, '', '', '50CL', NULL, 'Bouche:note miel de bruyère', '', '2017-06-18', NULL, NULL, NULL, '0.00', 1),
(82, 'Whisky Deanston ecossais', 'alcool', '40.00', 0, '1.44', 1, 18, '', '', '70CL', NULL, 'Bouche:fruits cuits,épicé', '', '2017-06-18', NULL, NULL, NULL, '0.00', 1),
(83, 'Whisky The six isles écossais', 'alcool', '45.00', 2, '1.44', 1, 18, '', '', '70CL', NULL, 'Assemblage de 6 whiskys.légèrement tourbée.', '', '2017-06-18', NULL, NULL, NULL, '0.00', 1),
(84, 'Whisky Mac na mara écossais', 'alcool', '25.00', 4, '1.44', 1, 18, '', '', '70CL', NULL, 'Bouche :note de caramel', '', '2017-06-18', NULL, NULL, NULL, '0.00', 1),
(85, 'Whisky Glengoyne 12 ans écossais', 'alcool', '59.00', 6, '1.44', 1, 18, '', '', '70CL', NULL, 'Bouche:pomme verte,caramel', '', '2017-06-18', NULL, NULL, NULL, '0.00', 1),
(86, 'Whisky Tobermory 10 ans écossais', 'alcool', '54.00', 2, '1.44', 1, 18, '', '', '70CL', NULL, 'Bouche:fruitées,des notes de poire,pomme,\r\npointes épicées et des notes mentholées.', '', '2017-06-18', NULL, NULL, NULL, '0.00', 1),
(87, 'Whisky Bunnahabhain 12 ans écossais', 'alcool', '58.00', 3, '1.44', 1, 18, '', '', '70CL', NULL, 'Bunnahabhain franchit le pas de la non filtration à froid et de fort degré d\'alcool .', '', '2017-06-18', NULL, NULL, NULL, '0.00', 1),
(88, 'Whisky Port charlotte', 'alcool', '55.00', 0, '1.44', 1, 18, '', '', '70CL', NULL, '', '', '2017-06-18', NULL, NULL, NULL, '0.00', 0),
(89, 'Whisky  boubon woodford reserve americain', 'alcool', '52.00', 4, '1.44', 1, 18, '', '', '70CL', NULL, 'C\'est un festival de saveurs:fruits noirs,caramel,chocolat', '', '2017-06-18', NULL, NULL, NULL, '0.00', 1),
(90, 'Whisky Ledaig 18 ans ecossais', 'alcool', '148.00', 0, '1.96', 1, 18, '', '', '70CL', NULL, 'Bouche:aromes fruités et boisés avec des notes de fumée de poivre noir,et de piment de cayenne', '', '2017-06-18', NULL, NULL, NULL, '0.00', 1),
(92, 'Domaine Brazilier vin mousseux brut', 'alcool', '7.10', 10, '1.50', 2, 19, '', '', '75CL', NULL, '', '', '2017-06-18', NULL, NULL, NULL, '0.00', 0),
(93, 'Domaine Brazilier vin mousseux rosé', 'alcool', '7.10', 20, '1.50', 2, 19, '', '', '75CL', NULL, '', '', '2017-06-18', NULL, NULL, NULL, '0.00', 0),
(101, ' Haut médoc château lalande 2014', 'alcool', '12.50', 18, '1.25', 3, 20, '', '', '75cl', NULL, '', '', '2017-06-18', NULL, NULL, NULL, '0.00', 1),
(102, 'Domaine Les barthes 2015', 'alcool', '7.00', 0, '1.25', 3, NULL, '', '', '75CL', NULL, 'Cepage mabec\r\naccord:charcuterie ,barbecue', '', '2017-06-18', NULL, NULL, NULL, '0.00', 1),
(103, ' Merlot louis eschenauer 2015', 'alcool', '7.60', 0, '1.25', 3, 21, '', '', '75cl', NULL, 'Louis eschenauer: un savoir faire fort depuis 1821.\r\nle merlot est rond puissant des tanins souples.\r\naccords: volailles et charcuteries.', '', '2017-06-18', NULL, NULL, NULL, '0.00', 1),
(104, ' Gewurztraminer dopff & irion les sorcières', 'alcool', '18.80', 6, '1.25', 3, 22, '', '', '75cl', NULL, 'Peut se déguster à l\'apéritif. \r\nbeaux accords avec le foie gras et le munster.', '', '2017-06-18', NULL, NULL, NULL, '0.00', 1),
(105, 'Gewurztramier Dopff irion', 'alcool', '13.90', 4, '1.25', 3, 22, '', '', '75CL', NULL, 'Accords: munster,apéritif,foie gras.', '', '2017-06-18', NULL, NULL, NULL, '0.00', 1),
(106, 'Pinot Gris dopff irion', 'alcool', '13.80', 6, '1.25', 3, 22, '', '', '75CL', NULL, 'Accord:apéritif,foie gras', '', '2017-06-18', NULL, NULL, NULL, '0.00', 1),
(107, 'Riesling Dopff irion', 'alcool', '11.50', 6, '1.25', 3, 22, '', '', '75CL', NULL, 'Accord :fruits de mer', '', '2017-06-18', NULL, NULL, NULL, '0.00', 1),
(108, ' Crémant d\'alscace dopff & irion blanc de blancs brut', 'alcool', '11.60', 6, '1.25', 2, 19, '', '', '75cl', NULL, '', '', '2017-06-18', NULL, NULL, NULL, '0.00', 1),
(110, 'Champagne Jean despret ', 'alcool', '19.90', 6, '1.50', 2, 23, '', '', '75cl', NULL, '', '', '2017-06-18', NULL, NULL, NULL, '0.00', 1),
(111, 'Champagne larnaudie-Hirault 1er cru', 'alcool', '22.50', 4, '1.50', 2, 23, '', '', '75cl', NULL, '', '', '2017-06-18', NULL, NULL, NULL, '0.00', 1),
(112, 'Champagne larnaudie-Hirault rosé guide hachette 2018', 'alcool', '25.00', 3, '1.50', 2, 23, '', '', '75cl', NULL, 'Joli succès pour le champagne larnaudie\r\nrosé premier cru:1 étoile dans le guide hachette des vins 2018,et une médaille d\'or décernée par elle a table.', '', '2017-06-18', NULL, NULL, NULL, '0.00', 1),
(113, 'Champagne Mailly grand cru 37.5 cl', 'alcool', '16.20', 24, '1.50', 2, 23, '', '', '37,5cl', NULL, '', '', '2017-06-18', NULL, NULL, NULL, '0.00', 1),
(114, 'Champagne Mailly grand cru', 'alcool', '29.90', 0, '1.50', 2, 23, '', '', '75cl', NULL, '', '', '2017-06-18', NULL, NULL, NULL, '0.00', 1),
(115, 'Champagne Mailly magnum', 'alcool', '61.80', 3, '3.20', 2, 23, '', '', '150cl', NULL, '', '', '2017-06-19', NULL, NULL, NULL, '0.00', 1),
(116, 'Champagne Ar lenoble dozage zéro', 'alcool', '29.50', 6, '1.50', 2, 23, '', '', '75cl', NULL, '', '', '2017-06-19', NULL, NULL, NULL, '0.00', 1),
(117, 'Champagne Ar lenoble intense', 'alcool', '28.50', 3, '1.50', 2, 23, '', '', '75cl', NULL, '', '', '2017-06-19', NULL, NULL, NULL, '0.00', 1),
(118, 'Champagne Ar lenoble grand cru blanc de blancs', 'alcool', '33.50', 4, '1.50', 2, 23, '', '', '75cl', NULL, '', '', '2017-06-19', NULL, NULL, NULL, '0.00', 1),
(119, 'Champagne Lenoble les aventures', 'alcool', '80.00', 2, '1.50', 2, 23, '', '', '75cl', NULL, '', '', '2017-06-19', NULL, NULL, NULL, '0.00', 1),
(120, 'Champagne Lenoble rosé', 'alcool', '42.00', 6, '1.50', 2, 23, '', '', '75cl', NULL, '', '', '2017-06-19', NULL, NULL, NULL, '0.00', 1),
(121, 'Champagne Paul bara millésime 2010', 'alcool', '35.00', 6, '1.50', 2, 23, '', '', '75cl', NULL, '', '', '2017-06-19', NULL, NULL, NULL, '0.00', 1),
(122, 'Crémant De bourgogne bailly lapierre', 'alcool', '9.90', 36, '1.50', 2, 19, '', '', '75CL', NULL, '', '', '2017-06-19', NULL, NULL, NULL, '0.00', 1),
(123, 'Crémant D\'alscace dopff & irion', 'alcool', '10.90', 1, '1.50', 2, 19, '', '', '75CL', NULL, '', '', '2017-06-19', NULL, NULL, NULL, '0.00', 0),
(124, 'Champagne Château de passavent', 'alcool', '14.70', 0, '1.50', 2, 23, '', '', '', NULL, '', '', '2017-06-19', NULL, NULL, NULL, '0.00', 0),
(125, 'Saumur Brut domaine des sanzay', 'alcool', '9.70', 3, '1.50', 2, 19, '', '', '75CL', NULL, '', '', '2017-06-19', NULL, NULL, NULL, '0.00', 1),
(126, 'Saumur Roze domaine des sanzay', 'alcool', '10.60', 3, '1.50', 2, 19, '', '', '75CL', NULL, '', '', '2017-06-19', NULL, NULL, NULL, '0.00', 1),
(127, ' Prosecco, issu de la culture biologique', 'alcool', '11.50', 10, '1.50', 2, 19, '', '', '75cl', NULL, 'Effervescent italien.\r\nissu de la culture biologigue', '', '2017-06-19', NULL, NULL, NULL, '0.00', 1),
(128, 'Champagne Ruinart brut', 'alcool', '44.00', 3, '1.50', 2, 23, '', '', '75cl', NULL, '', '', '2017-06-19', NULL, NULL, NULL, '0.00', 1),
(129, 'Champagne Ruinart blanc de blanc', 'alcool', '63.00', 2, '1.50', 2, 23, '', '', '75cl', NULL, '', '', '2017-06-19', NULL, NULL, NULL, '0.00', 1),
(131, 'Nuits-Saint-georges les brûlées 2013', 'alcool', '32.70', 12, '1.25', 3, 24, '', '', '75CL', NULL, 'Accord: gigot agneau', '', '2017-06-19', NULL, NULL, NULL, '0.00', 1),
(132, 'Chablis Cuvée émeraude', 'alcool', '16.90', 1, '1.25', 3, 24, '', '', '75cl', NULL, 'Accords: poissons, crustacés.', '', '2017-06-19', NULL, NULL, NULL, '0.00', 1),
(133, 'Chablis Premier cru', 'alcool', '20.00', 6, '1.25', 3, 24, '', '', '75cl', NULL, 'Accords: poissons en sauce ', '', '2017-06-19', NULL, NULL, NULL, '0.00', 1),
(134, 'Saint-Véran', 'alcool', '13.00', 3, '1.25', 3, NULL, '', '', '75CL', NULL, 'Accords:poisson grillé,apéritif ,viande blanche', '', '2017-06-19', NULL, NULL, NULL, '0.00', 1),
(135, 'Pouilly-Fuissé la collonge', 'alcool', '17.00', 12, '1.25', 3, 24, '', '', '75CL', NULL, 'Accords: st jacques ,langoustines,poisson en sauce', '', '2017-06-19', NULL, NULL, NULL, '0.00', 1),
(136, 'Côte De nuits villages 2014', 'alcool', '23.60', 6, '1.25', 3, 24, '', '', '75CL', NULL, 'Issu de la culture biologique\r\naccords :carré de veau , gigot d\'agneau.', '', '2017-06-19', NULL, NULL, NULL, '0.00', 1),
(137, 'Marsanay Rouge ', 'alcool', '26.50', 6, '1.25', 3, 24, '', '', '75CL', NULL, 'Issu de la culture biologique', '', '2017-06-19', NULL, NULL, NULL, '0.00', 1),
(138, 'Gevrey-Chambertin 2014', 'alcool', '36.40', 4, '1.25', 3, 24, '', '', '75CL', NULL, 'Issu de la culture biologique\r\naccords:viande rouge ,agneau ,gigot rotie', '', '2017-06-19', NULL, NULL, NULL, '0.00', 1),
(139, 'Marsanay Blanc 2015', 'alcool', '23.40', 2, '1.25', 3, 24, '', '', '75CL', NULL, 'Issu de la culture biologique\r\naccords: blanquette de veau,poisson,', '', '2017-06-19', NULL, NULL, NULL, '0.00', 1),
(140, 'Nero D\'avola 2013', 'alcool', '8.60', 1, '1.25', 3, 25, '', '', '75CL', NULL, 'Vin italien\r\naccord pizza', '', '2017-06-19', NULL, NULL, NULL, '0.00', 1),
(141, 'Barbera D\'asti 2012', 'alcool', '13.30', 8, '1.25', 3, 25, '', '', '75cl', NULL, 'Vin italien.\r\naccords:plat en sauce.', '', '2017-06-19', NULL, NULL, NULL, '0.00', 1),
(142, 'Opal Ridge 2013', 'alcool', '9.80', 3, '1.25', 3, 25, '', '', '75CL', NULL, 'Vin australien\r\naccord :plat en sauce', '', '2017-06-19', NULL, NULL, NULL, '0.00', 1),
(143, 'Terra Afrique du sud 2012', 'alcool', '9.80', 0, '1.25', 3, 25, '', '', '75CL', NULL, 'Accord:agneau', '', '2017-06-19', NULL, NULL, NULL, '0.00', 1),
(144, 'Tamari Malbec', 'alcool', '9.50', 6, '1.25', 3, 25, '', '', '75CL', NULL, 'Vin argentin cepage malbec\r\naccord :viande rouge', '', '2017-06-19', NULL, NULL, NULL, '0.00', 1),
(145, ' Rioja coto vintage 2014', 'alcool', '11.80', 6, '1.25', 3, 25, '', '', '75cl', NULL, '', '', '2017-06-19', NULL, NULL, NULL, '0.00', 1),
(146, 'Footprint Chardonnay', 'alcool', '9.90', 1, '1.25', 3, 25, '', '', '0.75CL', NULL, '', '', '2017-06-19', NULL, NULL, NULL, '0.00', 1),
(148, 'Château Des matards rouge 2014', 'alcool', '8.60', 12, '1.25', 3, 20, '', '', '75cl', NULL, '', '', '2017-06-19', NULL, NULL, NULL, '0.00', 1),
(149, ' Côtes de bourg château maçay 2015', 'alcool', '9.90', 12, '1.25', 3, 20, '', '', '75CL', NULL, 'Merlot 65% cabernet sauvignon 15%\r\ncabernet franc 10% malbec10%', '', '2017-06-19', NULL, NULL, NULL, '0.00', 1),
(150, ' fronsac château mayne-Vieil', 'alcool', '13.50', 4, '1.25', 3, 20, '', '', '75cl', NULL, '', '', '2017-06-19', NULL, NULL, NULL, '0.00', 1),
(151, ' Graves château haut selve 2014', 'alcool', '14.00', 35, '1.25', 3, 20, '', '', '75cl', NULL, 'Cépages:55% merlot, 45% cabernet sauvignon. \r\n12 ans de garde', '', '2017-06-19', NULL, NULL, NULL, '0.00', 1),
(152, 'Lalande De pomerol', 'alcool', '17.50', 0, '1.25', 3, 20, '', '', '0.75CL', NULL, '', '', '2017-06-19', NULL, NULL, NULL, '0.00', 0),
(153, 'St Emilion grand cru 2012', 'alcool', '18.00', 6, '1.25', 3, 20, '', '', '75CL', NULL, '', '', '2017-06-19', NULL, NULL, NULL, '0.00', 0),
(154, ' Medoc château fourcas hosten 2011', 'alcool', '21.00', 7, '1.25', 3, 20, '', '', '75CL', NULL, 'Médoc cru bourgeois.\r\noffre une parfaite symphonie de saveurs\r\ngrâce à ses vieilles vignes de merlot et de \r\ncabernet sauvignon', '', '2017-06-19', NULL, NULL, NULL, '0.00', 1),
(155, 'Medoc Les c \'edres d\'hosten 2011', 'alcool', '18.00', 1, '1.25', 3, 20, '', '', '75CL', NULL, 'Accord:viande en sauce', '', '2017-06-19', NULL, NULL, NULL, '0.00', 1),
(156, 'Medoc Chapelle de potensac 2014', 'alcool', '19.50', 3, '1.25', 3, 20, '', '', '75CL', NULL, 'Second vin de potensac\r\naccord viande rouge', '', '2017-06-19', NULL, NULL, NULL, '0.00', 1),
(157, ' Pomerol château la fleur des rouzes 2012', 'alcool', '25.50', 2, '1.25', 3, 20, '', '', '75cl', NULL, 'Cépages :cabernet franc et merlot.\r\nvin à la fois rond et charmeur.\r\naccompagnera à merveille les plats de viande .', '', '2017-06-19', NULL, NULL, NULL, '0.00', 1),
(158, ' st julien château lalande-Borie 2011', 'alcool', '27.50', 8, '1.25', 3, 20, '', '', '75cl', NULL, 'Cépages :cabernet franc ,cabernet sauvignon, colombaud,merlot.\r\nun vin dense .', '', '2017-06-19', NULL, NULL, NULL, '0.00', 1),
(159, ' St estephe château ségur de cabanac 2008', 'alcool', '28.50', 3, '1.25', 3, 20, '', '', '75cl', NULL, 'Cépages: 40% merlot et 60% cabernet sauvignon.\r\n', '', '2017-06-19', NULL, NULL, NULL, '0.00', 1),
(160, ' St estephe château clauzet 2010', 'alcool', '28.50', 24, '1.25', 3, 20, '', '', '75cl', NULL, 'Cépages:55% cabernet sauvignon,\r\n40% merlot, 5% cabernet franc et petit verdot', '', '2017-06-19', NULL, NULL, NULL, '0.00', 1),
(161, ' Pauillac château tour pibran 2010', 'alcool', '28.50', 10, '1.25', 3, 20, '', '', '75cl', NULL, 'Mis en bouteille à la propriété château pichon longueville.\r\nsecond vin château pibran\r\ncépages: 50% merlot et 50% cabernet sauvignon.\r\nstyle caractéristique des grands pauillac.', '', '2017-06-19', NULL, NULL, NULL, '0.00', 1),
(162, ' Margaux vivens 2009', 'alcool', '33.20', 0, '1.25', 3, 20, '', '', '75cl', NULL, '', '', '2017-06-19', NULL, NULL, NULL, '0.00', 1),
(163, ' Margaux les hauts du tertre 2012', 'alcool', '32.50', 4, '1.25', 3, 20, '', '', '75cl', NULL, 'Second vin du grand cru classé chateau\r\ndu tertre\r\ncépages:cbernet sauvignon,merlot,cabernet franc,petit verdot', '', '2017-06-19', NULL, NULL, NULL, '0.00', 1),
(164, 'Château Bouscaut pessac léognan 2011', 'alcool', '39.90', 6, '1.25', 3, 20, '', '', '75cl', NULL, 'Grand cru classé de graves.', '', '2017-06-19', NULL, NULL, NULL, '0.00', 1),
(165, 'Château Des matards blanc', 'alcool', '8.60', 6, '1.25', 3, 20, '', '', '75CL', NULL, 'Blaye blanc\r\naccords:crustacés,fruits de mer et apéritif.', '', '2017-06-19', NULL, NULL, NULL, '0.00', 1),
(166, 'Sauternes Castelnau', 'alcool', '24.50', 0, '1.25', 3, 20, '', '', '75CL', NULL, 'Accords:salade de fruits,foie gras.', '', '2017-06-19', NULL, NULL, NULL, '0.00', 1),
(167, ' st estephe château clauzet - magnum', 'alcool', '41.00', 0, '2.50', 3, 20, '', '', '150cl', NULL, '55% cabernet sauvignon, 40% merlot,\r\n5% cabernet franc et petit verdot.', '', '2017-06-19', NULL, NULL, NULL, '0.00', 1),
(168, ' Graves château haut selve', 'alcool', '33.00', 0, '2.50', 3, 20, '', '', '1.5', NULL, '', '', '2017-06-19', NULL, NULL, NULL, '0.00', 0),
(169, ' castillon château saint-Genès 2015', 'alcool', '9.90', 0, '1.25', 3, 20, '', '', '75cl', NULL, 'Servir à 16 degrés .\r\naccords:apéritif,charcuterie.', '', '2017-06-19', NULL, NULL, NULL, '0.00', 1),
(170, 'St Emilion château franc cantenac 2014', 'alcool', '17.70', 18, '1.25', 3, 20, '', '', '75CL', NULL, 'Accord:viande en sauce.', '', '2017-06-19', NULL, NULL, NULL, '0.00', 0),
(171, ' Fitou l\'impusilf', 'alcool', '8.40', 0, '1.25', 3, 26, '', '', '75cl', NULL, 'Cépages syrah carignan grenache, à\r\ncarafer 1 à 2 heures avant consommation\r\naccords gibier,chocolat noir,cassoulets', '', '2017-06-19', NULL, NULL, NULL, '0.00', 1),
(172, ' Fitou partage 2014', 'alcool', '10.50', 4, '1.25', 3, 26, '', '', '75cl', NULL, 'Cépages:syrah, carignan, grenache noir.\r\ns\"accorde parfaitement avec le:gibier, le cassoulet et le chocolat noir.', '', '2017-06-19', NULL, NULL, NULL, '0.00', 1),
(173, ' Côteaux du languedoc la tour penedesses 2013', 'alcool', '8.90', 6, '1.25', 3, 26, '', '', '75CL', NULL, 'Issu de la culture biologique', '', '2017-06-19', NULL, NULL, NULL, '0.00', 1),
(174, 'Domaine La tour penedesses faugères 2014', 'alcool', '10.90', 8, '1.25', 3, 26, '', '', '75cl.', NULL, 'Issu de la culture biologique\r\nrécolte manuelle', '', '2017-06-19', NULL, NULL, NULL, '0.00', 1),
(175, 'Chateau Haut gléon corbières 2012', 'alcool', '14.00', 10, '1.25', 3, 26, '', '', '75CL', NULL, 'Cépages :grenache 60%, syrah 25% , carignan 15%.\r\naccords: pot au feu, gibiers.', '', '2017-06-19', NULL, NULL, NULL, '0.00', 1),
(176, 'Corbieres Haut gleon', 'alcool', '9.50', 0, '1.25', 3, 26, '', '', '0.75CL', NULL, '', '', '2017-06-19', NULL, NULL, NULL, '0.00', 0),
(177, 'Domaine Des maels minervois', 'alcool', '8.50', 6, '1.25', 3, 26, '', '', '0.75CL', NULL, 'Issu de la culture biologique', '', '2017-06-19', NULL, NULL, NULL, '0.00', 0),
(178, 'St Chinian tradition rouge 2014 ', 'alcool', '7.10', 2, '1.25', 3, 26, '', '', '75CL', NULL, '', '', '2017-06-19', NULL, NULL, NULL, '0.00', 1),
(179, 'St Chinian armandelis 2013', 'alcool', '11.00', 3, '1.25', 3, 26, '', '', '75cl', NULL, 'Accod : viande rouge', '', '2017-06-19', NULL, NULL, NULL, '0.00', 1),
(180, 'St Chinian tradition blanc  domaine la croix sainte eulalie', 'alcool', '6.50', 6, '1.25', 3, 26, '', '', '75CL', NULL, 'Accords:poisson ,aperitif', '', '2017-06-19', NULL, NULL, NULL, '0.00', 1),
(181, 'Domaine la croix sainte eulalie saint-Chinian rose', 'alcool', '7.10', 6, '1.25', 3, 26, '', '', '0.75CL', NULL, 'Accord :charcuterie,apéritif,barbecue,salade', '', '2017-06-19', NULL, NULL, NULL, '0.00', 1),
(182, 'Languedoc Reserve chateau d\'assas 2011', 'alcool', '9.30', 3, '1.25', 3, 26, '', '', '75CL', NULL, 'Accord :viande rouge ,gibiers', '', '2017-06-19', NULL, NULL, NULL, '0.00', 1),
(183, 'Chardonnay Rouquet\'s', 'alcool', '4.30', 1, '1.25', 3, 26, '', '', '75CL', NULL, '', '', '2017-06-19', NULL, NULL, NULL, '0.00', 1),
(184, 'Viognier Rouquet\'s', 'alcool', '4.30', 0, '1.25', 3, 26, '', '', '0.75CL', NULL, '', '', '2017-06-19', NULL, NULL, NULL, '0.00', 1),
(185, 'Mas Belles eaux blanc', 'alcool', '9.90', 0, '1.25', 3, 26, '', '', '75CL', NULL, 'Accord :poisson ', '', '2017-06-19', NULL, NULL, NULL, '0.00', 1),
(186, 'Rosé Château belles eaux', 'alcool', '9.20', 0, '1.25', 3, 26, '', '', '75cl', NULL, 'Accords :tapas, plats épicés.', '', '2017-06-19', NULL, NULL, NULL, '0.00', 1),
(187, 'Chinon Couly dutheil  2013', 'alcool', '9.70', 2, '1.25', 3, 27, '', '', '75cl', NULL, 'Accords: barbecue ,volailles.', '', '2017-06-19', NULL, NULL, NULL, '0.00', 1),
(188, 'Reuilly Rose', 'alcool', '9.10', 0, '1.25', 3, 27, '', '', '75CL', NULL, '', '', '2017-06-19', NULL, NULL, NULL, '0.00', 1),
(189, 'Quincy Tradition', 'alcool', '8.90', 6, '1.25', 3, 27, '', '', '75CL', NULL, 'Accords:viande blanche ,poisson,apéritif', '', '2017-06-19', NULL, NULL, NULL, '0.00', 1),
(190, 'Domaines Des forges sauvignon', 'alcool', '4.95', 4, '1.25', 3, 27, '', '', '75CL', NULL, '', '', '2017-06-19', NULL, NULL, NULL, '0.00', 1),
(191, 'Domaines Des forges chardonnay', 'alcool', '4.95', 12, '1.25', 3, 27, '', '', '75CL', NULL, '', '', '2017-06-19', NULL, NULL, NULL, '0.00', 1),
(192, ' Anjou blanc domaines des forges l\'audace', 'alcool', '7.95', 6, '1.25', 3, 27, '', 'Loire', '75cl', NULL, 'Vin blanc sec 100% chenin,\r\nà carafer 2 h avant consommation', '', '2017-06-19', NULL, NULL, NULL, '0.00', 1),
(193, ' Savennieres le moulin du gué du domaine des forges', 'alcool', '11.60', 6, '1.25', 3, 27, '', '', '75cl', NULL, '100% chenin.\r\nvendanges manuelles.\r\na carafer et servir à 10-12 degrés.\r\nmerveilleux compagnon des poissons en sauce.', '', '2017-06-19', NULL, NULL, NULL, '0.00', 1),
(194, 'Anjou 3c du domaines des forges 2015', 'alcool', '9.90', 3, '1.25', 3, 27, '', '', '75cl', NULL, 'Cépages: 60% cabernet sauvignon, 40% cabernet franc.\r\nvendanges manuelles\r\nnotes épicées.', '', '2017-06-19', NULL, NULL, NULL, '0.00', 1),
(195, 'Rosé Délice d\'été  cabernet d\'anjou', 'alcool', '6.70', 0, '1.25', 3, 27, '', '', '75CL', NULL, '', '', '2017-06-19', NULL, NULL, NULL, '0.00', 1),
(196, 'Saumur Champigny domaine des sanzay ', 'alcool', '8.50', 6, '1.25', 3, 27, '', '', '0.75CL', NULL, 'Domaine de sansay', '', '2017-06-19', NULL, NULL, NULL, '0.00', 0),
(197, 'Côteaux Du layon passavant bio', 'alcool', '14.50', 18, '1.25', 3, 27, '', '', '75CL', NULL, 'Issu de la culture biologique\r\ncépage chenin\r\naccords:apéritif, foie gras, fromages bleus.', '', '2017-06-19', NULL, NULL, NULL, '0.00', 1),
(198, 'Saumur Champigny domaine des sanzay', 'alcool', '8.50', 2, '1.25', 3, 27, '', '', '0.75CL', NULL, '', '', '2017-06-19', NULL, NULL, NULL, '0.00', 1),
(199, ' Côtes du rhône réserve grand veneur 2016', 'alcool', '8.80', 18, '1.25', 3, 28, '', '', '75cl', NULL, 'Une véritable expression du terroir d\'origine', '', '2017-06-19', NULL, NULL, NULL, '0.00', 1),
(200, 'Côtes Du rhône champauvins 2015', 'alcool', '12.00', 18, '1.25', 3, 28, '', '', '75CL', NULL, 'Issu de la culture biologique\r\nbien que classée côtes du rhône, cette cuvée est souvent comparée aux grands vins de la région.\r\n', '', '2017-06-19', NULL, NULL, NULL, '0.00', 1),
(201, 'Lirac Roquedon 2013', 'alcool', '12.00', 6, '1.25', 3, 28, '', '', '0.75CL', NULL, '', '', '2017-06-19', NULL, NULL, NULL, '0.00', 1),
(202, 'Vacqueyras Grande garrigue 2015', 'alcool', '15.20', 18, '1.25', 3, 28, '', '', '75CL', NULL, 'Accord: viande rouge,gibiers', '', '2017-06-19', NULL, NULL, NULL, '0.00', 1),
(203, 'Terrasses De montmirail gigondas', 'alcool', '18.80', 12, '1.25', 3, 28, '', '', '0.75CL ', NULL, '', '', '2017-06-19', NULL, NULL, NULL, '0.00', 1),
(204, 'Domaine Grand veneur blanc de viognier', 'alcool', '13.30', 6, '1.25', 3, 28, '', '', '75CL', NULL, 'Issu de la culture biologique\r\naccord:poisson en sauce,apéritif', '', '2017-06-19', NULL, NULL, NULL, '0.00', 1),
(205, 'Rosé Cotes du rhône ', 'alcool', '8.80', 2, '1.25', 3, 28, '', '', '75CL', NULL, 'Issu de la culture biologique', '', '2017-06-19', NULL, NULL, NULL, '0.00', 0),
(206, 'Le Crétacé tavel', 'alcool', '12.00', 6, '1.25', 3, 28, '', '', '75CL', NULL, 'Accords:tajine agneau,coscous,', '', '2017-06-19', NULL, NULL, NULL, '0.00', 1),
(207, 'Chateuneuf Du pape mont redon 2009', 'alcool', '33.00', 12, '1.25', 3, 28, '', '', '75cl', NULL, 'Accords :viandes rouges, cassoulets.', '', '2017-06-19', NULL, NULL, NULL, '0.00', 1),
(208, 'Cotes Du rhone mont redon ', 'alcool', '10.40', 0, '1.25', 3, 28, '', '', '75CL', NULL, '', '', '2017-06-19', NULL, NULL, NULL, '0.00', 1),
(209, ' Chateauneuf du pape 2012', 'alcool', '25.00', 5, '1.25', 3, 28, '', '', '75cl', NULL, 'Domaine mathieu 2012\r\nrobe rubis , notes de fruits noirs et d\'épices,\r\nouvrir 2 à 3 heures avant consommation, \r\nservir à 18 degrés', '', '2017-06-19', NULL, NULL, NULL, '0.00', 1),
(210, 'Crozes-Hermitage ', 'alcool', '20.00', 0, '1.25', 3, 28, '', '', '75CL', NULL, '', '', '2017-06-19', NULL, NULL, NULL, '0.00', 1),
(211, 'Mini Madeleine citron', 'epiceriefine', '4.95', 0, '0.26', 7, 30, '', 'Les Éélices de marie', NULL, '250g', '', '', '2017-06-20', NULL, NULL, NULL, '0.00', 1),
(212, 'Cookie', 'epiceriefine', '4.95', 0, '0.22', 7, 30, '', 'Les Délices de marie', NULL, '220g', '', '', '2017-06-20', NULL, NULL, NULL, '0.00', 1),
(213, 'Meringues', 'epiceriefine', '2.95', 0, '106.00', 7, 30, '', 'Les Délices de marie', NULL, '100g', '', '', '2017-06-20', NULL, NULL, NULL, '0.00', 1),
(214, 'Croquants Pommes caramel amandes', 'epiceriefine', '4.95', 0, '0.11', 7, 30, '', '', NULL, '', '', '', '2017-06-20', NULL, NULL, NULL, '0.00', 1),
(215, 'Croquants Pépites de chocolat et écorces d\'orange', 'epiceriefine', '3.95', 0, '0.12', 7, 30, '', '', NULL, '', '', '', '2017-06-20', NULL, NULL, NULL, '0.00', 1),
(216, 'Les Croquants caramel', 'epiceriefine', '3.95', 0, '0.12', 7, 30, '', '', NULL, '', '', '', '2017-06-20', NULL, NULL, NULL, '0.00', 1),
(217, 'Le Craquant au caramel salé', 'epiceriefine', '3.95', 0, '0.12', 7, 30, '', '', NULL, '', '', '', '2017-06-20', NULL, NULL, NULL, '0.00', 1),
(218, 'Noisettes Aux trois chocolats', 'epiceriefine', '12.00', 0, '0.22', 7, 29, '', '', NULL, '200g', '', '', '2017-06-20', NULL, NULL, NULL, '0.00', 1),
(219, 'Noisettes Aux trois chocolats', 'epiceriefine', '5.50', 0, '0.90', 7, 29, '', '', NULL, '', '', '', '2017-06-20', NULL, NULL, NULL, '0.00', 1),
(220, 'Carrés Chocolat noir', 'epiceriefine', '5.20', 0, '0.13', 7, 29, '', '', NULL, '125g', '', '', '2017-06-20', NULL, NULL, NULL, '0.00', 1),
(221, 'Tablette Chocolat lait', 'epiceriefine', '4.80', 0, '0.90', 7, 29, '', '', NULL, '', '', '', '2017-06-20', NULL, NULL, NULL, '0.00', 1),
(222, 'Maxi Tablette', 'epiceriefine', '12.50', 0, '0.63', 7, 29, '', '', NULL, '500g', '', '', '2017-06-20', NULL, NULL, NULL, '0.00', 1),
(223, 'Chocolat Au lait', 'epiceriefine', '6.70', 0, '0.29', 7, 29, '', 'Ladure', NULL, '105g', '', '', '2017-06-20', NULL, NULL, NULL, '0.00', 1),
(224, 'Chocolat Noir', 'epiceriefine', '6.70', 0, '0.28', 7, 29, '', '', NULL, '105g', '', '', '2017-06-20', NULL, NULL, NULL, '0.00', 1),
(225, 'Palets Chocolat noir piment d\'espelette', 'epiceriefine', '5.70', 0, '0.26', 7, 29, '', '', NULL, '85g', '', '', '2017-06-20', NULL, NULL, NULL, '0.00', 1),
(226, 'Palets Chocolat au lait piment d\'espelette', 'epiceriefine', '5.70', 0, '0.26', 7, 29, '', '', NULL, '85g', '', '', '2017-06-20', NULL, NULL, NULL, '0.00', 1),
(227, 'Palets Chocolat lait', 'epiceriefine', '5.50', 0, '0.26', 7, 29, '', '', NULL, '85g', '', '', '2017-06-20', NULL, NULL, NULL, '0.00', 1),
(228, 'Palets Chocolat noir ', 'epiceriefine', '5.50', 0, '0.26', 7, 29, '', '', NULL, '', '', '', '2017-06-20', NULL, NULL, NULL, '0.00', 1),
(229, 'Tablette Chocolat noir 70%', 'epiceriefine', '4.30', 0, '0.96', 7, 29, '', '', NULL, '85g', '', '', '2017-06-20', NULL, NULL, NULL, '0.00', 1),
(230, 'Tablette Chocolat noir 74%', 'epiceriefine', '4.30', 0, '0.88', 7, 29, '', '', NULL, '85g', '', '', '2017-06-20', NULL, NULL, NULL, '0.00', 1),
(231, 'Confiture Framboise à la violette', 'epiceriefine', '3.80', 0, '0.27', 7, 31, '', '', NULL, '', '', '', '2017-06-20', NULL, NULL, NULL, '0.00', 1),
(232, 'Confiture Fraise', 'epiceriefine', '5.35', 0, '0.55', 7, 31, '', '', NULL, '', '', '', '2017-06-20', NULL, NULL, NULL, '0.00', 1),
(233, 'Confiture Fraise au coquelicot', 'epiceriefine', '5.35', 0, '0.55', 7, 31, '', '', NULL, '', '', '', '2017-06-20', NULL, NULL, NULL, '0.00', 1),
(234, 'Confiture Rhubarbe et cassis', 'epiceriefine', '3.80', 0, '0.55', 7, 31, '', '', NULL, '', '', '', '2017-06-20', NULL, NULL, NULL, '0.00', 1),
(235, 'Confiture Fraise au coquelicot', 'epiceriefine', '3.80', 0, '0.27', 7, 31, '', '', NULL, '', '', '', '2017-06-20', NULL, NULL, NULL, '0.00', 1),
(236, 'Joli Mois de mai fraise, passion, fève de tonka', 'epiceriefine', '3.80', 0, '0.27', 7, 31, '', '', NULL, '', '', '', '2017-06-20', NULL, NULL, NULL, '0.00', 1),
(237, '1,2,3 Soleil orange, citron, pomelos', 'epiceriefine', '3.80', 0, '0.27', 7, 31, '', '', NULL, '', '', '', '2017-06-20', NULL, NULL, NULL, '0.00', 1),
(238, 'Clémentine De corse', 'epiceriefine', '3.80', 0, '0.27', 7, 31, '', '', NULL, '', '', '', '2017-06-20', NULL, NULL, NULL, '0.00', 1),
(239, 'Automne Coing, pomme, poire, épices', 'epiceriefine', '3.80', 0, '0.27', 7, 31, '', '', NULL, '', '', '', '2017-06-20', NULL, NULL, NULL, '0.00', 1),
(240, 'Cerise Noire', 'epiceriefine', '3.80', 0, '0.27', 7, 31, '', '', NULL, '', '', '', '2017-06-20', NULL, NULL, NULL, '0.00', 1),
(241, 'Il Était une fois fraise, framboise, cerise, groseille', 'epiceriefine', '5.35', 0, '0.55', 7, 31, '', '', NULL, '', '', '', '2017-06-20', NULL, NULL, NULL, '0.00', 1),
(242, 'Miel De châtaignier', 'epiceriefine', '6.40', 0, '0.38', 7, 32, '', '', NULL, '250g', '', '', '2017-06-20', NULL, NULL, NULL, '0.00', 1),
(243, 'Miel De fleurs', 'epiceriefine', '6.40', 0, '0.40', 7, 32, '', '', NULL, '250g', '', '', '2017-06-20', NULL, NULL, NULL, '0.00', 1),
(244, 'Miel De bruyères erica', 'epiceriefine', '7.10', 0, '0.39', 7, 32, '', '', NULL, '250g', '', '', '2017-06-20', NULL, NULL, NULL, '0.00', 1),
(245, 'Miel De fleurs', 'epiceriefine', '2.95', 0, '0.22', 7, 32, '', '', NULL, '', '', '', '2017-06-20', NULL, NULL, NULL, '0.00', 1),
(246, 'Miel De chataignier', 'epiceriefine', '3.55', 0, '0.22', 7, 32, '', '', NULL, '', '', '', '2017-06-20', NULL, NULL, NULL, '0.00', 1),
(247, 'Miel De blé noir', 'epiceriefine', '4.85', 0, '0.22', 7, 32, '', '', NULL, '', '', '', '2017-06-20', NULL, NULL, NULL, '0.00', 1),
(248, 'Tagliatelle Nature', 'epiceriefine', '3.50', 0, '0.22', 6, 33, '', '', NULL, '', '', '', '2017-06-20', NULL, NULL, NULL, '0.00', 1),
(249, 'Fettucine Au piment d\'espelette', 'epiceriefine', '4.50', 0, '0.23', 6, 33, '', '', NULL, '', '', '', '2017-06-20', NULL, NULL, NULL, '0.00', 1),
(250, 'Risone Nature', 'epiceriefine', '3.50', 0, '0.31', 6, 33, '', '', NULL, '', '', '', '2017-06-20', NULL, NULL, NULL, '0.00', 1),
(251, 'Likenn Nature', 'epiceriefine', '3.50', 0, '0.27', 6, 33, '', '', NULL, '', '', '', '2017-06-20', NULL, NULL, NULL, '0.00', 1),
(252, 'Rozenn Nature', 'epiceriefine', '3.50', 0, '0.27', 6, 33, '', '', NULL, '', '', '', '2017-06-20', NULL, NULL, NULL, '0.00', 1),
(253, 'Feltuccine Au sarrasin', 'epiceriefine', '4.50', 0, '0.23', 6, 33, '', '', NULL, '', '', '', '2017-06-20', NULL, NULL, NULL, '0.00', 1),
(254, 'Feltuccine Aux cépes', 'epiceriefine', '4.50', 0, '0.23', 6, 33, '', '', NULL, '', '', '', '2017-06-20', NULL, NULL, NULL, '0.00', 1),
(255, 'Feltuccine Au noir de sépia', 'epiceriefine', '4.50', 0, '0.23', 6, 33, '', '', NULL, '', '', '', '2017-06-20', NULL, NULL, NULL, '0.00', 1),
(256, 'Likenn Aux 5 saveurs', 'epiceriefine', '4.50', 0, '0.26', 6, 33, '', '', NULL, '', '', '', '2017-06-20', NULL, NULL, NULL, '0.00', 1),
(257, 'Rillettes De hareng fume aux tomates confites', 'epiceriefine', '3.75', 0, '0.21', 6, 34, '', '', NULL, '', '', '', '2017-06-20', NULL, NULL, NULL, '0.00', 1),
(258, 'Rillettes De st jacques aux algues', 'epiceriefine', '5.00', 0, '0.21', 6, 34, '', '', NULL, '', '', '', '2017-06-20', NULL, NULL, NULL, '0.00', 1),
(259, 'Rillettes De maquereau fume au poivre', 'epiceriefine', '4.50', 0, '0.20', 6, 34, '', '', NULL, '', '', '', '2017-06-20', NULL, NULL, NULL, '0.00', 1),
(260, 'Rillettes De bar sauvage a la fleur de sel', 'epiceriefine', '6.40', 0, '0.21', 6, 34, '', '', NULL, '', '', '', '2017-06-20', NULL, NULL, NULL, '0.00', 1),
(261, 'Rillettes De saumon aux algues', 'epiceriefine', '4.20', 0, '0.21', 6, 34, '', '', NULL, '', '', '', '2017-06-20', NULL, NULL, NULL, '0.00', 1),
(262, 'Rillettes De sardine', 'epiceriefine', '3.40', 0, '21.00', 6, 34, '', '', NULL, '', '', '', '2017-06-20', NULL, NULL, NULL, '0.00', 1),
(263, 'Soupe De poissons', 'epiceriefine', '4.10', 0, '1.12', 6, 34, '', '', NULL, '', '', '', '2017-06-20', NULL, NULL, NULL, '0.00', 1),
(264, 'Soupe 3 poissons aux algues', 'epiceriefine', '3.20', 0, '0.71', 6, 34, '', '', NULL, '', '', '', '2017-06-20', NULL, NULL, NULL, '0.00', 1),
(265, 'Bisque De langoustine aux algues', 'epiceriefine', '3.40', 0, '0.70', 6, 34, '', '', NULL, '', '', '', '2017-06-20', NULL, NULL, NULL, '0.00', 1),
(266, 'Salicornes En marinade', 'epiceriefine', '4.70', 0, '0.31', 6, 34, '', '', NULL, '', '', '', '2017-06-20', NULL, NULL, NULL, '0.00', 1),
(267, 'Saveurs D\'artichaut du léon', 'epiceriefine', '4.55', 0, '0.21', 6, 34, '', '', NULL, '', '', '', '2017-06-20', NULL, NULL, NULL, '0.00', 1),
(268, 'Saveurs de chou-Fleur a l\'andouille', 'epiceriefine', '3.35', 0, '0.21', 6, 34, '', '', NULL, '', '', '', '2017-06-20', NULL, NULL, NULL, '0.00', 1),
(269, 'Saveurs De petit pois', 'epiceriefine', '3.35', 0, '0.20', 6, 34, '', '', NULL, '', '', '', '2017-06-20', NULL, NULL, NULL, '0.00', 1),
(270, 'Saveurs De potimarron du léon', 'epiceriefine', '3.35', 0, '0.21', 6, 34, '', '', NULL, '', '', '', '2017-06-20', NULL, NULL, NULL, '0.00', 1),
(271, 'Saveurs De tomates confites', 'epiceriefine', '3.85', 0, '0.21', 6, 34, '', '', NULL, '', '', '', '2017-06-20', NULL, NULL, NULL, '0.00', 1),
(272, 'Rillettes De st jacques au lard', 'epiceriefine', '3.40', 0, '0.21', 6, 34, '', '', NULL, '', '', '', '2017-06-20', NULL, NULL, NULL, '0.00', 1),
(273, 'Tartare D\'algues', 'epiceriefine', '3.50', 0, '0.21', 6, 34, '', '', NULL, '', '', '', '2017-06-20', NULL, NULL, NULL, '0.00', 1),
(274, 'Rillettes De lotte aux agrumes', 'epiceriefine', '5.50', 0, '0.29', 6, 34, '', '', NULL, '', '', '', '2017-06-20', NULL, NULL, NULL, '0.00', 1),
(277, 'Rillettes De maquereaux façon boucane', 'epiceriefine', '0.00', 0, '0.00', 6, 34, '', '', NULL, '', '', '', '2017-06-20', NULL, NULL, NULL, '0.00', 1),
(278, 'Rillettes De sardines aux tomates confites', 'epiceriefine', '3.40', 0, '0.21', 6, 34, '', '', NULL, '', '', '', '2017-06-20', NULL, NULL, NULL, '0.00', 1),
(279, 'Cuisses De canard confites', 'epiceriefine', '9.50', 0, '1.23', 6, 35, '', '', NULL, '', '', '', '2017-06-20', NULL, NULL, NULL, '0.00', 1),
(280, 'Cassoulet Au confit de canard', 'epiceriefine', '6.20', 0, '0.82', 6, 35, '', '', NULL, '', '', '', '2017-06-20', NULL, NULL, NULL, '0.00', 1),
(281, 'Foie Gras de canard entier à la fleur de sel', 'epiceriefine', '18.50', 0, '0.51', 6, 35, '', '', NULL, '', '', '', '2017-06-20', NULL, NULL, NULL, '0.00', 1),
(282, 'Bloc De foie gras de canard', 'epiceriefine', '9.50', 0, '0.24', 6, 35, '', '', NULL, '', '', '', '2017-06-20', NULL, NULL, NULL, '0.00', 1),
(283, 'Délice De canard ', 'epiceriefine', '3.95', 0, '0.27', 6, 35, '', '', NULL, '', '', '', '2017-06-20', NULL, NULL, NULL, '0.00', 1),
(284, 'Terrine D\'oie aux fruits rouges', 'epiceriefine', '4.40', 0, '0.34', 6, 35, '', '', NULL, '', '', '', '2017-06-20', NULL, NULL, NULL, '0.00', 1),
(285, 'Terrine De pintade aux girolles', 'epiceriefine', '5.55', 0, '0.34', NULL, NULL, '', '', NULL, '', '', '', '2017-06-20', NULL, NULL, NULL, '0.00', 1),
(286, 'Rillettes De canard au foie gras', 'epiceriefine', '5.90', 0, '0.34', 6, 35, '', '', NULL, '', '', '', '2017-06-20', NULL, NULL, NULL, '0.00', 1),
(287, 'Rillettes D\'oie', 'epiceriefine', '5.75', 0, '0.34', 6, 35, '', '', NULL, '', '', '', '2017-06-20', NULL, NULL, NULL, '0.00', 1),
(288, 'Paté À l\'andouille', 'epiceriefine', '3.95', 0, '0.22', 6, 35, '', '', NULL, '', '', '', '2017-06-20', NULL, NULL, NULL, '0.00', 1),
(289, 'Rillettes De porcs', 'epiceriefine', '4.90', 0, '0.35', 6, 35, '', '', NULL, '', '', '', '2017-06-20', NULL, NULL, NULL, '0.00', 1),
(290, 'Rillettes Au wakamé', 'epiceriefine', '3.95', 0, '0.22', 6, 35, '', '', NULL, '', '', '', '2017-06-20', NULL, NULL, NULL, '0.00', 1),
(291, 'Rillettes Au cidre', 'epiceriefine', '3.95', 0, '0.22', 6, 35, '', '', NULL, '', '', '', '2017-06-20', NULL, NULL, NULL, '0.00', 1),
(292, 'Rillettes Au wakamé', 'epiceriefine', '3.95', 0, '0.34', 6, 35, '', '', NULL, '', '', '', '2017-06-20', NULL, NULL, NULL, '0.00', 1),
(293, 'Rillettes Pur autruche au piment d\'espellette', 'epiceriefine', '5.00', 0, '0.21', 6, 35, '', '', NULL, '', '', '', '2017-06-20', NULL, NULL, NULL, '0.00', 1),
(294, 'Rillettes Pur autruche aux algues', 'epiceriefine', '5.00', 0, '0.21', 6, 35, '', '', NULL, '', '', '', '2017-06-20', NULL, NULL, NULL, '0.00', 1),
(295, 'Rillettes Pur autruche au pommeau de bretagne', 'epiceriefine', '5.00', 0, '0.21', 6, 35, '', '', NULL, '', '', '', '2017-06-20', NULL, NULL, NULL, '0.00', 1),
(296, 'Rillettes De canard au magret fumé', 'epiceriefine', '4.25', 0, '0.34', 6, 35, '', '', NULL, '', '', '', '2017-06-20', NULL, NULL, NULL, '0.00', 1),
(298, 'Crémant De loire', 'alcool', '8.80', 6, '1.25', 2, 19, '', '', '75CL', NULL, '', '', '2017-08-09', NULL, NULL, NULL, '0.00', 1),
(299, 'Whisky Flatnose écossais', 'alcool', '33.00', 1, '1.44', 1, 18, '', '', '70CL', NULL, 'Bouche :céréales,épicé ', '', '2017-08-29', NULL, NULL, NULL, '0.00', 1),
(300, 'Rhum Naga', 'alcool', '39.00', 0, '1.44', NULL, NULL, '', '', '0.70cl', NULL, '', '', '2017-08-29', NULL, NULL, NULL, '0.00', 1),
(301, 'Clairette De die', 'alcool', '8.00', 6, '1.50', 2, 19, '', '', '75CL', NULL, '', '', '2017-08-29', NULL, NULL, NULL, '0.00', 1),
(302, 'Fuji-Sanroku japonais', 'alcool', '43.00', 6, '1.45', 1, 18, '', '', '70CL', NULL, 'Whisky japonais 50 degres\r\nfuji-sanroku est une exclusivité japonaise lancée en mars 2016. cette spécificité lui apporte des aromes de fruits cuits.', '', '2017-09-05', NULL, NULL, NULL, '0.00', 1),
(303, 'Rhum Naga indonesie', 'alcool', '39.00', 2, '1.45', 1, 13, '', '', '70CL', NULL, 'En bouche:souple ,douce,épicée.', '', '2017-09-05', NULL, NULL, NULL, '0.00', 1),
(304, 'Domaine Rety 2015 l\'insolente roussillon 3 étoiles guide hachette 2018', 'alcool', '13.90', 12, '1.44', 3, 48, 'Espira De l\'agly', '', '75CL', NULL, 'Le domaine rety vient de recevoir 3 étoiles dans le nouveau guide hachette des vins 2018.le vin rouge primé est le cote du roussillon l\'insolente millésimé\r\n2015 qui a reçu une note de 5 sur 5 soit \r\n3 étoiles vin exceptionnel .\r\naccords:viande blanche,viande rouge.\r\n\r\n\r\n', '', '2017-09-06', NULL, NULL, NULL, '0.00', 1),
(305, 'Reuilly Blanc', 'alcool', '9.10', 48, '1.44', 3, 27, '', '', '75CL', NULL, 'Accords:apéritif,poisson ,crottin de chevre', '', '2017-09-06', NULL, NULL, NULL, '0.00', 1),
(306, ' Pauillac tour pibran 6 bouteilles 75cl dont 2 gratuites', 'alcool', '114.00', 5, '8.70', 3, 20, '', '', '6x75cl', NULL, '', '', '2017-09-07', NULL, '2017-11-01', '2017-12-15', '114.00', 0);
INSERT INTO `produit` (`idProduit`, `nomProduit`, `typeProduit`, `prixProduit`, `stockProduit`, `poidsBrutProduit`, `categorieProduit`, `sousCategorieProduit`, `lieuProductionProduit`, `marqueProduit`, `contenanceProduit`, `poidsNetProduit`, `descriptionProduit`, `avisCommercantProduit`, `dateAjoutProduit`, `dateFinProduit`, `dateDebutPromotionProduit`, `dateFinPromotionProduit`, `prixPromotionProduit`, `etatProduit`) VALUES
(307, 'Rhum Coloma 8 ans', 'alcool', '38.00', 2, '1.44', 1, 13, 'Colombie', '', '75CL', NULL, 'Rhum coloma 8 ans est un rhum de colombie élaboré à partir de jus de canne à sucres deux variétés différentes.\r\npossédant des aromes vanillés et légèrement orangé, on le compare au don papa.', '', '2017-09-12', NULL, NULL, NULL, '0.00', 1),
(308, 'Bunnahabhain Toiteach', 'alcool', '56.00', 2, '1.44', 1, 18, 'Écosse', '', '75CL', NULL, 'Son nom, qui signifie fumé en gaélique,évoque la tourbe, bien présente qui n\'écrase en rien le caractère fruité de\r\nla distillerie bunnahabhain et l\'enrobé d\'une touche chocolatée.', '', '2017-09-12', NULL, NULL, NULL, '0.00', 1),
(309, 'Flatnose Blended malt', 'alcool', '43.00', 2, '1.44', 1, 18, 'Écosse', '', '75CL', NULL, 'Le tout nouveau flatnose blended malt est assemblé à partir de 100%de scotch single malt en provenance de chaque région de production,avec un accent sur\r\nceux provenant de l\'ile d\'islay,ainsi la tourbe est présente de manière douce\r\nmais persistante et équilibré par des saveurs délicates d\"e miel et citron confit.\r\n', '', '2017-09-12', NULL, NULL, NULL, '0.00', 1),
(310, 'Rhum Centenario 20 ans', 'alcool', '60.00', 2, '1.44', 1, 13, 'Costa Rica', '', '70CL', NULL, 'Bouche:des notes de fruits murs,de pommes,et de cerise.', '', '2017-09-13', NULL, NULL, NULL, '0.00', 1),
(311, 'Test', 'epiceriefine', '5.00', 5, '5.00', 1, NULL, '', '', NULL, '', '', '', '2017-09-17', NULL, NULL, NULL, '0.00', 0),
(312, 'Magnum Domaine rety 2016 souffle d\'or', 'alcool', '49.80', 3, '3.70', 3, 48, 'Espira De l\'agly', '', '150cl', NULL, 'Cépages:grenache,mourvèdre,syrah.\r\naccords mets et vin :viande rouge ,filet de boeuf.', '', '2017-09-20', NULL, NULL, NULL, '0.00', 1),
(313, '6 Bouteilles 75cl graves haut selve dont 2 offertes', 'alcool', '84.00', 4, '9.50', 3, 20, '', '', '', NULL, '', '', '2017-11-01', NULL, '2017-11-01', '2017-12-15', '56.00', 1),
(314, '6 Bouteilles 75cl chinien bergeron savoie dont 2 offertes', 'alcool', '96.00', 4, '9.60', 3, 6, '', '', '', NULL, '', '', '2017-11-01', NULL, '2017-11-01', '2017-12-15', '64.00', 1),
(315, '6 Bouteilles 75cl fourcas hostein(listrac médoc) dont 2 offertes', 'alcool', '126.00', 3, '8.00', 3, 20, '', '', '', NULL, '', '', '2017-11-01', NULL, '2017-11-01', '2017-12-15', '84.00', 1),
(316, '6 Bouteilles 75cl corbières haut gléon dont 2 offertes', 'alcool', '84.00', 2, '8.60', 3, 26, '', '', '', NULL, '', '', '2017-11-01', NULL, '2017-11-01', '2017-12-15', '56.00', 1),
(317, 'Ventoux ', 'alcool', '7.70', 18, '1.60', 3, 28, 'Vallée Du rhone', '', '0.75CL', NULL, 'Accords: viande rouge,plat épicé.', '', '2018-01-19', NULL, NULL, NULL, '0.00', 1),
(318, 'Lirac rouge chateau mont-Redon', 'alcool', '17.80', 2, '1.60', 3, 28, 'Vallée Du rhone', '', '0.75CL', NULL, 'Accords:cote de boeuf ,cassoulet.', '', '2018-01-19', NULL, NULL, NULL, '0.00', 1),
(319, 'Chateauneuf du pape blanc mont-Redon', 'alcool', '31.60', 5, '1.60', 3, 28, 'Vallée Du rhone', '', '0.75CL', NULL, 'Accords:poisson,viande blanche,chapon,apéritif.', '', '2018-01-19', NULL, NULL, NULL, '0.00', 1),
(320, 'Syrah 100% jean luc colombo', 'alcool', '11.00', 0, '1.60', 3, 28, 'Les Collines de laure cornas', '', '0.75CL', NULL, 'Accords:viande rouge.', '', '2018-01-19', NULL, NULL, NULL, '0.00', 1),
(321, 'Cornas Jean luc colombo', 'alcool', '48.00', 5, '1.60', 3, 28, 'Cornas', '', '0.75CL', NULL, 'Accords:viande rouge,magret de canard.', '', '2018-01-19', NULL, NULL, NULL, '0.00', 1),
(322, 'Cote rotie jean-Luc colombo', 'alcool', '55.00', 4, '1.60', 3, 28, 'Vallée Du rhone', '', '0.75CL', NULL, 'Accords:viande rouge.', '', '2018-01-19', NULL, NULL, NULL, '0.00', 1),
(323, 'Chateau La mijane', 'alcool', '9.00', 10, '1.60', 3, 28, 'Carcasonne', '', '0.75CL', NULL, 'Accords:gibier,viande rouge,fromage bleu.', '', '2018-01-19', NULL, NULL, NULL, '0.00', 1),
(324, 'Lalande De pomerol', 'alcool', '21.70', 12, '1.60', 3, 20, 'La fleur saint-Georges', '', '0.75CL', NULL, '', '', '2018-01-19', NULL, NULL, NULL, '0.00', 1),
(325, 'Saint-Emilion grand cru classé 2015', 'alcool', '47.60', 6, '1.60', 3, 20, 'Bordeaux', '', '0.75CL', NULL, '', '', '2018-01-19', NULL, NULL, NULL, '0.00', 1),
(326, 'Pomerol Chateau la croix', 'alcool', '39.50', 6, '1.60', 3, 20, 'Bordeaux', '', '0.75CL', NULL, '', '', '2018-01-19', NULL, NULL, NULL, '0.00', 1),
(327, 'Moulis Chateau mauvesin barton', 'alcool', '23.00', 6, '1.60', 3, 20, 'Bordeaux', '', '0.75CL', NULL, '', '', '2018-01-19', NULL, NULL, NULL, '0.00', 1),
(328, 'Saint-Véran chateau de beauregard', 'alcool', '19.00', 12, '1.60', 3, 24, 'Bourgogne', '', '0.75CL', NULL, 'Accords:poisson grillée,apéritif,poisson,\r\ncrustacés.', '', '2018-01-19', NULL, NULL, NULL, '0.00', 1),
(329, 'Viré-Clessé joseph burrier', 'alcool', '20.00', 6, '1.60', 3, 24, 'Bourgogne', '', '0.75CL', NULL, 'Accords:apéritif,poisson.', '', '2018-01-19', NULL, NULL, NULL, '0.00', 1),
(330, 'Chinon Rouge bernard baudry', 'alcool', '13.40', 0, '1.60', 3, 27, 'Cravant-Les-coteaux', '', '0.75CL', NULL, 'Accords:bar,lotte,viande en sauce.', '', '2018-01-19', NULL, NULL, NULL, '0.00', 1),
(331, 'Chinon Blanc bernard baudry', 'alcool', '15.00', 6, '1.60', 3, 27, 'Cravant-Les-coteaux', '', '0.75CL', NULL, 'Accords:poisson ,apéritif.', '', '2018-01-19', NULL, NULL, NULL, '0.00', 1),
(332, 'Fixin Rouge', 'alcool', '26.80', 4, '1.60', 3, 24, 'Bourgogne', '', '0.75CL', NULL, 'Accord:gigot d\'agneau.', '', '2018-01-19', NULL, NULL, NULL, '0.00', 1),
(333, 'Roussanne Blanc', 'alcool', '7.50', 6, '1.60', 3, NULL, 'Argens', '', '0.75CL', NULL, 'Accords:apéritif,poisson;viande blanche.', '', '2018-01-19', NULL, NULL, NULL, '0.00', 1),
(334, 'Roussanne Blanc', 'alcool', '7.50', 0, '1.60', 3, 49, 'Argens', '', '0.75CL', NULL, 'Accords:apéritif,poisson,viande blanche.', '', '2018-01-19', NULL, NULL, NULL, '0.00', 1),
(335, 'Minervois Rouge le clos du pech laurié', 'alcool', '16.90', 6, '1.60', 3, 49, 'Argens', '', '', NULL, 'Accords:tajines,viandes d\'agneau,canard. ', 'Souvent primé guide hachette.', '2018-01-19', NULL, NULL, NULL, '0.00', 1),
(336, 'Minervois Rouge domaine des maels', 'alcool', '8.50', 0, '1.60', 3, 49, 'Argens', '', '0.75CL', NULL, 'Accords:grillades,cassoulet,fromages.', '', '2018-01-19', NULL, NULL, NULL, '0.00', 1),
(337, 'Domaine Rety souffle d\'or', 'alcool', '16.90', 6, '1.60', 3, 48, 'Espira De l\'agly', '', '0.75CL', NULL, 'Accords:viande rouge.', '', '2018-01-19', NULL, NULL, NULL, '0.00', 1),
(338, 'Legacy Roussillon blanc', 'alcool', '13.80', 2, '1.60', 3, 48, 'Espira De l\'agly', '', '0.75CL', NULL, 'Accords:huitres,apéritif.', '', '2018-01-19', NULL, NULL, NULL, '0.00', 1),
(339, 'Champagne Jacquesson', 'alcool', '45.00', 6, '1.70', 2, 23, 'Dizy', 'Jaquesson', '0.75CL', NULL, '', '', '2018-01-19', NULL, NULL, NULL, '0.00', 1),
(340, 'Writers Tears', 'alcool', '41.00', 2, '1.60', 1, 18, 'Irlandais', 'Writers Tears', '', NULL, 'Des notes épicés.', '', '2018-01-19', NULL, NULL, NULL, '0.00', 1),
(341, 'Coloma 15 ans', 'alcool', '54.00', 1, '1.60', 1, 18, 'Colombie', '', '0.75CL', NULL, 'Vieilli pendant 15 ans dans des futs de chene américains,puis 6mois en futs de chene de café.', '', '2018-01-19', NULL, NULL, NULL, '0.00', 0),
(342, 'Diplomatico Collection ', 'alcool', '59.00', 2, '1.60', 1, 13, 'Venezuela', '', '0.75CL', NULL, '', '', '2018-01-19', NULL, NULL, NULL, '0.00', 1),
(343, 'Coloma 15 ans', 'alcool', '54.00', 1, '1.60', 1, 13, 'Colombie', '', '0.75CL', NULL, '', '', '2018-01-19', NULL, NULL, NULL, '0.00', 1);

--
-- Déclencheurs `produit`
--
DELIMITER $$
CREATE TRIGGER `InsertProduit(Majuscule&Date)` BEFORE INSERT ON `produit` FOR EACH ROW BEGIN

	SET new.nomProduit = concat(UPPER(Substring(new.nomProduit, 1, 1)), LOWER(Substring(new.nomProduit, 2))); 
    
    SET new.typeProduit = LOWER(new.typeProduit);

    
    IF (INSTR(new.nomProduit,'-') != 0) THEN
    	SET new.nomProduit = concat(concat(UPPER(Substring(new.nomProduit, 1, 1)), LOWER(Substring(new.nomProduit, 2, INSTR(new.nomProduit,'-')-1))), concat(UPPER(Substring(new.nomProduit, INSTR(new.nomProduit,'-')+1, 1)), LOWER(Substring(new.nomProduit, INSTR(new.nomProduit,'-')+2))));
    ELSEIF (INSTR(new.nomProduit,' ') != 0) THEN
    	SET new.nomProduit = concat(concat(UPPER(Substring(new.nomProduit, 1, 1)), LOWER(Substring(new.nomProduit, 2, INSTR(new.nomProduit,' ')-1))), concat(UPPER(Substring(new.nomProduit, INSTR(new.nomProduit,' ')+1, 1)), LOWER(Substring(new.nomProduit, INSTR(new.nomProduit,' ')+2))));
    END IF;
        
    SET new.marqueProduit = concat(UPPER(Substring(new.marqueProduit, 1, 1)), LOWER(Substring(new.marqueProduit, 2)));
    
    IF (INSTR(new.marqueProduit,'-') != 0) THEN
    	SET new.marqueProduit = concat(concat(UPPER(Substring(new.marqueProduit, 1, 1)), LOWER(Substring(new.marqueProduit, 2, INSTR(new.marqueProduit,'-')-1))), concat(UPPER(Substring(new.marqueProduit, INSTR(new.marqueProduit,'-')+1, 1)), LOWER(Substring(new.marqueProduit, INSTR(new.marqueProduit,'-')+2))));
   ELSEIF (INSTR(new.marqueProduit,' ') != 0) THEN
    	SET new.marqueProduit = concat(concat(UPPER(Substring(new.marqueProduit, 1, 1)), LOWER(Substring(new.marqueProduit, 2, INSTR(new.marqueProduit,' ')-1))), concat(UPPER(Substring(new.marqueProduit, INSTR(new.nomProduit,' ')+1, 1)), LOWER(Substring(new.marqueProduit, INSTR(new.marqueProduit,' ')+2))));
    END IF;
        
    SET new.lieuProductionProduit = concat(UPPER(Substring(new.lieuProductionProduit, 1, 1)), LOWER(Substring(new.lieuProductionProduit, 2)));
    
     IF (INSTR(new.lieuProductionProduit,'-') != 0) THEN
    	SET new.lieuProductionProduit = concat(concat(UPPER(Substring(new.lieuProductionProduit, 1, 1)), LOWER(Substring(new.lieuProductionProduit, 2, INSTR(new.lieuProductionProduit,'-')-1))), concat(UPPER(Substring(new.lieuProductionProduit, INSTR(new.lieuProductionProduit,'-')+1, 1)), LOWER(Substring(new.lieuProductionProduit, INSTR(new.lieuProductionProduit,'-')+2))));
    ELSEIF (INSTR(new.lieuProductionProduit,' ') != 0) THEN
    	SET new.lieuProductionProduit = concat(concat(UPPER(Substring(new.lieuProductionProduit, 1, 1)), LOWER(Substring(new.lieuProductionProduit, 2, INSTR(new.lieuProductionProduit,' ')-1))), concat(UPPER(Substring(new.lieuProductionProduit, INSTR(new.lieuProductionProduit,' ')+1, 1)), LOWER(Substring(new.lieuProductionProduit, INSTR(new.lieuProductionProduit,' ')+2))));
    END IF;
        
    SET new.descriptionProduit = concat(UPPER(Substring(new.descriptionProduit, 1, 1)), LOWER(Substring(new.descriptionProduit, 2)));
    
    SET new.avisCommercantProduit = concat(UPPER(Substring(new.avisCommercantProduit, 1, 1)), LOWER(Substring(new.avisCommercantProduit, 2)));
    
    SET new.dateAjoutProduit = curdate(); 
    
    IF (new.typeProduit = "alcool") THEN
    	SET new.poidsNetProduit = NULL;
    ELSEIF (new.typeProduit = "epicerieFine") THEN
    	SET new.contenanceProduit = NULL;
    ELSEIF (new.typeProduit = "panierGarni") THEN
    	SET new.contenanceProduit = NULL;
        SET new.poidsNetProduit = NULL;
    END IF;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `UpdateProduit(Majuscule)` BEFORE UPDATE ON `produit` FOR EACH ROW BEGIN

	SET new.nomProduit = concat(UPPER(Substring(new.nomProduit, 1, 1)), LOWER(Substring(new.nomProduit, 2))); 
    
    IF (INSTR(new.nomProduit,'-') != 0) THEN
    	SET new.nomProduit = concat(concat(UPPER(Substring(new.nomProduit, 1, 1)), LOWER(Substring(new.nomProduit, 2, INSTR(new.nomProduit,'-')-1))), concat(UPPER(Substring(new.nomProduit, INSTR(new.nomProduit,'-')+1, 1)), LOWER(Substring(new.nomProduit, INSTR(new.nomProduit,'-')+2))));
     ELSEIF (INSTR(new.nomProduit,' ') != 0) THEN
    	SET new.nomProduit = concat(concat(UPPER(Substring(new.nomProduit, 1, 1)), LOWER(Substring(new.nomProduit, 2, INSTR(new.nomProduit,' ')-1))), concat(UPPER(Substring(new.nomProduit, INSTR(new.nomProduit,' ')+1, 1)), LOWER(Substring(new.nomProduit, INSTR(new.nomProduit,' ')+2))));
    END IF;
    
    SET new.typeProduit = LOWER(new.typeProduit);
        
    SET new.marqueProduit = concat(UPPER(Substring(new.marqueProduit, 1, 1)), LOWER(Substring(new.marqueProduit, 2)));
    
    IF (INSTR(new.marqueProduit,'-') != 0) THEN
    	SET new.marqueProduit = concat(concat(UPPER(Substring(new.marqueProduit, 1, 1)), LOWER(Substring(new.marqueProduit, 2, INSTR(new.marqueProduit,'-')-1))), concat(UPPER(Substring(new.marqueProduit, INSTR(new.marqueProduit,'-')+1, 1)), LOWER(Substring(new.marqueProduit, INSTR(new.marqueProduit,'-')+2))));
    ELSEIF (INSTR(new.marqueProduit,' ') != 0) THEN
    	SET new.marqueProduit = concat(concat(UPPER(Substring(new.marqueProduit, 1, 1)), LOWER(Substring(new.marqueProduit, 2, INSTR(new.marqueProduit,' ')-1))), concat(UPPER(Substring(new.marqueProduit, INSTR(new.marqueProduit,' ')+1, 1)), LOWER(Substring(new.marqueProduit, INSTR(new.marqueProduit,' ')+2))));
    END IF;
        
    SET new.lieuProductionProduit = concat(UPPER(Substring(new.lieuProductionProduit, 1, 1)), LOWER(Substring(new.lieuProductionProduit, 2)));
    
     IF (INSTR(new.lieuProductionProduit,'-') != 0) THEN
    	SET new.lieuProductionProduit = concat(concat(UPPER(Substring(new.lieuProductionProduit, 1, 1)), LOWER(Substring(new.lieuProductionProduit, 2, INSTR(new.lieuProductionProduit,'-')-1))), concat(UPPER(Substring(new.lieuProductionProduit, INSTR(new.lieuProductionProduit,'-')+1, 1)), LOWER(Substring(new.lieuProductionProduit, INSTR(new.lieuProductionProduit,'-')+2))));
        ELSEIF (INSTR(new.lieuProductionProduit,' ') != 0) THEN
    	SET new.lieuProductionProduit = concat(concat(UPPER(Substring(new.lieuProductionProduit, 1, 1)), LOWER(Substring(new.lieuProductionProduit, 2, INSTR(new.lieuProductionProduit,' ')-1))), concat(UPPER(Substring(new.lieuProductionProduit, INSTR(new.lieuProductionProduit,' ')+1, 1)), LOWER(Substring(new.lieuProductionProduit, INSTR(new.lieuProductionProduit,' ')+2))));
    END IF;
        
    SET new.descriptionProduit = concat(UPPER(Substring(new.descriptionProduit, 1, 1)), LOWER(Substring(new.descriptionProduit, 2)));
    
    SET new.avisCommercantProduit = concat(UPPER(Substring(new.avisCommercantProduit, 1, 1)), LOWER(Substring(new.avisCommercantProduit, 2)));
    
    IF (new.typeProduit = "alcool") THEN
    	SET new.poidsNetProduit = NULL;
    ELSEIF (new.typeProduit = "epicerieFine") THEN
    	SET new.contenanceProduit = NULL;
    ELSEIF (new.typeProduit = "panierGarni") THEN
    	SET new.contenanceProduit = NULL;
        SET new.poidsNetProduit = NULL;
    END IF;  
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Structure de la table `souscategorie`
--

CREATE TABLE `souscategorie` (
  `idSousCategorie` int(3) NOT NULL,
  `idCategorie` int(3) NOT NULL,
  `libelleSousCategorie` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `souscategorie`
--

INSERT INTO `souscategorie` (`idSousCategorie`, `idCategorie`, `libelleSousCategorie`) VALUES
(1, 5, 'Bière ambrée'),
(2, 5, 'Bière blanche'),
(3, 5, 'Bière blonde'),
(4, 5, 'Bière brune'),
(5, 3, 'Beaujolais'),
(6, 3, 'Savoie'),
(7, 3, 'Gascogne'),
(8, 3, 'Provence'),
(9, 3, 'Muscadet'),
(10, 1, 'Cognac'),
(11, 3, 'Jura'),
(12, 5, 'Bière rousse'),
(13, 1, 'Rhum'),
(14, 1, 'Armagnac'),
(15, 1, 'Tequila'),
(16, 1, 'Gin'),
(18, 1, 'Whisky'),
(19, 2, 'Cremant'),
(20, 3, 'Bordeaux'),
(21, 3, 'Merlot'),
(22, 3, 'Alsace'),
(23, 2, 'Champagne'),
(24, 3, 'Bourgogne'),
(25, 3, 'Etrangers'),
(26, 3, 'Languedoc'),
(27, 3, 'Loire'),
(28, 3, 'Rhône'),
(29, 7, 'Chocolat'),
(30, 7, 'Biscuit confiserie'),
(31, 7, 'Confiture'),
(32, 7, 'Miel'),
(33, 6, 'Pâtes'),
(34, 6, 'Produit de la mer'),
(35, 6, 'Produit de la terre'),
(42, 2, 'Autres'),
(43, 3, 'Bergerac'),
(44, 3, 'Gaillac'),
(45, 3, 'Bergerac'),
(46, 3, 'Gaillac'),
(48, 3, 'Roussillon'),
(49, 3, 'Minervois');

--
-- Déclencheurs `souscategorie`
--
DELIMITER $$
CREATE TRIGGER `InsertSousCategorie(Majuscule)` BEFORE INSERT ON `souscategorie` FOR EACH ROW BEGIN SET new.libelleSousCategorie = concat(UPPER(Substring(new.libelleSousCategorie, 1, 1)), LOWER(Substring(new.libelleSousCategorie, 2))); IF (INSTR(new.libelleSousCategorie,'-') != 0) THEN SET new.libelleSousCategorie = concat(concat(UPPER(Substring(new.libelleSousCategorie, 1, 1)), LOWER(Substring(new.libelleSousCategorie, 2, INSTR(new.libelleSousCategorie,'-')-1))), concat(UPPER(Substring(new.libelleSousCategorie, INSTR(new.libelleSousCategorie,'-')+1, 1)), LOWER(Substring(new.libelleSousCategorie, INSTR(new.libelleSousCategorie,'-')+2)))); END IF; END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `UpdateSousCategorie(Majuscule)` BEFORE UPDATE ON `souscategorie` FOR EACH ROW BEGIN SET new.libelleSousCategorie = concat(UPPER(Substring(new.libelleSousCategorie, 1, 1)), LOWER(Substring(new.libelleSousCategorie, 2))); IF (INSTR(new.libelleSousCategorie,'-') != 0) THEN SET new.libelleSousCategorie = concat(concat(UPPER(Substring(new.libelleSousCategorie, 1, 1)), LOWER(Substring(new.libelleSousCategorie, 2, INSTR(new.libelleSousCategorie,'-')-1))), concat(UPPER(Substring(new.libelleSousCategorie, INSTR(new.libelleSousCategorie,'-')+1, 1)), LOWER(Substring(new.libelleSousCategorie, INSTR(new.libelleSousCategorie,'-')+2)))); END IF; END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Structure de la table `utilisateur`
--

CREATE TABLE `utilisateur` (
  `idUtilisateur` int(2) NOT NULL,
  `nomUtilisateur` varchar(255) NOT NULL,
  `mdpUtilisateur` varchar(255) NOT NULL,
  `idNiveau` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `utilisateur`
--

INSERT INTO `utilisateur` (`idUtilisateur`, `nomUtilisateur`, `mdpUtilisateur`, `idNiveau`) VALUES
(1, 'christophe_Mouriec', 'f2f803312a09b25956b4dee3352736151fce81ed', 1);

--
-- Déclencheurs `utilisateur`
--
DELIMITER $$
CREATE TRIGGER `InsertUtilisateur(MdpSha1)` BEFORE INSERT ON `utilisateur` FOR EACH ROW BEGIN

	SET new.mdpUtilisateur = sha1(new.mdpUtilisateur); 
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `UpdateUtilisateur(mdpSha1)` BEFORE UPDATE ON `utilisateur` FOR EACH ROW BEGIN
	SET new.mdpUtilisateur = sha1(new.mdpUtilisateur); 
END
$$
DELIMITER ;

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `actualites`
--
ALTER TABLE `actualites`
  ADD PRIMARY KEY (`idActualite`),
  ADD KEY `fkPhotoActualites` (`idPhoto`);

--
-- Index pour la table `avisutilisateur`
--
ALTER TABLE `avisutilisateur`
  ADD PRIMARY KEY (`idAvis`);

--
-- Index pour la table `categorie`
--
ALTER TABLE `categorie`
  ADD PRIMARY KEY (`idCategorie`);

--
-- Index pour la table `client`
--
ALTER TABLE `client`
  ADD PRIMARY KEY (`idClient`);

--
-- Index pour la table `commande`
--
ALTER TABLE `commande`
  ADD PRIMARY KEY (`idCommande`),
  ADD KEY `fkcommandeClient` (`idClient`);

--
-- Index pour la table `evenement`
--
ALTER TABLE `evenement`
  ADD PRIMARY KEY (`idEvenement`),
  ADD KEY `fkPhotoCouvertureEvenement` (`imageCouvertureEvenement`);

--
-- Index pour la table `fraisdeport`
--
ALTER TABLE `fraisdeport`
  ADD PRIMARY KEY (`poidsMinFraisDePort`,`poidsMaxFraisDePort`);

--
-- Index pour la table `link_commande_produit`
--
ALTER TABLE `link_commande_produit`
  ADD PRIMARY KEY (`idCommande`,`idProduit`),
  ADD KEY `fkProduitCommande` (`idProduit`);

--
-- Index pour la table `link_photo_evenement`
--
ALTER TABLE `link_photo_evenement`
  ADD PRIMARY KEY (`idPhoto`,`idEvenement`),
  ADD KEY `fkEvenementPhoto` (`idEvenement`);

--
-- Index pour la table `link_photo_produit`
--
ALTER TABLE `link_photo_produit`
  ADD PRIMARY KEY (`idPhoto`,`idProduit`),
  ADD KEY `fkProduitPhoto` (`idProduit`);

--
-- Index pour la table `niveau`
--
ALTER TABLE `niveau`
  ADD PRIMARY KEY (`idNiveau`);

--
-- Index pour la table `photo`
--
ALTER TABLE `photo`
  ADD PRIMARY KEY (`idPhoto`);

--
-- Index pour la table `produit`
--
ALTER TABLE `produit`
  ADD PRIMARY KEY (`idProduit`),
  ADD KEY `fkcat` (`categorieProduit`),
  ADD KEY `fksousCat` (`sousCategorieProduit`);

--
-- Index pour la table `souscategorie`
--
ALTER TABLE `souscategorie`
  ADD PRIMARY KEY (`idSousCategorie`),
  ADD KEY `fksouscategorie` (`idCategorie`);

--
-- Index pour la table `utilisateur`
--
ALTER TABLE `utilisateur`
  ADD PRIMARY KEY (`idUtilisateur`),
  ADD KEY `fkidNiveau` (`idNiveau`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `actualites`
--
ALTER TABLE `actualites`
  MODIFY `idActualite` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT pour la table `avisutilisateur`
--
ALTER TABLE `avisutilisateur`
  MODIFY `idAvis` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `categorie`
--
ALTER TABLE `categorie`
  MODIFY `idCategorie` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
--
-- AUTO_INCREMENT pour la table `client`
--
ALTER TABLE `client`
  MODIFY `idClient` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT pour la table `commande`
--
ALTER TABLE `commande`
  MODIFY `idCommande` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT pour la table `evenement`
--
ALTER TABLE `evenement`
  MODIFY `idEvenement` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;
--
-- AUTO_INCREMENT pour la table `niveau`
--
ALTER TABLE `niveau`
  MODIFY `idNiveau` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT pour la table `photo`
--
ALTER TABLE `photo`
  MODIFY `idPhoto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=523;
--
-- AUTO_INCREMENT pour la table `produit`
--
ALTER TABLE `produit`
  MODIFY `idProduit` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=344;
--
-- AUTO_INCREMENT pour la table `souscategorie`
--
ALTER TABLE `souscategorie`
  MODIFY `idSousCategorie` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;
--
-- AUTO_INCREMENT pour la table `utilisateur`
--
ALTER TABLE `utilisateur`
  MODIFY `idUtilisateur` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `actualites`
--
ALTER TABLE `actualites`
  ADD CONSTRAINT `fkPhotoActualites` FOREIGN KEY (`idPhoto`) REFERENCES `photo` (`idPhoto`);

--
-- Contraintes pour la table `commande`
--
ALTER TABLE `commande`
  ADD CONSTRAINT `fkcommnadeClient` FOREIGN KEY (`idClient`) REFERENCES `client` (`idClient`);

--
-- Contraintes pour la table `evenement`
--
ALTER TABLE `evenement`
  ADD CONSTRAINT `fkPhotoCouvertureEvenement` FOREIGN KEY (`imageCouvertureEvenement`) REFERENCES `photo` (`idPhoto`);

--
-- Contraintes pour la table `link_commande_produit`
--
ALTER TABLE `link_commande_produit`
  ADD CONSTRAINT `fkCommande` FOREIGN KEY (`idCommande`) REFERENCES `commande` (`idCommande`),
  ADD CONSTRAINT `fkProduitCommande` FOREIGN KEY (`idProduit`) REFERENCES `produit` (`idProduit`);

--
-- Contraintes pour la table `link_photo_evenement`
--
ALTER TABLE `link_photo_evenement`
  ADD CONSTRAINT `fkEvenementPhoto` FOREIGN KEY (`idEvenement`) REFERENCES `evenement` (`idEvenement`),
  ADD CONSTRAINT `fkPhotoEvenement` FOREIGN KEY (`idPhoto`) REFERENCES `photo` (`idPhoto`);

--
-- Contraintes pour la table `link_photo_produit`
--
ALTER TABLE `link_photo_produit`
  ADD CONSTRAINT `fkPhotoProduit` FOREIGN KEY (`idPhoto`) REFERENCES `photo` (`idPhoto`),
  ADD CONSTRAINT `fkProduitPhoto` FOREIGN KEY (`idProduit`) REFERENCES `produit` (`idProduit`);

--
-- Contraintes pour la table `produit`
--
ALTER TABLE `produit`
  ADD CONSTRAINT `fkcat` FOREIGN KEY (`categorieProduit`) REFERENCES `categorie` (`idCategorie`),
  ADD CONSTRAINT `fksousCat` FOREIGN KEY (`sousCategorieProduit`) REFERENCES `souscategorie` (`idSousCategorie`);

--
-- Contraintes pour la table `souscategorie`
--
ALTER TABLE `souscategorie`
  ADD CONSTRAINT `fksouscategorie` FOREIGN KEY (`idCategorie`) REFERENCES `categorie` (`idCategorie`);

--
-- Contraintes pour la table `utilisateur`
--
ALTER TABLE `utilisateur`
  ADD CONSTRAINT `fkidNiveau` FOREIGN KEY (`idNiveau`) REFERENCES `niveau` (`idNiveau`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
