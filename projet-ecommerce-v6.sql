-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : dim. 02 jan. 2022 à 11:30
-- Version du serveur : 10.4.19-MariaDB
-- Version de PHP : 8.0.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `projet-ecommerce-v6`
--

-- --------------------------------------------------------

--
-- Structure de la table `admin`
--

CREATE TABLE `admin` (
  `email` text NOT NULL,
  `motdepasse` varchar(30) NOT NULL,
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `admin`
--

INSERT INTO `admin` (`email`, `motdepasse`, `id`) VALUES
('admin@gmail.com', 'admin1234', 1);

-- --------------------------------------------------------

--
-- Structure de la table `facture`
--

CREATE TABLE `facture` (
  `numCommande` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `membres`
--

CREATE TABLE `membres` (
  `id` int(11) NOT NULL,
  `id_client` varchar(30) NOT NULL,
  `email` text NOT NULL,
  `blocked` int(11) NOT NULL DEFAULT 0,
  `password` text NOT NULL,
  `secret` text NOT NULL,
  `adresse` text NOT NULL,
  `date_naissance` date DEFAULT NULL,
  `prenom` varchar(26) NOT NULL,
  `nom` varchar(100) NOT NULL,
  `pays` varchar(50) NOT NULL,
  `code_postal` text NOT NULL,
  `adresse2` text DEFAULT NULL,
  `adresse_livraison` text NOT NULL,
  `ville` text NOT NULL,
  `Tél` text NOT NULL,
  `civilité` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `membres`
--

INSERT INTO `membres` (`id`, `id_client`, `email`, `blocked`, `password`, `secret`, `adresse`, `date_naissance`, `prenom`, `nom`, `pays`, `code_postal`, `adresse2`, `adresse_livraison`, `ville`, `Tél`, `civilité`) VALUES
(1, 'V-200', 'verstappen@gmail.com', 0, 'aq1b911854a6f936e3cffe675bfeff5d9892b08e48525', '085b2813af807337b803c584d1005c65cf510bf01639761267', '77 rue du circuit court', '1997-12-22', 'Max', 'Verstappen', 'Belgique', '78842', '', 'zandvoort', 'Spa-francorchamps', '06 11 22 33 44', 'Mr'),
(2, 'E-253', 'maengambe@gmail.com', 0, 'aq1844918d41679494b69357ea02be416aafa9d079a25', '5f892b248a1cc27a1dab8387a6f5167bdcfe24f81632071509', '178 Avenue du 17 Juin 1940', '2002-01-02', 'Mathias', 'Engambe', 'France', '92500', '2 Résidence La Lutèce', '178 Avenue du 17 Juin 1940, 2 Résidence La Lutèce', 'Rueil-Malmaison', '777375048', 'Mr'),
(3, 'H-456', 'krish@yahoo.fr', 0, 'aq1b3cb4adf50ef6b9507e8830daf118823deefae0a25', '74efb3c2125a4fc1e1b6ccf5cb831506c373753b1632409684', 'Nanterre', '2002-01-02', 'Krishnat', 'Hassan', 'Sri Lanka', '66789', '', '1 Rue Maréchal Joffre', 'Nanterre', '06 22 33 44 55', 'Mr'),
(4, 'C-805', 'ulysse.cochard@gmail.com', 0, 'aq18433c92daeae67a09f17251c15fde0fd2258318b25', '4b609edf6df8efd2fe878160aafa99804c72280a1639919661', '12 rue des hibiscus', '2001-04-15', 'Ulysse', 'Cochard', 'France', '92500', '', '12 rue des hibiscus', 'Rueil-Malmaison', '07 55 66 77 88', 'Mr'),
(10, 'H-545', 'phelisiop@gmail.com', 0, 'aq16a15bbc90d7c6c501b1c2c32ac5b76fb865d926225', '7668ffcb2e4ac9f893c16dfc33c8832c689c8b2c1640012607', '77  rue du gouverneur general eboue', '2006-04-11', 'krish', 'hassan', 'France', '92130', NULL, 'qsdqsdgdsdgsdg', 'Nanterre', '0614946804', 'Mr'),
(11, 'G-878', 'tomgely78@gmail.com', 0, 'aq1d4c3df8920c06532dee578e41dc90a5577593e6725', '451a2630a57aea5c3f39fbb7b9d8c795675519e11640359814', '9 rue francois Mansart', '2002-10-05', 'Tom', 'Gely', 'France', '78280', NULL, '9 rue francois Mansart', 'Guyancourt', '07 81 91 75 74', 'Mr'),
(12, 'D-878', 'didier.dupont@gmail.com', 0, 'aq1d4c3df8920c06532dee578e41dc90a5577593e6725', '99d84e40611f1e0e7851ee7a26eb1ed4d7973f231640440285', '1 rue du bonheur', '1988-10-23', 'Didier', 'Dupont', 'France', '75000', NULL, '1 rue du bonheur', 'Paris', '06 80 90 70 60', 'Mr'),
(13, 'B-365', 'Phil.binoche@gmail.com', 0, 'aq1d4c3df8920c06532dee578e41dc90a5577593e6725', 'b01cee678f7a628374f508b02d6522c965a799551640440717', '5 avenue Jean Jaures', '1970-02-10', 'Philippe', 'Binoche', 'France', '13000', NULL, ' 5 avenue Jean Jaures', 'Marseille', '06 10 20 30 40 ', 'Mr'),
(14, 'R-549', 'nico.robin@gmail.com', 0, 'aq1d4c3df8920c06532dee578e41dc90a5577593e6725', '45f81f804b0f473e0b8241a82ae027a71ad54ea01640440873', '2 Rue des graviers', '1990-02-05', 'Nico', 'Robin', 'France', '69000', NULL, '2 rue des graviers', 'Lyon', '07 88 99 11 22 ', 'Mme'),
(15, 'D-511', 'Fabienne.durant@gmail.com', 0, 'aq1d4c3df8920c06532dee578e41dc90a5577593e6725', '936c700556fde1b2a3f635a307a8ddf8139e2c181640441529', '21 Rue du monde', '1968-07-12', 'Fabienne', 'Durant', 'France', '78140', NULL, '21 Rue du monde', 'Vélizy', '06 50 12 36 78', 'Mme'),
(16, 'D-747', 'Fabien.durant@gmail.com', 0, 'aq1d4c3df8920c06532dee578e41dc90a5577593e6725', '54fdc905a5375ad96b11703c5c5fd5991df593001640442008', '21 Rue du monde', '1960-05-10', 'Fabien', 'Durant', 'France', '78140', NULL, '21 rue du monde', 'Velizy', '06 10 11 12 13', 'Mr'),
(17, 'Y-889', 'inesyapa@gmail.com', 0, 'aq1d4c3df8920c06532dee578e41dc90a5577593e6725', '5ccf4eb202b7c1d1a9885c9759fdbb75776b1c8e1640442383', ' 1 Boulevard du Chateau', '2003-03-10', 'Ines', 'Yapa', 'France', '91000', NULL, '1 Boulevard du Chateau', 'Evry', '07 50 49 48 10', 'Mme'),
(18, 'D-321', 'Veroduchemin@gmail.com', 0, 'aq1d4c3df8920c06532dee578e41dc90a5577593e6725', '771509f614600ae5a9b7c50aae0e9c2e30e171021640443046', '1 Rue du Chateau', '1950-09-30', 'Veronique', 'Duchemin', 'France', '78000', NULL, '1 Rue du Chateau', 'versailles', '06 52 41 30 20', 'Mme'),
(19, 'P-546', 'pashouget@gmail.com', 0, 'aq1d4c3df8920c06532dee578e41dc90a5577593e6725', '5e529f67373ab74f3392faac67a15e920331db361640443314', '3 rue du grand pré', '1989-04-04', 'Pascale', 'Houget', 'France', '78300', NULL, '3 rue du grand pré', 'Voisins-le-bretonneux', '06 84 94 62 51', 'Mme'),
(20, 'M-133', 'Xavmontpar@gmail.com', 0, 'aq1d4c3df8920c06532dee578e41dc90a5577593e6725', '33e36ada3675f0f83ae647c0df4c55c3a40df08a1640443597', '9 Rue de la ferme', '1962-03-10', 'Xavier', 'Montpar', 'France', '17000', NULL, '9 Rue de la ferme', 'Bordeaux', '06 20 41 56 87', 'Mr'),
(21, 'M-896', 'olimagenaud@gmail.com', 0, 'aq1d4c3df8920c06532dee578e41dc90a5577593e6725', '5f72c304c6ae2abbc41eb42ad18114ef1a6b8ab71640527889', '6 rue des raviolis', '1976-10-20', 'Olivier', 'Magenau', 'France', '78300', NULL, '1 place bernard cheramy', 'Trappes', '06 53 47 89 10', 'Mr'),
(22, 'L-894', 'ericlezed@gmail.com', 0, 'aq1d4c3df8920c06532dee578e41dc90a5577593e6725', 'a865e6268859793d6cb8e28204f03ab233be40121640528065', '1 place des coquelicot', '1960-08-24', 'Eric', 'Lezed', 'France', '65680', NULL, '1 place des coquelicot', 'Lille', '06 69 80 69 10', 'Mr'),
(23, 'B-754', 'karimbenzegoal@gmail.com', 0, 'aq1d4c3df8920c06532dee578e41dc90a5577593e6725', 'b56754bd53e4a2cfa0f3f20267e3186983c2e1451640528223', '1 Place du foot', '1990-09-09', 'Karim', 'Benzema', 'France', '40000', NULL, '1 Place du foot', 'Brest', '06 50 40 30 20', 'Mr'),
(24, 'M-656', 'florentman@gmail.com', 0, 'aq1d4c3df8920c06532dee578e41dc90a5577593e6725', '406a1f4e585a14a87cd803036d84722d98dc6fdf1640528313', '10 Rue des biscottes ', '1992-06-05', 'Florent', 'Manaudou', 'France', '80000', NULL, '10 Rue des biscottes ', 'Nice', '06 88 77 99 44', 'Mr'),
(25, 'R-875', 'tedriner@gmail.com', 0, 'aq1d4c3df8920c06532dee578e41dc90a5577593e6725', '1f4e7b4d2a28b5b825a772d6e0ba6e3c601b5c881640528412', '1 Boulevard des prises', '1990-03-10', 'Teddy', 'Riner', 'France', '50000', NULL, '1 Boulevard des prises', 'Strasbourg', '06 85 64 21 37', 'Mr'),
(26, 'H-256', 'marierondelle@gmail.com', 0, 'aq1d4c3df8920c06532dee578e41dc90a5577593e6725', '0cf17c838cde6728574aee2b7e4a1d6ace03831b1640528831', '8 Rue des koalas', '1996-01-20', 'Marie', 'Hirondelle', 'Belgique', '01000', NULL, '8 Rue des koalas', 'Bruxelles', '06 23 45 89 74', 'Mme'),
(27, 'P-456', 'Poulard@gmail.com', 0, 'aq1d4c3df8920c06532dee578e41dc90a5577593e6725', '540ba28962463b034c5795aa9076859eb5964a0f1640529087', '1 Rue des abricots', '1998-06-30', 'Raoul', ' Poulard', 'France', '41000', NULL, '1 Rue des abricots', ' Rennes', '06 50 30 51 84', 'Mr'),
(28, 'T-954', 'tosylvie@gmail.com', 0, 'aq1d4c3df8920c06532dee578e41dc90a5577593e6725', 'd1da56df3260acb1f7afe20aa015832f3da51a741640529214', '1 Rue des brioches', '1996-06-06', 'Sylvie', 'Toster', 'France', '64000', NULL, '1 Rue des brioches', 'Biarritz', '06 51 32 61 84', 'Mme'),
(29, 'L-755', 'sophielmtre@gmail.com', 0, 'aq1d4c3df8920c06532dee578e41dc90a5577593e6725', '7d465532c1bca7625297417cb0704785157eba771640529778', '9 Rue du Temps', '1996-07-08', 'Sophie', 'Lamontre', 'France', '30000', NULL, '9 Rue du Temps', 'Montellimar', '06 50 51 61 18', 'Mme'),
(30, 'L-324', 'lamoellegas@gmail.com', 0, 'aq1d4c3df8920c06532dee578e41dc90a5577593e6725', '60c5ed8a82088bb26e3f52296950b53b669ee10a1640529985', '162 Avenue du Fleuve', '2000-12-30', 'Gaston', 'Lamoelle', 'France', '69000', NULL, '162 Avenue du Fleuve', 'Lyon', '06 80 94 65 31', 'Mr'),
(31, 'F-186', 'Opheliefi@gmail.com', 0, 'aq1d4c3df8920c06532dee578e41dc90a5577593e6725', '9bc49a8a3775d6757bff58e5139a6bd21666109e1640530209', '1 Place des brocolis', '1999-11-02', 'Ophelie', 'Fila', 'France ', '91000', NULL, '1 Place des brocolis', 'Boulogne', '06 21 34 68 97 ', 'Mme'),
(32, 'R-422', 'Loloranler@gmail.com', 0, 'aq1d4c3df8920c06532dee578e41dc90a5577593e6725', '64217aa3cf6b0c2a3df97fc044a208d488b1addb1640530389', '1 Rue Georges Haussman', '1998-11-06', 'Lorenzo', 'Ranler', 'France', '66000', NULL, '1 Rue Georges Haussman', 'Reims', '06 78 78 77 91', 'Mr'),
(33, 'A-784', 'Jeanamr@gmail.com', 0, 'aq1d4c3df8920c06532dee578e41dc90a5577593e6725', '20359390b6560921b8481591baf196ca693000dc1640530515', '1 Rue Jean Macé', '1997-02-10', 'Jean', 'Aimarre', 'France', '20000', NULL, '1 Rue Jean Macé', 'Toulon', '06 30 30 31 31', 'Mr'),
(34, 'F-912', 'jenfnito@gmail.com', 0, 'aq1d4c3df8920c06532dee578e41dc90a5577593e6725', 'f369313b01260c97bb854e6279ef3dff432389d41640530663', '1 place du Colizée', '2005-06-03', 'Jennifer', 'Finito', 'Italie', '10000', NULL, '1 place du Colizée', 'Rome', '06 10 30 30 45', 'Mme'),
(35, 'H-603', 'Hamilton@gmail.com', 0, 'aq10c67e4bb080125ecd451c6e91a2e8f8fb6a1a7c025', '07e0460e5093a90c582bcf4e6c76f5e8ddd3739c1640546372', '444 BackerStreet', '0985-03-15', 'Lewis', 'Hamilton', 'Angleterre', '87241', NULL, '12 Rue des Monaco', 'Steevenage', '333-777-555', 'Mr'),
(36, 'E-788', 'goubi@gmail.com', 0, 'aq1364dc8ef50e10c8bd71f727e96887b0c405ac75925', 'c048fce1513eb31946f398e52d52f62f5d66305a1640775431', '2 avenue du 18 juin 1940', '2000-10-26', 'Alicia', 'Engambe', 'France', '92500', NULL, '2 avenue du 18 juin 1940', 'Rueil-Malmaison', '0668264420', 'Mme');

-- --------------------------------------------------------

--
-- Structure de la table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `marque` varchar(255) NOT NULL,
  `image` text NOT NULL,
  `reference` text NOT NULL,
  `description` text NOT NULL,
  `couleur` text NOT NULL,
  `taille` text NOT NULL,
  `categorie` varchar(11) NOT NULL,
  `sous_categorie` varchar(255) NOT NULL,
  `nombre_stock` int(11) NOT NULL DEFAULT 1,
  `poids` int(11) NOT NULL DEFAULT 0,
  `prix_achat_HT` float NOT NULL,
  `prix_vente_HT` float NOT NULL DEFAULT 0,
  `priceTTC` float NOT NULL,
  `tauxTVA` float NOT NULL,
  `remise` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `products`
--

INSERT INTO `products` (`id`, `marque`, `image`, `reference`, `description`, `couleur`, `taille`, `categorie`, `sous_categorie`, `nombre_stock`, `poids`, `prix_achat_HT`, `prix_vente_HT`, `priceTTC`, `tauxTVA`, `remise`) VALUES
(1, 'Adidas', 'T-shirt_blanc1.jpg', 'addTshBlack1', 'T-shirt blanc d\'été hyper stylé', 'Blanc', '34-36-38-40-42-44-46', 'Femme', 'T-shirt', 10, 12, 8.5, 28.5, 34.2, 20, 50),
(2, 'nike', 'nike_sportswear_jaune.jpg', 'NikeSportswearJ', 'Le pantalon Nike Sportswear est un incontournable fabriqué dans un tissu Fleece épais au fini semi-brossé.', 'jaune', 'S,L,XL', 'Homme', 'jogging', 10, 300, 20, 75, 90, 20, 0),
(3, 'adidas', 'pantalon_adidas_noir.jpg', 'JoggingAdidasN1', 'Pantalon d\'entraînement brodé bandes adidas le long des jambes et logo adidas Originals sur l\'avant.', 'Blanc', 'S,L,XL', 'Homme', 'jogging', 10, 280, 12, 60, 72, 20, 0),
(4, 'nike', '1.jpg', 'JoggingNikeN3', 'Jogging nike confortable et pratique pour le sport. ', 'noir ', 'S,L,XL', 'Homme', 'jogging', 10, 300, 20, 75, 90, 20, 0),
(5, 'nike', '1639851192shortBlanc.jpg', 'shtBlan41436', 'Ce short est conçu dans un tissu anti-transpiration. Produit en fibres de polyester recyclé.', 'blanc', 'S,L', 'Homme', 'short', 10, 80, 5, 40, 48, 20, 0),
(6, 'nike', 'sweat_bleu.jpg', 'Nike Sportswear Club Fleece', 'sweat à capuche Nike Sportswear Club Fleece', 'bleu', 'S,XL', 'Homme', 'sweat', 10, 200, 14, 55, 66, 20, 0),
(7, 'nike', 'polo_tenis.jpg', 'NikeCourt Dri-FIT ADV Slam', 'Confectionné avec nos matières les plus innovantes, le polo NikeCourt Dri-FIT ADV Slam est conçu pour vous permettre de donner le meilleur de vous-même.', 'blanc', 'S,L,XL', 'Homme', 'polo', 10, 120, 12, 40, 48, 20, 0),
(8, 'nike', 'haut_dri.jpg', 'Nike Dri-FIT Run Division', 'Soyez prêt à affronter le froid avec le haut Nike Dri-FIT Run Division.Avec sa laine intégrée au tissu, il vous permet de bénéficier d\'un maximum de chaleur', 'vert', 'S,L', 'Homme', 'T-shirt', 10, 80, 10, 25, 30, 20, 0),
(9, 'The North Face', 'shortNoirTheNorthFace.jpg', 'thnShtBlack46587', 'short d\'été', 'Noir', 'S-M-L-XL-XXL', 'Homme', 'short', 10, 250, 14, 35, 42, 20, 0),
(10, 'nike', '1639927049shortBlanc.jpg', 'shtNikeBLN1425', 'short décontracté de sport. Produit en matière synthétique', 'Blanc', 'S,M,L,XL,XXL', 'Homme', 'short', 14, 85, 10.5, 30, 36, 20, 0),
(11, 'nike', '1639929745shortNoir.jpg', 'fefezf1144', 'short décontracté', 'Noir', 'L,XL,XXL', 'Homme', 'short', 14, 90, 10.5, 35, 42, 20, 0),
(12, 'nike', '1639935706Nike_doudoune.jpg', 'doudBlkNike1235', 'Passer l\'hiver au chaud avec cette doudoune 100% polyester', 'Noir', 'M,L,XL,XXL,XXXL', 'Homme', 'Blouson', 15, 330, 35, 70, 84, 20, 0),
(13, 'nike', '1640096000brassiere_blanche_nike.jpg', 'brsNikeWht123', 'Brassière de sport', 'Blanc', '32-34-36-38-40-42-44-46-48-50', 'Femme', 'brassière', 15, 25, 7.5, 17, 20.4, 20, 0),
(14, 'nike', '1640097567Legging_noir_nike.jpg', 'leggBlk4562', 'Legging de sport', 'Noir', '32-34-36-38-40-42-44-46-48-50', 'Femme', 'legging', 10, 40, 9, 20, 24, 20, 0),
(15, 'Adidas', '1640098931adidas-sweat.jpg', 'swtAddgr125', 'Sweat décontracté', 'vert', '36-38-40-42-44-46', 'Femme', 'sweat', 25, 200, 30, 60, 72, 20, 0),
(16, 'Adidas', '1640099185adidas-doudoune-noir.jpg', 'doudBlaADD45', 'Passer l\'hiver au chaud avec cette doudoune', 'Noir', '34-36-38-40-42-44-46-48', 'Femme', 'Blouson', 15, 400, 55, 85, 102, 20, 0),
(18, 'Adidas', '1640101306adidas-sweatshirts-oversized-femme.jpg', 'swtAddgrey12', 'adidas-sweatshirts-oversized-femme', 'gris', '46-48-50-52-54-56-58', 'Femme', 'sweat', 40, 220, 25, 40, 48, 20, 0),
(19, 'Adidas', '1640102252adidas-sweat-shirt.jpg', 'swtAddBl144', 'Sweat décontracté', 'bleu', '32-34-36-38-40-42-44-46-48-50-52-54', 'Femme', 'sweat', 15, 200, 17, 30, 36, 20, 0),
(20, 'Adidas', '1640102544adidas-sweat.jpg', 'rfezdae7895', 'adidas-sweat-shirt-adicolor', 'gris', '36-38-40-42-44-46', 'Femme', 'sweat', 30, 200, 17, 30, 36, 20, 0),
(21, 'nike', '1640102840brassiere_noir_nike.jpg', 'brsNikeBlk123', 'Brassière de sport maintient la poitrine pendant l\'effort', 'Noir', '32-34-36-38-40-42-44-46-48-50-52-54', 'Femme', 'brassière', 40, 25, 9, 17, 20.4, 20, 0),
(24, 'the north face', '1640444807test.jpg', 'BrsTHNblue1212', 'Brassière de sport maintient la poitrine pendant l\'effort', 'bleu', 'S-M-L-XL-XXL', 'Femme', 'brassière', 15, 25, 8, 20, 24, 20, 0),
(25, 'the north face', '1640445137test.jpg', 'BrsTHNpink1212', 'Brassière de sport. Maintient bien la poitrine pendant l\'effort', 'bleu', 'S-M-L-XL-XXL', 'Femme', 'brassière', 15, 25, 8, 20, 24, 20, 0),
(27, 'Adidas', '1640108984test.jpg', 'wetgxhyr', 'Brassière de sport', 'orange', 'S-M-L-XL-XXL', 'Femme', 'brassière', 10, 25, 12, 28, 33.6, 20, 0),
(28, 'Adidas', '1640109178test.jpg', 'addBrsWht45', 'Brassière de sport. Maintient bien la poitrine', 'Blanc', 'S-M-L-XL-XXL', 'Femme', 'brassière', 10, 25, 12, 28, 33.6, 20, 0),
(29, 'Adidas', '1640109472test.jpg', 'addBrsBlk4546', 'Brassière de sport', 'Noir', 'S-M-L-XL-XXL', 'Femme', 'brassière', 30, 25, 12, 28, 33.6, 20, 0),
(30, 'Adidas', '1640109657te.jpg', 'addbleu4644', 'Brassière de sport', 'bleu', 'S-M-L-XL-XXL', 'Femme', 'brassière', 25, 25, 12, 28, 33.6, 20, 0),
(31, 'Adidas', '1640109791te.jpg', 'addOrange56415', 'Brassière de sport', 'orange', 'S-M-L-XL-XXL', 'Femme', 'brassière', 25, 25, 12, 28, 33.6, 20, 0),
(32, 'Adidas', '1640109894te.jpg', 'addRed133525', 'Brassière de sport', 'rouge', 'S-M-L-XL-XXL', 'Femme', 'brassière', 25, 25, 12, 28, 33.6, 20, 0),
(33, 'Adidas', '1640110204te.jpg', 'addRed259', 'Brassière de sport', 'rouge', 'S-M-L-XL-XXL', 'Femme', 'brassière', 10, 25, 12, 28, 33.6, 20, 0),
(34, 'Adidas', '1640110521te.jpg', 'wdtwetdh', 'Brassière de sport', 'rose', 'S-M-L-XL-XXL', 'Femme', 'brassière', 20, 25, 12, 28, 33.6, 20, 0),
(35, 'Adidas', '1640110753blue.jpg', 'addPrimeBlue45', 'Brassière de sport', 'bleu', 'S-M-L-XL', 'Femme', 'brassière', 20, 25, 12, 28, 33.6, 20, 0),
(36, 'nike', '1640380818blanc.jpg', 'brsNikeWht1111', 'Brassière de sport. Maintient bien la poitrine durant l\'effort', 'Blanc', 'XS-S-M-L-XL-XXL', 'Femme', 'brassière', 40, 25, 15, 35, 42, 20, 0),
(37, 'Adidas', '1640111059bleu.jpg', 'blubrsadd446', 'Brassière de sport', 'bleu', 'S-M-L-XL-XXL', 'Femme', 'brassière', 15, 25, 12, 28, 33.6, 20, 0),
(39, 'nike', '1640112170doudoune_nike_roes.jpg', 'dodNikPink', 'passer l\'hiver au chaud avec cette doudoune', 'rose', '36-38-40-42-44-46-48-50', 'Femme', 'Blouson', 100, 300, 45, 95, 114, 20, 0),
(40, 'Adidas', '1640113174test.jpg', 'zrfzfzEf', 'Pull décontracté', 'rose', '36-38-40-42-44-46', 'Femme', 'sweat', 15, 220, 15, 25, 30, 20, 0),
(41, 'nike', '1640113294test.jpg', 'swtNikeBl4654', 'Sweat décontracté', 'bleu', '36-38-40-42-44-46', 'Femme', 'sweat', 25, 200, 15, 25, 30, 20, 0),
(42, 'nike', '1640113555test.jpg', 'pllldtgeNike2', 'Le sweat à capuche Nike Air, sa coupe courte tombe au niveau de la taille ', 'noir', '36-38-40-42-44-46', 'Femme', 'crop-top', 15, 240, 25, 35, 42, 20, 0),
(43, 'nike', '1640113974test.jpg', 'tgwwtrh', 'Sweat décontracté', 'Noir', '36-38-40-42-44-46', 'Femme', 'sweat', 15, 220, 25, 35, 42, 20, 0),
(44, 'nike', '1640114072test.jpg', 'swtBlack4645555', 'Sweat décontracté', 'noir', '36-38-40-42-44-46', 'Femme', 'sweat', 15, 180, 25, 35, 42, 20, 0),
(45, 'nike', '1640114597test.jpeg', 'swtxxxlzNike456', 'Sweat de sport. Evacue la transpiration', 'bleu', '34-36-38-40-42-44-46-48', 'Femme', 'sweat', 15, 180, 15, 25, 30, 20, 0),
(46, 'nike', '1640114684gris.jpg', 'NikeswtGrey45', 'Sweat de sport, coupe fuselé', 'gris', '36-38-40-42-44-46', 'Femme', 'sweat', 10, 180, 15, 25, 30, 20, 0),
(47, 'Adidas', '1640119314test.jpeg', 'addWht556swt', 'Sweat décontracté', 'Blanc', '36-38-40-42-44-46', 'Femme', 'sweat', 25, 200, 15, 25, 30, 20, 0),
(48, 'Adidas', '1640119455test.jpeg', 'addBlk455566', 'Sweat décontracté', 'Noir', '36-38-40-42-44-46', 'Femme', 'sweat', 15, 200, 15, 25, 30, 20, 0),
(49, 'Adidas', '1640607411test.jpg', 'thstBlakNike4555', 'T-shirt décontracté', 'rose', '36-38-40-42-44-46', 'Femme', 'T-shirt', 50, 200, 8, 15, 18, 20, 0),
(50, 'Adidas', '1640119838test.jpeg', 'swtAddPink777', 'Sweat de sport', 'rose', '32-34-36-38-40-42-44-46-48-50-52-54', 'Femme', 'sweat', 25, 200, 15, 25, 30, 20, 0),
(51, 'Adidas', '1640120040test.jpeg', 'redAdd789sweat', 'Sweat de sport décontracté', 'rouge', '36-38-40-42-44-46-48-50-52-54', 'Femme', 'sweat', 25, 200, 15, 25, 30, 20, 0),
(52, 'Adidas', '1640120482sweat.jpg', 'swtAdd777', 'Sweat de sport', 'Noir', '32-34-36-38-40-42-44-46-48-50', 'Femme', 'sweat', 15, 200, 15, 25, 30, 20, 0),
(53, 'Adidas', '1640120611sweat.jpg', '1566swtBlkadd', 'Ce sweat-shirt à capuche allie design audacieux et confort ultime. Orné d\'un logo adidas Badge of Sport oversize sur la poitrine', 'noir', '34-36-38-40-42-44-46-48', 'Femme', 'sweat', 20, 150, 15, 25, 30, 20, 0),
(54, 'the north face', '1640121100test.jpg', 'thnBlackFace22', 'Passer l\'hiver au chaud avec cette doudoune', 'Noir', 'S-M-L-XL-XXL', 'Homme', 'Blouson', 20, 300, 50, 90, 108, 20, 0),
(55, 'the north face', '1640121028test.jpg', 'NorthParka4555', 'Passer l\'hiver au chaud avec cette doudoune', 'noir', 'S-M-L-XL-XXL', 'Homme', 'Blouson', 40, 300, 100, 200, 240, 20, 0),
(56, 'the north face', '1640121504test.jpg', 'PrakaGreyFace22', 'Passer l\'hiver au chaud avec cette doudoune', 'gris', 'S-M-L-XL-XXL', 'Homme', 'Blouson', 50, 300, 100, 200, 240, 20, 0),
(57, 'the north face', '1640121965test.jpg', 'blousGrey1235', 'Passer l\'hiver au chaud avec cette doudoune', 'gris', 'XS-S-M-L-XL-XXL', 'Homme', 'Blouson', 20, 330, 80, 180, 216, 20, 0),
(58, 'the north face', '1640122390test.jpg', 'wsetwhtw', 'Passer l\'hiver au chaud avec cette doudoune', 'jaune', '34-36-38-40-42-44-46-48', 'Femme', 'Blouson', 25, 330, 100, 200, 240, 20, 0),
(59, 'the north face', '1640170900test.jpg', '4566swtNorthFace', 'The North Face Sweat Drew Peak Hd Gris Sweat Capuche Homme Multisports', 'gris', 'S-M-L-XL-XXL', 'Homme', 'sweat', 40, 200, 40, 60, 72, 20, 0),
(60, 'the north face', '1640172420test.jpg', 'dodTHNFblack12', 'Avec son design simple mais rafiné, la parka ZANECK noire de NORTH FACE pour femme combine élégance et confort optimal. Coupe longue et épurée ', 'Noir', '38-40-42-44-46-48-50-52-54', 'Femme', 'Blouson', 50, 280, 40, 60, 72, 20, 0),
(61, 'the north face', '1640172789test.jpg', '78WhiteNorthFace', 'parka blanche. ', 'Blanc', '34-36-38-40-42-44-46-48', 'Femme', 'Blouson', 50, 280, 40, 60, 72, 20, 0),
(62, 'the north face', '1640173367test.jpg', 'manParkathn15green', 'La parka Arctic vous protège de la pluie, de la neige, du vent et du froid, et tout ça en restant élégante. Elle est aussi confortable en randonnée', 'vert', 'S-M-L-XL-XXL', 'Homme', 'Blouson', 50, 200, 60, 240, 288, 20, 0),
(63, 'the north face', '1640173506test.jpg', 'tzrfzZZFE', 'La parka Arctic vous protège de la pluie, de la neige, du vent et du froid, et tout ça en restant élégante. Elle est aussi confortable en randonnée', 'gris', 'S-M-L-XL-XXL', 'Homme', 'Blouson', 20, 300, 40, 60, 72, 20, 0),
(64, 'the north face', '1640173779test.jpg', 'totoTHNFblack33', 'La parka Arctic vous protège de la pluie, de la neige, du vent et du froid, et tout ça en restant élégante. Elle est aussi confortable en randonnée', 'Noir', 'S-M-L-XL-XXL', 'Homme', 'Blouson', 60, 300, 45, 65, 78, 20, 0),
(65, 'the north face', '1640174013test.jpg', 'manYellow4665thn', 'La parka Arctic vous protège de la pluie, de la neige, du vent et du froid, et tout ça en restant élégante. Elle est aussi confortable en randonnée', 'marron', 'S-M-L-XL-XXL', 'Homme', 'Blouson', 50, 300, 60, 90, 108, 20, 0),
(66, 'the north face', '1640174281test.jpg', 'girlYellowthNorth666', 'La parka Arctic vous protège de la pluie, de la neige, du vent et du froid, et tout ça en restant élégante. Elle est aussi confortable en randonnée', 'jaune', '36-38-40-42-44-46-48-50-52-54', 'Femme', 'Blouson', 30, 280, 60, 90, 108, 20, 0),
(67, 'the north face', '1640174574test.jpg', 'wdgerwge777', 'La parka Arctic vous protège de la pluie, de la neige, du vent et du froid, et tout ça en restant élégante. Elle est aussi confortable en randonnée', 'violet', '32-34-36-38-40-42-44-46-48-50-52-54', 'Femme', 'Blouson', 40, 280, 40, 80, 96, 20, 0),
(68, 'the north face', '1640174749test2.jpg', 'swtTHNFACEBLACK1', 'Sweat décontracté', 'noir', '32-34-36-38-40-42-44-46-48-50-52-54', 'Femme', 'sweat', 40, 180, 15, 35, 42, 20, 0),
(69, 'the north face', '1640174870test.jpg', 'girlPINKthn444444', 'Sweat ', 'rose', '36-38-40-42-44-46', 'Femme', 'sweat', 15, 180, 15, 35, 42, 20, 0),
(70, 'the north face', '1640174986test.jpg', 'ftfhfxyyf25', 'Sweat décontracté', 'Blanc', '32-34-36-38-40-42-44-46-48-50', 'Femme', 'sweat', 23, 200, 15, 35, 42, 20, 0),
(71, 'the north face', '1640175046test2.jpg', 'manWihte5555thn', 'Sweat décontracté', 'Blanc', 'S-M-L-XL-XXL', 'Homme', 'sweat', 25, 200, 15, 35, 42, 20, 0),
(72, 'the north face', '1640175136test.jpg', 'gggSweatTHNFACE5', 'Sweat décontracté', 'beige', 'S-M-L-XL-XXL', 'Homme', 'sweat', 25, 200, 15, 35, 42, 20, 0),
(73, 'the north face', '1640175321test2.jpg', 'ttstzRKJ', 'Sweat décontracté', 'marron', 'S-M-L-XL-XXL', 'Homme', 'sweat', 25, 200, 15, 35, 42, 20, 0),
(74, 'the north face', '1640175437test.jpg', 'brownThn4566dud', 'La parka Arctic vous protège de la pluie, de la neige, du vent et du froid, et tout ça en restant élégante. Elle est aussi confortable en randonnée', 'marron', 'S-M-L-XL-XXL', 'Homme', 'Blouson', 40, 300, 60, 90, 108, 20, 0),
(75, 'the north face', '1640175544test.jpg', 'bgeThNFAce455swt', 'Sweat décontracté', 'beige', 'S-M-L-XL-XXL', 'Homme', 'sweat', 30, 200, 15, 35, 42, 20, 0),
(76, 'the north face', '1640183045test.jpg', 'legTHNblack', 'Détailsquel que soit l\'endroit où vous vous entraînez, faites confiance au legging mountain athletics. Lisse, doux et extensible,', 'Noir', '36-38-40-42-44-46', 'Femme', 'legging', 20, 20, 7, 15, 18, 20, 0),
(77, 'the north face', '1640183893test.jpg', 'legGirl4577thn', 'Détailsquel que soit l\'endroit où vous vous entraînez, faites confiance au legging mountain athletics. Lisse, doux et extensible,', 'noir', '36-38-40-42-44-46', 'Femme', 'legging', 15, 20, 7, 15, 18, 20, 0),
(78, 'the north face', '1640184064test.jpg', 'legGirlThnGrey22', 'legging mountain athletics. Lisse, doux et extensible', 'gris', '36-38-40-42-44-46', 'Femme', 'legging', 20, 20, 7, 15, 18, 20, 0),
(79, 'the north face', '1640184186test.jpg', 'estgste25THN', 'legging mountain athletics. Lisse, doux et extensible', 'vert', '36-38-40-42-44-46-48-50', 'Femme', 'legging', 20, 20, 7, 15, 18, 20, 0),
(80, 'the north face', '1640184314test.jpg', 'ThnBlulegging45', 'legging mountain athletics. Lisse, doux et extensible', 'bleu', '36-38-40-42-44-46', 'Femme', 'legging', 10, 20, 7, 15, 18, 20, 0),
(81, 'Adidas', '1640185435test.jpg', 'addlegGirlBLK4', 'Tu te sentiras comme une super-héroïne avec ce legging. ', 'Noir', '36-38-40-42-44-46', 'Femme', 'legging', 25, 20, 7, 15, 18, 20, 0),
(82, 'Adidas', '1640185541test.jpg', 'BlackAdd4555', 'Tu te sentiras comme une super-héroïne avec ce legging. ', 'Noir', '32-34-36-38-40-42-44-46-48-50-52-54', 'Femme', 'legging', 40, 200, 7, 15, 18, 20, 0),
(83, 'Adidas', '1640185685test.jpg', 'leglegGrey7788N', 'Le tight Swoosh Nike Sportswear pour Femme est fabriqué à partir d\'un tissu à base de coton extensible pour une tenue confortable', 'gris', '36-38-40-42-44-46', 'Femme', 'legging', 52, 20, 15, 30, 36, 20, 0),
(84, 'Adidas', '1640185802test.jpg', 'regLeggjjjp78', 'Le tight Swoosh Nike Sportswear pour Femme est fabriqué à partir d\'un tissu à base de coton extensible pour une tenue confortable', 'rouge', '34-36-38-40-42-44-46-48', 'Femme', 'legging', 45, 20, 12, 25, 30, 20, 0),
(85, 'Adidas', '1640185998test.jpg', 'Blkadd455leg', 'Le tight Swoosh Nike Sportswear pour Femme est fabriqué à partir d\'un tissu à base de coton extensible pour une tenue confortable', 'noir', '34-36-38-40-42-44-46-48', 'Femme', 'legging', 25, 20, 15, 30, 36, 20, 0),
(86, 'nike', '1640186143test.jpg', 'legNike778999', 'Le tight Swoosh Nike Sportswear pour Femme est fabriqué à partir d\'un tissu à base de coton extensible pour une tenue confortable', 'Noir', '34-36-38-40-42-44-46-48', 'Femme', 'legging', 80, 20, 15, 35, 42, 20, 0),
(87, 'nike', '1640186244test.jpg', 'dddlegBlkNike5', 'Le tight Swoosh Nike Sportswear pour Femme est fabriqué à partir d\'un tissu à base de coton extensible pour une tenue confortable', 'Noir', '34-36-38-40-42-44-46-48', 'Femme', 'legging', 40, 20, 15, 30, 36, 20, 0),
(89, 'nike', '1640186448test.jpg', 'dthewgLeggrey', 'Le tight Swoosh Nike Sportswear pour Femme est fabriqué à partir d\'un tissu à base de coton extensible pour une tenue confortable', 'gris', '34-36-38-40-42-44-46-48', 'Femme', 'legging', 40, 20, 15, 35, 42, 20, 0),
(90, 'nike', '1640186702test.jpg', 'addlegBlak77Nik', 'Le tight Swoosh Nike Sportswear pour Femme est fabriqué à partir d\'un tissu à base de coton extensible pour une tenue confortable', 'Noir', '36-38-40-42-44-46', 'Femme', 'legging', 26, 20, 15, 35, 42, 20, 0),
(91, 'nike', '1640186833test.jpg', 'addBLKleggirl', 'Le tight Swoosh Nike Sportswear pour Femme est fabriqué à partir d\'un tissu à base de coton extensible pour une tenue confortable', 'gris', '36-38-40-42-44-46', 'Femme', 'legging', 30, 20, 15, 35, 42, 20, 0),
(92, 'nike', '1640187475test.jpg', 'nikeBLKGirlLeggg', 'Le tight Swoosh Nike Sportswear pour Femme est fabriqué à partir d\'un tissu à base de coton extensible pour une tenue confortable', 'Noir', '36-38-40-42-44-46', 'Femme', 'legging', 30, 20, 12, 20, 24, 20, 0),
(93, 'Adidas', '1640189004te.jpeg', 'addLeg7888888', 'Le tight Swoosh Nike Sportswear pour Femme est fabriqué à partir d\'un tissu à base de coton extensible pour une tenue confortable', 'Noir', '34-36-38-40-42-44-46-48', 'Femme', 'legging', 30, 20, 8, 15, 18, 20, 0),
(94, 'Adidas', '1640188028test.jpg', 'addrtetsesgte', 'Le tight Swoosh Nike Sportswear pour Femme est fabriqué à partir d\'un tissu à base de coton extensible pour une tenue confortable', 'bleu', '36-38-40-42-44-46', 'Femme', 'legging', 25, 20, 8, 15, 18, 20, 0),
(95, 'Adidas', '1640188316test.jpg', 'legAddviolet17', 'Un bon entraînement repose sur ton rythme, ton environnement et ton équipement. ', 'violet', '36-38-40-42-44-46', 'Femme', 'legging', 20, 20, 8, 15, 18, 20, 0),
(96, 'Adidas', '1640189016test.jpeg', 'gglegblueADD50', 'Un bon entraînement repose sur ton rythme, ton environnement et ton équipement. ', 'bleu', '36-38-40-42-44-46', 'Femme', 'legging', 20, 20, 8, 15, 18, 20, 0),
(97, 'Adidas', '1640189360test.jpeg', 'dodADDhhh45', 'Cette doudoune femmes t\'assure une protection légère contre le froid. Conçue en duvet ultra chaud.', 'Noir', '36-38-40-42-44-46', 'Femme', 'Blouson', 20, 200, 30, 50, 60, 20, 0),
(98, 'Adidas', '1640189570test.jpeg', 'ferrADDdoudBro', 'Cette doudoune femmes t\'assure une protection légère contre le froid. Conçue en duvet ultra chaud.', 'marron', '36-38-40-42-44-46', 'Femme', 'Blouson', 50, 200, 30, 50, 60, 20, 0),
(99, 'Adidas', '1640189688test.jpeg', 'mbappeADDdoud', 'Cette doudoune femmes t\'assure une protection légère contre le froid. Conçue en duvet ultra chaud.', 'bleu', '36-38-40-42-44-46', 'Femme', 'Blouson', 12, 200, 30, 50, 60, 20, 0),
(100, 'Adidas', '1640189863te.jpg', 'ADDredbeurette', 'Cette doudoune femmes t\'assure une protection légère contre le froid. Conçue en duvet ultra chaud.', 'rouge', '34-36-38-40-42-44-46-48', 'Femme', 'Blouson', 30, 200, 30, 50, 60, 20, 0),
(101, 'Adidas', '1640189932test.jpeg', 'blousADDPurpl23', 'Cette doudoune femmes t\'assure une protection légère contre le froid. Conçue en duvet ultra chaud.', 'violet', '36-38-40-42-44-46', 'Femme', 'Blouson', 50, 200, 30, 50, 60, 20, 0),
(103, 'Adidas', '1640190631test.jpeg', 'BlackAddDoud4555', 'passer l\'hiver au chaud avec cette doudoune', 'Noir', '36-38-40-42-44-46', 'Femme', 'Blouson', 50, 240, 45, 65, 78, 20, 0),
(104, 'Adidas', '1640190962test.jpeg', 'tatoupou778', 'Les petits matins sont plus agréables lorsque vous êtes au chaud.', 'bleu', '36-38-40-42-44-46', 'Femme', 'Blouson', 70, 200, 40, 60, 72, 20, 0),
(105, 'the north face', '1640191141test.jpeg', 'memTHNblous7', 'Les petits matins sont plus agréables lorsque vous êtes au chaud.', 'Noir', '36-38-40-42-44-46', 'Femme', 'Blouson', 30, 200, 40, 60, 72, 20, 0),
(106, 'the north face', '1640191320test.jpeg', 'voAdd', 'Les petits matins sont plus agréables lorsque vous êtes au chaud.', 'noir', '36-38-40-42-44-46', 'Femme', 'Blouson', 30, 200, 40, 60, 72, 20, 0),
(107, 'nike', '1640191476test.jpeg', 'LassDoodNikeWht', 'Les petits matins sont plus agréables lorsque vous êtes au chaud.', 'Blanc', '36-38-40-42-44-46', 'Femme', 'Blouson', 30, 200, 45, 65, 78, 20, 0),
(108, 'nike', '1640191625test.jpeg', 'alalNikeSweat', 'Sweat décontracté', 'noir', '36-38-40-42-44-46', 'Femme', 'sweat', 23, 140, 15, 35, 42, 20, 0),
(109, 'nike', '1640191759test.jpeg', 'wdthtxyjy', 'Sweat décontacté', 'Blanc', '36-38-40-42-44-46', 'Femme', 'sweat', 40, 140, 15, 35, 42, 20, 0),
(110, 'Adidas', '1640191947test.jpg', 'padAddJogBlk', 'Jogging de sport', 'Noir', '36-38-40-42-44-46', 'Femme', 'Jogging', 30, 150, 40, 60, 72, 20, 0),
(111, 'nike', '1640354627test.jpg', 'jogNikPink4546', 'DOUX AVEC DES DÉTAILS CÔTELÉS', 'rose', '34-36-38-40-42-44-46-48', 'Femme', 'Jogging', 40, 220, 30, 50, 60, 20, 0),
(112, 'Adidas', '1640371327test.jpg', 'jogAddGirl4655gr', 'jogging de sport', 'gris', '34-36-38-40-42-44-46-48', 'Femme', 'Jogging', 35, 220, 30, 50, 60, 20, 0),
(113, 'the north face', '1640371538test.jpg', 'jogTHN456blk', 'jogging de sport', 'Noir', '34-36-38-40-42-44-46-48', 'Femme', 'Jogging', 30, 200, 25, 40, 48, 20, 0),
(114, 'nike', '1640371724test.jpg', 'nikejogGREY7777', 'Jogging gris femme nike fleece pant', 'gris', '34-36-38-40-42-44-46-48', 'Femme', 'Jogging', 60, 220, 30, 50, 60, 20, 0),
(115, 'nike', '1640371871test.jpg', 'joggirlgreyGIRL', 'Jogging gris femme nike ', 'gris', '34-36-38-40-42-44-46-48', 'Femme', 'Jogging', 15, 200, 25, 40, 48, 20, 0),
(116, 'nike', '1640371994test.jpg', 'Blkjog456fille', 'Jogging noir femme nike ', 'Noir', '34-36-38-40-42-44-46-48', 'Femme', 'Jogging', 16, 220, 30, 50, 60, 20, 0),
(117, 'nike', '1640372138test.jpg', 'jogg78Greygirl', 'Jogging gris femme nike', 'gris', '36-38-40-42-44-46', 'Femme', 'Jogging', 30, 200, 25, 40, 48, 20, 0),
(118, 'Adidas', '1640372270test.jpg', 'addBLKjog77', 'jogging de sport', 'Noir', '36-38-40-42-44-46', 'Femme', 'Jogging', 60, 200, 25, 40, 48, 20, 0),
(119, 'Adidas', '1640372429test.jpg', 'addBLKjogGirl88', 'Jogging noir femme nike ', 'Noir', '36-38-40-42-44-46', 'Femme', 'Jogging', 40, 200, 25, 40, 48, 20, 0),
(120, 'the north face', '1640372901test.jpg', 'thnJoggGreen', 'jogging coupe-vent femme', 'vert', '36-38-40-42-44-46', 'Femme', 'Jogging', 30, 200, 25, 35, 42, 20, 0),
(121, 'the north face', '1640373115test.jpg', 'doudthnGreen7895', 'passer l\'hiver au chaud', 'vert', '36-38-40-42-44-46', 'Femme', 'Blouson', 60, 300, 50, 80, 96, 20, 0),
(122, 'the north face', '1640373229test.jpg', 'doreDODOrthn4', 'passer l\'hiver au chaud avec cette doudoune', 'doré ', '36-38-40-42-44-46', 'Femme', 'Blouson', 40, 300, 50, 80, 96, 20, 0),
(123, 'nike', '1640373638test.jpg', 'doudNikNlk4556', 'doudoune femme', 'bleu', '36-38-40-42-44-46', 'Femme', 'Blouson', 25, 250, 30, 50, 60, 20, 0),
(124, 'Adidas', '1640373815test.jpg', 'addDodGD2507', 'Nouvelle Collection adidas 2021 Modèle Slim GD2507', 'Noir', '36-38-40-42-44-46', 'Femme', 'Blouson', 20, 200, 40, 60, 72, 20, 0),
(125, 'Adidas', '1640373942test.jpg', 'addPink7863Girl', 'jogging de sport', 'rouge', '36-38-40-42-44-46', 'Femme', 'Jogging', 50, 200, 30, 50, 60, 20, 0),
(126, 'Adidas', '1640374087test.jpg', 'roseJogAdd4545', 'jogging femme', 'rose', '36-38-40-42-44-46-48-50-52-54', 'Femme', 'Jogging', 25, 200, 30, 50, 60, 20, 0),
(127, 'Adidas', '1640374224test.jpg', 'noirAddjog5666girl', 'jogging femme', 'Noir', '36-38-40-42-44-46', 'Femme', 'Jogging', 5, 200, 30, 50, 60, 20, 0),
(128, 'Adidas', '1640377773test.jpg', 'redJOGGnike77', 'jogging hyper stylé', 'rouge', '36-38-40-42-44-46', 'Femme', 'Jogging', 7, 2180, 25, 35, 42, 20, 0),
(129, 'Adidas', '1640377974test.jpg', '44PinknikJog', 'jogging décontracté', 'rose', '36-38-40-42-44-46', 'Femme', 'Jogging', 33, 200, 30, 50, 60, 20, 0),
(130, 'Adidas', '1640378185test.jpg', 'originals58953', 'jogging hyper stylé originals', 'bordeaux', '36-38-40-42-44-46', 'Femme', 'Jogging', 66, 200, 40, 60, 72, 20, 0),
(131, 'Adidas', '1640378595test.jpg', 'pinkADDjog899', 'jogging femme hyper stylé', 'rose', '32-34-36-38-40-42-44-46-48-50-52-54', 'Femme', 'Jogging', 70, 200, 25, 35, 52.5, 50, 0),
(132, 'Adidas', '1640378794test.jpg', 'Blackoriginals44', 'Nouvelle colection originals', 'Noir', '32-34-36-38-40-42-44-46-48-50-52-54', 'Femme', 'Jogging', 44, 150, 35, 55, 66, 20, 0),
(133, 'Adidas', '1640379135test.jpg', 'AddBlueOriginals33', 'Nouvelle collection addidas originals femme ', 'bleu', '38-40-42-44-46-48-50-52-54', 'Femme', 'Jogging', 80, 180, 35, 55, 66, 20, 0),
(134, 'Adidas', '1640379344test.jpg', 'blkOrinals11', 'Nouvelle collection addidas originals', 'Noir', '36-38-40-42-44-46-48-50-52-54', 'Femme', 'Jogging', 60, 180, 35, 55, 66, 20, 0),
(135, 'nike', '1640379787test.jpg', 'brsTestNikeblk', 'brassière de sport', 'Noir', 'S-M-L-XL-XXL', 'Femme', 'brassière', 10, 25, 8, 20, 24, 20, 0),
(136, 'nike', '1640380252test.jpg', 'brsNikegirl55gg', 'brassière femme', 'Noir', 'S-M-L-XL-XXL', 'Femme', 'brassière', 10, 25, 8, 15, 18, 20, 0),
(137, 'nike', '1640380352test.jpg', 'fffbrsBlkNike77', 'brassière femme', 'Noir', 'S-M-L-XL-XXL', 'Femme', 'brassière', 33, 25, 8, 15, 18, 20, 0),
(138, 'nike', '1640380569test.jpg', 'nimpbrsNike', 'brassière femme', 'Blanc', 'S-M-L-XL-XXL', 'Femme', 'brassière', 60, 25, 8, 15, 18, 20, 0),
(139, 'nike', '1640381148test.jpg', 'brsgreyNike12', 'brassière d\'entrainement', 'gris', '36-38-40-42-44-46', 'Femme', 'brassière', 50, 25, 8, 15, 18, 20, 0),
(140, 'nike', '1640444275test.jpg', 'brsRoseNike533', 'Brassière de sport Nike', 'rose', 'S-M-L-XL-XXL', 'Femme', 'brassière', 20, 25, 8, 15, 18, 20, 0),
(141, 'the north face', '1640459918test.jpg', 'cycWHtthn456', 'cycliste femme', 'Blanc', '36-38-40-42-44-46', 'Femme', 'cycliste', 40, 25, 8, 15, 18, 20, 0),
(142, 'the north face', '1640448775test.jpg', 'cycBlkthngirl', 'cycliste femme', 'Noir', '34-36-38-40-42-44-46-48', 'Femme', 'cycliste', 26, 20, 8, 15, 18, 20, 0),
(143, 'the north face', '1640448928test.jpg', 'cycPurplethn4333', 'cycliste femme', 'violet', '34-36-38-40-42-44-46-48', 'Femme', 'cycliste', 77, 20, 8, 15, 18, 20, 0),
(144, 'Adidas', '1640449405test.jpg', 'H56440', 'Nouvelle Collection adidas 2021 Modèle H56440', 'Blanc', '34-36-38-40-42-44-46-48', 'Femme', 'cycliste', 56, 25, 15, 25, 30, 20, 0),
(145, 'the north face', '1640449717test.jpg', 'cycBlkthngirl100', 'cycliste femme', 'Noir', '36-38-40-42-44-46-48-50-52-54', 'Femme', 'cycliste', 13, 20, 8, 15, 18, 20, 0),
(146, 'the north face', '1640450298test.jpg', 'addcycGirl12', 'cycliste femme', 'Noir', '36-38-40-42-44-46', 'Femme', 'cycliste', 10, 25, 8, 15, 18, 20, 0),
(147, 'Adidas', '1640450858test.jpg', 'bigCycAdd456', 'cycliste pour les rondes', 'marron', '44-46-48-50-52-54-56-58', 'Femme', 'cycliste', 30, 20, 8, 15, 18, 20, 0),
(148, 'Adidas', '1640451085test.jpg', 'redCycAdd88', 'cycliste femme', 'rouge', '34-36-38-40-42-44-46-48', 'Femme', 'cycliste', 15, 25, 8, 15, 18, 20, 0),
(149, 'Adidas', '1640451162test.jpg', 'blueCycAdd45', 'cycliste de sport femme', 'bleu', '36-38-40-42-44-46', 'Femme', 'cycliste', 60, 25, 8, 15, 18, 20, 0),
(150, 'Adidas', '1640451503test.jpg', 'bigBlackAddcyc', 'cycliste de sport grandes tailles', 'Noir', '44-46-48-50-52-54-56-58', 'Femme', 'cycliste', 70, 20, 8, 15, 18, 20, 0),
(151, 'Adidas', '1640451682test.jpg', 'AddcycBlack', 'cycliste femme', 'Noir', '34-36-38-40-42-44-46-48', 'Femme', 'cycliste', 40, 20, 8, 15, 18, 20, 0),
(152, 'Adidas', '1640451854test.jpg', 'cycnoirgirl45', 'cycliste femme', 'Noir', '36-38-40-42-44-46', 'Femme', 'cycliste', 25, 200, 8, 15, 18, 20, 0),
(153, 'Adidas', '1640451989test.jpg', 'PinkCycAdd23', 'cycliste en coton', 'rose', '36-38-40-42-44-46', 'Femme', 'cycliste', 68, 25, 8, 15, 18, 20, 0),
(154, 'Adidas', '1640454724test.jpg', 'cygBeigeAdd66', 'Cycliste femme', 'beige', '36-38-40-42-44-46', 'Femme', 'cycliste', 52, 25, 8, 15, 18, 20, 0),
(155, 'Adidas', '1640454880test.jpg', 'blueAddCyc24', 'cycliste femme', 'bleu', '36-38-40-42-44-46', 'Femme', 'cycliste', 35, 25, 8, 15, 18, 20, 0),
(156, 'Adidas', '1640455004test.jpg', 'BlackCycADD44', 'cycliste femme', 'Noir', '36-38-40-42-44-46-48-50-52-54', 'Femme', 'cycliste', 44, 25, 8, 15, 18, 20, 0),
(157, 'Adidas', '1640455190test.jpg', 'WhtCycAdd22', 'cycliste Addidas Hyper stylé', 'Blanc', '34-36-38-40-42-44-46-48', 'Femme', 'cycliste', 80, 20, 8, 15, 18, 20, 0),
(158, 'nike', '1640456307nike.jpg', 'nikeCycGirlBlk', 'cycliste de sport', 'Noir', '36-38-40-42-44-46', 'Femme', 'cycliste', 56, 25, 15, 25, 30, 20, 0),
(159, 'nike', '1640457061test.jpg', 'redCycNike796', 'cycliste de sport', 'rouge', '36-38-40-42-44-46', 'Femme', 'cycliste', 5, 25, 15, 25, 30, 20, 0),
(160, 'nike', '1640457562test.jpg', 'nikeblueCyc33', 'cycliste de sport pour femme', 'bleu', '34-36-38-40-42-44-46-48', 'Femme', 'cycliste', 40, 20, 15, 25, 30, 20, 0),
(161, 'nike', '1640457785test.jpg', 'roseCycNike97', 'cycliste de sport', 'rose', '36-38-40-42-44-46', 'Femme', 'cycliste', 21, 20, 15, 25, 30, 20, 0),
(162, 'nike', '1640460246test.jpg', 'crocWhtNike7', 'T-shirt décontracté taille courte', 'Blanc', '36-38-40-42-44-46', 'Femme', 'crop-top', 14, 25, 15, 25, 30, 20, 0),
(163, 'The North Face', '1640473650polothenorthfacerose4289.jpg', 'thenorthfacepolorose4728', 'Polo the north face rose', 'Rose', 'XS,S,M,L,XL', 'Homme', 'Polo', 119, 127, 12, 29.99, 35.988, 20, 0),
(164, 'nike', '1640460943test.jpg', 'thirdWhtNikeTop', 'T-shirt décontracté taille courte', 'Blanc', '32-34-36-38-40', 'Femme', 'crop-top', 46, 25, 15, 25, 30, 20, 0),
(165, 'nike', '1640461100test.jpg', 'crocBlk17', 'T-shirt décontracté taille courte', 'Noir', '32-34-36-38-40', 'Femme', 'crop-top', 42, 25, 15, 25, 30, 20, 0),
(166, 'nike', '1640461242top_nike_grisnoir.jpg', 'nikeBlkcroc12', 'T-shirt décontracté taille courte', 'Noir', '32-34-36-38-40', 'Femme', 'crop-top', 78, 25, 15, 25, 30, 20, 0),
(167, 'nike', '1640461351test.jpg', 'redcrocNike13', 'T-shirt décontracté taille courte', 'rouge', '32-34-36-38-40', 'Femme', 'crop-top', 20, 25, 15, 25, 30, 20, 0),
(168, 'the north face', '1640462011test.jpg', 'thncrocGrey', 'T-shirt décontracté taille courte', 'gris', '32-34-36-38-40', 'Femme', 'crop-top', 25, 50, 15, 25, 30, 20, 0),
(169, 'the north face', '1640462229test.jpg', 'thnTopPurple', 'T-shirt décontracté taille courte', 'violet', '32-34-36-38-40', 'Femme', 'crop-top', 36, 45, 10, 20, 24, 20, 0),
(170, 'The North Face', '1640474393thenorthfacetshirtmaron4888.jpg', 'thenorthfacetshirtmarron378', 'T-shirt the north face marron', 'Marron', 'XS,S,M,L,XL', 'Homme', 't-shirt', 80, 98, 16, 23, 27.6, 20, 0),
(171, 'Nike', '1640474715blousonnikenoir378.jpg', 'nikeblousonnoir3728', 'Blouson nike noir', 'Noir', 'XS,S,M,L,XL', 'Homme', 'Blouson', 35, 730, 40, 60, 72, 20, 0),
(172, 'Nike', '1640474857blousonnikeblanc378.jpg', 'nikeblousonblanc3728', 'Blouson nike blanc', 'Blanc', 'XS,S,M,L,XL', 'Homme', 'Blouson', 10, 890, 60, 85, 102, 20, 0),
(173, 'Nike', '1640474937blousonnikevert4782.jog.jpg', 'nikeblousonvert4738', 'Blouson nike vert, noir', 'Vert', 'XS,S,M,L,XL', 'Homme', 'Blouson', 60, 460, 30, 45, 54, 20, 0),
(174, 'Nike', '1640475018blousonnikeblanc999.jpg', 'nikeblousonblanc768', 'Blouson nike blanc', 'Blanc', 'XS,S,M,L,XL', 'Homme', 'Blouson', 48, 870, 70, 100, 120, 20, 0),
(175, 'Adidas', '1640475179blousonaddidasnoir222.jpg', 'addidasblousonnoir888', 'Blouson addidas noir', 'Noir', 'XS,S,M,L,XL', 'Homme', 'Blouson', 37, 620, 37, 44.99, 53.988, 20, 0),
(176, 'The North Face', '1640475441thenorthfaceshortvert999.jpg', 'thenorthfaceshortvert749', 'Short the north face vert', 'Vert', 'XS,S,M,L,XL', 'Homme', 'Short', 15, 230, 20, 40, 48, 20, 0),
(177, 'The North Face', '1640475541thenorthfaceshortjaune736.jpg', 'thenorthfaceshortjaune778', 'Short the north face jaune', 'Jaune', 'XS,S,M,L,XL', 'Homme', 'Short', 25, 230, 15, 35, 42, 20, 0),
(178, 'The North Face', '1640475691shortthenorthfaceblanc488.jpg', 'thenorthfaceshortblanc489', 'Short the north face blanc', 'Blanc', 'XS,S,M,L,XL', 'Homme', 'Short', 45, 270, 15, 24.99, 29.988, 20, 0),
(179, 'The North Face', '1640475793shortthenorthfaceorange1199.jpg', 'thenorthfaceshortorange119', 'Short the north face orange', 'Orange', 'XS,S,M,L,XL', 'Homme', 'Short', 85, 195, 13, 27, 32.4, 20, 0),
(180, 'The North Face', '1640797347test.jpg', 'thenorthfaceshortnoir767', 'Short the north face noir', 'Noir', 'XS,S,M,L,XL', 'Homme', 'Short', 15, 215, 24, 35, 42, 20, 0),
(181, 'Adidas', '1640476079addidassweatblanc4777.jpg', 'addidassweatblanc4777', 'Sweat addidas blanc', 'Blanc', 'XS,S,M,L,XL', 'Homme', 'Sweat', 95, 350, 25, 44.99, 53.988, 20, 0),
(182, 'Adidas', '1640476183addidassweatviolet4367.jpg', 'addidassweatviolet4789', 'Sweat addidas violet', 'Violet', 'XS,S,M,L,XL', 'Homme', 'Sweat', 25, 340, 30, 43, 51.6, 20, 0),
(183, 'Adidas', '1640476287addidassweatbleu811.jpg', 'addidassweatbleu911', 'Sweat addidas bleu', 'Bleu', 'XS,S,M,L,XL', 'Homme', 'sweat', 13, 356, 22, 30, 36, 20, 0),
(184, 'Adidas', '1640476368addidassweatgris3688.jpg', 'addidassweatgris8899', 'Sweat addidas gris', 'Gris', 'XS,S,M,L,XL', 'Homme', 'Sweat', 30, 330, 22, 28, 33.6, 20, 0),
(185, 'The North Face', '1640476588thenorthfacesweatvert4889.jpg', 'thenorthfacesweatvert4889', 'Sweat the north face vert', 'Vert', 'XS,S,M,L,XL', 'Homme', 'Sweat', 45, 315, 23, 36, 43.2, 20, 0),
(186, 'The North Face', '1640476726thenorthfacepolonoir2889.jpg', 'thenorthfacepolonoir2889', 'Polo the north face noir', 'Noir', 'XS,S,M,L,XL', 'Homme', 'polo', 6, 174, 16, 28, 33.6, 20, 0),
(187, 'The North Face', '1640798356test.jpg', 'thnpolobordeaux33', 'Polo the north face bordeaux', 'bordeaux', 'XS,S,M,L,XL', 'Homme', 'polo', 67, 146, 13, 24.99, 29.988, 20, 0),
(188, 'Nike', '1640477041polonikevert5557.jpg', 'nikepolovert477', 'Polo nike vert', 'Vert', 'XS,S,M,L,XL', 'Homme', 'polo', 38, 135, 12, 24.99, 29.988, 20, 0),
(189, 'Nike', '1640477123nikepoloblanc4444.jpg', 'nikepoloblanc4444', 'Polo nike blanc', 'Blanc', 'XS,S,M,L,XL', 'Homme', 'polo', 75, 185, 15, 29, 34.8, 20, 0),
(190, 'Nike', '1640477258nikepolorose1955.jpg', 'nikepolorose1955', 'Polo nike rose', 'Rose', 'XS,S,M,L,XL', 'Homme', 'polo', 120, 160, 15, 20, 24, 20, 0),
(191, 'Nike', '1640477550tshirtnikejaune2228.jpg', 'tshirtnikejaune2228', 'T-shirt nike jaune', 'Jaune', 'XS,S,M,L,XL', 'Homme', 't-shirt', 50, 115, 10, 19.99, 23.988, 20, 0),
(192, 'Nike', '1640477654tshirtnikeblanc7567.jpg', 'niketshirtblanc8999', 'T-shirt nike blanc', 'Blanc', 'XS,S,M,L,XL', 'Homme', 't-shirt', 15, 125, 13, 24, 28.8, 20, 0),
(193, 'Adidas', '1640477795addidastshirtrouge3778.jpg', 'addidastshirtrouge3778', 'T-shirt addidas rouge', 'Rouge', 'XS,S,M,L,XL', 'Homme', 't-shirt', 14, 95, 15, 24, 28.8, 20, 0),
(194, 'Adidas', '1640477874addidastshirtblanc7331.jpg', 'addidastshirtblanc7331', 'T-shirt addidas blanc', 'Blanc', 'XS,S,M,L,XL', 'Homme', 't-shirt', 61, 100, 20, 29.99, 35.988, 20, 0),
(195, 'Adidas', '1640477977addidastshirtbleu1911.jpg', 'addidastshirtbleu1911', 'T-shirt addidas bleu', 'Bleu', 'XS,S,M,L,XL', 'Homme', 't-shirt', 78, 110, 18, 28, 33.6, 20, 0),
(196, 'Adidas', '1640478151addidasblousonorange4566.jpg', 'addidasblousonorange4566', 'Blouson addidas orange', 'Orange', 'XS,S,M,L,XL', 'Homme', 'Blouson', 37, 480, 35, 49.99, 59.988, 20, 0),
(197, 'The North Face', '1640478286thenorthfaceblousonbleu7333.jpg', 'thenorthfaceblousonbleu7333', 'Blouson the north face bleu', 'Bleu', 'XS,S,M,L,XL', 'Homme', 'Blouson', 35, 560, 45, 70, 84, 20, 0),
(198, 'The North Face', '1640478342thenorthfaceblousonvert6455.jpg', 'thenorthfaceblousonvert3344', 'Blouson the north face vert', 'Vert', 'XS,S,M,L,XL', 'Homme', 'Blouson', 98, 600, 50, 69.99, 83.988, 20, 0),
(199, 'The North Face', '1640478496thenorthfaceblousonmarron8990.jpg', 'thenorthfaceblousonmarron9001', 'Blouson the north face marron', 'Marron', 'XS,S,M,L,XL', 'Homme', 'Blouson', 2, 679, 60, 89.99, 107.988, 20, 0),
(200, 'The North Face', '1640478579thenorthfaceblousonviolet6090.jpg', 'thenorthfaceblousonviolet6090', 'Blouson the north face violet', 'Violet', 'XS,S,M,L,XL', 'Homme', 'Blouson', 31, 850, 70, 140, 168, 20, 0),
(331, 'Nike', '1640356157shortnikebleusport128218.jpg', 'nikeShortBlue938', 'Short sport bleu nike', 'Bleu', 'XS,S,M,L,XL', 'Homme', 'short', 68, 220, 25, 39, 46.8, 20, 0),
(332, 'Nike', '1640356363shortnikegrissport128128717.jpg', 'nikeshortgris128', 'short nike pas chère gris', 'gris', 'XS,S,M,L,XL', 'Homme', 'short', 19, 190, 10, 19, 22.8, 20, 0),
(333, 'Nike', '1640356551shortnikegrissport1328319.jpg', 'nikeshortgris182', 'Short de sport nike gris', 'gris', 'XS,S,M,L,XL', 'Homme', 'short', 100, 250, 40, 55, 66, 20, 0),
(334, 'Nike', '1640356715shortnikejaunesport18218.jpeg', 'nikeshortjaune182', 'Short de sport nike jaune', 'jaune', 'XS,S,M,L,XL', 'Homme', 'short', 8, 230, 15, 24, 28.8, 20, 0),
(335, 'Adidas', '1640356870shortaddidasnoir712.png', 'addidasshortnoir182', 'Short de sport addidas noir', 'Noir', 'XS,S,M,L,XL', 'Homme', 'short', 85, 260, 29.99, 39.99, 47.988, 20, 0),
(336, 'Nike', '1640439766polonikegris5194915.png', 'nikepologris128', 'Polo nike gris.', 'gris', 'S,M,L,XL', 'Homme', 'polo', 60, 180, 30, 40, 48, 20, 0),
(337, 'Nike', '1640439958polonikerougedorée.png', 'nikepolorougedor1281', 'Polo nike rouge dorée', 'rouge', 'XS,S,M,L,XL', 'Homme', 'polo', 27, 190, 40, 49, 58.8, 20, 0),
(338, 'nike', '1640440084nikepoloblanc1828.jpg', 'nikepoloblanc28', 'Polo nike blanc', 'blanc', 'XS,S,M,L,XL', 'Homme', 'polo', 90, 130, 25, 35, 42, 20, 0),
(339, 'Nike', '1640440189nikepolorouge12717.jpg', 'nikepolorouge18221', 'Polo nike rouge', 'rouge', 'XS,S,M,L,XL', 'Homme', 'polo', 98, 185, 30, 39.99, 47.988, 20, 0),
(340, 'Adidas', '1640440338poloaddidasbleu18.jpg', 'addidaspolobleu1287', 'Polo addidas bleu', 'Bleu', 'XS,S,M,L,XL', 'Homme', 'polo', 36, 200, 23.99, 29.99, 35.988, 20, 0),
(341, 'Adidas', '1640440499poloaddidasbleufoncé128.jpg', 'addidaspolobleuf298', 'Polo addidas bleu foncé', 'Bleu', 'XS,S,M,L,XL', 'Homme', 'polo', 23, 175, 26.25, 34.99, 41.988, 20, 0),
(342, 'Adidas', '1640440969poloaddidasbleuclair182.jpg', 'addidaspololbleu398', 'Polo addidas bleu clair', 'Bleu', 'XS,S,M,L,XL', 'Homme', 'polo', 38, 190, 30, 44, 52.8, 20, 0),
(343, 'Adidas', '1640441126poloaddidasblanc1872.jpg', 'addidaspoloblanc18', 'Polo addidas blanc', 'Blanc', 'XS,S,M,L,XL', 'Homme', 'polo', 28, 185, 30, 39.99, 47.988, 20, 0),
(344, 'Adidas', '1640442280addidaspoloblanc961.jpg', 'addidaspoloblanc456', 'Polo Addidas blanc', 'Blanc', 'XS,S,M,L,XL', 'Homme', 'polo', 128, 190, 25, 35, 42, 20, 0),
(345, 'Nike', '1640442876tshirtnikenoir1821.jpg', 'niketshirtnoir138', 'T-shirt nike noir', 'Noir', 'XS,S,M,L,XL', 'Homme', 't-shirt', 18, 100, 20, 29, 34.8, 20, 0),
(346, 'Nike', '1640443026tshirtnikeblanc128.jpg', 'niketshirtblanc278', 'T-shirt nike blanc', 'Blanc', 'XS,S,M,L,XL', 'Homme', 't-shirt', 72, 120, 19.99, 29.99, 35.988, 20, 0),
(347, 'Adidas', '1640443191tshirtaddidasnoir.jpg', 'addidastshirtnoir1298', 'T-shirt addidas noir ', 'Noir', 'XS,S,M,L,XL', 'Homme', 't-shirt', 187, 140, 25, 35, 42, 20, 0),
(348, 'Adidas', '1640443346tshirtaddidasblanc.jpg', 'addidastshirtblanc128', 'T-shirt addidas blanc', 'Blanc', 'XS,S,M,L,XL', 'Homme', 't-shirt', 83, 130, 23, 29, 34.8, 20, 0),
(349, 'Adidas', '1640444162addidastshirtlogo287.jpg', 'addidastshirtlogo12782', 'T-shirt blanc addidas', 'Blanc', 'XS,S,M,L,XL', 'Homme', 't-shirt', 13, 120, 33.99, 39.99, 47.988, 20, 0),
(350, 'Adidas', '1640444346addidastshirtgris1281.jpg', 'addidastshirtgris172', 'T-shirt addidas gris', 'Gris', 'XS,S,M,L,XL', 'Homme', 't-shirt', 7, 120, 12, 18, 21.6, 20, 0),
(351, 'Adidas', '1640444575addidastshirtrouge1288.jpg', 'addidastshirtrouge236', 'T-shirt addidas rouge', 'Rouge', 'XS,S,M,L,XL', 'Homme', 't-shirt', 38, 165, 15, 25, 30, 20, 0),
(352, 'Nike', '1640444835tshirtnikeairgris.jpg', 'niketshirtgris459', 'T-shirt nike gris ', 'Gris', 'XS,S,M,L,XL', 'Homme', 't-shirt', 28, 163, 19.99, 27.99, 33.588, 20, 0),
(353, 'Nike', '1640444989tshirtnikeairmaxblanc512.jpg', 'niketshirtblanc239', 'T-shirt nike blanc', 'Blanc', 'XS,S,M,L,XL', 'Homme', 't-shirt', 17, 127, 23, 38, 45.6, 20, 0),
(354, 'Nike', '1640445602tshirtniketoutnoir723.jpg', 'niketshirtnoir36834', 'T-shirt nike noir', 'Noir', 'XS,S,M,L,XL', 'Homme', 't-shirt', 4, 167, 15, 29, 34.8, 20, 0),
(355, 'Nike', '1640445722joggingnikegris3718.jpg', 'nikejoggris82', 'Jogging nike gris', 'Gris', 'XS,S,M,L,XL', 'Homme', 'Jogging', 28, 320, 50, 70, 84, 20, 0),
(356, 'Nike', '1640445811joggingnikenoir3728.jpg', 'nikejognoir2832', 'Jogging nike noir', 'Noir', 'XS,S,M,L,XL', 'Homme', 'Jogging', 100, 350, 45, 70, 84, 20, 0),
(357, 'Nike', '1640445907joggingnikebleu732.jpg', 'nikejogbleu283', 'Jogging nike bleu', 'Bleu', 'XS,S,M,L,XL', 'Homme', 'Jogging', 37, 369, 40, 60, 72, 20, 0),
(358, 'Adidas', '1640446003joggingaddidasbleu283.jpg', 'addidasjogbleu2809', 'Jogging addidas bleu', 'Bleu', 'XS,S,M,L,XL', 'Homme', 'Jogging', 99, 325, 35, 50, 60, 20, 0),
(359, 'Adidas', '1640446085joggingaddidasvert289.jpg', 'addidasjogvert239', 'Jogging addidas vert', 'Vert', 'XS,S,M,L,XL', 'Homme', 'Jogging', 76, 300, 40, 60, 72, 20, 0),
(360, 'Adidas', '1640446202joggingaddidasrouge378.jpg', 'addidasjogrouge389', 'Jogging Addidas rouge', 'Rouge', 'XS,S,M,L,XL', 'Homme', 'Jogging', 48, 370, 40, 65, 78, 20, 0),
(361, 'Adidas', '1640446330addidassweatnoir1238.jpg', 'addidassweatnoir28', 'Sweat à capuche addidas noir', 'Noir', 'XS,S,M,L,XL', 'Homme', 'Sweat', 76, 450, 50, 70, 84, 20, 0),
(362, 'Adidas', '1640446437addidassweatbleu1728.jpg', 'addidassweatbleu389', 'Sweat addidas bleu', 'Bleu', 'XS,S,M,L,XL', 'Homme', 'Sweat', 18, 400, 40, 60, 72, 20, 0),
(363, 'Adidas', '1640446641addidassweatblanc23228.jpg', 'addidassweatblanc378', 'Sweat addidas blanc', 'Blanc', 'XS,S,M,L,XL', 'Homme', 'Sweat', 27, 412, 35, 45, 54, 20, 0),
(364, 'Nike', '1640446738nikesweatnoir3872.jpg', 'nikesweatnoir83', 'Sweat nike noir', 'Noir', 'XS,S,M,L,XL', 'Homme', 'Sweat', 48, 370, 10, 20, 24, 20, 0),
(365, 'The North Face', '1640446876thenorthfaceshortnoir38789.jpg', 'thenorthfaceshortnoir389', 'Short the north face noir', 'Noir', 'XS,S,M,L,XL', 'Homme', 'short', 57, 130, 20, 25, 30, 20, 0),
(366, 'The North Face', '1640446987thenorthfacejogginggris3289.jpg', 'thenorthfacejoggris278', 'Jogging the north face gris', 'Gris', 'XS,S,M,L,XL', 'Homme', 'Jogging', 7, 380, 40, 55, 66, 20, 0),
(367, 'The North Face', '1640468958joggingthenorthfacemarron3178.jpg', 'thenorthfacejoggingmarron289', 'Jogging The North Face marron', 'Marron', 'XS,S,M,L,XL', 'Homme', 'Jogging', 36, 379, 30, 45, 54, 20, 0),
(368, 'The North Face', '1640470575joggingthenorthfacenoir3782.jpg', 'thenorthfacejoggin3782', 'Jogging The North Face noir', 'Noir', 'XS,S,M,L,XL', 'Homme', 'Jogging', 37, 430, 50, 69.99, 83.988, 20, 0),
(369, 'The North Face', '1640470758joggingthenorthfacejaune2367.jpg', 'thenorthfacejoggingjaune378', 'Jogging the north face jaune', 'jaune', 'XS,S,M,L,XL', 'Homme', 'Jogging', 89, 386, 40, 54.99, 65.988, 20, 0),
(370, 'The North Face', '1640470952joggingthenorthfacegris37182.jpg', 'thenorthfacejoggris127', 'Jogging the north face gris', 'Gris', 'XS,S,M,L,XL', 'Homme', 'Jogging', 38, 410, 35, 49.99, 59.988, 20, 0),
(371, 'Adidas', '1640471055joggingaddidasvert378.jpg', 'addidasjogvert348', 'Jogging addidas vert', 'Vert', 'XS,S,M,L,XL', 'Homme', 'Jogging', 33, 420, 50, 65, 78, 20, 0),
(372, 'Adidas', '1640471224joggingaddidasbleublancrouge3728.jpg', 'addidasjogbleu9846', 'Jogging addidas bleu', 'Bleu', 'XS,S,M,L,XL', 'Homme', 'Jogging', 43, 395, 35, 44.99, 53.988, 20, 0),
(373, 'Nike', '1640471499joggingnikeorange1687.jpg', 'nikejogorange2738', 'Jogging nike orange', 'Orange', 'XS,S,M,L,XL', 'Homme', 'Jogging', 31, 450, 28, 35, 42, 20, 0),
(374, 'The North Face', '1640471658joggingthenorthfacerose2781.jpg', 'thenorthfacejogrose238', 'Jogging the north face rose', 'Rose', 'XS,S,M,L,XL', 'Homme', 'Jogging', 5, 510, 60, 190, 228, 20, 0),
(375, 'The North Face', '1640471761joggingthenorthfacevert12718.jpg', 'thenorthfacejogvert478', 'Jogging the north face vert', 'Vert', 'XS,S,M,L,XL', 'Homme', 'Jogging', 39, 380, 20, 39.99, 47.988, 20, 0),
(376, 'Nike', '1640471980thenorthfacejogginggris3289.jpg', 'nikejoggris278', 'Jogging nike gris', 'Gris', 'XS,S,M,L,XL', 'Homme', 'Jogging', 102, 430, 25, 39.99, 47.988, 20, 0),
(377, 'Adidas', '1640472192addidasshortvert3892.jpg', 'addidasshortvert387', 'Short addidas vert', 'Vert', 'XS,S,M,L,XL', 'Homme', 'Short', 24, 120, 10, 19.99, 23.988, 20, 0),
(378, 'Adidas', '1640472290shortaddidasblanc3728.jpg', 'addidasshortblanc367', 'Short addidas blanc', 'Blanc', 'XS,S,M,L,XL', 'Homme', 'short', 89, 115, 8, 20, 24, 20, 0),
(379, 'Adidas', '1640472470shortaddidasnoir489.jpg', 'addidasshortnoir1192', 'Short addidas noir', 'Noir', 'XS,S,M,L,XL', 'Homme', 'short', 61, 143, 15, 29.99, 35.988, 20, 0),
(380, 'Adidas', '1640472622shortaddidasrouge2728.jpg', 'addidasshortrouge872', 'Short addidas rouge', 'Rouge', 'XS,S,M,L,XL', 'Homme', 'short', 13, 135, 19.99, 29.99, 35.988, 20, 0),
(381, 'Adidas', '1640472730shortaddidasblanc128.jpg', 'addidasshortblanc382', 'Short addidas blanc', 'Blanc', 'XS,S,M,L,XL', 'Homme', 'short', 72, 149, 14, 24.99, 29.988, 20, 0),
(382, 'Nike', '1640472926nikesweatnoir5498.jpg', 'nikesweatnoir4728', 'Sweat nike noir', 'Noir', 'XS,S,M,L,XL', 'Homme', 'Sweat', 19, 405, 30, 59.99, 71.988, 20, 0),
(383, 'Nike', '1640472992nikesweatvert1928.jpg', 'nikesweatvert2372', 'Sweat nike vert', 'Vert', 'XS,S,M,L,XL', 'Homme', 'Sweat', 94, 370, 30, 49.99, 59.988, 20, 0),
(384, 'Nike', '1640473079nikesweatrouge4729.jpg', 'nikesweatrouge4729', 'Sweat nike rouge', 'Rouge', 'XS,S,M,L,XL', 'Homme', 'Sweat', 3, 340, 20, 39.99, 47.988, 20, 0),
(385, 'Nike', '1640473160nikesweatorange3824.jpg', 'nikesweatorange473', 'Sweat nike orange', 'Orange', 'XS,S,M,L,XL', 'Homme', 'Sweat', 130, 400, 30, 60, 72, 20, 0),
(386, 'Adidas', '1640473269addidassweatvert3473.jpg', 'addidassweatvert129', 'Sweat addidas vert', 'Vert', 'XS,S,M,L,XL', 'Homme', 'Sweat', 105, 365, 20, 44.99, 53.988, 20, 0),
(387, 'The North Face', '1640473464thenorthfacepolovert4890.jpg', 'thenorthfacepolovert3728', 'Polo the north face vert', 'Vert', 'XS,S,M,L,XL', 'Homme', 'Polo', 8, 160, 14.99, 30, 36, 20, 0),
(388, 'The North Face', '1640473532thenorthfacepolobleu1293.jpg', 'thenorthfacepolobleu2738', 'Polo the north face bleu', 'Bleu', 'XS,S,M,L,XL', 'Homme', 'Polo', 36, 120, 20, 34.99, 41.988, 20, 0),
(389, 'The North Face', '1640797993test.jpg', 'thenorthfacepologris4378', 'Polo the north face gris', 'Gris', 'XS,S,M,L,XL', 'Homme', 'Polo', 22, 139, 17, 28, 33.6, 20, 0),
(390, 'The North Face', '1640473796polothenorthfacebleu8888.jpg', 'thenorthfacepolobleu9999', 'Polo the north face bleu', 'Bleu', 'XS,S,M,L,XL', 'Homme', 'Polo', 10, 178, 14, 27, 32.4, 20, 0),
(391, 'The North Face', '1640473942tshirtthenorthfacejaune.jpg', 'thenorthfacetshirtjaune478', 'T-shirt the north face jaune', 'Jaune', 'XS,S,M,L,XL', 'Homme', 't-shirt', 30, 85, 5, 20, 24, 20, 0),
(392, 'The North Face', '1640474046tshirtthenorthfaceblanc47328.jpg', 'thenorthfacetshirtblanc478', 'T-shirt the north face blanc', 'Blanc', 'XS,S,M,L,XL', 'Homme', 't-shirt', 40, 95, 15, 30, 36, 20, 0),
(393, 'The North Face', '1640474143thenorthfacetshirtrouge293.jpg', 'thenorthfacetshirtrouge666', 'T-shirt the north face rouge', 'Rouge', 'XS,S,M,L,XL', 'Homme', 't-shirt', 90, 79, 15, 24.99, 29.988, 20, 0),
(394, 'The North Face', '1640474296thenorthfacetshirtnoir3333.jpg', 'thenorthfacetshirtnoir333', 'T-shirt the north face noir', 'Noir', 'XS,S,M,L,XL', 'Homme', 'T-shirt', 3, 110, 15, 29.99, 35.988, 20, 0),
(395, 'the north face', '1640547476test.jpg', 'thnBlackTop5', 'T-shirt décontracté taille courte', 'Noir', '36-38-40-42-44-46', 'Femme', 'crop-top', 66, 25, 15, 25, 30, 20, 0),
(396, 'Adidas', '1640599469test.jpg', 'addTopwht7', 'T-shirt décontracté taille courte', 'Blanc', '32-34-36-38-40', 'Femme', 'crop-top', 98, 25, 15, 25, 30, 20, 0),
(397, 'Adidas', '1640600039test.jpg', 'TpdBlk78girl', 'T-shirt décontracté taille courte', 'Noir', '32-34-36-38-40', 'Femme', 'crop-top', 70, 25, 15, 25, 30, 20, 0),
(398, 'Adidas', '1640600205test.jpg', 'TopWhite87', 'T-shirt décontracté taille courte', 'Blanc', '32-34-36-38-40', 'Femme', 'crop-top', 54, 25, 15, 25, 30, 20, 0),
(399, 'Adidas', '1640600299test.jpg', 'PinkTopAdd23', 'T-shirt décontracté taille courte', 'rose', '32-34-36-38-40', 'Femme', 'crop-top', 65, 25, 15, 25, 30, 20, 0),
(400, 'the north face', '1640600406test.jpg', 'thnWhiteTop56', 'T-shirt décontracté taille courte', 'Blanc', '32-34-36-38-40', 'Femme', 'crop-top', 74, 25, 15, 25, 30, 20, 0),
(401, 'Adidas', '1640600505test.jpg', 'TopblackADD80', 'T-shirt décontracté taille courte', 'Noir', '32-34-36-38-40', 'Femme', 'crop-top', 80, 25, 15, 25, 30, 20, 0),
(402, 'Adidas', '1640600672test.jpg', 'AddYellowTop', 'T-shirt décontracté taille courte', 'jaune', '32-34-36-38-40', 'Femme', 'crop-top', 55, 25, 15, 25, 30, 20, 0),
(403, 'Adidas', '1640600882test.jpg', 'BlkTopAddtcho', 'T-shirt décontracté taille courte', 'Noir', '32-34-36-38-40', 'Femme', 'crop-top', 44, 25, 15, 25, 30, 20, 0),
(404, 'Adidas', '1640601023test.jpg', 'AddTopBlkute99', 'T-shirt décontracté taille courte', 'Noir', '32-34-36-38-40', 'Femme', 'crop-top', 100, 25, 20, 30, 36, 20, 0),
(405, 'Adidas', '1640601137test.jpg', 'GreenTopAdd27', 'T-shirt décontracté taille courte', 'vert', '32-34-36-38-40', 'Femme', 'crop-top', 26, 25, 15, 25, 30, 20, 0),
(406, 'the north face', '1640602964test.jpg', 'thnTopBlk99', 'T-shirt décontracté taille courte', 'vert', '32-34-36-38-40', 'Femme', 'crop-top', 60, 25, 20, 30, 36, 20, 0),
(407, 'the north face', '1640601561test.jpg', 'thnASSblackTop', 'T-shirt décontracté taille courte', 'Noir', '32-34-36-38-40', 'Femme', 'crop-top', 33, 25, 20, 30, 36, 20, 0);
INSERT INTO `products` (`id`, `marque`, `image`, `reference`, `description`, `couleur`, `taille`, `categorie`, `sous_categorie`, `nombre_stock`, `poids`, `prix_achat_HT`, `prix_vente_HT`, `priceTTC`, `tauxTVA`, `remise`) VALUES
(408, 'the north face', '1640603533test.jpg', 'thnShirtBlk8', 'Nouvelle Collection The North Face 2020 Modèle Easy C256 ', 'Noir', '32-34-36-38-40', 'Femme', 'T-shirt', 46, 25, 10, 20, 24, 20, 0),
(409, 'the north face', '1640603760test.jpg', 'thnWhitesirt66', 'Nouvelle Collection The North Face 2020 Modèle Easy C256 ', 'Blanc', '32-34-36-38-40', 'Femme', 'T-shirt', 80, 25, 10, 20, 24, 20, 0),
(410, 'the north face', '1640604014test.jpg', 'thnShirtblack9', 'Nouvelle Collection The North Face 2020 Modèle Easy C256 ', 'Noir', '32-34-36-38-40', 'Femme', 'T-shirt', 77, 25, 10, 20, 24, 20, 0),
(411, 'the north face', '1640604234test.jpg', 'redShirtthn999', 'Nouvelle Collection The North Face 2020 Modèle Easy C256 ', 'rouge', '34-36-38-40-42-44-46-48', 'Femme', 'T-shirt', 4, 25, 10, 20, 24, 20, 0),
(412, 'the north face', '1640604429test.jpg', 'PinkthnShirt17', 'T-shirt décontrecté', 'rose', '34-36-38-40-42-44-46-48', 'Femme', 'T-shirt', 17, 25, 10, 20, 24, 20, 0),
(413, 'the north face', '1640604548test.jpg', 'WhtShirt45', 'Nouvelle Collection The North Face 2020 Modèle Easy C256 ', 'Blanc', '36-38-40-42-44-46', 'Femme', 'T-shirt', 28, 25, 10, 20, 24, 20, 0),
(414, 'the north face', '1640604779test.jpg', 'GreenShirtThn6', 'Nouvelle Collection The North Face 2020 Modèle Easy C256 ', 'vert', '36-38-40-42-44-46-48-50', 'Femme', 'T-shirt', 9, 25, 10, 20, 24, 20, 0),
(415, 'the north face', '1640604951test.jpg', 'PurpleShirt45', 'T-shirt décontracté', 'violet', '34-36-38-40-42-44-46-48', 'Femme', 'T-shirt', 9, 25, 10, 20, 24, 20, 0),
(416, 'nike', '1640605235test.jpg', 'NikeShirtWht8', 't-shirt décontracté femme', 'Blanc', '34-36-38-40-42-44-46-48', 'Femme', 'T-shirt', 20, 25, 15, 25, 30, 20, 0),
(417, 'nike', '1640605408test.jpg', 'NikePinkShirt', 't-shirt décontracté femme', 'rose', '36-38-40-42-44-46', 'Femme', 'T-shirt', 16, 25, 15, 25, 30, 20, 0),
(418, 'nike', '1640605490test.jpg', 'whtNike78tshirt', 't-shirt décontracté femme', 'Blanc', '32-34-36-38-40', 'Femme', 'T-shirt', 70, 25, 15, 25, 30, 20, 0),
(419, 'nike', '1640605752test.jpg', 'whtShirtNike12', 't-shirt décontracté femme', 'Blanc', '36-38-40-42-44-46', 'Femme', 'T-shirt', 12, 25, 15, 25, 30, 20, 0),
(420, 'nike', '1640605866test.jpg', 'nikewhtShirt9', 't-shirt décontracté femme', 'Blanc', '36-38-40-42-44-46', 'Femme', 'T-shirt', 40, 25, 15, 25, 30, 20, 0),
(421, 'nike', '1640605944test.jpg', 'OrangeShirtnike', 't-shirt décontracté femme', 'orange', '36-38-40-42-44-46', 'Femme', 'T-shirt', 60, 25, 15, 25, 30, 20, 0),
(422, 'nike', '1640606027test.jpg', 'BlkShirtnike6', 't-shirt décontracté femme', 'Noir', '36-38-40-42-44-46', 'Femme', 'T-shirt', 100, 25, 15, 25, 30, 20, 0),
(423, 'nike', '1640606295test.jpg', 'nikeShirtBlk56', 't-shirt décontracté femme', 'gris', '36-38-40-42-44-46', 'Femme', 'T-shirt', 56, 25, 15, 25, 30, 20, 0),
(424, 'Adidas', '1640606483test.jpg', 'AddOrangeShirt', 't-shirt décontracté femme', 'orange', '36-38-40-42-44-46', 'Femme', 'T-shirt', 123, 25, 15, 25, 30, 20, 0),
(425, 'Adidas', '1640606593test.jpg', 'AddRedShirt45', 't-shirt décontracté femme', 'rouge', '36-38-40-42-44-46', 'Femme', 'T-shirt', 45, 25, 10, 20, 24, 20, 0),
(426, 'Adidas', '1640606666test.jpg', 'AddRedShirt77', 't-shirt décontracté femme', 'rouge', '36-38-40-42-44-46', 'Femme', 'T-shirt', 77, 25, 10, 20, 24, 20, 0),
(427, 'Adidas', '1640606728test.jpg', 'addwhtShirt7', 't-shirt décontracté femme', 'Blanc', '36-38-40-42-44-46', 'Femme', 'T-shirt', 7, 25, 10, 20, 24, 20, 0),
(428, 'Adidas', '1640606849test.jpg', 'whiteShirtAdd', 't-shirt décontracté femme', 'Blanc', '36-38-40-42-44-46', 'Femme', 'T-shirt', 36, 25, 10, 20, 24, 20, 0),
(429, 'Adidas', '1640606913test.jpg', 'blkShirtadd8', 't-shirt décontracté femme', 'Noir', '36-38-40-42-44-46', 'Femme', 'T-shirt', 95, 25, 10, 20, 24, 20, 0),
(430, 'Adidas', '1640606988test.jpg', 'AddBlackShirt9', 't-shirt décontracté femme', 'Noir', '36-38-40-42-44-46', 'Femme', 'T-shirt', 36, 25, 10, 20, 24, 20, 0),
(431, 'Adidas', '1640607122test.jpg', 'addBlueShirt', 't-shirt décontracté femme', 'bleu', '36-38-40-42-44-46', 'Femme', 'T-shirt', 88, 25, 10, 20, 24, 20, 0),
(432, 'Adidas', '1640607210test.jpg', 'AddBlueShirt33', 't-shirt décontracté femme', 'bleu', '36-38-40-42-44-46', 'Femme', 'T-shirt', 44, 25, 10, 20, 24, 20, 0);

-- --------------------------------------------------------

--
-- Structure de la table `recuperation`
--

CREATE TABLE `recuperation` (
  `id` int(11) NOT NULL,
  `mail` text NOT NULL,
  `code` int(11) NOT NULL,
  `confirme` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `membres`
--
ALTER TABLE `membres`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `membres`
--
ALTER TABLE `membres`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
