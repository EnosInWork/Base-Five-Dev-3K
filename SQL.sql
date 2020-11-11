-- phpMyAdmin SQL Dump
-- version 4.6.6deb5
-- https://www.phpmyadmin.net/
--
-- Client :  localhost:3306
-- Généré le :  Mer 11 Novembre 2020 à 16:12
-- Version du serveur :  5.7.32-0ubuntu0.18.04.1
-- Version de PHP :  7.2.24-0ubuntu0.18.04.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  ``
--

-- --------------------------------------------------------

--
-- Structure de la table `addon_account`
--

CREATE TABLE `addon_account` (
  `name` varchar(60) NOT NULL,
  `label` varchar(100) NOT NULL,
  `shared` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `addon_account`
--

INSERT INTO `addon_account` (`name`, `label`, `shared`) VALUES
('property_black_money', 'Argent Sale Propriété', 0),
('society_aircraftdealer', 'Airliner', 1),
('society_ambulance', 'Ambulance', 1),
('society_armurier', 'Armurier', 1),
('society_avocat', 'avocat', 1),
('society_aztecas', 'Aztecas', 1),
('society_bahama', 'bahama', 1),
('society_biker', 'Biker', 1),
('society_bloods', 'Bloods', 1),
('society_cardealer', 'Concessionnaire', 1),
('society_cartel', 'Cartel', 1),
('society_crips', 'crips', 1),
('society_fire', 'Pompier', 1),
('society_gouv', 'Gouvernement', 1),
('society_journaliste', 'journaliste', 1),
('society_ltdnord', 'ltdnord', 1),
('society_ltdsud', 'ltdsud', 1),
('society_mafia', 'mafia', 1),
('society_mechanic', 'Mécano', 1),
('society_nightclub', 'Nightclub', 1),
('society_police', 'Police', 1),
('society_realestateagent', 'Agent immobilier', 1),
('society_sheriff', 'Sheriff', 1),
('society_taxi', 'Taxi', 1),
('society_ubereats', 'UberEats', 1),
('society_unicorn', 'Unicorn', 1),
('society_vagos', 'Vagos', 1),
('society_vigne', 'Vigneron', 1);

-- --------------------------------------------------------

--
-- Structure de la table `addon_account_data`
--

CREATE TABLE `addon_account_data` (
  `id` int(11) NOT NULL,
  `account_name` varchar(100) DEFAULT NULL,
  `money` int(11) NOT NULL,
  `owner` varchar(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `addon_account_data`
--

INSERT INTO `addon_account_data` (`id`, `account_name`, `money`, `owner`) VALUES
(1, 'property_black_money', 0, 'steam:110000134bc8c01'),
(2, 'property_black_money', 0, 'steam:110000116d9cec8'),
(3, 'property_black_money', 0, 'steam:110000112a69b9e'),
(4, 'property_black_money', 0, 'steam:11000013368b987'),
(5, 'property_black_money', 0, 'steam:11000013e98cb7e'),
(6, 'society_cardealer', 0, NULL),
(7, 'society_realestateagent', 0, NULL),
(8, 'society_sheriff', 0, NULL),
(9, 'society_mechanic', 500, NULL),
(10, 'society_police', 400, NULL),
(11, 'society_aircraftdealer', 0, NULL),
(12, 'society_ambulance', 0, NULL),
(13, 'society_taxi', 0, NULL),
(14, 'society_avocat', 0, NULL),
(15, 'society_bahama', 0, NULL),
(16, 'society_journaliste', 0, NULL),
(17, 'society_nightclub', 0, NULL),
(18, 'society_unicorn', 500, NULL),
(19, 'society_vigne', 0, NULL),
(20, 'society_vagos', 0, NULL),
(21, 'society_aztecas', 0, NULL),
(22, 'society_biker', 50010, NULL),
(23, 'society_mafia', 0, NULL),
(24, 'society_cartel', 0, NULL),
(25, 'society_gouv', 0, NULL),
(26, 'society_bloods', 0, NULL),
(27, 'society_armurier', 500, NULL),
(28, 'society_ltdnord', 0, NULL),
(29, 'society_ltdsud', 0, NULL),
(30, 'society_ubereats', 0, NULL),
(31, 'society_crips', 0, NULL),
(32, 'society_fire', 0, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `addon_inventory`
--

CREATE TABLE `addon_inventory` (
  `name` varchar(60) NOT NULL,
  `label` varchar(100) NOT NULL,
  `shared` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `addon_inventory`
--

INSERT INTO `addon_inventory` (`name`, `label`, `shared`) VALUES
('property', 'Propriété', 0),
('society_aircraftdealer', 'Airliner', 1),
('society_ambulance', 'Ambulance', 1),
('society_armurier', 'Armurier', 1),
('society_avocat', 'avocat', 1),
('society_aztecas', 'Aztecas', 1),
('society_bahama', 'bahama', 1),
('society_bahama_fridge', 'bahama (frigo)', 1),
('society_biker', 'Biker', 1),
('society_bloods', 'Bloods', 1),
('society_cardealer', 'Concesionnaire', 1),
('society_cartel', 'Cartel', 1),
('society_crips', 'crips', 1),
('society_fire', 'Pompier', 1),
('society_gouv', 'Gouvernement', 1),
('society_journaliste', 'journaliste', 1),
('society_ltdnord', 'ltdnord', 1),
('society_ltdsud', 'ltdsud', 1),
('society_mafia', 'mafia', 1),
('society_mechanic', 'Mécano', 1),
('society_nightclub', 'Nightclub', 1),
('society_nightclub_fridge', 'Nightclub (fridge)', 1),
('society_police', 'Police', 1),
('society_sheriff', 'Sheriff', 1),
('society_taxi', 'Taxi', 1),
('society_ubereats', 'ubereats', 1),
('society_ubereats_fridge', 'UberEats (frigo)', 1),
('society_unicorn', 'Unicorn', 1),
('society_unicorn_fridge', 'Unicorn (frigo)', 1),
('society_vagos', 'Vagos', 1),
('society_vigne', 'Vigneron', 1);

-- --------------------------------------------------------

--
-- Structure de la table `addon_inventory_items`
--

CREATE TABLE `addon_inventory_items` (
  `id` int(11) NOT NULL,
  `inventory_name` varchar(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `count` int(11) NOT NULL,
  `owner` varchar(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `addon_inventory_items`
--

INSERT INTO `addon_inventory_items` (`id`, `inventory_name`, `name`, `count`, `owner`) VALUES
(1, 'society_ambulance', 'bandage', 1, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `aircraftdealer_aircrafts`
--

CREATE TABLE `aircraftdealer_aircrafts` (
  `id` int(11) NOT NULL,
  `vehicle` varchar(255) NOT NULL,
  `price` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `aircrafts`
--

CREATE TABLE `aircrafts` (
  `name` varchar(60) NOT NULL,
  `model` varchar(60) NOT NULL,
  `price` int(11) NOT NULL,
  `category` varchar(60) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `aircrafts`
--

INSERT INTO `aircrafts` (`name`, `model`, `price`, `category`) VALUES
('Alpha Z1', 'alphaz1', 1121000, 'plane'),
('Besra', 'besra', 1000000, 'plane'),
('Buzzard', 'buzzard2', 500000, 'heli'),
('Cuban 800', 'cuban800', 240000, 'plane'),
('Dodo', 'dodo', 500000, 'plane'),
('Duster', 'duster', 175000, 'plane'),
('Frogger', 'frogger', 800000, 'heli'),
('Havok', 'havok', 250000, 'heli'),
('Howard NX25', 'howard', 975000, 'plane'),
('Luxor', 'luxor', 1500000, 'plane'),
('Luxor Deluxe ', 'luxor2', 1750000, 'plane'),
('Mammatus', 'mammatus', 300000, 'plane'),
('Maverick', 'maverick', 750000, 'heli'),
('Ultra Light', 'microlight', 50000, 'plane'),
('Nimbus', 'nimbus', 900000, 'plane'),
('Rogue', 'rogue', 1000000, 'plane'),
('Sea Breeze', 'seabreeze', 850000, 'plane'),
('Sea Sparrow', 'seasparrow', 815000, 'heli'),
('Shamal', 'shamal', 1150000, 'plane'),
('Mallard', 'stunt', 250000, 'plane'),
('SuperVolito', 'supervolito', 1000000, 'heli'),
('SuperVolito Carbon', 'supervolito2', 1250000, 'heli'),
('Swift', 'swift', 1000000, 'heli'),
('Swift Deluxe', 'swift2', 1250000, 'heli'),
('Velum', 'velum2', 450000, 'plane'),
('Vestra', 'vestra', 950000, 'plane'),
('Volatus', 'volatus', 1250000, 'heli');

-- --------------------------------------------------------

--
-- Structure de la table `aircraft_categories`
--

CREATE TABLE `aircraft_categories` (
  `name` varchar(60) NOT NULL,
  `label` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `aircraft_categories`
--

INSERT INTO `aircraft_categories` (`name`, `label`) VALUES
('heli', 'Helicopters'),
('plane', 'Planes');

-- --------------------------------------------------------

--
-- Structure de la table `billing`
--

CREATE TABLE `billing` (
  `id` int(11) NOT NULL,
  `identifier` varchar(255) NOT NULL,
  `sender` varchar(255) NOT NULL,
  `target_type` varchar(50) NOT NULL,
  `target` varchar(255) NOT NULL,
  `label` varchar(255) NOT NULL,
  `amount` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `boats`
--

CREATE TABLE `boats` (
  `name` varchar(60) NOT NULL,
  `model` varchar(60) NOT NULL,
  `price` int(11) NOT NULL,
  `category` varchar(60) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `boats`
--

INSERT INTO `boats` (`name`, `model`, `price`, `category`) VALUES
('Dinghy 4Seat', 'dinghy', 25000, 'boat'),
('Dinghy 2Seat', 'dinghy2', 20000, 'boat'),
('Dinghy Yacht', 'dinghy4', 25000, 'boat'),
('Jetmax', 'jetmax', 30000, 'boat'),
('Marquis', 'marquis', 45000, 'boat'),
('Seashark', 'seashark', 10000, 'boat'),
('Seashark Yacht', 'seashark3', 10000, 'boat'),
('Speeder', 'speeder', 40000, 'boat'),
('Squalo', 'squalo', 32000, 'boat'),
('Submarine', 'submersible', 29000, 'subs'),
('Kraken', 'submersible2', 31000, 'subs'),
('Suntrap', 'suntrap', 34000, 'boat'),
('Toro', 'toro', 38000, 'boat'),
('Toro Yacht', 'toro2', 38000, 'boat'),
('Tropic', 'tropic', 27000, 'boat'),
('Tropic Yacht', 'tropic2', 27000, 'boat');

-- --------------------------------------------------------

--
-- Structure de la table `boat_categories`
--

CREATE TABLE `boat_categories` (
  `name` varchar(60) NOT NULL,
  `label` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `boat_categories`
--

INSERT INTO `boat_categories` (`name`, `label`) VALUES
('boat', 'Boats'),
('subs', 'Submersibles');

-- --------------------------------------------------------

--
-- Structure de la table `cardealer_vehicles`
--

CREATE TABLE `cardealer_vehicles` (
  `id` int(11) NOT NULL,
  `vehicle` varchar(255) NOT NULL,
  `price` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `characters`
--

CREATE TABLE `characters` (
  `identifier` varchar(255) NOT NULL,
  `firstname` varchar(255) NOT NULL,
  `lastname` varchar(255) NOT NULL,
  `dateofbirth` varchar(255) NOT NULL,
  `sex` varchar(1) NOT NULL DEFAULT 'f',
  `height` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `characters`
--

INSERT INTO `characters` (`identifier`, `firstname`, `lastname`, `dateofbirth`, `sex`, `height`) VALUES
('steam:110000134bc8c01', 'Max', 'Bloom', '19/06/1995', 'm', '182'),
('steam:110000112a69b9e', 'Yanis', 'Breezi', '15121980', 'm', '180'),
('steam:11000013368b987', 'Its', 'Nehco', '01:01:1990', 'm', '175'),
('steam:11000013e98cb7e', 'Noks', 'Tkt', '04/10/1998', 'm', '188');

-- --------------------------------------------------------

--
-- Structure de la table `datastore`
--

CREATE TABLE `datastore` (
  `name` varchar(60) NOT NULL,
  `label` varchar(100) NOT NULL,
  `shared` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `datastore`
--

INSERT INTO `datastore` (`name`, `label`, `shared`) VALUES
('property', 'Propriété', 0),
('society_ambulance', 'Ambulance', 1),
('society_armurier', 'Armurier', 1),
('society_avocat', 'avocat', 1),
('society_aztecas', 'Aztecas', 1),
('society_bahama', 'bahama', 1),
('society_biker', 'Biker', 1),
('society_bloods', 'Bloods', 1),
('society_cartel', 'Cartel', 1),
('society_crips', 'crips', 1),
('society_fire', 'Pompier', 1),
('society_gouv', 'Gouvernement', 1),
('society_journaliste', 'journaliste', 1),
('society_ltdnord', 'ltdnord', 1),
('society_ltdsud', 'ltdsud', 1),
('society_mafia', 'mafia', 1),
('society_mechanic', 'Mécano', 1),
('society_nightclub', 'Nightclub', 1),
('society_police', 'Police', 1),
('society_sheriff', 'Sheriff', 1),
('society_taxi', 'Taxi', 1),
('society_ubereats', 'UberEats', 1),
('society_unicorn', 'Unicorn', 1),
('society_vagos', 'Vagos', 1),
('society_vigne', 'Vigneron', 1),
('user_ears', 'Ears', 0),
('user_glasses', 'Glasses', 0),
('user_helmet', 'Helmet', 0),
('user_mask', 'Mask', 0);

-- --------------------------------------------------------

--
-- Structure de la table `datastore_data`
--

CREATE TABLE `datastore_data` (
  `id` int(11) NOT NULL,
  `name` varchar(60) NOT NULL,
  `owner` varchar(40) DEFAULT NULL,
  `data` longtext
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `datastore_data`
--

INSERT INTO `datastore_data` (`id`, `name`, `owner`, `data`) VALUES
(1, 'property', 'steam:110000134bc8c01', '{}'),
(2, 'user_ears', 'steam:110000134bc8c01', '{}'),
(3, 'user_glasses', 'steam:110000134bc8c01', '{}'),
(4, 'user_helmet', 'steam:110000134bc8c01', '{}'),
(5, 'user_mask', 'steam:110000134bc8c01', '{}'),
(6, 'property', 'steam:110000116d9cec8', '{}'),
(7, 'user_ears', 'steam:110000116d9cec8', '{}'),
(8, 'user_helmet', 'steam:110000116d9cec8', '{}'),
(9, 'user_mask', 'steam:110000116d9cec8', '{}'),
(10, 'user_glasses', 'steam:110000116d9cec8', '{}'),
(11, 'user_ears', 'steam:110000112a69b9e', '{}'),
(12, 'user_glasses', 'steam:110000112a69b9e', '{}'),
(13, 'user_helmet', 'steam:110000112a69b9e', '{}'),
(14, 'user_mask', 'steam:110000112a69b9e', '{}'),
(15, 'property', 'steam:110000112a69b9e', '{}'),
(16, 'property', 'steam:11000013368b987', '{}'),
(17, 'user_ears', 'steam:11000013368b987', '{}'),
(18, 'user_glasses', 'steam:11000013368b987', '{}'),
(19, 'user_helmet', 'steam:11000013368b987', '{}'),
(20, 'user_mask', 'steam:11000013368b987', '{}'),
(21, 'property', 'steam:11000013e98cb7e', '{}'),
(22, 'user_ears', 'steam:11000013e98cb7e', '{}'),
(23, 'user_glasses', 'steam:11000013e98cb7e', '{}'),
(24, 'user_helmet', 'steam:11000013e98cb7e', '{}'),
(25, 'user_mask', 'steam:11000013e98cb7e', '{}'),
(26, 'society_sheriff', NULL, '{}'),
(27, 'society_mechanic', NULL, '{}'),
(28, 'society_police', NULL, '{}'),
(29, 'society_ambulance', NULL, '{}'),
(30, 'society_taxi', NULL, '{}'),
(31, 'society_avocat', NULL, '{}'),
(32, 'society_bahama', NULL, '{}'),
(33, 'society_journaliste', NULL, '{}'),
(34, 'society_nightclub', NULL, '{}'),
(35, 'society_unicorn', NULL, '{}'),
(36, 'society_vigne', NULL, '{}'),
(37, 'society_vagos', NULL, '{}'),
(38, 'society_aztecas', NULL, '{}'),
(39, 'society_biker', NULL, '{}'),
(40, 'society_mafia', NULL, '{}'),
(41, 'society_cartel', NULL, '{}'),
(42, 'society_gouv', NULL, '{}'),
(43, 'society_bloods', NULL, '{}'),
(44, 'society_armurier', NULL, '{}'),
(45, 'society_ltdnord', NULL, '{}'),
(46, 'society_ltdsud', NULL, '{}'),
(47, 'society_ubereats', NULL, '{}'),
(48, 'society_crips', NULL, '{}'),
(49, 'society_fire', NULL, '{}');

-- --------------------------------------------------------

--
-- Structure de la table `dpkeybinds`
--

CREATE TABLE `dpkeybinds` (
  `id` varchar(50) DEFAULT NULL,
  `keybind1` varchar(50) DEFAULT 'num4',
  `emote1` varchar(255) DEFAULT '',
  `keybind2` varchar(50) DEFAULT 'num5',
  `emote2` varchar(255) DEFAULT '',
  `keybind3` varchar(50) DEFAULT 'num6',
  `emote3` varchar(255) DEFAULT '',
  `keybind4` varchar(50) DEFAULT 'num7',
  `emote4` varchar(255) DEFAULT '',
  `keybind5` varchar(50) DEFAULT 'num8',
  `emote5` varchar(255) DEFAULT '',
  `keybind6` varchar(50) DEFAULT 'num9',
  `emote6` varchar(255) DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `dpkeybinds`
--

INSERT INTO `dpkeybinds` (`id`, `keybind1`, `emote1`, `keybind2`, `emote2`, `keybind3`, `emote3`, `keybind4`, `emote4`, `keybind5`, `emote5`, `keybind6`, `emote6`) VALUES
('steam:110000112a69b9e', 'num4', '', 'num5', '', 'num6', '', 'num7', '', 'num8', '', 'num9', ''),
('steam:11000013368b987', 'num4', '', 'num5', '', 'num6', '', 'num7', '', 'num8', '', 'num9', '');

-- --------------------------------------------------------

--
-- Structure de la table `fine_types`
--

CREATE TABLE `fine_types` (
  `id` int(11) NOT NULL,
  `label` varchar(255) DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  `category` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `fine_types`
--

INSERT INTO `fine_types` (`id`, `label`, `amount`, `category`) VALUES
(1, 'Usage abusif du klaxon', 30, 0),
(2, 'Franchir une ligne continue', 40, 0),
(3, 'Circulation à contresens', 250, 0),
(4, 'Demi-tour non autorisé', 250, 0),
(5, 'Circulation hors-route', 170, 0),
(6, 'Non-respect des distances de sécurité', 30, 0),
(7, 'Arrêt dangereux / interdit', 150, 0),
(8, 'Stationnement gênant / interdit', 70, 0),
(9, 'Non respect  de la priorité à droite', 70, 0),
(10, 'Non-respect à un véhicule prioritaire', 90, 0),
(11, 'Non-respect d\'un stop', 105, 0),
(12, 'Non-respect d\'un feu rouge', 130, 0),
(13, 'Dépassement dangereux', 100, 0),
(14, 'Véhicule non en état', 100, 0),
(15, 'Conduite sans permis', 1500, 0),
(16, 'Délit de fuite', 800, 0),
(17, 'Excès de vitesse < 5 kmh', 90, 0),
(18, 'Excès de vitesse 5-15 kmh', 120, 0),
(19, 'Excès de vitesse 15-30 kmh', 180, 0),
(20, 'Excès de vitesse > 30 kmh', 300, 0),
(21, 'Entrave de la circulation', 110, 1),
(22, 'Dégradation de la voie publique', 90, 1),
(23, 'Trouble à l\'ordre publique', 90, 1),
(24, 'Entrave opération de police', 130, 1),
(25, 'Insulte envers / entre civils', 75, 1),
(26, 'Outrage à agent de police', 110, 1),
(27, 'Menace verbale ou intimidation envers civil', 90, 1),
(28, 'Menace verbale ou intimidation envers policier', 150, 1),
(29, 'Manifestation illégale', 250, 1),
(30, 'Tentative de corruption', 1500, 1),
(31, 'Arme blanche sortie en ville', 120, 2),
(32, 'Arme léthale sortie en ville', 300, 2),
(33, 'Port d\'arme non autorisé (défaut de license)', 600, 2),
(34, 'Port d\'arme illégal', 700, 2),
(35, 'Pris en flag lockpick', 300, 2),
(36, 'Vol de voiture', 1800, 2),
(37, 'Vente de drogue', 1500, 2),
(38, 'Fabriquation de drogue', 1500, 2),
(39, 'Possession de drogue', 650, 2),
(40, 'Prise d\'ôtage civil', 1500, 2),
(41, 'Prise d\'ôtage agent de l\'état', 2000, 2),
(42, 'Braquage particulier', 650, 2),
(43, 'Braquage magasin', 650, 2),
(44, 'Braquage de banque', 1500, 2),
(45, 'Tir sur civil', 2000, 3),
(46, 'Tir sur agent de l\'état', 2500, 3),
(47, 'Tentative de meurtre sur civil', 3000, 3),
(48, 'Tentative de meurtre sur agent de l\'état', 5000, 3),
(49, 'Meurtre sur civil', 10000, 3),
(50, 'Meurte sur agent de l\'état', 30000, 3),
(51, 'Meurtre involontaire', 1800, 3),
(52, 'Escroquerie à l\'entreprise', 2000, 2),
(53, 'Usage abusif du klaxon', 30, 0),
(54, 'Franchir une ligne continue', 40, 0),
(55, 'Circulation à contresens', 250, 0),
(56, 'Demi-tour non autorisé', 250, 0),
(57, 'Circulation hors-route', 170, 0),
(58, 'Non-respect des distances de sécurité', 30, 0),
(59, 'Arrêt dangereux / interdit', 150, 0),
(60, 'Stationnement gênant / interdit', 70, 0),
(61, 'Non respect  de la priorité à droite', 70, 0),
(62, 'Non-respect à un véhicule prioritaire', 90, 0),
(63, 'Non-respect d\'un stop', 105, 0),
(64, 'Non-respect d\'un feu rouge', 130, 0),
(65, 'Dépassement dangereux', 100, 0),
(66, 'Véhicule non en état', 100, 0),
(67, 'Conduite sans permis', 1500, 0),
(68, 'Délit de fuite', 800, 0),
(69, 'Excès de vitesse < 5 kmh', 90, 0),
(70, 'Excès de vitesse 5-15 kmh', 120, 0),
(71, 'Excès de vitesse 15-30 kmh', 180, 0),
(72, 'Excès de vitesse > 30 kmh', 300, 0),
(73, 'Entrave de la circulation', 110, 1),
(74, 'Dégradation de la voie publique', 90, 1),
(75, 'Trouble à l\'ordre publique', 90, 1),
(76, 'Entrave opération de police', 130, 1),
(77, 'Insulte envers / entre civils', 75, 1),
(78, 'Outrage à agent de police', 110, 1),
(79, 'Menace verbale ou intimidation envers civil', 90, 1),
(80, 'Menace verbale ou intimidation envers policier', 150, 1),
(81, 'Manifestation illégale', 250, 1),
(82, 'Tentative de corruption', 1500, 1),
(83, 'Arme blanche sortie en ville', 120, 2),
(84, 'Arme léthale sortie en ville', 300, 2),
(85, 'Port d\'arme non autorisé (défaut de license)', 600, 2),
(86, 'Port d\'arme illégal', 700, 2),
(87, 'Pris en flag lockpick', 300, 2),
(88, 'Vol de voiture', 1800, 2),
(89, 'Vente de drogue', 1500, 2),
(90, 'Fabriquation de drogue', 1500, 2),
(91, 'Possession de drogue', 650, 2),
(92, 'Prise d\'ôtage civil', 1500, 2),
(93, 'Prise d\'ôtage agent de l\'état', 2000, 2),
(94, 'Braquage particulier', 650, 2),
(95, 'Braquage magasin', 650, 2),
(96, 'Braquage de banque', 1500, 2),
(97, 'Tir sur civil', 2000, 3),
(98, 'Tir sur agent de l\'état', 2500, 3),
(99, 'Tentative de meurtre sur civil', 3000, 3),
(100, 'Tentative de meurtre sur agent de l\'état', 5000, 3),
(101, 'Meurtre sur civil', 10000, 3),
(102, 'Meurte sur agent de l\'état', 30000, 3),
(103, 'Meurtre involontaire', 1800, 3),
(104, 'Escroquerie à l\'entreprise', 2000, 2);

-- --------------------------------------------------------

--
-- Structure de la table `fine_types_gouv`
--

CREATE TABLE `fine_types_gouv` (
  `id` int(11) NOT NULL,
  `label` varchar(255) DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  `category` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `fine_types_gouv`
--

INSERT INTO `fine_types_gouv` (`id`, `label`, `amount`, `category`) VALUES
(1, 'Escroquerie à l\'entreprise', 2000, 2);

-- --------------------------------------------------------

--
-- Structure de la table `fine_types_vagos`
--

CREATE TABLE `fine_types_vagos` (
  `id` int(11) NOT NULL,
  `label` varchar(255) DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  `category` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `fine_types_vagos`
--

INSERT INTO `fine_types_vagos` (`id`, `label`, `amount`, `category`) VALUES
(1, 'Raket', 3000, 0),
(2, 'Raket', 5000, 0),
(3, 'Raket', 10000, 1),
(4, 'Raket', 20000, 1),
(5, 'Raket', 50000, 2),
(6, 'Raket', 150000, 3),
(7, 'Raket', 350000, 3);

-- --------------------------------------------------------

--
-- Structure de la table `items`
--

CREATE TABLE `items` (
  `name` varchar(50) NOT NULL,
  `label` varchar(50) NOT NULL,
  `limit` int(11) NOT NULL DEFAULT '-1',
  `rare` int(11) NOT NULL DEFAULT '0',
  `can_remove` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `items`
--

INSERT INTO `items` (`name`, `label`, `limit`, `rare`, `can_remove`) VALUES
('bandage', 'Bandage', 2, 0, 1),
('blowpipe', 'Chalumeaux', 2, 0, 1),
('bolcacahuetes', 'Bol de cacahuètes', 5, 0, 1),
('bolchips', 'Bol de chips', 5, 0, 1),
('bolnoixcajou', 'Bol de noix de cajou', 5, 0, 1),
('bolpistache', 'Bol de pistaches', 5, 0, 1),
('bread', 'Pain', 10, 0, 1),
('carokit', 'Kit carosserie', 3, 0, 1),
('carotool', 'outils carosserie', 2, 0, 1),
('carte', 'Carte De Banque', 10, 0, 1),
('cartebanque', 'Carte De Banque', 10, 0, 1),
('clip', 'Chargeur', 15, 0, 1),
('coffee', 'Café', 5, 0, 1),
('drpepper', 'Dr. Pepper', 5, 0, 1),
('energy', 'Energy Drink', 5, 0, 1),
('fixkit', 'Kit réparation', 3, 0, 1),
('fixtool', 'outils réparation', 2, 0, 1),
('gazbottle', 'bouteille de gaz', 2, 0, 1),
('golem', 'Golem', 5, 0, 1),
('grand_cru', 'Grand cru', -1, 0, 1),
('grapperaisin', 'Grappe de raisin', 5, 0, 1),
('ice', 'Glaçon', 5, 0, 1),
('icetea', 'Ice Tea', 5, 0, 1),
('jager', 'Jägermeister', 5, 0, 1),
('jagerbomb', 'Jägerbomb', 5, 0, 1),
('jagercerbere', 'Jäger Cerbère', 3, 0, 1),
('jusfruit', 'Jus de fruits', 5, 0, 1),
('jus_raisin', 'Jus de raisin', -1, 0, 1),
('limonade', 'Limonade', 5, 0, 1),
('martini', 'Martini blanc', 5, 0, 1),
('Masque1', 'Masque1', 10, 0, 1),
('Masque10', 'Masque10', 10, 0, 1),
('Masque10_1', 'Masque10_1', 10, 0, 1),
('Masque10_2', 'Masque10_2', 10, 0, 1),
('Masque11', 'Masque11', 10, 0, 1),
('Masque11_1', 'Masque11_1', 10, 0, 1),
('Masque11_2', 'Masque11_2', 10, 0, 1),
('Masque12', 'Masque12', 10, 0, 1),
('Masque12_1', 'Masque12_1', 10, 0, 1),
('Masque12_2', 'Masque12_2', 10, 0, 1),
('Masque13', 'Masque13', 10, 0, 1),
('Masque13_1', 'Masque13_1', 10, 0, 1),
('Masque13_2', 'Masque13_2', 10, 0, 1),
('Masque14', 'Masque14', 10, 0, 1),
('Masque14_1', 'Masque14_1', 10, 0, 1),
('Masque14_2', 'Masque14_2', 10, 0, 1),
('Masque15', 'Masque15', 10, 0, 1),
('Masque15_1', 'Masque15_1', 10, 0, 1),
('Masque15_2', 'Masque15_2', 10, 0, 1),
('Masque16', 'Masque16', 10, 0, 1),
('Masque16_1', 'Masque16_1', 10, 0, 1),
('Masque16_2', 'Masque16_2', 10, 0, 1),
('Masque17', 'Masque17', 10, 0, 1),
('Masque17_1', 'Masque17_1', 10, 0, 1),
('Masque17_2', 'Masque17_2', 10, 0, 1),
('Masque18', 'Masque18', 10, 0, 1),
('Masque18_1', 'Masque18_1', 10, 0, 1),
('Masque18_2', 'Masque18_2', 10, 0, 1),
('Masque19', 'Masque19', 10, 0, 1),
('Masque19_1', 'Masque19_1', 10, 0, 1),
('Masque19_2', 'Masque19_2', 10, 0, 1),
('Masque1_2', 'Masque1_2', 10, 0, 1),
('Masque1_3', 'Masque1_3', 10, 0, 1),
('Masque2', 'Masque2', 10, 0, 1),
('Masque20', 'Masque20', 10, 0, 1),
('Masque20_1', 'Masque20_1', 10, 0, 1),
('Masque20_2', 'Masque20_2', 10, 0, 1),
('Masque21', 'Masque21', 10, 0, 1),
('Masque21_1', 'Masque21_1', 10, 0, 1),
('Masque21_2', 'Masque21_2', 10, 0, 1),
('Masque22', 'Masque22', 10, 0, 1),
('Masque22_1', 'Masque22_1', 10, 0, 1),
('Masque22_2', 'Masque22_2', 10, 0, 1),
('Masque23', 'Masque23', 10, 0, 1),
('Masque23_1', 'Masque23_1', 10, 0, 1),
('Masque23_2', 'Masque23_2', 10, 0, 1),
('Masque24', 'Masque24', 10, 0, 1),
('Masque24_1', 'Masque24_1', 10, 0, 1),
('Masque24_2', 'Masque24_2', 10, 0, 1),
('Masque25', 'Masque25', 10, 0, 1),
('Masque25_1', 'Masque25_1', 10, 0, 1),
('Masque25_2', 'Masque25_2', 10, 0, 1),
('Masque26', 'Masque26', 10, 0, 1),
('Masque26_1', 'Masque26_1', 10, 0, 1),
('Masque26_2', 'Masque26_2', 10, 0, 1),
('Masque27', 'Masque27', 10, 0, 1),
('Masque27_1', 'Masque27_1', 10, 0, 1),
('Masque27_2', 'Masque27_2', 10, 0, 1),
('Masque28', 'Masque28', 10, 0, 1),
('Masque28_1', 'Masque28_1', 10, 0, 1),
('Masque28_2', 'Masque28_2', 10, 0, 1),
('Masque29', 'Masque29', 10, 0, 1),
('Masque29_1', 'Masque29_1', 10, 0, 1),
('Masque29_2', 'Masque29_2', 10, 0, 1),
('Masque2_1', 'Masque2_1', 10, 0, 1),
('Masque2_2', 'Masque2_2', 10, 0, 1),
('Masque3', 'Masque3', 10, 0, 1),
('Masque30', 'Masque30', 10, 0, 1),
('Masque30_1', 'Masque30_1', 10, 0, 1),
('Masque30_2', 'Masque30_2', 10, 0, 1),
('Masque31', 'Masque31', 10, 0, 1),
('Masque31_1', 'Masque31_1', 10, 0, 1),
('Masque31_2', 'Masque31_2', 10, 0, 1),
('Masque32', 'Masque32', 10, 0, 1),
('Masque32_1', 'Masque32_1', 10, 0, 1),
('Masque32_2', 'Masque32_2', 10, 0, 1),
('Masque33', 'Masque33', 10, 0, 1),
('Masque33_1', 'Masque33_1', 10, 0, 1),
('Masque33_2', 'Masque33_2', 10, 0, 1),
('Masque34', 'Masque34', 10, 0, 1),
('Masque34_1', 'Masque34_1', 10, 0, 1),
('Masque34_2', 'Masque34_2', 10, 0, 1),
('Masque35', 'Masque35', 10, 0, 1),
('Masque35_1', 'Masque35_1', 10, 0, 1),
('Masque35_2', 'Masque35_2', 10, 0, 1),
('Masque36', 'Masque36', 10, 0, 1),
('Masque36_1', 'Masque36_1', 10, 0, 1),
('Masque36_2', 'Masque36_2', 10, 0, 1),
('Masque37', 'Masque37', 10, 0, 1),
('Masque37_1', 'Masque37_1', 10, 0, 1),
('Masque37_2', 'Masque37_2', 10, 0, 1),
('Masque38', 'Masque38', 10, 0, 1),
('Masque38_1', 'Masque38_1', 10, 0, 1),
('Masque38_2', 'Masque38_2', 10, 0, 1),
('Masque39', 'Masque39', 10, 0, 1),
('Masque39_1', 'Masque39_1', 10, 0, 1),
('Masque39_2', 'Masque39_2', 10, 0, 1),
('Masque4', 'Masque4', 10, 0, 1),
('Masque40', 'Masque40', 10, 0, 1),
('Masque40_1', 'Masque40_1', 10, 0, 1),
('Masque40_2', 'Masque40_2', 10, 0, 1),
('Masque41', 'Masque41', 10, 0, 1),
('Masque41_1', 'Masque41_1', 10, 0, 1),
('Masque41_2', 'Masque41_2', 10, 0, 1),
('Masque42', 'Masque42', 10, 0, 1),
('Masque42_1', 'Masque42_1', 10, 0, 1),
('Masque42_2', 'Masque42_2', 10, 0, 1),
('Masque43', 'Masque43', 10, 0, 1),
('Masque43_1', 'Masque43_1', 10, 0, 1),
('Masque43_2', 'Masque43_2', 10, 0, 1),
('Masque44', 'Masque44', 10, 0, 1),
('Masque44_1', 'Masque44_1', 10, 0, 1),
('Masque44_2', 'Masque44_2', 10, 0, 1),
('Masque45', 'Masque45', 10, 0, 1),
('Masque45_1', 'Masque45_1', 10, 0, 1),
('Masque45_2', 'Masque45_2', 10, 0, 1),
('Masque46', 'Masque46', 10, 0, 1),
('Masque46_1', 'Masque46_1', 10, 0, 1),
('Masque46_2', 'Masque46_2', 10, 0, 1),
('Masque47', 'Masque47', 10, 0, 1),
('Masque47_1', 'Masque47_1', 10, 0, 1),
('Masque47_2', 'Masque47_2', 10, 0, 1),
('Masque48', 'Masque48', 10, 0, 1),
('Masque48_1', 'Masque48_1', 10, 0, 1),
('Masque48_2', 'Masque48_2', 10, 0, 1),
('Masque49', 'Masque49', 10, 0, 1),
('Masque49_1', 'Masque49_1', 10, 0, 1),
('Masque49_2', 'Masque49_2', 10, 0, 1),
('Masque4_1', 'Masque4_1', 10, 0, 1),
('Masque4_2', 'Masque4_2', 10, 0, 1),
('Masque5', 'Masque5', 10, 0, 1),
('Masque50', 'Masque50', 10, 0, 1),
('Masque50_1', 'Masque50_1', 10, 0, 1),
('Masque50_2', 'Masque50_2', 10, 0, 1),
('Masque50_3', 'Masque50_3', 10, 0, 1),
('Masque50_4', 'Masque50_4', 10, 0, 1),
('Masque50_5', 'Masque50_5', 10, 0, 1),
('Masque50_6', 'Masque50_6', 10, 0, 1),
('Masque50_7', 'Masque50_7', 10, 0, 1),
('Masque50_8', 'Masque50_8', 10, 0, 1),
('Masque50_9', 'Masque50_9', 10, 0, 1),
('Masque51', 'Masque1', 10, 0, 1),
('Masque51_1', 'Masque51_1', 10, 0, 1),
('Masque51_2', 'Masque51_2', 10, 0, 1),
('Masque51_3', 'Masque51_3', 10, 0, 1),
('Masque51_4', 'Masque51_4', 10, 0, 1),
('Masque51_5', 'Masque51_5', 10, 0, 1),
('Masque51_6', 'Masque51_6', 10, 0, 1),
('Masque51_7', 'Masque51_7', 10, 0, 1),
('Masque51_8', 'Masque51_8', 10, 0, 1),
('Masque51_9', 'Masque51_9', 10, 0, 1),
('Masque52', 'Masque52', 10, 0, 1),
('Masque52_1', 'Masque52_1', 10, 0, 1),
('Masque52_2', 'Masque52_2', 10, 0, 1),
('Masque52_3', 'Masque52_3', 10, 0, 1),
('Masque52_4', 'Masque52_4', 10, 0, 1),
('Masque52_5', 'Masque52_5', 10, 0, 1),
('Masque52_6', 'Masque52_6', 10, 0, 1),
('Masque52_7', 'Masque52_7', 10, 0, 1),
('Masque52_8', 'Masque52_8', 10, 0, 1),
('Masque52_9', 'Masque52_9', 10, 0, 1),
('Masque53', 'Masque53', 10, 0, 1),
('Masque53_1', 'Masque53_1', 10, 0, 1),
('Masque53_2', 'Masque53_2', 10, 0, 1),
('Masque53_3', 'Masque53_3', 10, 0, 1),
('Masque53_4', 'Masque53_4', 10, 0, 1),
('Masque53_5', 'Masque53_5', 10, 0, 1),
('Masque53_6', 'Masque53_6', 10, 0, 1),
('Masque53_7', 'Masque53_7', 10, 0, 1),
('Masque53_8', 'Masque53_8', 10, 0, 1),
('Masque53_9', 'Masque53_9', 10, 0, 1),
('Masque54', 'Masque54', 10, 0, 1),
('Masque54_1', 'Masque54_1', 10, 0, 1),
('Masque54_2', 'Masque54_2', 10, 0, 1),
('Masque54_3', 'Masque54_3', 10, 0, 1),
('Masque54_4', 'Masque54_4', 10, 0, 1),
('Masque54_5', 'Masque54_5', 10, 0, 1),
('Masque54_6', 'Masque54_6', 10, 0, 1),
('Masque54_7', 'Masque54_7', 10, 0, 1),
('Masque54_8', 'Masque54_8', 10, 0, 1),
('Masque54_9', 'Masque54_9', 10, 0, 1),
('Masque55', 'Masque55', 10, 0, 1),
('Masque55_1', 'Masque55_1', 10, 0, 1),
('Masque55_2', 'Masque55_2', 10, 0, 1),
('Masque56', 'Masque56', 10, 0, 1),
('Masque56_1', 'Masque56_1', 10, 0, 1),
('Masque56_2', 'Masque56_2', 10, 0, 1),
('Masque57', 'Masque57', 10, 0, 1),
('Masque57_1', 'Masque57_1', 10, 0, 1),
('Masque57_2', 'Masque57_2', 10, 0, 1),
('Masque58', 'Masque58', 10, 0, 1),
('Masque58_1', 'Masque58_1', 10, 0, 1),
('Masque58_2', 'Masque58_2', 10, 0, 1),
('Masque59', 'Masque59', 10, 0, 1),
('Masque59_1', 'Masque59_1', 10, 0, 1),
('Masque59_2', 'Masque59_2', 10, 0, 1),
('Masque5_1', 'Masque5_1', 10, 0, 1),
('Masque5_2', 'Masque5_2', 10, 0, 1),
('Masque6', 'Masque6', 10, 0, 1),
('Masque60', 'Masque60', 10, 0, 1),
('Masque60_1', 'Masque60_1', 10, 0, 1),
('Masque60_2', 'Masque60_2', 10, 0, 1),
('Masque6_1', 'Masque6_1', 10, 0, 1),
('Masque6_2', 'Masque6_2', 10, 0, 1),
('Masque7', 'Masque7', 10, 0, 1),
('Masque7_1', 'Masque7_1', 10, 0, 1),
('Masque7_2', 'Masque7_2', 10, 0, 1),
('Masque8', 'Masque8', 10, 0, 1),
('Masque8_1', 'Masque8_1', 10, 0, 1),
('Masque8_2', 'Masque8_2', 10, 0, 1),
('Masque9', 'Masque9', 10, 0, 1),
('Masque9_1', 'Masque9_1', 10, 0, 1),
('Masque9_2', 'Masque9_2', 10, 0, 1),
('medikit', 'Medikit', 2, 0, 1),
('menergy', 'Monster Energy', 5, 0, 1),
('menthe', 'Feuille de menthe', 10, 0, 1),
('metreshooter', 'Mètre de shooter', 3, 0, 1),
('mixapero', 'Mix Apéritif', 3, 0, 1),
('mojito', 'Mojito', 5, 0, 1),
('piluleoubli', 'Pilule de l\'oubli', 5, 0, 1),
('raisin', 'Raisin', -1, 0, 1),
('redbull', 'RedBull', 5, 0, 1),
('rhum', 'Rhum', 5, 0, 1),
('rhumcoca', 'Rhum-coca', 5, 0, 1),
('rhumfruit', 'Rhum-jus de fruits', 5, 0, 1),
('sandwich', 'Sandwich', 10, 0, 1),
('saucisson', 'Saucisson', 5, 0, 1),
('sim', 'Carte Sim', -1, 0, 1),
('soda', 'Soda', 5, 0, 1),
('tel', 'Téléphone', -1, 0, 1),
('teqpaf', 'Teq\'paf', 5, 0, 1),
('tequila', 'Tequila', 5, 0, 1),
('vine', 'Vin', -1, 0, 1),
('vodka', 'Vodka', 5, 0, 1),
('vodkaenergy', 'Vodka-energy', 5, 0, 1),
('vodkafruit', 'Vodka-jus de fruits', 5, 0, 1),
('water', 'Eau', 5, 0, 1),
('whisky', 'Whisky', 5, 0, 1),
('whiskycoca', 'Whisky-coca', 5, 0, 1),
('xanax', 'Xanax', -1, 0, 1);

-- --------------------------------------------------------

--
-- Structure de la table `jobs`
--

CREATE TABLE `jobs` (
  `name` varchar(50) NOT NULL,
  `label` varchar(50) DEFAULT NULL,
  `whitelisted` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Contenu de la table `jobs`
--

INSERT INTO `jobs` (`name`, `label`, `whitelisted`) VALUES
('aircraftdealer', 'Airliner', 1),
('ambulance', 'Ambulance', 1),
('armurier', 'Armurier', 1),
('avocat', 'avocat', 1),
('aztecas', 'Aztecas', 1),
('bahama', 'bahama', 1),
('biker', 'Hells Angels', 1),
('bloods', 'Bloods', 1),
('cardealer', 'Concessionnaire', 1),
('cartel', 'Cartel', 1),
('crips', 'crips', 1),
('fire', 'Pompier', 0),
('gouv', 'Gouv', 1),
('journaliste', 'journaliste', 1),
('ltdnord', 'LTD Nord', 0),
('ltdsud', 'LTD Sud', 0),
('mafia', 'mafia', 1),
('mechanic', 'Mécano', 1),
('nightclub', 'Nightclub', 1),
('police', 'LSPD', 1),
('realestateagent', 'Agent immobilier', 1),
('sheriff', 'Sheriff', 1),
('taxi', 'Taxi', 1),
('ubereats', 'UberEats', 0),
('unemployed', 'Chomeur', 0),
('unemployed2', 'Etat', 0),
('unicorn', 'Unicorn', 1),
('vagos', 'Vagos', 1),
('vigne', 'Vigneron', 1);

-- --------------------------------------------------------

--
-- Structure de la table `job_grades`
--

CREATE TABLE `job_grades` (
  `id` int(11) NOT NULL,
  `job_name` varchar(50) DEFAULT NULL,
  `grade` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `label` varchar(50) NOT NULL,
  `salary` int(11) NOT NULL,
  `skin_male` longtext NOT NULL,
  `skin_female` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Contenu de la table `job_grades`
--

INSERT INTO `job_grades` (`id`, `job_name`, `grade`, `name`, `label`, `salary`, `skin_male`, `skin_female`) VALUES
(1, 'unemployed', 0, 'unemployed', 'Pole emploi', 50, '{}', '{}'),
(256, 'unemployed2', 0, 'rsa', 'Civil', 5, '{}', '{}'),
(257, 'cardealer', 0, 'recruit', 'Recrue', 10, '{}', '{}'),
(258, 'cardealer', 1, 'novice', 'Novice', 25, '{}', '{}'),
(259, 'cardealer', 2, 'experienced', 'Experimente', 40, '{}', '{}'),
(260, 'cardealer', 3, 'boss', 'Patron', 0, '{}', '{}'),
(261, 'sheriff', 0, 'recruit', 'Recrue', 20, '{}', '{}'),
(262, 'sheriff', 1, 'officer', 'Deputy', 40, '{}', '{}'),
(263, 'sheriff', 2, 'sergeant', 'Major', 60, '{}', '{}'),
(264, 'sheriff', 3, 'lieutenant', 'Sheriff-Adjoint', 85, '{}', '{}'),
(265, 'sheriff', 4, 'boss', 'Sheriff', 100, '{}', '{}'),
(266, 'realestateagent', 0, 'location', 'Location', 10, '{}', '{}'),
(267, 'realestateagent', 1, 'vendeur', 'Vendeur', 25, '{}', '{}'),
(268, 'realestateagent', 2, 'gestion', 'Gestion', 40, '{}', '{}'),
(269, 'realestateagent', 3, 'boss', 'Patron', 0, '{}', '{}'),
(270, 'mechanic', 0, 'recrue', 'Recrue', 1200, '{}', '{}'),
(271, 'mechanic', 1, 'novice', 'Novice', 24, '{}', '{}'),
(272, 'mechanic', 2, 'experimente', 'Experimente', 36, '{}', '{}'),
(273, 'mechanic', 3, 'chief', 'Chef d\'équipe', 48, '{}', '{}'),
(274, 'mechanic', 4, 'boss', 'Patron', 0, '{}', '{}'),
(280, 'police', 0, 'recruit', 'Recrue', 500, '{}', '{}'),
(281, 'police', 1, 'officer', 'Officier', 500, '{}', '{}'),
(282, 'police', 2, 'sergeant', 'Sergent', 500, '{}', '{}'),
(283, 'police', 3, 'lieutenant', 'Lieutenant', 500, '{}', '{}'),
(284, 'police', 4, 'boss', 'Commandant', 100, '{}', '{}'),
(290, 'aircraftdealer', 0, 'recruit', 'Recruit', 10, '{}', '{}'),
(291, 'aircraftdealer', 1, 'novice', 'Novice', 25, '{}', '{}'),
(292, 'aircraftdealer', 2, 'experienced', 'Expert', 40, '{}', '{}'),
(293, 'aircraftdealer', 3, 'boss', 'Boss', 0, '{}', '{}'),
(294, 'ambulance', 0, 'ambulance', 'Ambulancier', 20, '{\"tshirt_2\":0,\"hair_color_1\":5,\"glasses_2\":3,\"shoes\":9,\"torso_2\":3,\"hair_color_2\":0,\"pants_1\":24,\"glasses_1\":4,\"hair_1\":2,\"sex\":0,\"decals_2\":0,\"tshirt_1\":15,\"arms\":92,\"face\":19,\"decals_1\":60,\"torso_1\":13,\"hair_2\":0,\"skin\":34,\"pants_2\":5}', '{\"tshirt_2\":3,\"decals_2\":0,\"glasses\":0,\"hair_1\":2,\"torso_1\":73,\"shoes\":1,\"hair_color_2\":0,\"glasses_1\":19,\"skin\":13,\"face\":6,\"pants_2\":5,\"tshirt_1\":75,\"pants_1\":37,\"helmet_1\":57,\"torso_2\":0,\"arms\":14,\"sex\":1,\"glasses_2\":0,\"decals_1\":0,\"hair_2\":0,\"helmet_2\":0,\"hair_color_1\":0}'),
(295, 'ambulance', 1, 'doctor', 'Medecin', 40, '{\"tshirt_2\":0,\"hair_color_1\":5,\"glasses_2\":3,\"shoes\":9,\"torso_2\":3,\"hair_color_2\":0,\"pants_1\":24,\"glasses_1\":4,\"hair_1\":2,\"sex\":0,\"decals_2\":0,\"tshirt_1\":15,\"arms\":92,\"face\":19,\"decals_1\":60,\"torso_1\":13,\"hair_2\":0,\"skin\":34,\"pants_2\":5}', '{\"tshirt_2\":3,\"decals_2\":0,\"glasses\":0,\"hair_1\":2,\"torso_1\":73,\"shoes\":1,\"hair_color_2\":0,\"glasses_1\":19,\"skin\":13,\"face\":6,\"pants_2\":5,\"tshirt_1\":75,\"pants_1\":37,\"helmet_1\":57,\"torso_2\":0,\"arms\":14,\"sex\":1,\"glasses_2\":0,\"decals_1\":0,\"hair_2\":0,\"helmet_2\":0,\"hair_color_1\":0}'),
(296, 'ambulance', 2, 'chief_doctor', 'Medecin-chef', 60, '{\"tshirt_2\":0,\"hair_color_1\":5,\"glasses_2\":3,\"shoes\":9,\"torso_2\":3,\"hair_color_2\":0,\"pants_1\":24,\"glasses_1\":4,\"hair_1\":2,\"sex\":0,\"decals_2\":0,\"tshirt_1\":15,\"arms\":92,\"face\":19,\"decals_1\":60,\"torso_1\":13,\"hair_2\":0,\"skin\":34,\"pants_2\":5}', '{\"tshirt_2\":3,\"decals_2\":0,\"glasses\":0,\"hair_1\":2,\"torso_1\":73,\"shoes\":1,\"hair_color_2\":0,\"glasses_1\":19,\"skin\":13,\"face\":6,\"pants_2\":5,\"tshirt_1\":75,\"pants_1\":37,\"helmet_1\":57,\"torso_2\":0,\"arms\":14,\"sex\":1,\"glasses_2\":0,\"decals_1\":0,\"hair_2\":0,\"helmet_2\":0,\"hair_color_1\":0}'),
(297, 'ambulance', 3, 'boss', 'Chirurgien', 80, '{\"tshirt_2\":0,\"hair_color_1\":5,\"glasses_2\":3,\"shoes\":9,\"torso_2\":3,\"hair_color_2\":0,\"pants_1\":24,\"glasses_1\":4,\"hair_1\":2,\"sex\":0,\"decals_2\":0,\"tshirt_1\":15,\"arms\":92,\"face\":19,\"decals_1\":60,\"torso_1\":13,\"hair_2\":0,\"skin\":34,\"pants_2\":5}', '{\"tshirt_2\":3,\"decals_2\":0,\"glasses\":0,\"hair_1\":2,\"torso_1\":73,\"shoes\":1,\"hair_color_2\":0,\"glasses_1\":19,\"skin\":13,\"face\":6,\"pants_2\":5,\"tshirt_1\":75,\"pants_1\":37,\"helmet_1\":57,\"torso_2\":0,\"arms\":14,\"sex\":1,\"glasses_2\":0,\"decals_1\":0,\"hair_2\":0,\"helmet_2\":0,\"hair_color_1\":0}'),
(302, 'taxi', 0, 'recrue', 'Recrue', 12, '{\"hair_2\":0,\"hair_color_2\":0,\"torso_1\":32,\"bags_1\":0,\"helmet_2\":0,\"chain_2\":0,\"eyebrows_3\":0,\"makeup_3\":0,\"makeup_2\":0,\"tshirt_1\":31,\"makeup_1\":0,\"bags_2\":0,\"makeup_4\":0,\"eyebrows_4\":0,\"chain_1\":0,\"lipstick_4\":0,\"bproof_2\":0,\"hair_color_1\":0,\"decals_2\":0,\"pants_2\":0,\"age_2\":0,\"glasses_2\":0,\"ears_2\":0,\"arms\":27,\"lipstick_1\":0,\"ears_1\":-1,\"mask_2\":0,\"sex\":0,\"lipstick_3\":0,\"helmet_1\":-1,\"shoes_2\":0,\"beard_2\":0,\"beard_1\":0,\"lipstick_2\":0,\"beard_4\":0,\"glasses_1\":0,\"bproof_1\":0,\"mask_1\":0,\"decals_1\":1,\"hair_1\":0,\"eyebrows_2\":0,\"beard_3\":0,\"age_1\":0,\"tshirt_2\":0,\"skin\":0,\"torso_2\":0,\"eyebrows_1\":0,\"face\":0,\"shoes_1\":10,\"pants_1\":24}', '{\"hair_2\":0,\"hair_color_2\":0,\"torso_1\":57,\"bags_1\":0,\"helmet_2\":0,\"chain_2\":0,\"eyebrows_3\":0,\"makeup_3\":0,\"makeup_2\":0,\"tshirt_1\":38,\"makeup_1\":0,\"bags_2\":0,\"makeup_4\":0,\"eyebrows_4\":0,\"chain_1\":0,\"lipstick_4\":0,\"bproof_2\":0,\"hair_color_1\":0,\"decals_2\":0,\"pants_2\":1,\"age_2\":0,\"glasses_2\":0,\"ears_2\":0,\"arms\":21,\"lipstick_1\":0,\"ears_1\":-1,\"mask_2\":0,\"sex\":1,\"lipstick_3\":0,\"helmet_1\":-1,\"shoes_2\":0,\"beard_2\":0,\"beard_1\":0,\"lipstick_2\":0,\"beard_4\":0,\"glasses_1\":5,\"bproof_1\":0,\"mask_1\":0,\"decals_1\":1,\"hair_1\":0,\"eyebrows_2\":0,\"beard_3\":0,\"age_1\":0,\"tshirt_2\":0,\"skin\":0,\"torso_2\":0,\"eyebrows_1\":0,\"face\":0,\"shoes_1\":49,\"pants_1\":11}'),
(303, 'taxi', 1, 'novice', 'Novice', 24, '{\"hair_2\":0,\"hair_color_2\":0,\"torso_1\":32,\"bags_1\":0,\"helmet_2\":0,\"chain_2\":0,\"eyebrows_3\":0,\"makeup_3\":0,\"makeup_2\":0,\"tshirt_1\":31,\"makeup_1\":0,\"bags_2\":0,\"makeup_4\":0,\"eyebrows_4\":0,\"chain_1\":0,\"lipstick_4\":0,\"bproof_2\":0,\"hair_color_1\":0,\"decals_2\":0,\"pants_2\":0,\"age_2\":0,\"glasses_2\":0,\"ears_2\":0,\"arms\":27,\"lipstick_1\":0,\"ears_1\":-1,\"mask_2\":0,\"sex\":0,\"lipstick_3\":0,\"helmet_1\":-1,\"shoes_2\":0,\"beard_2\":0,\"beard_1\":0,\"lipstick_2\":0,\"beard_4\":0,\"glasses_1\":0,\"bproof_1\":0,\"mask_1\":0,\"decals_1\":1,\"hair_1\":0,\"eyebrows_2\":0,\"beard_3\":0,\"age_1\":0,\"tshirt_2\":0,\"skin\":0,\"torso_2\":0,\"eyebrows_1\":0,\"face\":0,\"shoes_1\":10,\"pants_1\":24}', '{\"hair_2\":0,\"hair_color_2\":0,\"torso_1\":57,\"bags_1\":0,\"helmet_2\":0,\"chain_2\":0,\"eyebrows_3\":0,\"makeup_3\":0,\"makeup_2\":0,\"tshirt_1\":38,\"makeup_1\":0,\"bags_2\":0,\"makeup_4\":0,\"eyebrows_4\":0,\"chain_1\":0,\"lipstick_4\":0,\"bproof_2\":0,\"hair_color_1\":0,\"decals_2\":0,\"pants_2\":1,\"age_2\":0,\"glasses_2\":0,\"ears_2\":0,\"arms\":21,\"lipstick_1\":0,\"ears_1\":-1,\"mask_2\":0,\"sex\":1,\"lipstick_3\":0,\"helmet_1\":-1,\"shoes_2\":0,\"beard_2\":0,\"beard_1\":0,\"lipstick_2\":0,\"beard_4\":0,\"glasses_1\":5,\"bproof_1\":0,\"mask_1\":0,\"decals_1\":1,\"hair_1\":0,\"eyebrows_2\":0,\"beard_3\":0,\"age_1\":0,\"tshirt_2\":0,\"skin\":0,\"torso_2\":0,\"eyebrows_1\":0,\"face\":0,\"shoes_1\":49,\"pants_1\":11}'),
(304, 'taxi', 2, 'experimente', 'Experimente', 36, '{\"hair_2\":0,\"hair_color_2\":0,\"torso_1\":26,\"bags_1\":0,\"helmet_2\":0,\"chain_2\":0,\"eyebrows_3\":0,\"makeup_3\":0,\"makeup_2\":0,\"tshirt_1\":57,\"makeup_1\":0,\"bags_2\":0,\"makeup_4\":0,\"eyebrows_4\":0,\"chain_1\":0,\"lipstick_4\":0,\"bproof_2\":0,\"hair_color_1\":0,\"decals_2\":0,\"pants_2\":4,\"age_2\":0,\"glasses_2\":0,\"ears_2\":0,\"arms\":11,\"lipstick_1\":0,\"ears_1\":-1,\"mask_2\":0,\"sex\":0,\"lipstick_3\":0,\"helmet_1\":-1,\"shoes_2\":0,\"beard_2\":0,\"beard_1\":0,\"lipstick_2\":0,\"beard_4\":0,\"glasses_1\":0,\"bproof_1\":0,\"mask_1\":0,\"decals_1\":0,\"hair_1\":0,\"eyebrows_2\":0,\"beard_3\":0,\"age_1\":0,\"tshirt_2\":0,\"skin\":0,\"torso_2\":0,\"eyebrows_1\":0,\"face\":0,\"shoes_1\":10,\"pants_1\":24}', '{\"hair_2\":0,\"hair_color_2\":0,\"torso_1\":57,\"bags_1\":0,\"helmet_2\":0,\"chain_2\":0,\"eyebrows_3\":0,\"makeup_3\":0,\"makeup_2\":0,\"tshirt_1\":38,\"makeup_1\":0,\"bags_2\":0,\"makeup_4\":0,\"eyebrows_4\":0,\"chain_1\":0,\"lipstick_4\":0,\"bproof_2\":0,\"hair_color_1\":0,\"decals_2\":0,\"pants_2\":1,\"age_2\":0,\"glasses_2\":0,\"ears_2\":0,\"arms\":21,\"lipstick_1\":0,\"ears_1\":-1,\"mask_2\":0,\"sex\":1,\"lipstick_3\":0,\"helmet_1\":-1,\"shoes_2\":0,\"beard_2\":0,\"beard_1\":0,\"lipstick_2\":0,\"beard_4\":0,\"glasses_1\":5,\"bproof_1\":0,\"mask_1\":0,\"decals_1\":1,\"hair_1\":0,\"eyebrows_2\":0,\"beard_3\":0,\"age_1\":0,\"tshirt_2\":0,\"skin\":0,\"torso_2\":0,\"eyebrows_1\":0,\"face\":0,\"shoes_1\":49,\"pants_1\":11}'),
(305, 'taxi', 3, 'uber', 'Uber', 48, '{\"hair_2\":0,\"hair_color_2\":0,\"torso_1\":26,\"bags_1\":0,\"helmet_2\":0,\"chain_2\":0,\"eyebrows_3\":0,\"makeup_3\":0,\"makeup_2\":0,\"tshirt_1\":57,\"makeup_1\":0,\"bags_2\":0,\"makeup_4\":0,\"eyebrows_4\":0,\"chain_1\":0,\"lipstick_4\":0,\"bproof_2\":0,\"hair_color_1\":0,\"decals_2\":0,\"pants_2\":4,\"age_2\":0,\"glasses_2\":0,\"ears_2\":0,\"arms\":11,\"lipstick_1\":0,\"ears_1\":-1,\"mask_2\":0,\"sex\":0,\"lipstick_3\":0,\"helmet_1\":-1,\"shoes_2\":0,\"beard_2\":0,\"beard_1\":0,\"lipstick_2\":0,\"beard_4\":0,\"glasses_1\":0,\"bproof_1\":0,\"mask_1\":0,\"decals_1\":0,\"hair_1\":0,\"eyebrows_2\":0,\"beard_3\":0,\"age_1\":0,\"tshirt_2\":0,\"skin\":0,\"torso_2\":0,\"eyebrows_1\":0,\"face\":0,\"shoes_1\":10,\"pants_1\":24}', '{\"hair_2\":0,\"hair_color_2\":0,\"torso_1\":57,\"bags_1\":0,\"helmet_2\":0,\"chain_2\":0,\"eyebrows_3\":0,\"makeup_3\":0,\"makeup_2\":0,\"tshirt_1\":38,\"makeup_1\":0,\"bags_2\":0,\"makeup_4\":0,\"eyebrows_4\":0,\"chain_1\":0,\"lipstick_4\":0,\"bproof_2\":0,\"hair_color_1\":0,\"decals_2\":0,\"pants_2\":1,\"age_2\":0,\"glasses_2\":0,\"ears_2\":0,\"arms\":21,\"lipstick_1\":0,\"ears_1\":-1,\"mask_2\":0,\"sex\":1,\"lipstick_3\":0,\"helmet_1\":-1,\"shoes_2\":0,\"beard_2\":0,\"beard_1\":0,\"lipstick_2\":0,\"beard_4\":0,\"glasses_1\":5,\"bproof_1\":0,\"mask_1\":0,\"decals_1\":1,\"hair_1\":0,\"eyebrows_2\":0,\"beard_3\":0,\"age_1\":0,\"tshirt_2\":0,\"skin\":0,\"torso_2\":0,\"eyebrows_1\":0,\"face\":0,\"shoes_1\":49,\"pants_1\":11}'),
(306, 'taxi', 4, 'boss', 'Patron', 0, '{\"hair_2\":0,\"hair_color_2\":0,\"torso_1\":29,\"bags_1\":0,\"helmet_2\":0,\"chain_2\":0,\"eyebrows_3\":0,\"makeup_3\":0,\"makeup_2\":0,\"tshirt_1\":31,\"makeup_1\":0,\"bags_2\":0,\"makeup_4\":0,\"eyebrows_4\":0,\"chain_1\":0,\"lipstick_4\":0,\"bproof_2\":0,\"hair_color_1\":0,\"decals_2\":0,\"pants_2\":4,\"age_2\":0,\"glasses_2\":0,\"ears_2\":0,\"arms\":1,\"lipstick_1\":0,\"ears_1\":-1,\"mask_2\":0,\"sex\":0,\"lipstick_3\":0,\"helmet_1\":-1,\"shoes_2\":0,\"beard_2\":0,\"beard_1\":0,\"lipstick_2\":0,\"beard_4\":0,\"glasses_1\":0,\"bproof_1\":0,\"mask_1\":0,\"decals_1\":0,\"hair_1\":0,\"eyebrows_2\":0,\"beard_3\":0,\"age_1\":0,\"tshirt_2\":0,\"skin\":0,\"torso_2\":4,\"eyebrows_1\":0,\"face\":0,\"shoes_1\":10,\"pants_1\":24}', '{\"hair_2\":0,\"hair_color_2\":0,\"torso_1\":57,\"bags_1\":0,\"helmet_2\":0,\"chain_2\":0,\"eyebrows_3\":0,\"makeup_3\":0,\"makeup_2\":0,\"tshirt_1\":38,\"makeup_1\":0,\"bags_2\":0,\"makeup_4\":0,\"eyebrows_4\":0,\"chain_1\":0,\"lipstick_4\":0,\"bproof_2\":0,\"hair_color_1\":0,\"decals_2\":0,\"pants_2\":1,\"age_2\":0,\"glasses_2\":0,\"ears_2\":0,\"arms\":21,\"lipstick_1\":0,\"ears_1\":-1,\"mask_2\":0,\"sex\":1,\"lipstick_3\":0,\"helmet_1\":-1,\"shoes_2\":0,\"beard_2\":0,\"beard_1\":0,\"lipstick_2\":0,\"beard_4\":0,\"glasses_1\":5,\"bproof_1\":0,\"mask_1\":0,\"decals_1\":1,\"hair_1\":0,\"eyebrows_2\":0,\"beard_3\":0,\"age_1\":0,\"tshirt_2\":0,\"skin\":0,\"torso_2\":0,\"eyebrows_1\":0,\"face\":0,\"shoes_1\":49,\"pants_1\":11}'),
(307, 'bahama', 0, 'barman', 'Barman', 300, '{}', '{}'),
(308, 'bahama', 1, 'dj', 'DJ', 300, '{}', '{}'),
(309, 'bahama', 2, 'secu', 'Sécurité', 300, '{}', '{}'),
(310, 'bahama', 3, 'viceboss', 'Co-gérant', 500, '{}', '{}'),
(311, 'bahama', 4, 'boss', 'Gérant', 600, '{}', '{}'),
(312, 'journaliste', 0, 'stagiaire', 'Stagiaire', 250, '{}', '{}'),
(313, 'journaliste', 1, 'reporter', 'Reporter', 350, '{}', '{}'),
(314, 'journaliste', 2, 'investigator', 'Enquêteur', 400, '{}', '{}'),
(315, 'journaliste', 3, 'boss', 'Rédac\' chef', 450, '{}', '{}'),
(316, 'nightclub', 0, 'barman', 'Barman', 1450, '{}', '{}'),
(317, 'nightclub', 1, 'dancer', 'Danceur', 1450, '{}', '{}'),
(318, 'nightclub', 2, 'viceboss', 'Co-Manager', 3500, '{}', '{}'),
(319, 'nightclub', 3, 'boss', 'Manager', 5000, '{}', '{}'),
(320, 'unicorn', 0, 'barman', 'Barman', 300, '{}', '{}'),
(321, 'unicorn', 1, 'dancer', 'Danseur', 300, '{}', '{}'),
(322, 'unicorn', 2, 'viceboss', 'Co-gérant', 500, '{}', '{}'),
(323, 'unicorn', 3, 'boss', 'Gérant', 600, '{}', '{}'),
(324, 'vigne', 0, 'recrue', 'Intérimaire', 500, '{\"tshirt_1\":59,\"tshirt_2\":0,\"torso_1\":12,\"torso_2\":5,\"shoes_1\":7,\"shoes_2\":2,\"pants_1\":9, \"pants_2\":7, \"arms\":1, \"helmet_1\":11, \"helmet_2\":0,\"bags_1\":0,\"bags_2\":0,\"ears_1\":0,\"glasses_1\":0,\"ears_2\":0,\"glasses_2\":0}', '{\"tshirt_1\":0,\"tshirt_2\":0,\"torso_1\":56,\"torso_2\":0,\"shoes_1\":27,\"shoes_2\":0,\"pants_1\":36, \"pants_2\":0, \"arms\":63, \"helmet_1\":11, \"helmet_2\":0,\"bags_1\":0,\"bags_2\":0,\"ears_1\":0,\"glasses_1\":0,\"ears_2\":0,\"glasses_2\":0}'),
(325, 'vigne', 1, 'novice', 'Vigneron', 750, '{\"tshirt_1\":57,\"tshirt_2\":0,\"torso_1\":13,\"torso_2\":5,\"shoes_1\":7,\"shoes_2\":2,\"pants_1\":9, \"pants_2\":7, \"arms\":11, \"helmet_1\":11, \"helmet_2\":0,\"bags_1\":0,\"bags_2\":0,\"ears_1\":0,\"glasses_1\":0,\"ears_2\":0,\"glasses_2\":0}', '{\"tshirt_1\":0,\"tshirt_2\":0,\"torso_1\":56,\"torso_2\":0,\"shoes_1\":27,\"shoes_2\":0,\"pants_1\":36, \"pants_2\":0, \"arms\":63, \"helmet_1\":11, \"helmet_2\":0,\"bags_1\":0,\"bags_2\":0,\"ears_1\":0,\"glasses_1\":0,\"ears_2\":0,\"glasses_2\":0}'),
(326, 'vigne', 2, 'cdisenior', 'Chef de chai', 1200, '{\"tshirt_1\":57,\"tshirt_2\":0,\"torso_1\":13,\"torso_2\":5,\"shoes_1\":7,\"shoes_2\":2,\"pants_1\":9, \"pants_2\":7, \"arms\":11, \"helmet_1\":11, \"helmet_2\":0,\"bags_1\":0,\"bags_2\":0,\"ears_1\":0,\"glasses_1\":0,\"ears_2\":0,\"glasses_2\":0}', '{\"tshirt_1\":0,\"tshirt_2\":0,\"torso_1\":56,\"torso_2\":0,\"shoes_1\":27,\"shoes_2\":0,\"pants_1\":36, \"pants_2\":0, \"arms\":63, \"helmet_1\":11, \"helmet_2\":0,\"bags_1\":0,\"bags_2\":0,\"ears_1\":0,\"glasses_1\":0,\"ears_2\":0,\"glasses_2\":0}'),
(327, 'vigne', 3, 'boss', 'Patron', 1600, '{\"tshirt_1\":57,\"tshirt_2\":0,\"torso_1\":13,\"torso_2\":5,\"shoes_1\":7,\"shoes_2\":2,\"pants_1\":9, \"pants_2\":7, \"arms\":11, \"helmet_1\":11, \"helmet_2\":0,\"bags_1\":0,\"bags_2\":0,\"ears_1\":0,\"glasses_1\":0,\"ears_2\":0,\"glasses_2\":0}', '{\"tshirt_1\":15,\"tshirt_2\":0,\"torso_1\":14,\"torso_2\":15,\"shoes_1\":12,\"shoes_2\":0,\"pants_1\":9, \"pants_2\":5, \"arms\":1, \"helmet_1\":11, \"helmet_2\":0,\"bags_1\":0,\"bags_2\":0,\"ears_1\":0,\"glasses_1\":0,\"ears_2\":0,\"glasses_2\":0}'),
(328, 'avocat', 0, 'stagiaire', 'Stagiaire', 250, '{}', '{}'),
(329, 'avocat', 1, 'reporter', 'Avocat', 350, '{}', '{}'),
(330, 'avocat', 2, 'boss', 'Rédac\' Maitre', 450, '{}', '{}'),
(331, 'vagos', 1, 'soldato', 'pequino', 0, '{}', '{}'),
(332, 'vagos', 2, 'capo', 'Conseiller', 0, '{}', '{}'),
(333, 'vagos', 3, 'consigliere', 'OG', 0, '{}', '{}'),
(334, 'vagos', 4, 'double_og', 'Double-OG', 0, '{}', '{}'),
(335, 'vagos', 5, 'boss', 'Jefe', 0, '{}', '{}'),
(336, 'aztecas', 0, 'soldato', 'Vendeur', 200, 'null', 'null'),
(337, 'aztecas', 1, 'capo', 'Braqueur', 400, 'null', 'null'),
(338, 'aztecas', 2, 'consigliere', 'Bras droit', 600, 'null', 'null'),
(339, 'aztecas', 3, 'boss', 'Chef', 1000, 'null', 'null'),
(340, 'mafia', 0, 'soldato', 'Dealer', 200, 'null', 'null'),
(341, 'mafia', 1, 'capo', 'Braqueur', 400, 'null', 'null'),
(342, 'mafia', 2, 'consigliere', 'Bandit', 600, 'null', 'null'),
(343, 'mafia', 3, 'boss', 'Chef du Gang', 1000, 'null', 'null'),
(344, 'vagos', 0, 'soldato', 'Tireur', 200, 'null', 'null'),
(345, 'vagos', 1, 'capo', 'Braqueur', 400, 'null', 'null'),
(346, 'vagos', 2, 'consigliere', 'Bras droit', 600, 'null', 'null'),
(347, 'vagos', 3, 'boss', 'Chef', 1000, 'null', 'null'),
(348, 'biker', 0, 'soldato', 'Tireur', 200, 'null', 'null'),
(349, 'biker', 1, 'capo', 'Braqueur', 400, 'null', 'null'),
(350, 'biker', 2, 'consigliere', 'Pilote', 600, 'null', 'null'),
(351, 'biker', 3, 'boss', 'Chef', 1000, 'null', 'null'),
(352, 'cartel', 0, 'soldato', 'Braqueur', 200, 'null', 'null'),
(353, 'cartel', 1, 'capo', 'Tireur', 400, 'null', 'null'),
(354, 'cartel', 2, 'consigliere', 'Bras droit', 600, 'null', 'null'),
(355, 'cartel', 3, 'boss', 'Chef', 1000, 'null', 'null'),
(356, 'gouv', 0, 'stagiaire', 'Stagiaire', 20, '{}', '{}'),
(357, 'gouv', 1, 'gardedc', 'Garde du Corps', 40, '{}', '{}'),
(358, 'gouv', 2, 'secretaire', 'Secrétaire', 60, '{}', '{}'),
(359, 'gouv', 3, 'coboss', 'Vice-président', 85, '{}', '{}'),
(360, 'gouv', 4, 'boss', 'Président', 100, '{}', '{}'),
(361, 'bloods', 0, 'soldato', 'Dealer', 200, 'null', 'null'),
(362, 'bloods', 1, 'capo', 'Braqueur', 400, 'null', 'null'),
(363, 'bloods', 2, 'consigliere', 'Bandit', 600, 'null', 'null'),
(364, 'bloods', 3, 'boss', 'Chef du Gang', 1000, 'null', 'null'),
(365, 'armurier', 0, 'soldato', 'Vigile', 200, 'null', 'null'),
(366, 'armurier', 1, 'capo', 'Vendeur', 400, 'null', 'null'),
(367, 'armurier', 2, 'consigliere', 'Bras droit', 600, 'null', 'null'),
(368, 'armurier', 3, 'boss', 'Patron', 1000, 'null', 'null'),
(369, 'ltdsud', 0, 'employer', 'Employer', 300, '{}', '{}'),
(370, 'ltdsud', 1, 'gerant', 'Gérant', 300, '{}', '{}'),
(371, 'ltdsud', 0, 'employer', 'Employer', 300, '{}', '{}'),
(372, 'ltdsud', 1, 'gerant', 'Gérant', 300, '{}', '{}'),
(373, 'ltdnord', 0, 'employer', 'Employer', 300, '{}', '{}'),
(374, 'ltdnord', 1, 'gerant', 'Gérant', 300, '{}', '{}'),
(375, 'ubereats', 0, 'recruit', 'Stagiaire', 300, '{}', '{}'),
(376, 'ubereats', 1, 'employed', 'Employé', 300, '{}', '{}'),
(377, 'ubereats', 2, 'viceboss', 'Co-gérant', 500, '{}', '{}'),
(378, 'ubereats', 3, 'boss', 'Gérant', 600, '{}', '{}'),
(379, 'ubereats', 0, 'recruit', 'Stagiaire', 300, '{}', '{}'),
(380, 'ubereats', 1, 'employed', 'Employé', 300, '{}', '{}'),
(381, 'ubereats', 2, 'viceboss', 'Co-gérant', 500, '{}', '{}'),
(382, 'ubereats', 3, 'boss', 'Gérant', 600, '{}', '{}'),
(383, 'crips', 0, 'soldato', 'Ptite-Frappe', 1500, '{}', '{}'),
(384, 'crips', 1, 'capo', 'Capo', 1800, '{}', '{}'),
(385, 'crips', 2, 'consigliere', 'Consigliere', 2100, '{}', '{}'),
(386, 'crips', 3, 'boss', 'Parain', 2700, '{}', '{}'),
(387, 'ubereats', 0, 'recruit', 'Stagiaire', 300, '{}', '{}'),
(388, 'ubereats', 1, 'employed', 'Employé', 300, '{}', '{}'),
(389, 'ubereats', 2, 'viceboss', 'Co-gérant', 500, '{}', '{}'),
(390, 'ubereats', 3, 'boss', 'Gérant', 600, '{}', '{}'),
(391, 'fire', 0, 'recruit', 'GSP', 400, '{}', '{}'),
(392, 'fire', 1, 'fire1', 'Fire fighter', 600, '{}', '{}'),
(393, 'fire', 1, 'fire2', 'Visualiseur', 700, '{}', '{}'),
(394, 'fire', 2, 'sergeant', 'Sergant', 800, '{}', '{}'),
(395, 'fire', 3, 'lieutenant', 'Lieutenant', 900, '{}', '{}'),
(396, 'fire', 4, 'captian', 'Capitaine', 1000, '{}', '{}'),
(397, 'fire', 5, 'bchief', 'Chef du Feu', 1100, '{}', '{}'),
(398, 'fire', 6, 'achief', 'Caporal Chef', 1200, '{}', '{}'),
(399, 'fire', 7, 'boss', 'Patron Pompier', 1500, '{}', '{}');

-- --------------------------------------------------------

--
-- Structure de la table `licenses`
--

CREATE TABLE `licenses` (
  `type` varchar(60) NOT NULL,
  `label` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `licenses`
--

INSERT INTO `licenses` (`type`, `label`) VALUES
('aircraft', 'Aircraft License'),
('boat', 'Permis Bateau'),
('boating', 'Boating License');

-- --------------------------------------------------------

--
-- Structure de la table `mdt_reports`
--

CREATE TABLE `mdt_reports` (
  `id` int(11) NOT NULL,
  `char_id` int(11) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `incident` longtext,
  `charges` longtext,
  `author` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `mdt_warrants`
--

CREATE TABLE `mdt_warrants` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `char_id` int(11) DEFAULT NULL,
  `report_id` int(11) DEFAULT NULL,
  `report_title` varchar(255) DEFAULT NULL,
  `charges` longtext,
  `date` varchar(255) DEFAULT NULL,
  `expire` varchar(255) DEFAULT NULL,
  `notes` varchar(255) DEFAULT NULL,
  `author` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `open_car`
--

CREATE TABLE `open_car` (
  `id` int(11) NOT NULL,
  `identifier` varchar(255) DEFAULT NULL,
  `label` varchar(255) DEFAULT NULL,
  `value` varchar(50) DEFAULT NULL,
  `got` varchar(50) DEFAULT NULL,
  `NB` int(11) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `owned_aircrafts`
--

CREATE TABLE `owned_aircrafts` (
  `owner` varchar(30) NOT NULL,
  `plate` varchar(12) NOT NULL,
  `vehicle` longtext
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `owned_properties`
--

CREATE TABLE `owned_properties` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `price` double NOT NULL,
  `rented` int(11) NOT NULL,
  `owner` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `owned_vehicles`
--

CREATE TABLE `owned_vehicles` (
  `owner` varchar(40) NOT NULL,
  `state` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Etat de la voiture',
  `plate` varchar(12) NOT NULL,
  `vehicle` longtext,
  `type` varchar(20) NOT NULL DEFAULT 'car',
  `job` varchar(20) NOT NULL DEFAULT 'civ',
  `stored` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `phone_app_chat`
--

CREATE TABLE `phone_app_chat` (
  `id` int(11) NOT NULL,
  `channel` varchar(20) NOT NULL,
  `message` varchar(255) NOT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `phone_calls`
--

CREATE TABLE `phone_calls` (
  `id` int(11) NOT NULL,
  `owner` varchar(10) NOT NULL COMMENT 'Num tel proprio',
  `num` varchar(10) NOT NULL COMMENT 'Num reférence du contact',
  `incoming` int(11) NOT NULL COMMENT 'Défini si on est à l''origine de l''appels',
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `accepts` int(11) NOT NULL COMMENT 'Appels accepter ou pas'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `phone_messages`
--

CREATE TABLE `phone_messages` (
  `id` int(11) NOT NULL,
  `transmitter` varchar(10) NOT NULL,
  `receiver` varchar(10) NOT NULL,
  `message` varchar(255) NOT NULL DEFAULT '0',
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `isRead` int(11) NOT NULL DEFAULT '0',
  `owner` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `phone_users_contacts`
--

CREATE TABLE `phone_users_contacts` (
  `id` int(11) NOT NULL,
  `identifier` varchar(60) CHARACTER SET utf8mb4 DEFAULT NULL,
  `number` varchar(10) CHARACTER SET utf8mb4 DEFAULT NULL,
  `display` varchar(64) CHARACTER SET utf8mb4 NOT NULL DEFAULT '-1'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `properties`
--

CREATE TABLE `properties` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `label` varchar(255) DEFAULT NULL,
  `entering` varchar(255) DEFAULT NULL,
  `exit` varchar(255) DEFAULT NULL,
  `inside` varchar(255) DEFAULT NULL,
  `outside` varchar(255) DEFAULT NULL,
  `ipls` varchar(255) DEFAULT '[]',
  `gateway` varchar(255) DEFAULT NULL,
  `is_single` int(11) DEFAULT NULL,
  `is_room` int(11) DEFAULT NULL,
  `is_gateway` int(11) DEFAULT NULL,
  `room_menu` varchar(255) DEFAULT NULL,
  `price` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `properties`
--

INSERT INTO `properties` (`id`, `name`, `label`, `entering`, `exit`, `inside`, `outside`, `ipls`, `gateway`, `is_single`, `is_room`, `is_gateway`, `room_menu`, `price`) VALUES
(1, 'WhispymoundDrive', '2677 Whispymound Drive', '{\"y\":564.89,\"z\":182.959,\"x\":119.384}', '{\"x\":117.347,\"y\":559.506,\"z\":183.304}', '{\"y\":557.032,\"z\":183.301,\"x\":118.037}', '{\"y\":567.798,\"z\":182.131,\"x\":119.249}', '[]', NULL, 1, 1, 0, '{\"x\":118.748,\"y\":566.573,\"z\":175.697}', 1500000),
(2, 'NorthConkerAvenue2045', '2045 North Conker Avenue', '{\"x\":372.796,\"y\":428.327,\"z\":144.685}', '{\"x\":373.548,\"y\":422.982,\"z\":144.907},', '{\"y\":420.075,\"z\":145.904,\"x\":372.161}', '{\"x\":372.454,\"y\":432.886,\"z\":143.443}', '[]', NULL, 1, 1, 0, '{\"x\":377.349,\"y\":429.422,\"z\":137.3}', 1500000),
(3, 'RichardMajesticApt2', 'Richard Majestic, Apt 2', '{\"y\":-379.165,\"z\":37.961,\"x\":-936.363}', '{\"y\":-365.476,\"z\":113.274,\"x\":-913.097}', '{\"y\":-367.637,\"z\":113.274,\"x\":-918.022}', '{\"y\":-382.023,\"z\":37.961,\"x\":-943.626}', '[]', NULL, 1, 1, 0, '{\"x\":-927.554,\"y\":-377.744,\"z\":112.674}', 1700000),
(4, 'NorthConkerAvenue2044', '2044 North Conker Avenue', '{\"y\":440.8,\"z\":146.702,\"x\":346.964}', '{\"y\":437.456,\"z\":148.394,\"x\":341.683}', '{\"y\":435.626,\"z\":148.394,\"x\":339.595}', '{\"x\":350.535,\"y\":443.329,\"z\":145.764}', '[]', NULL, 1, 1, 0, '{\"x\":337.726,\"y\":436.985,\"z\":140.77}', 1500000),
(5, 'WildOatsDrive', '3655 Wild Oats Drive', '{\"y\":502.696,\"z\":136.421,\"x\":-176.003}', '{\"y\":497.817,\"z\":136.653,\"x\":-174.349}', '{\"y\":495.069,\"z\":136.666,\"x\":-173.331}', '{\"y\":506.412,\"z\":135.0664,\"x\":-177.927}', '[]', NULL, 1, 1, 0, '{\"x\":-174.725,\"y\":493.095,\"z\":129.043}', 1500000),
(6, 'HillcrestAvenue2862', '2862 Hillcrest Avenue', '{\"y\":596.58,\"z\":142.641,\"x\":-686.554}', '{\"y\":591.988,\"z\":144.392,\"x\":-681.728}', '{\"y\":590.608,\"z\":144.392,\"x\":-680.124}', '{\"y\":599.019,\"z\":142.059,\"x\":-689.492}', '[]', NULL, 1, 1, 0, '{\"x\":-680.46,\"y\":588.6,\"z\":136.769}', 1500000),
(7, 'LowEndApartment', 'Appartement de base', '{\"y\":-1078.735,\"z\":28.4031,\"x\":292.528}', '{\"y\":-1007.152,\"z\":-102.002,\"x\":265.845}', '{\"y\":-1002.802,\"z\":-100.008,\"x\":265.307}', '{\"y\":-1078.669,\"z\":28.401,\"x\":296.738}', '[]', NULL, 1, 1, 0, '{\"x\":265.916,\"y\":-999.38,\"z\":-100.008}', 562500),
(8, 'MadWayneThunder', '2113 Mad Wayne Thunder', '{\"y\":454.955,\"z\":96.462,\"x\":-1294.433}', '{\"x\":-1289.917,\"y\":449.541,\"z\":96.902}', '{\"y\":446.322,\"z\":96.899,\"x\":-1289.642}', '{\"y\":455.453,\"z\":96.517,\"x\":-1298.851}', '[]', NULL, 1, 1, 0, '{\"x\":-1287.306,\"y\":455.901,\"z\":89.294}', 1500000),
(9, 'HillcrestAvenue2874', '2874 Hillcrest Avenue', '{\"x\":-853.346,\"y\":696.678,\"z\":147.782}', '{\"y\":690.875,\"z\":151.86,\"x\":-859.961}', '{\"y\":688.361,\"z\":151.857,\"x\":-859.395}', '{\"y\":701.628,\"z\":147.773,\"x\":-855.007}', '[]', NULL, 1, 1, 0, '{\"x\":-858.543,\"y\":697.514,\"z\":144.253}', 1500000),
(10, 'HillcrestAvenue2868', '2868 Hillcrest Avenue', '{\"y\":620.494,\"z\":141.588,\"x\":-752.82}', '{\"y\":618.62,\"z\":143.153,\"x\":-759.317}', '{\"y\":617.629,\"z\":143.153,\"x\":-760.789}', '{\"y\":621.281,\"z\":141.254,\"x\":-750.919}', '[]', NULL, 1, 1, 0, '{\"x\":-762.504,\"y\":618.992,\"z\":135.53}', 1500000),
(11, 'TinselTowersApt12', 'Tinsel Towers, Apt 42', '{\"y\":37.025,\"z\":42.58,\"x\":-618.299}', '{\"y\":58.898,\"z\":97.2,\"x\":-603.301}', '{\"y\":58.941,\"z\":97.2,\"x\":-608.741}', '{\"y\":30.603,\"z\":42.524,\"x\":-620.017}', '[]', NULL, 1, 1, 0, '{\"x\":-622.173,\"y\":54.585,\"z\":96.599}', 1700000),
(12, 'MiltonDrive', 'Milton Drive', '{\"x\":-775.17,\"y\":312.01,\"z\":84.658}', NULL, NULL, '{\"x\":-775.346,\"y\":306.776,\"z\":84.7}', '[]', NULL, 0, 0, 1, NULL, 0),
(13, 'Modern1Apartment', 'Appartement Moderne 1', NULL, '{\"x\":-784.194,\"y\":323.636,\"z\":210.997}', '{\"x\":-779.751,\"y\":323.385,\"z\":210.997}', NULL, '[\"apa_v_mp_h_01_a\"]', 'MiltonDrive', 0, 1, 0, '{\"x\":-766.661,\"y\":327.672,\"z\":210.396}', 1300000),
(14, 'Modern2Apartment', 'Appartement Moderne 2', NULL, '{\"x\":-786.8663,\"y\":315.764,\"z\":186.913}', '{\"x\":-781.808,\"y\":315.866,\"z\":186.913}', NULL, '[\"apa_v_mp_h_01_c\"]', 'MiltonDrive', 0, 1, 0, '{\"x\":-795.735,\"y\":326.757,\"z\":186.313}', 1300000),
(15, 'Modern3Apartment', 'Appartement Moderne 3', NULL, '{\"x\":-774.012,\"y\":342.042,\"z\":195.686}', '{\"x\":-779.057,\"y\":342.063,\"z\":195.686}', NULL, '[\"apa_v_mp_h_01_b\"]', 'MiltonDrive', 0, 1, 0, '{\"x\":-765.386,\"y\":330.782,\"z\":195.08}', 1300000),
(16, 'Mody1Apartment', 'Appartement Mode 1', NULL, '{\"x\":-784.194,\"y\":323.636,\"z\":210.997}', '{\"x\":-779.751,\"y\":323.385,\"z\":210.997}', NULL, '[\"apa_v_mp_h_02_a\"]', 'MiltonDrive', 0, 1, 0, '{\"x\":-766.615,\"y\":327.878,\"z\":210.396}', 1300000),
(17, 'Mody2Apartment', 'Appartement Mode 2', NULL, '{\"x\":-786.8663,\"y\":315.764,\"z\":186.913}', '{\"x\":-781.808,\"y\":315.866,\"z\":186.913}', NULL, '[\"apa_v_mp_h_02_c\"]', 'MiltonDrive', 0, 1, 0, '{\"x\":-795.297,\"y\":327.092,\"z\":186.313}', 1300000),
(18, 'Mody3Apartment', 'Appartement Mode 3', NULL, '{\"x\":-774.012,\"y\":342.042,\"z\":195.686}', '{\"x\":-779.057,\"y\":342.063,\"z\":195.686}', NULL, '[\"apa_v_mp_h_02_b\"]', 'MiltonDrive', 0, 1, 0, '{\"x\":-765.303,\"y\":330.932,\"z\":195.085}', 1300000),
(19, 'Vibrant1Apartment', 'Appartement Vibrant 1', NULL, '{\"x\":-784.194,\"y\":323.636,\"z\":210.997}', '{\"x\":-779.751,\"y\":323.385,\"z\":210.997}', NULL, '[\"apa_v_mp_h_03_a\"]', 'MiltonDrive', 0, 1, 0, '{\"x\":-765.885,\"y\":327.641,\"z\":210.396}', 1300000),
(20, 'Vibrant2Apartment', 'Appartement Vibrant 2', NULL, '{\"x\":-786.8663,\"y\":315.764,\"z\":186.913}', '{\"x\":-781.808,\"y\":315.866,\"z\":186.913}', NULL, '[\"apa_v_mp_h_03_c\"]', 'MiltonDrive', 0, 1, 0, '{\"x\":-795.607,\"y\":327.344,\"z\":186.313}', 1300000),
(21, 'Vibrant3Apartment', 'Appartement Vibrant 3', NULL, '{\"x\":-774.012,\"y\":342.042,\"z\":195.686}', '{\"x\":-779.057,\"y\":342.063,\"z\":195.686}', NULL, '[\"apa_v_mp_h_03_b\"]', 'MiltonDrive', 0, 1, 0, '{\"x\":-765.525,\"y\":330.851,\"z\":195.085}', 1300000),
(22, 'Sharp1Apartment', 'Appartement Persan 1', NULL, '{\"x\":-784.194,\"y\":323.636,\"z\":210.997}', '{\"x\":-779.751,\"y\":323.385,\"z\":210.997}', NULL, '[\"apa_v_mp_h_04_a\"]', 'MiltonDrive', 0, 1, 0, '{\"x\":-766.527,\"y\":327.89,\"z\":210.396}', 1300000),
(23, 'Sharp2Apartment', 'Appartement Persan 2', NULL, '{\"x\":-786.8663,\"y\":315.764,\"z\":186.913}', '{\"x\":-781.808,\"y\":315.866,\"z\":186.913}', NULL, '[\"apa_v_mp_h_04_c\"]', 'MiltonDrive', 0, 1, 0, '{\"x\":-795.642,\"y\":326.497,\"z\":186.313}', 1300000),
(24, 'Sharp3Apartment', 'Appartement Persan 3', NULL, '{\"x\":-774.012,\"y\":342.042,\"z\":195.686}', '{\"x\":-779.057,\"y\":342.063,\"z\":195.686}', NULL, '[\"apa_v_mp_h_04_b\"]', 'MiltonDrive', 0, 1, 0, '{\"x\":-765.503,\"y\":331.318,\"z\":195.085}', 1300000),
(25, 'Monochrome1Apartment', 'Appartement Monochrome 1', NULL, '{\"x\":-784.194,\"y\":323.636,\"z\":210.997}', '{\"x\":-779.751,\"y\":323.385,\"z\":210.997}', NULL, '[\"apa_v_mp_h_05_a\"]', 'MiltonDrive', 0, 1, 0, '{\"x\":-766.289,\"y\":328.086,\"z\":210.396}', 1300000),
(26, 'Monochrome2Apartment', 'Appartement Monochrome 2', NULL, '{\"x\":-786.8663,\"y\":315.764,\"z\":186.913}', '{\"x\":-781.808,\"y\":315.866,\"z\":186.913}', NULL, '[\"apa_v_mp_h_05_c\"]', 'MiltonDrive', 0, 1, 0, '{\"x\":-795.692,\"y\":326.762,\"z\":186.313}', 1300000),
(27, 'Monochrome3Apartment', 'Appartement Monochrome 3', NULL, '{\"x\":-774.012,\"y\":342.042,\"z\":195.686}', '{\"x\":-779.057,\"y\":342.063,\"z\":195.686}', NULL, '[\"apa_v_mp_h_05_b\"]', 'MiltonDrive', 0, 1, 0, '{\"x\":-765.094,\"y\":330.976,\"z\":195.085}', 1300000),
(28, 'Seductive1Apartment', 'Appartement Séduisant 1', NULL, '{\"x\":-784.194,\"y\":323.636,\"z\":210.997}', '{\"x\":-779.751,\"y\":323.385,\"z\":210.997}', NULL, '[\"apa_v_mp_h_06_a\"]', 'MiltonDrive', 0, 1, 0, '{\"x\":-766.263,\"y\":328.104,\"z\":210.396}', 1300000),
(29, 'Seductive2Apartment', 'Appartement Séduisant 2', NULL, '{\"x\":-786.8663,\"y\":315.764,\"z\":186.913}', '{\"x\":-781.808,\"y\":315.866,\"z\":186.913}', NULL, '[\"apa_v_mp_h_06_c\"]', 'MiltonDrive', 0, 1, 0, '{\"x\":-795.655,\"y\":326.611,\"z\":186.313}', 1300000),
(30, 'Seductive3Apartment', 'Appartement Séduisant 3', NULL, '{\"x\":-774.012,\"y\":342.042,\"z\":195.686}', '{\"x\":-779.057,\"y\":342.063,\"z\":195.686}', NULL, '[\"apa_v_mp_h_06_b\"]', 'MiltonDrive', 0, 1, 0, '{\"x\":-765.3,\"y\":331.414,\"z\":195.085}', 1300000),
(31, 'Regal1Apartment', 'Appartement Régal 1', NULL, '{\"x\":-784.194,\"y\":323.636,\"z\":210.997}', '{\"x\":-779.751,\"y\":323.385,\"z\":210.997}', NULL, '[\"apa_v_mp_h_07_a\"]', 'MiltonDrive', 0, 1, 0, '{\"x\":-765.956,\"y\":328.257,\"z\":210.396}', 1300000),
(32, 'Regal2Apartment', 'Appartement Régal 2', NULL, '{\"x\":-786.8663,\"y\":315.764,\"z\":186.913}', '{\"x\":-781.808,\"y\":315.866,\"z\":186.913}', NULL, '[\"apa_v_mp_h_07_c\"]', 'MiltonDrive', 0, 1, 0, '{\"x\":-795.545,\"y\":326.659,\"z\":186.313}', 1300000),
(33, 'Regal3Apartment', 'Appartement Régal 3', NULL, '{\"x\":-774.012,\"y\":342.042,\"z\":195.686}', '{\"x\":-779.057,\"y\":342.063,\"z\":195.686}', NULL, '[\"apa_v_mp_h_07_b\"]', 'MiltonDrive', 0, 1, 0, '{\"x\":-765.087,\"y\":331.429,\"z\":195.123}', 1300000),
(34, 'Aqua1Apartment', 'Appartement Aqua 1', NULL, '{\"x\":-784.194,\"y\":323.636,\"z\":210.997}', '{\"x\":-779.751,\"y\":323.385,\"z\":210.997}', NULL, '[\"apa_v_mp_h_08_a\"]', 'MiltonDrive', 0, 1, 0, '{\"x\":-766.187,\"y\":328.47,\"z\":210.396}', 1300000),
(35, 'Aqua2Apartment', 'Appartement Aqua 2', NULL, '{\"x\":-786.8663,\"y\":315.764,\"z\":186.913}', '{\"x\":-781.808,\"y\":315.866,\"z\":186.913}', NULL, '[\"apa_v_mp_h_08_c\"]', 'MiltonDrive', 0, 1, 0, '{\"x\":-795.658,\"y\":326.563,\"z\":186.313}', 1300000),
(36, 'Aqua3Apartment', 'Appartement Aqua 3', NULL, '{\"x\":-774.012,\"y\":342.042,\"z\":195.686}', '{\"x\":-779.057,\"y\":342.063,\"z\":195.686}', NULL, '[\"apa_v_mp_h_08_b\"]', 'MiltonDrive', 0, 1, 0, '{\"x\":-765.287,\"y\":331.084,\"z\":195.086}', 1300000),
(37, 'IntegrityWay', '4 Integrity Way', '{\"x\":-47.804,\"y\":-585.867,\"z\":36.956}', NULL, NULL, '{\"x\":-54.178,\"y\":-583.762,\"z\":35.798}', '[]', NULL, 0, 0, 1, NULL, 0),
(38, 'IntegrityWay28', '4 Integrity Way - Apt 28', NULL, '{\"x\":-31.409,\"y\":-594.927,\"z\":79.03}', '{\"x\":-26.098,\"y\":-596.909,\"z\":79.03}', NULL, '[]', 'IntegrityWay', 0, 1, 0, '{\"x\":-11.923,\"y\":-597.083,\"z\":78.43}', 1700000),
(39, 'IntegrityWay30', '4 Integrity Way - Apt 30', NULL, '{\"x\":-17.702,\"y\":-588.524,\"z\":89.114}', '{\"x\":-16.21,\"y\":-582.569,\"z\":89.114}', NULL, '[]', 'IntegrityWay', 0, 1, 0, '{\"x\":-26.327,\"y\":-588.384,\"z\":89.123}', 1700000),
(40, 'DellPerroHeights', 'Dell Perro Heights', '{\"x\":-1447.06,\"y\":-538.28,\"z\":33.74}', NULL, NULL, '{\"x\":-1440.022,\"y\":-548.696,\"z\":33.74}', '[]', NULL, 0, 0, 1, NULL, 0),
(41, 'DellPerroHeightst4', 'Dell Perro Heights - Apt 28', NULL, '{\"x\":-1452.125,\"y\":-540.591,\"z\":73.044}', '{\"x\":-1455.435,\"y\":-535.79,\"z\":73.044}', NULL, '[]', 'DellPerroHeights', 0, 1, 0, '{\"x\":-1467.058,\"y\":-527.571,\"z\":72.443}', 1700000),
(42, 'DellPerroHeightst7', 'Dell Perro Heights - Apt 30', NULL, '{\"x\":-1451.562,\"y\":-523.535,\"z\":55.928}', '{\"x\":-1456.02,\"y\":-519.209,\"z\":55.929}', NULL, '[]', 'DellPerroHeights', 0, 1, 0, '{\"x\":-1457.026,\"y\":-530.219,\"z\":55.937}', 1700000),
(43, 'MazeBankBuilding', 'Maze Bank Building', '{\"x\":-79.18,\"y\":-795.92,\"z\":43.35}', NULL, NULL, '{\"x\":-72.50,\"y\":-786.92,\"z\":43.40}', '[]', NULL, 0, 0, 1, NULL, 0),
(44, 'OldSpiceWarm', 'Old Spice Warm', NULL, '{\"x\":-75.69,\"y\":-827.08,\"z\":242.43}', '{\"x\":-75.51,\"y\":-823.90,\"z\":242.43}', NULL, '[\"ex_dt1_11_office_01a\"]', 'MazeBankBuilding', 0, 1, 0, '{\"x\":-71.81,\"y\":-814.34,\"z\":242.39}', 5000000),
(45, 'OldSpiceClassical', 'Old Spice Classical', NULL, '{\"x\":-75.69,\"y\":-827.08,\"z\":242.43}', '{\"x\":-75.51,\"y\":-823.90,\"z\":242.43}', NULL, '[\"ex_dt1_11_office_01b\"]', 'MazeBankBuilding', 0, 1, 0, '{\"x\":-71.81,\"y\":-814.34,\"z\":242.39}', 5000000),
(46, 'OldSpiceVintage', 'Old Spice Vintage', NULL, '{\"x\":-75.69,\"y\":-827.08,\"z\":242.43}', '{\"x\":-75.51,\"y\":-823.90,\"z\":242.43}', NULL, '[\"ex_dt1_11_office_01c\"]', 'MazeBankBuilding', 0, 1, 0, '{\"x\":-71.81,\"y\":-814.34,\"z\":242.39}', 5000000),
(47, 'ExecutiveRich', 'Executive Rich', NULL, '{\"x\":-75.69,\"y\":-827.08,\"z\":242.43}', '{\"x\":-75.51,\"y\":-823.90,\"z\":242.43}', NULL, '[\"ex_dt1_11_office_02b\"]', 'MazeBankBuilding', 0, 1, 0, '{\"x\":-71.81,\"y\":-814.34,\"z\":242.39}', 5000000),
(48, 'ExecutiveCool', 'Executive Cool', NULL, '{\"x\":-75.69,\"y\":-827.08,\"z\":242.43}', '{\"x\":-75.51,\"y\":-823.90,\"z\":242.43}', NULL, '[\"ex_dt1_11_office_02c\"]', 'MazeBankBuilding', 0, 1, 0, '{\"x\":-71.81,\"y\":-814.34,\"z\":242.39}', 5000000),
(49, 'ExecutiveContrast', 'Executive Contrast', NULL, '{\"x\":-75.69,\"y\":-827.08,\"z\":242.43}', '{\"x\":-75.51,\"y\":-823.90,\"z\":242.43}', NULL, '[\"ex_dt1_11_office_02a\"]', 'MazeBankBuilding', 0, 1, 0, '{\"x\":-71.81,\"y\":-814.34,\"z\":242.39}', 5000000),
(50, 'PowerBrokerIce', 'Power Broker Ice', NULL, '{\"x\":-75.69,\"y\":-827.08,\"z\":242.43}', '{\"x\":-75.51,\"y\":-823.90,\"z\":242.43}', NULL, '[\"ex_dt1_11_office_03a\"]', 'MazeBankBuilding', 0, 1, 0, '{\"x\":-71.81,\"y\":-814.34,\"z\":242.39}', 5000000),
(51, 'PowerBrokerConservative', 'Power Broker Conservative', NULL, '{\"x\":-75.69,\"y\":-827.08,\"z\":242.43}', '{\"x\":-75.51,\"y\":-823.90,\"z\":242.43}', NULL, '[\"ex_dt1_11_office_03b\"]', 'MazeBankBuilding', 0, 1, 0, '{\"x\":-71.81,\"y\":-814.34,\"z\":242.39}', 5000000),
(52, 'PowerBrokerPolished', 'Power Broker Polished', NULL, '{\"x\":-75.69,\"y\":-827.08,\"z\":242.43}', '{\"x\":-75.51,\"y\":-823.90,\"z\":242.43}', NULL, '[\"ex_dt1_11_office_03c\"]', 'MazeBankBuilding', 0, 1, 0, '{\"x\":-71.81,\"y\":-814.34,\"z\":242.39}', 5000000),
(53, 'LomBank', 'Lom Bank', '{\"x\":-1581.36,\"y\":-558.23,\"z\":34.07}', NULL, NULL, '{\"x\":-1583.60,\"y\":-555.12,\"z\":34.07}', '[]', NULL, 0, 0, 1, NULL, 0),
(54, 'LBOldSpiceWarm', 'LB Old Spice Warm', NULL, '{\"x\":-1579.53,\"y\":-564.89,\"z\":107.62}', '{\"x\":-1576.42,\"y\":-567.57,\"z\":107.62}', NULL, '[\"ex_sm_13_office_01a\"]', 'LomBank', 0, 1, 0, '{\"x\":-1571.26,\"y\":-575.76,\"z\":107.52}', 3500000),
(55, 'LBOldSpiceClassical', 'LB Old Spice Classical', NULL, '{\"x\":-1579.53,\"y\":-564.89,\"z\":107.62}', '{\"x\":-1576.42,\"y\":-567.57,\"z\":107.62}', NULL, '[\"ex_sm_13_office_01b\"]', 'LomBank', 0, 1, 0, '{\"x\":-1571.26,\"y\":-575.76,\"z\":107.52}', 3500000),
(56, 'LBOldSpiceVintage', 'LB Old Spice Vintage', NULL, '{\"x\":-1579.53,\"y\":-564.89,\"z\":107.62}', '{\"x\":-1576.42,\"y\":-567.57,\"z\":107.62}', NULL, '[\"ex_sm_13_office_01c\"]', 'LomBank', 0, 1, 0, '{\"x\":-1571.26,\"y\":-575.76,\"z\":107.52}', 3500000),
(57, 'LBExecutiveRich', 'LB Executive Rich', NULL, '{\"x\":-1579.53,\"y\":-564.89,\"z\":107.62}', '{\"x\":-1576.42,\"y\":-567.57,\"z\":107.62}', NULL, '[\"ex_sm_13_office_02b\"]', 'LomBank', 0, 1, 0, '{\"x\":-1571.26,\"y\":-575.76,\"z\":107.52}', 3500000),
(58, 'LBExecutiveCool', 'LB Executive Cool', NULL, '{\"x\":-1579.53,\"y\":-564.89,\"z\":107.62}', '{\"x\":-1576.42,\"y\":-567.57,\"z\":107.62}', NULL, '[\"ex_sm_13_office_02c\"]', 'LomBank', 0, 1, 0, '{\"x\":-1571.26,\"y\":-575.76,\"z\":107.52}', 3500000),
(59, 'LBExecutiveContrast', 'LB Executive Contrast', NULL, '{\"x\":-1579.53,\"y\":-564.89,\"z\":107.62}', '{\"x\":-1576.42,\"y\":-567.57,\"z\":107.62}', NULL, '[\"ex_sm_13_office_02a\"]', 'LomBank', 0, 1, 0, '{\"x\":-1571.26,\"y\":-575.76,\"z\":107.52}', 3500000),
(60, 'LBPowerBrokerIce', 'LB Power Broker Ice', NULL, '{\"x\":-1579.53,\"y\":-564.89,\"z\":107.62}', '{\"x\":-1576.42,\"y\":-567.57,\"z\":107.62}', NULL, '[\"ex_sm_13_office_03a\"]', 'LomBank', 0, 1, 0, '{\"x\":-1571.26,\"y\":-575.76,\"z\":107.52}', 3500000),
(61, 'LBPowerBrokerConservative', 'LB Power Broker Conservative', NULL, '{\"x\":-1579.53,\"y\":-564.89,\"z\":107.62}', '{\"x\":-1576.42,\"y\":-567.57,\"z\":107.62}', NULL, '[\"ex_sm_13_office_03b\"]', 'LomBank', 0, 1, 0, '{\"x\":-1571.26,\"y\":-575.76,\"z\":107.52}', 3500000),
(62, 'LBPowerBrokerPolished', 'LB Power Broker Polished', NULL, '{\"x\":-1579.53,\"y\":-564.89,\"z\":107.62}', '{\"x\":-1576.42,\"y\":-567.57,\"z\":107.62}', NULL, '[\"ex_sm_13_office_03c\"]', 'LomBank', 0, 1, 0, '{\"x\":-1571.26,\"y\":-575.76,\"z\":107.52}', 3500000),
(63, 'MazeBankWest', 'Maze Bank West', '{\"x\":-1379.58,\"y\":-499.63,\"z\":32.22}', NULL, NULL, '{\"x\":-1378.95,\"y\":-502.82,\"z\":32.22}', '[]', NULL, 0, 0, 1, NULL, 0),
(64, 'MBWOldSpiceWarm', 'MBW Old Spice Warm', NULL, '{\"x\":-1392.74,\"y\":-480.18,\"z\":71.14}', '{\"x\":-1389.43,\"y\":-479.01,\"z\":71.14}', NULL, '[\"ex_sm_15_office_01a\"]', 'MazeBankWest', 0, 1, 0, '{\"x\":-1390.76,\"y\":-479.22,\"z\":72.04}', 2700000),
(65, 'MBWOldSpiceClassical', 'MBW Old Spice Classical', NULL, '{\"x\":-1392.74,\"y\":-480.18,\"z\":71.14}', '{\"x\":-1389.43,\"y\":-479.01,\"z\":71.14}', NULL, '[\"ex_sm_15_office_01b\"]', 'MazeBankWest', 0, 1, 0, '{\"x\":-1390.76,\"y\":-479.22,\"z\":72.04}', 2700000),
(66, 'MBWOldSpiceVintage', 'MBW Old Spice Vintage', NULL, '{\"x\":-1392.74,\"y\":-480.18,\"z\":71.14}', '{\"x\":-1389.43,\"y\":-479.01,\"z\":71.14}', NULL, '[\"ex_sm_15_office_01c\"]', 'MazeBankWest', 0, 1, 0, '{\"x\":-1390.76,\"y\":-479.22,\"z\":72.04}', 2700000),
(67, 'MBWExecutiveRich', 'MBW Executive Rich', NULL, '{\"x\":-1392.74,\"y\":-480.18,\"z\":71.14}', '{\"x\":-1389.43,\"y\":-479.01,\"z\":71.14}', NULL, '[\"ex_sm_15_office_02b\"]', 'MazeBankWest', 0, 1, 0, '{\"x\":-1390.76,\"y\":-479.22,\"z\":72.04}', 2700000),
(68, 'MBWExecutiveCool', 'MBW Executive Cool', NULL, '{\"x\":-1392.74,\"y\":-480.18,\"z\":71.14}', '{\"x\":-1389.43,\"y\":-479.01,\"z\":71.14}', NULL, '[\"ex_sm_15_office_02c\"]', 'MazeBankWest', 0, 1, 0, '{\"x\":-1390.76,\"y\":-479.22,\"z\":72.04}', 2700000),
(69, 'MBWExecutive Contrast', 'MBW Executive Contrast', NULL, '{\"x\":-1392.74,\"y\":-480.18,\"z\":71.14}', '{\"x\":-1389.43,\"y\":-479.01,\"z\":71.14}', NULL, '[\"ex_sm_15_office_02a\"]', 'MazeBankWest', 0, 1, 0, '{\"x\":-1390.76,\"y\":-479.22,\"z\":72.04}', 2700000),
(70, 'MBWPowerBrokerIce', 'MBW Power Broker Ice', NULL, '{\"x\":-1392.74,\"y\":-480.18,\"z\":71.14}', '{\"x\":-1389.43,\"y\":-479.01,\"z\":71.14}', NULL, '[\"ex_sm_15_office_03a\"]', 'MazeBankWest', 0, 1, 0, '{\"x\":-1390.76,\"y\":-479.22,\"z\":72.04}', 2700000),
(71, 'MBWPowerBrokerConvservative', 'MBW Power Broker Convservative', NULL, '{\"x\":-1392.74,\"y\":-480.18,\"z\":71.14}', '{\"x\":-1389.43,\"y\":-479.01,\"z\":71.14}', NULL, '[\"ex_sm_15_office_03b\"]', 'MazeBankWest', 0, 1, 0, '{\"x\":-1390.76,\"y\":-479.22,\"z\":72.04}', 2700000),
(72, 'MBWPowerBrokerPolished', 'MBW Power Broker Polished', NULL, '{\"x\":-1392.74,\"y\":-480.18,\"z\":71.14}', '{\"x\":-1389.43,\"y\":-479.01,\"z\":71.14}', NULL, '[\"ex_sm_15_office_03c\"]', 'MazeBankWest', 0, 1, 0, '{\"x\":-1390.76,\"y\":-479.22,\"z\":72.04}', 2700000);

-- --------------------------------------------------------

--
-- Structure de la table `rented_aircrafts`
--

CREATE TABLE `rented_aircrafts` (
  `vehicle` varchar(60) NOT NULL,
  `plate` varchar(12) NOT NULL,
  `player_name` varchar(255) NOT NULL,
  `base_price` int(11) NOT NULL,
  `rent_price` int(11) NOT NULL,
  `owner` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `rented_vehicles`
--

CREATE TABLE `rented_vehicles` (
  `vehicle` varchar(60) NOT NULL,
  `plate` varchar(12) NOT NULL,
  `player_name` varchar(255) NOT NULL,
  `base_price` int(11) NOT NULL,
  `rent_price` int(11) NOT NULL,
  `owner` varchar(22) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `society_moneywash`
--

CREATE TABLE `society_moneywash` (
  `id` int(11) NOT NULL,
  `identifier` varchar(60) NOT NULL,
  `society` varchar(60) NOT NULL,
  `amount` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `twitter_accounts`
--

CREATE TABLE `twitter_accounts` (
  `id` int(11) NOT NULL,
  `username` varchar(50) CHARACTER SET utf8 NOT NULL DEFAULT '0',
  `password` varchar(50) COLLATE utf8mb4_bin NOT NULL DEFAULT '0',
  `avatar_url` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

CREATE TABLE `users` (
  `identifier` varchar(50) COLLATE utf8mb4_bin NOT NULL,
  `license` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_bin DEFAULT '',
  `skin` longtext COLLATE utf8mb4_bin,
  `job` varchar(255) COLLATE utf8mb4_bin DEFAULT 'unemployed',
  `job_grade` int(11) DEFAULT '0',
  `job2` varchar(255) COLLATE utf8mb4_bin DEFAULT 'unemployed2',
  `job2_grade` int(11) DEFAULT '0',
  `loadout` longtext COLLATE utf8mb4_bin,
  `position` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `permission_level` int(11) DEFAULT NULL,
  `group` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL,
  `firstname` varchar(50) COLLATE utf8mb4_bin DEFAULT '',
  `lastname` varchar(50) COLLATE utf8mb4_bin DEFAULT '',
  `dateofbirth` varchar(25) COLLATE utf8mb4_bin DEFAULT '',
  `sex` varchar(10) COLLATE utf8mb4_bin DEFAULT '',
  `height` varchar(5) COLLATE utf8mb4_bin DEFAULT '',
  `status` longtext COLLATE utf8mb4_bin,
  `isDead` bit(1) DEFAULT b'0',
  `last_property` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `animal` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL,
  `vote` varchar(254) COLLATE utf8mb4_bin DEFAULT NULL,
  `jail` int(11) NOT NULL DEFAULT '0',
  `phone_number` varchar(10) COLLATE utf8mb4_bin DEFAULT NULL,
  `is_dead` tinyint(1) DEFAULT '0',
  `skills` longtext COLLATE utf8mb4_bin,
  `money` int(11) DEFAULT NULL,
  `bank` int(11) DEFAULT NULL,
  `vip` tinyint(1) DEFAULT '0',
  `zetony` int(11) DEFAULT NULL,
  `tattoos` longtext COLLATE utf8mb4_bin
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Contenu de la table `users`
--

INSERT INTO `users` (`identifier`, `license`, `name`, `skin`, `job`, `job_grade`, `job2`, `job2_grade`, `loadout`, `position`, `permission_level`, `group`, `firstname`, `lastname`, `dateofbirth`, `sex`, `height`, `status`, `isDead`, `last_property`, `animal`, `vote`, `jail`, `phone_number`, `is_dead`, `skills`, `money`, `bank`, `vip`, `zetony`, `tattoos`) VALUES
('steam:110000112a69b9e', 'license:1dc198bc80a8a6f99c58e103f76a7062361b145c', 'Yanis Dahek', '{\"pants_1\":16,\"eyebrows_3\":0,\"lipstick_4\":0,\"glasses_2\":0,\"lipstick_1\":0,\"chain_2\":0,\"torso_1\":259,\"lipstick_2\":0,\"arms\":12,\"shoes_2\":0,\"ears_2\":0,\"bproof_1\":0,\"face\":0,\"helmet_2\":0,\"eyebrows_1\":0,\"eyebrows_4\":0,\"torso_2\":0,\"glasses_1\":0,\"makeup_2\":0,\"decals_1\":0,\"ears_1\":-1,\"makeup_1\":0,\"helmet_1\":-1,\"bags_1\":0,\"tshirt_1\":15,\"decals_2\":0,\"pants_2\":0,\"hair_1\":7,\"mask_1\":0,\"makeup_4\":0,\"chain_1\":0,\"age_1\":0,\"bproof_2\":0,\"hair_2\":0,\"hair_color_2\":0,\"lipstick_3\":0,\"mask_2\":0,\"beard_1\":0,\"beard_4\":0,\"shoes_1\":31,\"skin\":0,\"eyebrows_2\":0,\"sex\":0,\"hair_color_1\":0,\"age_2\":0,\"makeup_3\":0,\"beard_2\":0,\"beard_3\":0,\"bags_2\":0,\"tshirt_2\":0}', 'fire', 3, 'police', 0, '[]', '{\"x\":1072.7999999998,\"z\":36.800000000002,\"y\":-1423.6}', 0, 'superadmin', NULL, NULL, NULL, NULL, NULL, '[{\"percent\":67.2475,\"val\":672475,\"name\":\"hunger\"},{\"percent\":67.2475,\"val\":672475,\"name\":\"thirst\"},{\"percent\":0.0,\"val\":0,\"name\":\"drunk\"},{\"percent\":0.0,\"val\":0,\"name\":\"drug\"}]', b'0', NULL, NULL, NULL, 0, '5554538', 0, NULL, 50332381, 17730, 0, NULL, NULL),
('steam:11000013368b987', 'license:9fdf911c947e397b9bca49493bfe7e6328e9f76f', 'Nehco.\"', '{\"makeup_3\":0,\"lipstick_4\":0,\"chain_2\":0,\"decals_1\":0,\"glasses_1\":0,\"glasses_2\":0,\"bags_2\":0,\"face\":0,\"age_2\":0,\"bags_1\":0,\"decals_2\":0,\"pants_1\":14,\"beard_3\":0,\"shoes_1\":34,\"eyebrows_3\":0,\"mask_2\":0,\"beard_2\":0,\"torso_2\":0,\"chain_1\":0,\"beard_1\":0,\"torso_1\":15,\"lipstick_2\":0,\"makeup_4\":0,\"tshirt_1\":15,\"age_1\":0,\"ears_2\":0,\"pants_2\":0,\"lipstick_3\":0,\"bproof_2\":0,\"tshirt_2\":0,\"makeup_2\":0,\"hair_2\":0,\"helmet_1\":-1,\"hair_1\":0,\"makeup_1\":0,\"lipstick_1\":0,\"ears_1\":-1,\"eyebrows_4\":0,\"arms\":15,\"hair_color_1\":0,\"skin\":0,\"eyebrows_2\":0,\"helmet_2\":0,\"mask_1\":0,\"sex\":0,\"shoes_2\":0,\"beard_4\":0,\"bproof_1\":0,\"eyebrows_1\":0,\"hair_color_2\":0}', 'unemployed', 0, 'unemployed2', 0, '[{\"components\":[\"clip_default\"],\"label\":\"Pistolet\",\"ammo\":95,\"name\":\"WEAPON_PISTOL\"}]', '{\"z\":32.600000000006,\"x\":-470.80000000004,\"y\":-657.6000000001}', 0, 'superadmin', 'Its', 'Nehco', '12/09/2000', 'M', '180', '[{\"val\":963175,\"percent\":96.3175,\"name\":\"hunger\"},{\"val\":963175,\"percent\":96.3175,\"name\":\"thirst\"},{\"val\":0,\"percent\":0.0,\"name\":\"drunk\"}]', b'0', NULL, NULL, NULL, 0, '317-2194', 0, NULL, 5000, 15000, 0, NULL, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `user_accessories`
--

CREATE TABLE `user_accessories` (
  `id` int(11) NOT NULL,
  `identifier` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `mask` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `label` varchar(50) COLLATE utf8mb4_bin DEFAULT 'Masque',
  `type` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL,
  `index` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- --------------------------------------------------------

--
-- Structure de la table `user_accounts`
--

CREATE TABLE `user_accounts` (
  `id` int(11) NOT NULL,
  `identifier` varchar(22) NOT NULL,
  `name` varchar(50) NOT NULL,
  `money` double NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `user_accounts`
--

INSERT INTO `user_accounts` (`id`, `identifier`, `name`, `money`) VALUES
(1, 'steam:110000134bc8c01', 'black_money', 0),
(2, 'steam:110000116d9cec8', 'black_money', 0),
(3, 'steam:110000112a69b9e', 'black_money', 0),
(4, 'steam:11000013368b987', 'black_money', 0),
(5, 'steam:11000013e98cb7e', 'black_money', 0);

-- --------------------------------------------------------

--
-- Structure de la table `user_convictions`
--

CREATE TABLE `user_convictions` (
  `id` int(11) NOT NULL,
  `char_id` int(11) DEFAULT NULL,
  `offense` varchar(255) DEFAULT NULL,
  `count` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `user_inventory`
--

CREATE TABLE `user_inventory` (
  `id` int(11) NOT NULL,
  `identifier` varchar(22) NOT NULL,
  `item` varchar(50) NOT NULL,
  `count` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `user_inventory`
--

INSERT INTO `user_inventory` (`id`, `identifier`, `item`, `count`) VALUES
(1, 'steam:110000134bc8c01', 'bread', 0),
(2, 'steam:110000134bc8c01', 'cartebanque', 0),
(3, 'steam:110000134bc8c01', 'water', 0),
(4, 'steam:110000116d9cec8', 'bread', 0),
(5, 'steam:110000116d9cec8', 'cartebanque', 0),
(6, 'steam:110000116d9cec8', 'water', 0),
(7, 'steam:110000112a69b9e', 'cartebanque', 0),
(8, 'steam:110000112a69b9e', 'water', 7),
(9, 'steam:110000112a69b9e', 'bread', 3),
(10, 'steam:11000013368b987', 'water', 0),
(11, 'steam:11000013368b987', 'bread', 0),
(12, 'steam:11000013368b987', 'cartebanque', 0),
(13, 'steam:11000013368b987', 'carte', 1),
(14, 'steam:110000112a69b9e', 'carte', 1),
(15, 'steam:11000013e98cb7e', 'water', 0),
(16, 'steam:11000013e98cb7e', 'carte', 1),
(17, 'steam:11000013e98cb7e', 'bread', 0),
(18, 'steam:110000112a69b9e', 'fixtool', 0),
(19, 'steam:110000112a69b9e', 'fixkit', 3),
(20, 'steam:110000112a69b9e', 'carokit', 2),
(21, 'steam:110000112a69b9e', 'gazbottle', 0),
(22, 'steam:110000112a69b9e', 'blowpipe', 0),
(23, 'steam:110000112a69b9e', 'carotool', 0),
(24, 'steam:110000112a69b9e', 'bandage', 3),
(25, 'steam:110000112a69b9e', 'medikit', 3),
(26, 'steam:11000013368b987', 'bandage', 0),
(27, 'steam:11000013368b987', 'gazbottle', 0),
(28, 'steam:11000013368b987', 'carotool', 0),
(29, 'steam:11000013368b987', 'fixtool', 0),
(30, 'steam:11000013368b987', 'medikit', 0),
(31, 'steam:11000013368b987', 'blowpipe', 0),
(32, 'steam:11000013368b987', 'fixkit', 0),
(33, 'steam:11000013368b987', 'carokit', 0),
(34, 'steam:11000013368b987', 'menthe', 0),
(35, 'steam:11000013368b987', 'icetea', 0),
(36, 'steam:11000013368b987', 'bolnoixcajou', 0),
(37, 'steam:11000013368b987', 'saucisson', 0),
(38, 'steam:11000013368b987', 'jagerbomb', 0),
(39, 'steam:11000013368b987', 'jus_raisin', 0),
(40, 'steam:11000013368b987', 'mixapero', 0),
(41, 'steam:11000013368b987', 'limonade', 0),
(42, 'steam:11000013368b987', 'whiskycoca', 0),
(43, 'steam:11000013368b987', 'rhum', 0),
(44, 'steam:11000013368b987', 'metreshooter', 0),
(45, 'steam:11000013368b987', 'whisky', 0),
(46, 'steam:11000013368b987', 'drpepper', 0),
(47, 'steam:11000013368b987', 'bolpistache', 0),
(48, 'steam:11000013368b987', 'bolchips', 0),
(49, 'steam:11000013368b987', 'vodkafruit', 0),
(50, 'steam:11000013368b987', 'grapperaisin', 0),
(51, 'steam:11000013368b987', 'rhumfruit', 0),
(52, 'steam:11000013368b987', 'martini', 0),
(53, 'steam:11000013368b987', 'vodka', 0),
(54, 'steam:11000013368b987', 'coffee', 0),
(55, 'steam:11000013368b987', 'jagercerbere', 0),
(56, 'steam:11000013368b987', 'teqpaf', 0),
(57, 'steam:11000013368b987', 'tel', 0),
(58, 'steam:11000013368b987', 'energy', 0),
(59, 'steam:11000013368b987', 'sim', 0),
(60, 'steam:11000013368b987', 'rhumcoca', 0),
(61, 'steam:11000013368b987', 'mojito', 0),
(62, 'steam:11000013368b987', 'jager', 0),
(63, 'steam:11000013368b987', 'jusfruit', 0),
(64, 'steam:11000013368b987', 'vine', 0),
(65, 'steam:11000013368b987', 'vodkaenergy', 0),
(66, 'steam:11000013368b987', 'soda', 0),
(67, 'steam:11000013368b987', 'bolcacahuetes', 0),
(68, 'steam:11000013368b987', 'golem', 0),
(69, 'steam:11000013368b987', 'tequila', 0),
(70, 'steam:11000013368b987', 'ice', 0),
(71, 'steam:11000013368b987', 'grand_cru', 0),
(72, 'steam:11000013368b987', 'raisin', 0),
(73, 'steam:110000112a69b9e', 'Masque7_1', 0),
(74, 'steam:110000112a69b9e', 'Masque14', 0),
(75, 'steam:110000112a69b9e', 'Masque51_7', 0),
(76, 'steam:110000112a69b9e', 'Masque7', 0),
(77, 'steam:110000112a69b9e', 'Masque54_2', 0),
(78, 'steam:110000112a69b9e', 'vine', 0),
(79, 'steam:110000112a69b9e', 'Masque18', 0),
(80, 'steam:110000112a69b9e', 'Masque54_3', 0),
(81, 'steam:110000112a69b9e', 'Masque43_2', 0),
(82, 'steam:110000112a69b9e', 'Masque22_2', 0),
(83, 'steam:110000112a69b9e', 'Masque15', 0),
(84, 'steam:110000112a69b9e', 'Masque26', 0),
(85, 'steam:110000112a69b9e', 'Masque44_2', 0),
(86, 'steam:110000112a69b9e', 'Masque58_1', 0),
(87, 'steam:110000112a69b9e', 'Masque50_6', 0),
(88, 'steam:110000112a69b9e', 'jagerbomb', 0),
(89, 'steam:110000112a69b9e', 'Masque12', 0),
(90, 'steam:110000112a69b9e', 'Masque6_1', 0),
(91, 'steam:110000112a69b9e', 'Masque50_5', 0),
(92, 'steam:110000112a69b9e', 'Masque23_2', 0),
(93, 'steam:110000112a69b9e', 'Masque46_1', 0),
(94, 'steam:110000112a69b9e', 'Masque20_2', 0),
(95, 'steam:110000112a69b9e', 'Masque20_1', 0),
(96, 'steam:110000112a69b9e', 'Masque36_2', 0),
(97, 'steam:110000112a69b9e', 'icetea', 8),
(98, 'steam:110000112a69b9e', 'jager', 0),
(99, 'steam:110000112a69b9e', 'Masque1_3', 0),
(100, 'steam:110000112a69b9e', 'Masque53', 0),
(101, 'steam:110000112a69b9e', 'rhumcoca', 0),
(102, 'steam:110000112a69b9e', 'Masque53_4', 0),
(103, 'steam:110000112a69b9e', 'Masque48_2', 0),
(104, 'steam:110000112a69b9e', 'Masque51_2', 0),
(105, 'steam:110000112a69b9e', 'Masque24_2', 0),
(106, 'steam:110000112a69b9e', 'Masque51_8', 0),
(107, 'steam:110000112a69b9e', 'Masque21', 0),
(108, 'steam:110000112a69b9e', 'Masque37', 0),
(109, 'steam:110000112a69b9e', 'Masque52_8', 0),
(110, 'steam:110000112a69b9e', 'Masque33_2', 0),
(111, 'steam:110000112a69b9e', 'Masque54_7', 0),
(112, 'steam:110000112a69b9e', 'Masque2_1', 0),
(113, 'steam:110000112a69b9e', 'ice', 0),
(114, 'steam:110000112a69b9e', 'Masque42_2', 0),
(115, 'steam:110000112a69b9e', 'Masque50_2', 0),
(116, 'steam:110000112a69b9e', 'Masque53_7', 0),
(117, 'steam:110000112a69b9e', 'bolcacahuetes', 0),
(118, 'steam:110000112a69b9e', 'Masque16_1', 0),
(119, 'steam:110000112a69b9e', 'Masque4_2', 0),
(120, 'steam:110000112a69b9e', 'Masque60', 0),
(121, 'steam:110000112a69b9e', 'tel', 2),
(122, 'steam:110000112a69b9e', 'Masque30_1', 0),
(123, 'steam:110000112a69b9e', 'bolchips', 0),
(124, 'steam:110000112a69b9e', 'Masque52_6', 0),
(125, 'steam:110000112a69b9e', 'Masque26_1', 0),
(126, 'steam:110000112a69b9e', 'Masque38', 0),
(127, 'steam:110000112a69b9e', 'jusfruit', 0),
(128, 'steam:110000112a69b9e', 'Masque53_5', 0),
(129, 'steam:110000112a69b9e', 'Masque22', 0),
(130, 'steam:110000112a69b9e', 'Masque49', 0),
(131, 'steam:110000112a69b9e', 'Masque34_2', 0),
(132, 'steam:110000112a69b9e', 'Masque51_5', 0),
(133, 'steam:110000112a69b9e', 'Masque13_1', 0),
(134, 'steam:110000112a69b9e', 'Masque50_9', 0),
(135, 'steam:110000112a69b9e', 'Masque54_8', 0),
(136, 'steam:110000112a69b9e', 'Masque50_3', 0),
(137, 'steam:110000112a69b9e', 'Masque17', 0),
(138, 'steam:110000112a69b9e', 'Masque58_2', 0),
(139, 'steam:110000112a69b9e', 'Masque27_1', 0),
(140, 'steam:110000112a69b9e', 'Masque41_1', 0),
(141, 'steam:110000112a69b9e', 'Masque34_1', 0),
(142, 'steam:110000112a69b9e', 'grand_cru', 0),
(143, 'steam:110000112a69b9e', 'Masque17_1', 0),
(144, 'steam:110000112a69b9e', 'Masque2', 0),
(145, 'steam:110000112a69b9e', 'Masque55_2', 0),
(146, 'steam:110000112a69b9e', 'Masque51_9', 0),
(147, 'steam:110000112a69b9e', 'martini', 0),
(148, 'steam:110000112a69b9e', 'Masque55_1', 0),
(149, 'steam:110000112a69b9e', 'Masque42_1', 0),
(150, 'steam:110000112a69b9e', 'Masque54_4', 0),
(151, 'steam:110000112a69b9e', 'Masque27_2', 0),
(152, 'steam:110000112a69b9e', 'Masque52', 0),
(153, 'steam:110000112a69b9e', 'Masque14_2', 0),
(154, 'steam:110000112a69b9e', 'Masque36', 0),
(155, 'steam:110000112a69b9e', 'Masque36_1', 0),
(156, 'steam:110000112a69b9e', 'Masque47_1', 0),
(157, 'steam:110000112a69b9e', 'Masque23_1', 0),
(158, 'steam:110000112a69b9e', 'Masque44', 0),
(159, 'steam:110000112a69b9e', 'Masque29_2', 0),
(160, 'steam:110000112a69b9e', 'Masque11_2', 0),
(161, 'steam:110000112a69b9e', 'Masque17_2', 0),
(162, 'steam:110000112a69b9e', 'whisky', 0),
(163, 'steam:110000112a69b9e', 'Masque54_1', 0),
(164, 'steam:110000112a69b9e', 'Masque26_2', 0),
(165, 'steam:110000112a69b9e', 'Masque52_1', 0),
(166, 'steam:110000112a69b9e', 'Masque16', 0),
(167, 'steam:110000112a69b9e', 'Masque47_2', 0),
(168, 'steam:110000112a69b9e', 'Masque52_9', 0),
(169, 'steam:110000112a69b9e', 'Masque60_2', 0),
(170, 'steam:110000112a69b9e', 'Masque1_2', 0),
(171, 'steam:110000112a69b9e', 'Masque42', 0),
(172, 'steam:110000112a69b9e', 'Masque53_2', 0),
(173, 'steam:110000112a69b9e', 'Masque38_1', 0),
(174, 'steam:110000112a69b9e', 'Masque51_6', 0),
(175, 'steam:110000112a69b9e', 'Masque35', 0),
(176, 'steam:110000112a69b9e', 'mojito', 0),
(177, 'steam:110000112a69b9e', 'grapperaisin', 0),
(178, 'steam:110000112a69b9e', 'Masque39', 0),
(179, 'steam:110000112a69b9e', 'Masque12_2', 0),
(180, 'steam:110000112a69b9e', 'Masque45', 0),
(181, 'steam:110000112a69b9e', 'Masque56_1', 0),
(182, 'steam:110000112a69b9e', 'Masque10_1', 0),
(183, 'steam:110000112a69b9e', 'Masque25_1', 0),
(184, 'steam:110000112a69b9e', 'Masque41', 0),
(185, 'steam:110000112a69b9e', 'Masque34', 0),
(186, 'steam:110000112a69b9e', 'Masque53_9', 0),
(187, 'steam:110000112a69b9e', 'Masque2_2', 0),
(188, 'steam:110000112a69b9e', 'Masque30', 0),
(189, 'steam:110000112a69b9e', 'Masque52_7', 0),
(190, 'steam:110000112a69b9e', 'Masque6', 0),
(191, 'steam:110000112a69b9e', 'jagercerbere', 0),
(192, 'steam:110000112a69b9e', 'Masque31', 0),
(193, 'steam:110000112a69b9e', 'Masque19_1', 0),
(194, 'steam:110000112a69b9e', 'Masque3', 0),
(195, 'steam:110000112a69b9e', 'Masque51', 0),
(196, 'steam:110000112a69b9e', 'raisin', 0),
(197, 'steam:110000112a69b9e', 'Masque48', 0),
(198, 'steam:110000112a69b9e', 'Masque13_2', 0),
(199, 'steam:110000112a69b9e', 'vodkafruit', 0),
(200, 'steam:110000112a69b9e', 'Masque44_1', 0),
(201, 'steam:110000112a69b9e', 'Masque49_1', 0),
(202, 'steam:110000112a69b9e', 'mixapero', 0),
(203, 'steam:110000112a69b9e', 'metreshooter', 0),
(204, 'steam:110000112a69b9e', 'Masque53_8', 0),
(205, 'steam:110000112a69b9e', 'Masque55', 0),
(206, 'steam:110000112a69b9e', 'Masque25_2', 0),
(207, 'steam:110000112a69b9e', 'golem', 0),
(208, 'steam:110000112a69b9e', 'Masque11_1', 0),
(209, 'steam:110000112a69b9e', 'Masque30_2', 0),
(210, 'steam:110000112a69b9e', 'Masque4', 0),
(211, 'steam:110000112a69b9e', 'Masque40_1', 0),
(212, 'steam:110000112a69b9e', 'Masque46', 0),
(213, 'steam:110000112a69b9e', 'drpepper', 0),
(214, 'steam:110000112a69b9e', 'Masque54_5', 0),
(215, 'steam:110000112a69b9e', 'Masque28_2', 0),
(216, 'steam:110000112a69b9e', 'Masque54_6', 0),
(217, 'steam:110000112a69b9e', 'Masque57_1', 0),
(218, 'steam:110000112a69b9e', 'Masque57', 0),
(219, 'steam:110000112a69b9e', 'Masque28', 0),
(220, 'steam:110000112a69b9e', 'Masque53_3', 0),
(221, 'steam:110000112a69b9e', 'Masque45_1', 0),
(222, 'steam:110000112a69b9e', 'Masque35_2', 0),
(223, 'steam:110000112a69b9e', 'Masque7_2', 0),
(224, 'steam:110000112a69b9e', 'Masque5_1', 0),
(225, 'steam:110000112a69b9e', 'Masque6_2', 0),
(226, 'steam:110000112a69b9e', 'Masque16_2', 0),
(227, 'steam:110000112a69b9e', 'Masque5', 0),
(228, 'steam:110000112a69b9e', 'Masque32_2', 0),
(229, 'steam:110000112a69b9e', 'teqpaf', 0),
(230, 'steam:110000112a69b9e', 'energy', 0),
(231, 'steam:110000112a69b9e', 'sim', 0),
(232, 'steam:110000112a69b9e', 'Masque47', 0),
(233, 'steam:110000112a69b9e', 'whiskycoca', 0),
(234, 'steam:110000112a69b9e', 'Masque27', 0),
(235, 'steam:110000112a69b9e', 'vodkaenergy', 0),
(236, 'steam:110000112a69b9e', 'Masque59', 0),
(237, 'steam:110000112a69b9e', 'Masque13', 0),
(238, 'steam:110000112a69b9e', 'Masque59_2', 0),
(239, 'steam:110000112a69b9e', 'bolpistache', 0),
(240, 'steam:110000112a69b9e', 'Masque9_1', 0),
(241, 'steam:110000112a69b9e', 'Masque50_1', 0),
(242, 'steam:110000112a69b9e', 'Masque1', 0),
(243, 'steam:110000112a69b9e', 'Masque4_1', 0),
(244, 'steam:110000112a69b9e', 'Masque19', 0),
(245, 'steam:110000112a69b9e', 'tequila', 0),
(246, 'steam:110000112a69b9e', 'Masque52_4', 0),
(247, 'steam:110000112a69b9e', 'Masque51_1', 0),
(248, 'steam:110000112a69b9e', 'Masque37_2', 0),
(249, 'steam:110000112a69b9e', 'soda', 0),
(250, 'steam:110000112a69b9e', 'saucisson', 2),
(251, 'steam:110000112a69b9e', 'Masque40', 0),
(252, 'steam:110000112a69b9e', 'rhumfruit', 0),
(253, 'steam:110000112a69b9e', 'Masque15_1', 0),
(254, 'steam:110000112a69b9e', 'Masque29', 0),
(255, 'steam:110000112a69b9e', 'Masque59_1', 0),
(256, 'steam:110000112a69b9e', 'Masque19_2', 0),
(257, 'steam:110000112a69b9e', 'Masque54', 0),
(258, 'steam:110000112a69b9e', 'rhum', 0),
(259, 'steam:110000112a69b9e', 'Masque39_2', 0),
(260, 'steam:110000112a69b9e', 'Masque43', 0),
(261, 'steam:110000112a69b9e', 'Masque23', 0),
(262, 'steam:110000112a69b9e', 'menthe', 0),
(263, 'steam:110000112a69b9e', 'Masque50_7', 0),
(264, 'steam:110000112a69b9e', 'Masque24_1', 0),
(265, 'steam:110000112a69b9e', 'Masque52_2', 0),
(266, 'steam:110000112a69b9e', 'Masque9', 0),
(267, 'steam:110000112a69b9e', 'Masque8_2', 0),
(268, 'steam:110000112a69b9e', 'Masque8_1', 0),
(269, 'steam:110000112a69b9e', 'Masque8', 0),
(270, 'steam:110000112a69b9e', 'Masque12_1', 0),
(271, 'steam:110000112a69b9e', 'Masque22_1', 0),
(272, 'steam:110000112a69b9e', 'Masque14_1', 0),
(273, 'steam:110000112a69b9e', 'bolnoixcajou', 0),
(274, 'steam:110000112a69b9e', 'Masque60_1', 0),
(275, 'steam:110000112a69b9e', 'Masque5_2', 0),
(276, 'steam:110000112a69b9e', 'Masque52_3', 0),
(277, 'steam:110000112a69b9e', 'Masque18_2', 0),
(278, 'steam:110000112a69b9e', 'Masque51_4', 0),
(279, 'steam:110000112a69b9e', 'Masque45_2', 0),
(280, 'steam:110000112a69b9e', 'Masque58', 0),
(281, 'steam:110000112a69b9e', 'Masque50', 0),
(282, 'steam:110000112a69b9e', 'Masque9_2', 0),
(283, 'steam:110000112a69b9e', 'Masque57_2', 0),
(284, 'steam:110000112a69b9e', 'Masque39_1', 0),
(285, 'steam:110000112a69b9e', 'Masque31_2', 0),
(286, 'steam:110000112a69b9e', 'Masque46_2', 0),
(287, 'steam:110000112a69b9e', 'Masque56_2', 0),
(288, 'steam:110000112a69b9e', 'Masque48_1', 0),
(289, 'steam:110000112a69b9e', 'Masque20', 0),
(290, 'steam:110000112a69b9e', 'Masque56', 0),
(291, 'steam:110000112a69b9e', 'limonade', 3),
(292, 'steam:110000112a69b9e', 'Masque25', 3),
(293, 'steam:110000112a69b9e', 'Masque53_6', 0),
(294, 'steam:110000112a69b9e', 'Masque32', 0),
(295, 'steam:110000112a69b9e', 'Masque11', 0),
(296, 'steam:110000112a69b9e', 'Masque37_1', 0),
(297, 'steam:110000112a69b9e', 'Masque21_1', 0),
(298, 'steam:110000112a69b9e', 'coffee', 0),
(299, 'steam:110000112a69b9e', 'Masque33_1', 0),
(300, 'steam:110000112a69b9e', 'Masque54_9', 0),
(301, 'steam:110000112a69b9e', 'jus_raisin', 0),
(302, 'steam:110000112a69b9e', 'Masque10', 0),
(303, 'steam:110000112a69b9e', 'Masque53_1', 0),
(304, 'steam:110000112a69b9e', 'Masque38_2', 0),
(305, 'steam:110000112a69b9e', 'Masque33', 0),
(306, 'steam:110000112a69b9e', 'Masque10_2', 0),
(307, 'steam:110000112a69b9e', 'Masque52_5', 0),
(308, 'steam:110000112a69b9e', 'Masque51_3', 0),
(309, 'steam:110000112a69b9e', 'Masque50_8', 0),
(310, 'steam:110000112a69b9e', 'vodka', 0),
(311, 'steam:110000112a69b9e', 'Masque24', 0),
(312, 'steam:110000112a69b9e', 'Masque49_2', 0),
(313, 'steam:110000112a69b9e', 'Masque40_2', 0),
(314, 'steam:110000112a69b9e', 'Masque28_1', 0),
(315, 'steam:110000112a69b9e', 'Masque15_2', 0),
(316, 'steam:110000112a69b9e', 'Masque18_1', 0),
(317, 'steam:110000112a69b9e', 'Masque43_1', 0),
(318, 'steam:110000112a69b9e', 'Masque41_2', 0),
(319, 'steam:110000112a69b9e', 'Masque32_1', 0),
(320, 'steam:110000112a69b9e', 'Masque21_2', 0),
(321, 'steam:110000112a69b9e', 'Masque31_1', 0),
(322, 'steam:110000112a69b9e', 'Masque35_1', 0),
(323, 'steam:110000112a69b9e', 'Masque50_4', 0),
(324, 'steam:110000112a69b9e', 'Masque29_1', 0),
(325, 'steam:11000013368b987', 'Masque52_2', 0),
(326, 'steam:11000013368b987', 'Masque53', 0),
(327, 'steam:11000013368b987', 'Masque46', 0),
(328, 'steam:11000013368b987', 'Masque53_5', 0),
(329, 'steam:11000013368b987', 'Masque49_1', 0),
(330, 'steam:11000013368b987', 'Masque50_5', 0),
(331, 'steam:11000013368b987', 'Masque36_1', 0),
(332, 'steam:11000013368b987', 'Masque52_9', 0),
(333, 'steam:11000013368b987', 'Masque11_2', 0),
(334, 'steam:11000013368b987', 'Masque54_9', 0),
(335, 'steam:11000013368b987', 'Masque54_1', 0),
(336, 'steam:11000013368b987', 'Masque51', 0),
(337, 'steam:11000013368b987', 'Masque43', 0),
(338, 'steam:11000013368b987', 'Masque53_4', 0),
(339, 'steam:11000013368b987', 'Masque35', 0),
(340, 'steam:11000013368b987', 'Masque31_2', 0),
(341, 'steam:11000013368b987', 'Masque42_1', 0),
(342, 'steam:11000013368b987', 'Masque55', 0),
(343, 'steam:11000013368b987', 'Masque54_6', 0),
(344, 'steam:11000013368b987', 'Masque50', 0),
(345, 'steam:11000013368b987', 'Masque32_1', 0),
(346, 'steam:11000013368b987', 'Masque8_1', 0),
(347, 'steam:11000013368b987', 'Masque17_1', 0),
(348, 'steam:11000013368b987', 'Masque33_2', 0),
(349, 'steam:11000013368b987', 'Masque38_1', 0),
(350, 'steam:11000013368b987', 'Masque48', 0),
(351, 'steam:11000013368b987', 'Masque31_1', 0),
(352, 'steam:11000013368b987', 'Masque53_6', 0),
(353, 'steam:11000013368b987', 'Masque39_2', 0),
(354, 'steam:11000013368b987', 'Masque1', 0),
(355, 'steam:11000013368b987', 'Masque10_1', 0),
(356, 'steam:11000013368b987', 'Masque56_1', 0),
(357, 'steam:11000013368b987', 'Masque4_1', 0),
(358, 'steam:11000013368b987', 'Masque53_7', 0),
(359, 'steam:11000013368b987', 'Masque4', 0),
(360, 'steam:11000013368b987', 'Masque60_1', 0),
(361, 'steam:11000013368b987', 'Masque57_1', 0),
(362, 'steam:11000013368b987', 'Masque19', 0),
(363, 'steam:11000013368b987', 'Masque45_2', 0),
(364, 'steam:11000013368b987', 'Masque51_8', 0),
(365, 'steam:11000013368b987', 'Masque17_2', 0),
(366, 'steam:11000013368b987', 'Masque50_8', 0),
(367, 'steam:11000013368b987', 'Masque19_2', 0),
(368, 'steam:11000013368b987', 'Masque37_1', 0),
(369, 'steam:11000013368b987', 'Masque13_2', 0),
(370, 'steam:11000013368b987', 'Masque5', 0),
(371, 'steam:11000013368b987', 'Masque25_2', 0),
(372, 'steam:11000013368b987', 'Masque21', 0),
(373, 'steam:11000013368b987', 'Masque27', 0),
(374, 'steam:11000013368b987', 'Masque29_2', 0),
(375, 'steam:11000013368b987', 'Masque44_2', 0),
(376, 'steam:11000013368b987', 'Masque33_1', 0),
(377, 'steam:11000013368b987', 'Masque26_1', 0),
(378, 'steam:11000013368b987', 'Masque50_1', 0),
(379, 'steam:11000013368b987', 'Masque40', 0),
(380, 'steam:11000013368b987', 'Masque5_2', 0),
(381, 'steam:11000013368b987', 'Masque12_1', 0),
(382, 'steam:11000013368b987', 'Masque23_2', 0),
(383, 'steam:11000013368b987', 'Masque50_9', 0),
(384, 'steam:11000013368b987', 'Masque36_2', 0),
(385, 'steam:11000013368b987', 'Masque16_2', 0),
(386, 'steam:11000013368b987', 'Masque47_2', 0),
(387, 'steam:11000013368b987', 'Masque51_7', 0),
(388, 'steam:11000013368b987', 'Masque15_1', 0),
(389, 'steam:11000013368b987', 'Masque27_2', 0),
(390, 'steam:11000013368b987', 'Masque54_5', 0),
(391, 'steam:11000013368b987', 'Masque53_1', 0),
(392, 'steam:11000013368b987', 'Masque58_1', 0),
(393, 'steam:11000013368b987', 'Masque48_1', 0),
(394, 'steam:11000013368b987', 'Masque6', 0),
(395, 'steam:11000013368b987', 'Masque49', 0),
(396, 'steam:11000013368b987', 'Masque58', 0),
(397, 'steam:11000013368b987', 'Masque21_1', 0),
(398, 'steam:11000013368b987', 'Masque51_3', 0),
(399, 'steam:11000013368b987', 'Masque18_2', 0),
(400, 'steam:11000013368b987', 'Masque57', 0),
(401, 'steam:11000013368b987', 'Masque34', 0),
(402, 'steam:11000013368b987', 'Masque39', 0),
(403, 'steam:11000013368b987', 'Masque59_2', 0),
(404, 'steam:11000013368b987', 'Masque58_2', 0),
(405, 'steam:11000013368b987', 'Masque14', 0),
(406, 'steam:11000013368b987', 'Masque54_3', 0),
(407, 'steam:11000013368b987', 'Masque6_1', 0),
(408, 'steam:11000013368b987', 'Masque39_1', 0),
(409, 'steam:11000013368b987', 'Masque22_1', 0),
(410, 'steam:11000013368b987', 'Masque20', 0),
(411, 'steam:11000013368b987', 'Masque19_1', 0),
(412, 'steam:11000013368b987', 'Masque50_4', 0),
(413, 'steam:11000013368b987', 'Masque52_3', 0),
(414, 'steam:11000013368b987', 'Masque53_3', 0),
(415, 'steam:11000013368b987', 'Masque51_4', 0),
(416, 'steam:11000013368b987', 'Masque13', 0),
(417, 'steam:11000013368b987', 'Masque16_1', 0),
(418, 'steam:11000013368b987', 'Masque14_1', 0),
(419, 'steam:11000013368b987', 'Masque51_9', 0),
(420, 'steam:11000013368b987', 'Masque35_2', 0),
(421, 'steam:11000013368b987', 'Masque12', 0),
(422, 'steam:11000013368b987', 'Masque31', 0),
(423, 'steam:11000013368b987', 'Masque51_6', 0),
(424, 'steam:11000013368b987', 'Masque7', 0),
(425, 'steam:11000013368b987', 'Masque40_1', 0),
(426, 'steam:11000013368b987', 'Masque30_2', 0),
(427, 'steam:11000013368b987', 'Masque35_1', 0),
(428, 'steam:11000013368b987', 'Masque24', 0),
(429, 'steam:11000013368b987', 'Masque24_1', 0),
(430, 'steam:11000013368b987', 'Masque50_7', 0),
(431, 'steam:11000013368b987', 'Masque9', 0),
(432, 'steam:11000013368b987', 'Masque43_2', 0),
(433, 'steam:11000013368b987', 'Masque54_4', 0),
(434, 'steam:11000013368b987', 'Masque15', 0),
(435, 'steam:11000013368b987', 'Masque37', 0),
(436, 'steam:11000013368b987', 'Masque51_5', 0),
(437, 'steam:11000013368b987', 'Masque37_2', 0),
(438, 'steam:11000013368b987', 'Masque28', 0),
(439, 'steam:11000013368b987', 'Masque9_2', 0),
(440, 'steam:11000013368b987', 'Masque59_1', 0),
(441, 'steam:11000013368b987', 'Masque1_2', 0),
(442, 'steam:11000013368b987', 'Masque4_2', 0),
(443, 'steam:11000013368b987', 'Masque3', 0),
(444, 'steam:11000013368b987', 'Masque57_2', 0),
(445, 'steam:11000013368b987', 'Masque38_2', 0),
(446, 'steam:11000013368b987', 'Masque59', 0),
(447, 'steam:11000013368b987', 'Masque54', 0),
(448, 'steam:11000013368b987', 'Masque54_7', 0),
(449, 'steam:11000013368b987', 'Masque52_8', 0),
(450, 'steam:11000013368b987', 'Masque28_1', 0),
(451, 'steam:11000013368b987', 'Masque60', 0),
(452, 'steam:11000013368b987', 'Masque54_8', 0),
(453, 'steam:11000013368b987', 'Masque50_3', 0),
(454, 'steam:11000013368b987', 'Masque20_1', 0),
(455, 'steam:11000013368b987', 'Masque54_2', 0),
(456, 'steam:11000013368b987', 'Masque23_1', 0),
(457, 'steam:11000013368b987', 'Masque15_2', 0),
(458, 'steam:11000013368b987', 'Masque9_1', 0),
(459, 'steam:11000013368b987', 'Masque42', 0),
(460, 'steam:11000013368b987', 'Masque47_1', 0),
(461, 'steam:11000013368b987', 'Masque16', 0),
(462, 'steam:11000013368b987', 'Masque41', 0),
(463, 'steam:11000013368b987', 'Masque41_2', 0),
(464, 'steam:11000013368b987', 'Masque24_2', 0),
(465, 'steam:11000013368b987', 'Masque18', 0),
(466, 'steam:11000013368b987', 'Masque51_2', 0),
(467, 'steam:11000013368b987', 'Masque32_2', 0),
(468, 'steam:11000013368b987', 'Masque38', 0),
(469, 'steam:11000013368b987', 'Masque1_3', 0),
(470, 'steam:11000013368b987', 'Masque52', 0),
(471, 'steam:11000013368b987', 'Masque26_2', 0),
(472, 'steam:11000013368b987', 'Masque8', 0),
(473, 'steam:11000013368b987', 'Masque34_2', 0),
(474, 'steam:11000013368b987', 'Masque25_1', 0),
(475, 'steam:11000013368b987', 'Masque2_2', 0),
(476, 'steam:11000013368b987', 'Masque52_4', 0),
(477, 'steam:11000013368b987', 'Masque52_6', 0),
(478, 'steam:11000013368b987', 'Masque29_1', 0),
(479, 'steam:11000013368b987', 'Masque21_2', 0),
(480, 'steam:11000013368b987', 'Masque23', 0),
(481, 'steam:11000013368b987', 'Masque52_7', 0),
(482, 'steam:11000013368b987', 'Masque8_2', 0),
(483, 'steam:11000013368b987', 'Masque14_2', 0),
(484, 'steam:11000013368b987', 'Masque55_2', 0),
(485, 'steam:11000013368b987', 'Masque18_1', 0),
(486, 'steam:11000013368b987', 'Masque41_1', 0),
(487, 'steam:11000013368b987', 'Masque50_2', 0),
(488, 'steam:11000013368b987', 'Masque7_2', 0),
(489, 'steam:11000013368b987', 'Masque7_1', 0),
(490, 'steam:11000013368b987', 'Masque45', 0),
(491, 'steam:11000013368b987', 'Masque6_2', 0),
(492, 'steam:11000013368b987', 'Masque30_1', 0),
(493, 'steam:11000013368b987', 'Masque22_2', 0),
(494, 'steam:11000013368b987', 'Masque47', 0),
(495, 'steam:11000013368b987', 'Masque2', 0),
(496, 'steam:11000013368b987', 'Masque22', 0),
(497, 'steam:11000013368b987', 'Masque20_2', 0),
(498, 'steam:11000013368b987', 'Masque52_5', 0),
(499, 'steam:11000013368b987', 'Masque51_1', 0),
(500, 'steam:11000013368b987', 'Masque28_2', 0),
(501, 'steam:11000013368b987', 'Masque60_2', 0),
(502, 'steam:11000013368b987', 'Masque36', 0),
(503, 'steam:11000013368b987', 'Masque50_6', 0),
(504, 'steam:11000013368b987', 'Masque34_1', 0),
(505, 'steam:11000013368b987', 'Masque40_2', 0),
(506, 'steam:11000013368b987', 'Masque5_1', 0),
(507, 'steam:11000013368b987', 'Masque10', 0),
(508, 'steam:11000013368b987', 'Masque2_1', 0),
(509, 'steam:11000013368b987', 'Masque53_9', 0),
(510, 'steam:11000013368b987', 'Masque11', 0),
(511, 'steam:11000013368b987', 'Masque42_2', 0),
(512, 'steam:11000013368b987', 'Masque52_1', 0),
(513, 'steam:11000013368b987', 'Masque11_1', 0),
(514, 'steam:11000013368b987', 'Masque32', 0),
(515, 'steam:11000013368b987', 'Masque56_2', 0),
(516, 'steam:11000013368b987', 'Masque10_2', 0),
(517, 'steam:11000013368b987', 'Masque56', 0),
(518, 'steam:11000013368b987', 'Masque25', 0),
(519, 'steam:11000013368b987', 'Masque55_1', 0),
(520, 'steam:11000013368b987', 'Masque53_8', 0),
(521, 'steam:11000013368b987', 'Masque53_2', 0),
(522, 'steam:11000013368b987', 'Masque43_1', 0),
(523, 'steam:11000013368b987', 'Masque13_1', 0),
(524, 'steam:11000013368b987', 'Masque26', 0),
(525, 'steam:11000013368b987', 'Masque44_1', 0),
(526, 'steam:11000013368b987', 'Masque45_1', 0),
(527, 'steam:11000013368b987', 'Masque27_1', 0),
(528, 'steam:11000013368b987', 'Masque12_2', 0),
(529, 'steam:11000013368b987', 'Masque49_2', 0),
(530, 'steam:11000013368b987', 'Masque33', 0),
(531, 'steam:11000013368b987', 'Masque46_1', 0),
(532, 'steam:11000013368b987', 'Masque17', 0),
(533, 'steam:11000013368b987', 'Masque29', 0),
(534, 'steam:11000013368b987', 'Masque48_2', 0),
(535, 'steam:11000013368b987', 'Masque46_2', 0),
(536, 'steam:11000013368b987', 'Masque44', 0),
(537, 'steam:11000013368b987', 'Masque30', 0),
(538, 'steam:110000112a69b9e', 'clip', 12),
(539, 'steam:110000112a69b9e', 'redbull', 0),
(540, 'steam:110000112a69b9e', 'sandwich', 0),
(541, 'steam:110000112a69b9e', 'menergy', 0),
(542, 'steam:11000013368b987', 'menergy', 0),
(543, 'steam:11000013368b987', 'sandwich', 0),
(544, 'steam:11000013368b987', 'clip', 0),
(545, 'steam:11000013368b987', 'redbull', 0),
(546, 'steam:110000112a69b9e', 'piluleoubli', 0),
(547, 'steam:110000112a69b9e', 'xanax', 0);

-- --------------------------------------------------------

--
-- Structure de la table `user_licenses`
--

CREATE TABLE `user_licenses` (
  `id` int(11) NOT NULL,
  `type` varchar(60) NOT NULL,
  `owner` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `user_licenses`
--

INSERT INTO `user_licenses` (`id`, `type`, `owner`) VALUES
(1, 'aircraft', 'steam:110000112a69b9e'),
(2, 'aircraft', 'steam:110000112a69b9e');

-- --------------------------------------------------------

--
-- Structure de la table `user_mdt`
--

CREATE TABLE `user_mdt` (
  `id` int(11) NOT NULL,
  `char_id` int(11) DEFAULT NULL,
  `notes` varchar(255) DEFAULT NULL,
  `mugshot_url` varchar(255) DEFAULT NULL,
  `bail` bit(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `user_sim`
--

CREATE TABLE `user_sim` (
  `id` int(11) NOT NULL,
  `identifier` varchar(555) NOT NULL,
  `number` varchar(555) NOT NULL,
  `label` varchar(555) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Contenu de la table `user_sim`
--

INSERT INTO `user_sim` (`id`, `identifier`, `number`, `label`) VALUES
(107, 'steam:11000013368b987', '5553587', 'SIM 5553587'),
(109, 'steam:110000112a69b9e', '5554538', 'SIM 5554538'),
(110, 'steam:110000112a69b9e', '5554987', 'SIM 5554987'),
(111, 'steam:110000112a69b9e', '5558719', 'SIM 5558719'),
(112, 'steam:110000112a69b9e', '5552622', 'SIM 5552622');

-- --------------------------------------------------------

--
-- Structure de la table `user_tenue`
--

CREATE TABLE `user_tenue` (
  `id` int(11) NOT NULL,
  `identifier` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `tenue` longtext COLLATE utf8mb4_bin NOT NULL,
  `label` varchar(20) COLLATE utf8mb4_bin DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- --------------------------------------------------------

--
-- Structure de la table `vehicles`
--

CREATE TABLE `vehicles` (
  `name` varchar(60) NOT NULL,
  `model` varchar(60) NOT NULL,
  `price` int(11) NOT NULL,
  `category` varchar(60) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `vehicles`
--

INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
('Adder', 'adder', 900000, 'super'),
('Akuma', 'AKUMA', 7500, 'motorcycles'),
('Alpha', 'alpha', 60000, 'sports'),
('Ardent', 'ardent', 1150000, 'sportsclassics'),
('Asea', 'asea', 5500, 'sedans'),
('Autarch', 'autarch', 1955000, 'super'),
('Avarus', 'avarus', 18000, 'motorcycles'),
('Bagger', 'bagger', 13500, 'motorcycles'),
('Baller', 'baller2', 40000, 'suvs'),
('Baller Sport', 'baller3', 60000, 'suvs'),
('Banshee', 'banshee', 70000, 'sports'),
('Banshee 900R', 'banshee2', 255000, 'super'),
('Bati 801', 'bati', 12000, 'motorcycles'),
('Bati 801RR', 'bati2', 19000, 'motorcycles'),
('Bestia GTS', 'bestiagts', 55000, 'sports'),
('BF400', 'bf400', 6500, 'motorcycles'),
('Bf Injection', 'bfinjection', 16000, 'offroad'),
('Bifta', 'bifta', 12000, 'offroad'),
('Bison', 'bison', 45000, 'vans'),
('Blade', 'blade', 15000, 'muscle'),
('Blazer', 'blazer', 6500, 'offroad'),
('Blazer Sport', 'blazer4', 8500, 'offroad'),
('blazer5', 'blazer5', 1755600, 'offroad'),
('Blista', 'blista', 8000, 'compacts'),
('BMX (velo)', 'bmx', 160, 'motorcycles'),
('Bobcat XL', 'bobcatxl', 32000, 'vans'),
('Brawler', 'brawler', 45000, 'offroad'),
('Brioso R/A', 'brioso', 18000, 'compacts'),
('Btype', 'btype', 62000, 'sportsclassics'),
('Btype Hotroad', 'btype2', 155000, 'sportsclassics'),
('Btype Luxe', 'btype3', 85000, 'sportsclassics'),
('Buccaneer', 'buccaneer', 18000, 'muscle'),
('Buccaneer Rider', 'buccaneer2', 24000, 'muscle'),
('Buffalo', 'buffalo', 12000, 'sports'),
('Buffalo S', 'buffalo2', 20000, 'sports'),
('Bullet', 'bullet', 90000, 'super'),
('Burrito', 'burrito3', 19000, 'vans'),
('Camper', 'camper', 42000, 'vans'),
('Carbonizzare', 'carbonizzare', 75000, 'sports'),
('Carbon RS', 'carbonrs', 18000, 'motorcycles'),
('Casco', 'casco', 30000, 'sportsclassics'),
('Cavalcade', 'cavalcade2', 55000, 'suvs'),
('Cheetah', 'cheetah', 375000, 'super'),
('Chimera', 'chimera', 38000, 'motorcycles'),
('Chino', 'chino', 15000, 'muscle'),
('Chino Luxe', 'chino2', 19000, 'muscle'),
('Cliffhanger', 'cliffhanger', 9500, 'motorcycles'),
('Cognoscenti Cabrio', 'cogcabrio', 55000, 'coupes'),
('Cognoscenti', 'cognoscenti', 55000, 'sedans'),
('Comet', 'comet2', 65000, 'sports'),
('Comet 5', 'comet5', 1145000, 'sports'),
('Contender', 'contender', 70000, 'suvs'),
('Coquette', 'coquette', 65000, 'sports'),
('Coquette Classic', 'coquette2', 40000, 'sportsclassics'),
('Coquette BlackFin', 'coquette3', 55000, 'muscle'),
('Cruiser (velo)', 'cruiser', 510, 'motorcycles'),
('Cyclone', 'cyclone', 1890000, 'super'),
('Daemon', 'daemon', 11500, 'motorcycles'),
('Daemon High', 'daemon2', 13500, 'motorcycles'),
('Defiler', 'defiler', 9800, 'motorcycles'),
('Deluxo', 'deluxo', 4721500, 'sportsclassics'),
('Dominator', 'dominator', 35000, 'muscle'),
('Double T', 'double', 28000, 'motorcycles'),
('Dubsta', 'dubsta', 45000, 'suvs'),
('Dubsta Luxuary', 'dubsta2', 60000, 'suvs'),
('Bubsta 6x6', 'dubsta3', 120000, 'offroad'),
('Dukes', 'dukes', 28000, 'muscle'),
('Dune Buggy', 'dune', 8000, 'offroad'),
('Elegy', 'elegy2', 38500, 'sports'),
('Emperor', 'emperor', 8500, 'sedans'),
('Enduro', 'enduro', 5500, 'motorcycles'),
('Entity XF', 'entityxf', 425000, 'super'),
('Esskey', 'esskey', 4200, 'motorcycles'),
('Exemplar', 'exemplar', 32000, 'coupes'),
('F620', 'f620', 40000, 'coupes'),
('Faction', 'faction', 20000, 'muscle'),
('Faction Rider', 'faction2', 30000, 'muscle'),
('Faction XL', 'faction3', 40000, 'muscle'),
('Faggio', 'faggio', 1900, 'motorcycles'),
('Vespa', 'faggio2', 2800, 'motorcycles'),
('Felon', 'felon', 42000, 'coupes'),
('Felon GT', 'felon2', 55000, 'coupes'),
('Feltzer', 'feltzer2', 55000, 'sports'),
('Stirling GT', 'feltzer3', 65000, 'sportsclassics'),
('Fixter (velo)', 'fixter', 225, 'motorcycles'),
('FMJ', 'fmj', 185000, 'super'),
('Fhantom', 'fq2', 17000, 'suvs'),
('Fugitive', 'fugitive', 12000, 'sedans'),
('Furore GT', 'furoregt', 45000, 'sports'),
('Fusilade', 'fusilade', 40000, 'sports'),
('Gargoyle', 'gargoyle', 16500, 'motorcycles'),
('Gauntlet', 'gauntlet', 30000, 'muscle'),
('Gang Burrito', 'gburrito', 45000, 'vans'),
('Burrito', 'gburrito2', 29000, 'vans'),
('Glendale', 'glendale', 6500, 'sedans'),
('Grabger', 'granger', 50000, 'suvs'),
('Gresley', 'gresley', 47500, 'suvs'),
('GT 500', 'gt500', 785000, 'sportsclassics'),
('Guardian', 'guardian', 45000, 'offroad'),
('Hakuchou', 'hakuchou', 31000, 'motorcycles'),
('Hakuchou Sport', 'hakuchou2', 55000, 'motorcycles'),
('Hermes', 'hermes', 535000, 'muscle'),
('Hexer', 'hexer', 12000, 'motorcycles'),
('Hotknife', 'hotknife', 125000, 'muscle'),
('Huntley S', 'huntley', 40000, 'suvs'),
('Hustler', 'hustler', 625000, 'muscle'),
('Infernus', 'infernus', 180000, 'super'),
('Innovation', 'innovation', 23500, 'motorcycles'),
('Intruder', 'intruder', 7500, 'sedans'),
('Issi', 'issi2', 10000, 'compacts'),
('Jackal', 'jackal', 38000, 'coupes'),
('Jester', 'jester', 65000, 'sports'),
('Jester(Racecar)', 'jester2', 135000, 'sports'),
('Journey', 'journey', 6500, 'vans'),
('Kamacho', 'kamacho', 345000, 'offroad'),
('Khamelion', 'khamelion', 38000, 'sports'),
('Kuruma', 'kuruma', 30000, 'sports'),
('Landstalker', 'landstalker', 35000, 'suvs'),
('RE-7B', 'le7b', 325000, 'super'),
('Lynx', 'lynx', 40000, 'sports'),
('Mamba', 'mamba', 70000, 'sports'),
('Manana', 'manana', 12800, 'sportsclassics'),
('Manchez', 'manchez', 5300, 'motorcycles'),
('Massacro', 'massacro', 65000, 'sports'),
('Massacro(Racecar)', 'massacro2', 130000, 'sports'),
('Mesa', 'mesa', 16000, 'suvs'),
('Mesa Trail', 'mesa3', 40000, 'suvs'),
('Minivan', 'minivan', 13000, 'vans'),
('Monroe', 'monroe', 55000, 'sportsclassics'),
('The Liberator', 'monster', 210000, 'offroad'),
('Moonbeam', 'moonbeam', 18000, 'vans'),
('Moonbeam Rider', 'moonbeam2', 35000, 'vans'),
('Nemesis', 'nemesis', 5800, 'motorcycles'),
('Neon', 'neon', 1500000, 'sports'),
('Nightblade', 'nightblade', 35000, 'motorcycles'),
('Nightshade', 'nightshade', 65000, 'muscle'),
('9F', 'ninef', 65000, 'sports'),
('9F Cabrio', 'ninef2', 80000, 'sports'),
('Omnis', 'omnis', 35000, 'sports'),
('Oppressor', 'oppressor', 3524500, 'super'),
('Oracle XS', 'oracle2', 35000, 'coupes'),
('Osiris', 'osiris', 160000, 'super'),
('Panto', 'panto', 10000, 'compacts'),
('Paradise', 'paradise', 19000, 'vans'),
('Pariah', 'pariah', 1420000, 'sports'),
('Patriot', 'patriot', 55000, 'suvs'),
('PCJ-600', 'pcj', 6200, 'motorcycles'),
('Penumbra', 'penumbra', 28000, 'sports'),
('Pfister', 'pfister811', 85000, 'super'),
('Phoenix', 'phoenix', 12500, 'muscle'),
('Picador', 'picador', 18000, 'muscle'),
('Pigalle', 'pigalle', 20000, 'sportsclassics'),
('Prairie', 'prairie', 12000, 'compacts'),
('Premier', 'premier', 8000, 'sedans'),
('Primo Custom', 'primo2', 14000, 'sedans'),
('X80 Proto', 'prototipo', 2500000, 'super'),
('Radius', 'radi', 29000, 'suvs'),
('raiden', 'raiden', 1375000, 'sports'),
('Rapid GT', 'rapidgt', 35000, 'sports'),
('Rapid GT Convertible', 'rapidgt2', 45000, 'sports'),
('Rapid GT3', 'rapidgt3', 885000, 'sportsclassics'),
('Reaper', 'reaper', 150000, 'super'),
('Rebel', 'rebel2', 35000, 'offroad'),
('Regina', 'regina', 5000, 'sedans'),
('Retinue', 'retinue', 615000, 'sportsclassics'),
('Revolter', 'revolter', 1610000, 'sports'),
('riata', 'riata', 380000, 'offroad'),
('Rocoto', 'rocoto', 45000, 'suvs'),
('Ruffian', 'ruffian', 6800, 'motorcycles'),
('Ruiner 2', 'ruiner2', 5745600, 'muscle'),
('Rumpo', 'rumpo', 15000, 'vans'),
('Rumpo Trail', 'rumpo3', 19500, 'vans'),
('Sabre Turbo', 'sabregt', 20000, 'muscle'),
('Sabre GT', 'sabregt2', 25000, 'muscle'),
('Sanchez', 'sanchez', 5300, 'motorcycles'),
('Sanchez Sport', 'sanchez2', 5300, 'motorcycles'),
('Sanctus', 'sanctus', 25000, 'motorcycles'),
('Sandking', 'sandking', 55000, 'offroad'),
('Savestra', 'savestra', 990000, 'sportsclassics'),
('SC 1', 'sc1', 1603000, 'super'),
('Schafter', 'schafter2', 25000, 'sedans'),
('Schafter V12', 'schafter3', 50000, 'sports'),
('Scorcher (velo)', 'scorcher', 280, 'motorcycles'),
('Seminole', 'seminole', 25000, 'suvs'),
('Sentinel', 'sentinel', 32000, 'coupes'),
('Sentinel XS', 'sentinel2', 40000, 'coupes'),
('Sentinel3', 'sentinel3', 650000, 'sports'),
('Seven 70', 'seven70', 39500, 'sports'),
('ETR1', 'sheava', 220000, 'super'),
('Shotaro Concept', 'shotaro', 320000, 'motorcycles'),
('Slam Van', 'slamvan3', 11500, 'muscle'),
('Sovereign', 'sovereign', 22000, 'motorcycles'),
('Stinger', 'stinger', 80000, 'sportsclassics'),
('Stinger GT', 'stingergt', 75000, 'sportsclassics'),
('Streiter', 'streiter', 500000, 'sports'),
('Stretch', 'stretch', 90000, 'sedans'),
('Stromberg', 'stromberg', 3185350, 'sports'),
('Sultan', 'sultan', 15000, 'sports'),
('Sultan RS', 'sultanrs', 65000, 'super'),
('Super Diamond', 'superd', 130000, 'sedans'),
('Surano', 'surano', 50000, 'sports'),
('Surfer', 'surfer', 12000, 'vans'),
('T20', 't20', 300000, 'super'),
('Tailgater', 'tailgater', 30000, 'sedans'),
('Tampa', 'tampa', 16000, 'muscle'),
('Drift Tampa', 'tampa2', 80000, 'sports'),
('Thrust', 'thrust', 24000, 'motorcycles'),
('Tri bike (velo)', 'tribike3', 520, 'motorcycles'),
('Trophy Truck', 'trophytruck', 60000, 'offroad'),
('Trophy Truck Limited', 'trophytruck2', 80000, 'offroad'),
('Tropos', 'tropos', 40000, 'sports'),
('Turismo R', 'turismor', 350000, 'super'),
('Tyrus', 'tyrus', 600000, 'super'),
('Vacca', 'vacca', 120000, 'super'),
('Vader', 'vader', 7200, 'motorcycles'),
('Verlierer', 'verlierer2', 70000, 'sports'),
('Vigero', 'vigero', 12500, 'muscle'),
('Virgo', 'virgo', 14000, 'muscle'),
('Viseris', 'viseris', 875000, 'sportsclassics'),
('Visione', 'visione', 2250000, 'super'),
('Voltic', 'voltic', 90000, 'super'),
('Voltic 2', 'voltic2', 3830400, 'super'),
('Voodoo', 'voodoo', 7200, 'muscle'),
('Vortex', 'vortex', 9800, 'motorcycles'),
('Warrener', 'warrener', 4000, 'sedans'),
('Washington', 'washington', 9000, 'sedans'),
('Windsor', 'windsor', 95000, 'coupes'),
('Windsor Drop', 'windsor2', 125000, 'coupes'),
('Woflsbane', 'wolfsbane', 9000, 'motorcycles'),
('XLS', 'xls', 32000, 'suvs'),
('Yosemite', 'yosemite', 485000, 'muscle'),
('Youga', 'youga', 10800, 'vans'),
('Youga Luxuary', 'youga2', 14500, 'vans'),
('Z190', 'z190', 900000, 'sportsclassics'),
('Zentorno', 'zentorno', 1500000, 'super'),
('Zion', 'zion', 36000, 'coupes'),
('Zion Cabrio', 'zion2', 45000, 'coupes'),
('Zombie', 'zombiea', 9500, 'motorcycles'),
('Zombie Luxuary', 'zombieb', 12000, 'motorcycles'),
('Z-Type', 'ztype', 220000, 'sportsclassics');

-- --------------------------------------------------------

--
-- Structure de la table `vehicle_categories`
--

CREATE TABLE `vehicle_categories` (
  `name` varchar(60) NOT NULL,
  `label` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `vehicle_categories`
--

INSERT INTO `vehicle_categories` (`name`, `label`) VALUES
('compacts', 'Compacts'),
('coupes', 'Coupés'),
('motorcycles', 'Motos'),
('muscle', 'Muscle'),
('offroad', 'Off Road'),
('sedans', 'Sedans'),
('sports', 'Sports'),
('sportsclassics', 'Sports Classics'),
('super', 'Super'),
('suvs', 'SUVs'),
('vans', 'Vans');

-- --------------------------------------------------------

--
-- Structure de la table `vehicle_mdt`
--

CREATE TABLE `vehicle_mdt` (
  `id` int(11) NOT NULL,
  `plate` varchar(255) DEFAULT NULL,
  `stolen` bit(1) DEFAULT b'0',
  `notes` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `vehicle_sold`
--

CREATE TABLE `vehicle_sold` (
  `client` varchar(50) NOT NULL,
  `model` varchar(50) NOT NULL,
  `plate` varchar(50) NOT NULL,
  `soldby` varchar(50) NOT NULL,
  `date` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `waveshield_ban`
--

CREATE TABLE `waveshield_ban` (
  `license` varchar(50) COLLATE utf8mb4_bin NOT NULL,
  `identifier` varchar(25) COLLATE utf8mb4_bin DEFAULT NULL,
  `liveid` varchar(21) COLLATE utf8mb4_bin DEFAULT NULL,
  `xblid` varchar(21) COLLATE utf8mb4_bin DEFAULT NULL,
  `discord` varchar(30) COLLATE utf8mb4_bin DEFAULT NULL,
  `playerip` varchar(25) COLLATE utf8mb4_bin DEFAULT NULL,
  `targetplayername` varchar(32) COLLATE utf8mb4_bin DEFAULT NULL,
  `sourceplayername` varchar(32) COLLATE utf8mb4_bin DEFAULT NULL,
  `reason` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `timeat` varchar(50) COLLATE utf8mb4_bin NOT NULL,
  `expiration` varchar(50) COLLATE utf8mb4_bin NOT NULL,
  `permanent` int(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Index pour les tables exportées
--

--
-- Index pour la table `addon_account`
--
ALTER TABLE `addon_account`
  ADD PRIMARY KEY (`name`);

--
-- Index pour la table `addon_account_data`
--
ALTER TABLE `addon_account_data`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `index_addon_account_data_account_name_owner` (`account_name`,`owner`),
  ADD KEY `index_addon_account_data_account_name` (`account_name`);

--
-- Index pour la table `addon_inventory`
--
ALTER TABLE `addon_inventory`
  ADD PRIMARY KEY (`name`);

--
-- Index pour la table `addon_inventory_items`
--
ALTER TABLE `addon_inventory_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `index_addon_inventory_items_inventory_name_name` (`inventory_name`,`name`),
  ADD KEY `index_addon_inventory_items_inventory_name_name_owner` (`inventory_name`,`name`,`owner`),
  ADD KEY `index_addon_inventory_inventory_name` (`inventory_name`);

--
-- Index pour la table `aircraftdealer_aircrafts`
--
ALTER TABLE `aircraftdealer_aircrafts`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `aircrafts`
--
ALTER TABLE `aircrafts`
  ADD PRIMARY KEY (`model`);

--
-- Index pour la table `aircraft_categories`
--
ALTER TABLE `aircraft_categories`
  ADD PRIMARY KEY (`name`);

--
-- Index pour la table `billing`
--
ALTER TABLE `billing`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `boats`
--
ALTER TABLE `boats`
  ADD PRIMARY KEY (`model`);

--
-- Index pour la table `boat_categories`
--
ALTER TABLE `boat_categories`
  ADD PRIMARY KEY (`name`);

--
-- Index pour la table `cardealer_vehicles`
--
ALTER TABLE `cardealer_vehicles`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `datastore`
--
ALTER TABLE `datastore`
  ADD PRIMARY KEY (`name`);

--
-- Index pour la table `datastore_data`
--
ALTER TABLE `datastore_data`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `index_datastore_data_name_owner` (`name`,`owner`),
  ADD KEY `index_datastore_data_name` (`name`);

--
-- Index pour la table `fine_types`
--
ALTER TABLE `fine_types`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `fine_types_gouv`
--
ALTER TABLE `fine_types_gouv`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `fine_types_vagos`
--
ALTER TABLE `fine_types_vagos`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `items`
--
ALTER TABLE `items`
  ADD PRIMARY KEY (`name`);

--
-- Index pour la table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`name`);

--
-- Index pour la table `job_grades`
--
ALTER TABLE `job_grades`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `licenses`
--
ALTER TABLE `licenses`
  ADD PRIMARY KEY (`type`);

--
-- Index pour la table `mdt_reports`
--
ALTER TABLE `mdt_reports`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `mdt_warrants`
--
ALTER TABLE `mdt_warrants`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `open_car`
--
ALTER TABLE `open_car`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `owned_aircrafts`
--
ALTER TABLE `owned_aircrafts`
  ADD PRIMARY KEY (`plate`);

--
-- Index pour la table `owned_properties`
--
ALTER TABLE `owned_properties`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `owned_vehicles`
--
ALTER TABLE `owned_vehicles`
  ADD PRIMARY KEY (`plate`);

--
-- Index pour la table `phone_app_chat`
--
ALTER TABLE `phone_app_chat`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `phone_calls`
--
ALTER TABLE `phone_calls`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `phone_messages`
--
ALTER TABLE `phone_messages`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `phone_users_contacts`
--
ALTER TABLE `phone_users_contacts`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `properties`
--
ALTER TABLE `properties`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `rented_aircrafts`
--
ALTER TABLE `rented_aircrafts`
  ADD PRIMARY KEY (`plate`);

--
-- Index pour la table `rented_vehicles`
--
ALTER TABLE `rented_vehicles`
  ADD PRIMARY KEY (`plate`);

--
-- Index pour la table `society_moneywash`
--
ALTER TABLE `society_moneywash`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `twitter_accounts`
--
ALTER TABLE `twitter_accounts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Index pour la table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`identifier`);

--
-- Index pour la table `user_accessories`
--
ALTER TABLE `user_accessories`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `user_accounts`
--
ALTER TABLE `user_accounts`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `user_convictions`
--
ALTER TABLE `user_convictions`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `user_inventory`
--
ALTER TABLE `user_inventory`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `user_licenses`
--
ALTER TABLE `user_licenses`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `user_mdt`
--
ALTER TABLE `user_mdt`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `user_sim`
--
ALTER TABLE `user_sim`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `user_tenue`
--
ALTER TABLE `user_tenue`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `vehicles`
--
ALTER TABLE `vehicles`
  ADD PRIMARY KEY (`model`);

--
-- Index pour la table `vehicle_categories`
--
ALTER TABLE `vehicle_categories`
  ADD PRIMARY KEY (`name`);

--
-- Index pour la table `vehicle_mdt`
--
ALTER TABLE `vehicle_mdt`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `vehicle_sold`
--
ALTER TABLE `vehicle_sold`
  ADD PRIMARY KEY (`plate`);

--
-- Index pour la table `waveshield_ban`
--
ALTER TABLE `waveshield_ban`
  ADD PRIMARY KEY (`license`);

--
-- AUTO_INCREMENT pour les tables exportées
--

--
-- AUTO_INCREMENT pour la table `addon_account_data`
--
ALTER TABLE `addon_account_data`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;
--
-- AUTO_INCREMENT pour la table `addon_inventory_items`
--
ALTER TABLE `addon_inventory_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT pour la table `aircraftdealer_aircrafts`
--
ALTER TABLE `aircraftdealer_aircrafts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `billing`
--
ALTER TABLE `billing`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `cardealer_vehicles`
--
ALTER TABLE `cardealer_vehicles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `datastore_data`
--
ALTER TABLE `datastore_data`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;
--
-- AUTO_INCREMENT pour la table `fine_types`
--
ALTER TABLE `fine_types`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=105;
--
-- AUTO_INCREMENT pour la table `fine_types_gouv`
--
ALTER TABLE `fine_types_gouv`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT pour la table `fine_types_vagos`
--
ALTER TABLE `fine_types_vagos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT pour la table `job_grades`
--
ALTER TABLE `job_grades`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=400;
--
-- AUTO_INCREMENT pour la table `mdt_reports`
--
ALTER TABLE `mdt_reports`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `mdt_warrants`
--
ALTER TABLE `mdt_warrants`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `open_car`
--
ALTER TABLE `open_car`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `owned_properties`
--
ALTER TABLE `owned_properties`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `phone_app_chat`
--
ALTER TABLE `phone_app_chat`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `phone_calls`
--
ALTER TABLE `phone_calls`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `phone_messages`
--
ALTER TABLE `phone_messages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=106;
--
-- AUTO_INCREMENT pour la table `phone_users_contacts`
--
ALTER TABLE `phone_users_contacts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT pour la table `properties`
--
ALTER TABLE `properties`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=73;
--
-- AUTO_INCREMENT pour la table `society_moneywash`
--
ALTER TABLE `society_moneywash`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `twitter_accounts`
--
ALTER TABLE `twitter_accounts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `user_accessories`
--
ALTER TABLE `user_accessories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;
--
-- AUTO_INCREMENT pour la table `user_accounts`
--
ALTER TABLE `user_accounts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT pour la table `user_convictions`
--
ALTER TABLE `user_convictions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `user_inventory`
--
ALTER TABLE `user_inventory`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=548;
--
-- AUTO_INCREMENT pour la table `user_licenses`
--
ALTER TABLE `user_licenses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT pour la table `user_mdt`
--
ALTER TABLE `user_mdt`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `user_sim`
--
ALTER TABLE `user_sim`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=113;
--
-- AUTO_INCREMENT pour la table `user_tenue`
--
ALTER TABLE `user_tenue`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;
--
-- AUTO_INCREMENT pour la table `vehicle_mdt`
--
ALTER TABLE `vehicle_mdt`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
