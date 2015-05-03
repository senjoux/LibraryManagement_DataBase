-- phpMyAdmin SQL Dump
-- version 4.0.4
-- http://www.phpmyadmin.net
--
-- Client: localhost
-- Généré le: Dim 03 Mai 2015 à 23:02
-- Version du serveur: 5.6.12-log
-- Version de PHP: 5.4.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de données: `gestion_bibliotheque`
--
CREATE DATABASE IF NOT EXISTS `gestion_bibliotheque` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `gestion_bibliotheque`;

-- --------------------------------------------------------

--
-- Structure de la table `auteur`
--

CREATE TABLE IF NOT EXISTS `auteur` (
  `IDAUTEUR` int(11) NOT NULL AUTO_INCREMENT,
  `NOM` varchar(255) DEFAULT NULL,
  `PRENOM` varchar(255) DEFAULT NULL,
  `PAYS` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`IDAUTEUR`),
  KEY `FK_a4pi7lqxqnrdecbto4n5m1mf8` (`PAYS`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=10 ;

--
-- Contenu de la table `auteur`
--

INSERT INTO `auteur` (`IDAUTEUR`, `NOM`, `PRENOM`, `PAYS`) VALUES
(2, 'hamza', 'hedhly', 'AT'),
(3, 'salih', 'ben malih', 'FR'),
(4, 'salah1', 'ben salih1', 'TN'),
(5, 'salah2', 'ben salih2', 'FR'),
(6, 'salah1', 'ben salih1', 'TN'),
(7, 'salah2', 'ben salih2', 'FR'),
(8, 'salah7', 'ben salih7', 'DZ'),
(9, 'salah8', 'ben salih8', 'DZ');

-- --------------------------------------------------------

--
-- Structure de la table `emprunter`
--

CREATE TABLE IF NOT EXISTS `emprunter` (
  `ID_EMPRUNT` int(11) NOT NULL AUTO_INCREMENT,
  `DATE_DEBUT` datetime NOT NULL,
  `DATE_FIN` datetime DEFAULT NULL,
  `EXEMPLAIRE` int(11) DEFAULT NULL,
  `LECTEUR` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID_EMPRUNT`),
  KEY `FK_5octnuplaud3ln13dx0pm8qqu` (`EXEMPLAIRE`),
  KEY `FK_b2b17uq9skt0tp6tj8193fmvs` (`LECTEUR`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `examplaire`
--

CREATE TABLE IF NOT EXISTS `examplaire` (
  `IDEXAMPLAIRE` int(11) NOT NULL AUTO_INCREMENT,
  `DISPONIBLE` tinyint(1) DEFAULT NULL,
  `ETAT` varchar(255) DEFAULT NULL,
  `DATE_ACHAT` datetime DEFAULT NULL,
  `IDLIVRE` int(11) DEFAULT NULL,
  PRIMARY KEY (`IDEXAMPLAIRE`),
  KEY `FK_drpoe5d4m0phlfqbf64tclgf8` (`IDLIVRE`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Contenu de la table `examplaire`
--

INSERT INTO `examplaire` (`IDEXAMPLAIRE`, `DISPONIBLE`, `ETAT`, `DATE_ACHAT`, `IDLIVRE`) VALUES
(1, 1, 'bon', '2015-03-16 00:00:00', 3),
(2, 1, 'mauvais', '1970-06-10 07:00:00', 2),
(3, 1, 'bon', '2011-01-08 10:00:00', 3);

-- --------------------------------------------------------

--
-- Structure de la table `lecteur`
--

CREATE TABLE IF NOT EXISTS `lecteur` (
  `IDLECTEUR` int(11) NOT NULL AUTO_INCREMENT,
  `NOM` varchar(255) DEFAULT NULL,
  `PRENOM` varchar(255) DEFAULT NULL,
  `MAIL` varchar(255) DEFAULT NULL,
  `ADRESSE` varchar(255) DEFAULT NULL,
  `TELEPHONE` varchar(255) DEFAULT NULL,
  `DATE_INSCRIPTION` datetime DEFAULT NULL,
  `SANCTION` bit(1) DEFAULT NULL,
  PRIMARY KEY (`IDLECTEUR`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `livre`
--

CREATE TABLE IF NOT EXISTS `livre` (
  `IDLIVRE` int(11) NOT NULL AUTO_INCREMENT,
  `TITRE` varchar(255) DEFAULT NULL,
  `NBR_EXEMPLAIRES` int(11) DEFAULT NULL,
  `IDAUTEUR` int(11) DEFAULT NULL,
  PRIMARY KEY (`IDLIVRE`),
  KEY `FK_j0rc9st0e24hnyyih77rpo9h4` (`IDAUTEUR`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Contenu de la table `livre`
--

INSERT INTO `livre` (`IDLIVRE`, `TITRE`, `NBR_EXEMPLAIRES`, `IDAUTEUR`) VALUES
(1, 'Livre de Sc', 11, 5),
(2, 'Les miserables', 2, 2),
(3, 'Kalila wa dimna', 3, 3),
(5, 'Alf Lila wa Lila', 20, 5);

-- --------------------------------------------------------

--
-- Structure de la table `livre_theme`
--

CREATE TABLE IF NOT EXISTS `livre_theme` (
  `IDLIVRE` int(11) NOT NULL,
  `IDTHEME` int(11) NOT NULL,
  PRIMARY KEY (`IDLIVRE`,`IDTHEME`),
  KEY `FK_kuhwbiv7kva4eq0dfpoyxl5pt` (`IDTHEME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `livre_theme`
--

INSERT INTO `livre_theme` (`IDLIVRE`, `IDTHEME`) VALUES
(1, 1),
(1, 2),
(5, 3),
(2, 4);

-- --------------------------------------------------------

--
-- Structure de la table `pays`
--

CREATE TABLE IF NOT EXISTS `pays` (
  `CODE` varchar(255) NOT NULL,
  `NOM` varchar(255) DEFAULT NULL,
  `NOM_COMPLET` varchar(255) DEFAULT NULL,
  `ISO` varchar(255) DEFAULT NULL,
  `NUMERO` int(11) DEFAULT NULL,
  PRIMARY KEY (`CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `pays`
--

INSERT INTO `pays` (`CODE`, `NOM`, `NOM_COMPLET`, `ISO`, `NUMERO`) VALUES
('AD', 'Andorra', 'Principality of Andorra', 'AND', 20),
('AE', 'United Arab Emirates', 'United Arab Emirates', 'ARE', 784),
('AF', 'Afghanistan', 'Islamic Republic of Afgha', 'AFG', 4),
('AG', 'Antigua and Barbuda', 'Antigua and Barbuda', 'ATG', 28),
('AI', 'Anguilla', 'Anguilla', 'AIA', 660),
('AL', 'Albania', 'Republic of Albania', 'ALB', 8),
('AM', 'Armenia', 'Republic of Armenia', 'ARM', 51),
('AO', 'Angola', 'Republic of Angola', 'AGO', 24),
('AQ', 'Antarctica', 'Antarctica (the territory', 'ATA', 10),
('AR', 'Argentina', 'Argentine Republic', 'ARG', 32),
('AS', 'American Samoa', 'American Samoa', 'ASM', 16),
('AT', 'Austria', 'Republic of Austria', 'AUT', 40),
('AU', 'Australia', 'Commonwealth of Australia', 'AUS', 36),
('AW', 'Aruba', 'Aruba', 'ABW', 533),
('AX', 'Åland Islands', 'Åland Islands', 'ALA', 248),
('AZ', 'Azerbaijan', 'Republic of Azerbaijan', 'AZE', 31),
('BA', 'Bosnia and Herzegovina', 'Bosnia and Herzegovina', 'BIH', 70),
('BB', 'Barbados', 'Barbados', 'BRB', 52),
('BD', 'Bangladesh', 'People''s Republic of Bang', 'BGD', 50),
('BE', 'Belgium', 'Kingdom of Belgium', 'BEL', 56),
('BF', 'Burkina Faso', 'Burkina Faso', 'BFA', 854),
('BG', 'Bulgaria', 'Republic of Bulgaria', 'BGR', 100),
('BH', 'Bahrain', 'Kingdom of Bahrain', 'BHR', 48),
('BI', 'Burundi', 'Republic of Burundi', 'BDI', 108),
('BJ', 'Benin', 'Republic of Benin', 'BEN', 204),
('BL', 'Saint Barthélemy', 'Saint Barthélemy', 'BLM', 652),
('BM', 'Bermuda', 'Bermuda', 'BMU', 60),
('BN', 'Brunei Darussalam', 'Brunei Darussalam', 'BRN', 96),
('BO', 'Bolivia', 'Plurinational State of Bo', 'BOL', 68),
('BQ', 'Bonaire, Sint Eustatius a', 'Bonaire, Sint Eustatius a', 'BES', 535),
('BR', 'Brazil', 'Federative Republic of Br', 'BRA', 76),
('BS', 'Bahamas', 'Commonwealth of the Baham', 'BHS', 44),
('BT', 'Bhutan', 'Kingdom of Bhutan', 'BTN', 64),
('BV', 'Bouvet Island (Bouvetoya)', 'Bouvet Island (Bouvetoya)', 'BVT', 74),
('BW', 'Botswana', 'Republic of Botswana', 'BWA', 72),
('BY', 'Belarus', 'Republic of Belarus', 'BLR', 112),
('BZ', 'Belize', 'Belize', 'BLZ', 84),
('CA', 'Canada', 'Canada', 'CAN', 124),
('CC', 'Cocos (Keeling) Islands', 'Cocos (Keeling) Islands', 'CCK', 166),
('CD', 'Congo', 'Democratic Republic of th', 'COD', 180),
('CF', 'Central African Republic', 'Central African Republic', 'CAF', 140),
('CG', 'Congo', 'Republic of the Congo', 'COG', 178),
('CH', 'Switzerland', 'Swiss Confederation', 'CHE', 756),
('CI', 'Cote d''Ivoire', 'Republic of Cote d''Ivoire', 'CIV', 384),
('CK', 'Cook Islands', 'Cook Islands', 'COK', 184),
('CL', 'Chile', 'Republic of Chile', 'CHL', 152),
('CM', 'Cameroon', 'Republic of Cameroon', 'CMR', 120),
('CN', 'China', 'People''s Republic of Chin', 'CHN', 156),
('CO', 'Colombia', 'Republic of Colombia', 'COL', 170),
('CR', 'Costa Rica', 'Republic of Costa Rica', 'CRI', 188),
('CU', 'Cuba', 'Republic of Cuba', 'CUB', 192),
('CV', 'Cape Verde', 'Republic of Cape Verde', 'CPV', 132),
('CW', 'Curaçao', 'Curaçao', 'CUW', 531),
('CX', 'Christmas Island', 'Christmas Island', 'CXR', 162),
('CY', 'Cyprus', 'Republic of Cyprus', 'CYP', 196),
('CZ', 'Czech Republic', 'Czech Republic', 'CZE', 203),
('DE', 'Germany', 'Federal Republic of Germa', 'DEU', 276),
('DJ', 'Djibouti', 'Republic of Djibouti', 'DJI', 262),
('DK', 'Denmark', 'Kingdom of Denmark', 'DNK', 208),
('DM', 'Dominica', 'Commonwealth of Dominica', 'DMA', 212),
('DO', 'Dominican Republic', 'Dominican Republic', 'DOM', 214),
('DZ', 'Algeria', 'People''s Democratic Repub', 'DZA', 12),
('EC', 'Ecuador', 'Republic of Ecuador', 'ECU', 218),
('EE', 'Estonia', 'Republic of Estonia', 'EST', 233),
('EG', 'Egypt', 'Arab Republic of Egypt', 'EGY', 818),
('EH', 'Western Sahara', 'Western Sahara', 'ESH', 732),
('ER', 'Eritrea', 'State of Eritrea', 'ERI', 232),
('ES', 'Spain', 'Kingdom of Spain', 'ESP', 724),
('ET', 'Ethiopia', 'Federal Democratic Republ', 'ETH', 231),
('FI', 'Finland', 'Republic of Finland', 'FIN', 246),
('FJ', 'Fiji', 'Republic of Fiji', 'FJI', 242),
('FK', 'Falkland Islands (Malvina', 'Falkland Islands (Malvina', 'FLK', 238),
('FM', 'Micronesia', 'Federated States of Micro', 'FSM', 583),
('FO', 'Faroe Islands', 'Faroe Islands', 'FRO', 234),
('FR', 'France', 'French Republic', 'FRA', 250),
('GA', 'Gabon', 'Gabonese Republic', 'GAB', 266),
('GB', 'United Kingdom of Great B', 'United Kingdom of Great B', 'GBR', 826),
('GD', 'Grenada', 'Grenada', 'GRD', 308),
('GE', 'Georgia', 'Georgia', 'GEO', 268),
('GF', 'French Guiana', 'French Guiana', 'GUF', 254),
('GG', 'Guernsey', 'Bailiwick of Guernsey', 'GGY', 831),
('GH', 'Ghana', 'Republic of Ghana', 'GHA', 288),
('GI', 'Gibraltar', 'Gibraltar', 'GIB', 292),
('GL', 'Greenland', 'Greenland', 'GRL', 304),
('GM', 'Gambia', 'Republic of the Gambia', 'GMB', 270),
('GN', 'Guinea', 'Republic of Guinea', 'GIN', 324),
('GP', 'Guadeloupe', 'Guadeloupe', 'GLP', 312),
('GQ', 'Equatorial Guinea', 'Republic of Equatorial Gu', 'GNQ', 226),
('GR', 'Greece', 'Hellenic Republic Greece', 'GRC', 300),
('GS', 'South Georgia and the Sou', 'South Georgia and the Sou', 'SGS', 239),
('GT', 'Guatemala', 'Republic of Guatemala', 'GTM', 320),
('GU', 'Guam', 'Guam', 'GUM', 316),
('GW', 'Guinea-Bissau', 'Republic of Guinea-Bissau', 'GNB', 624),
('GY', 'Guyana', 'Co-operative Republic of ', 'GUY', 328),
('HK', 'Hong Kong', 'Hong Kong Special Adminis', 'HKG', 344),
('HM', 'Heard Island and McDonald', 'Heard Island and McDonald', 'HMD', 334),
('HN', 'Honduras', 'Republic of Honduras', 'HND', 340),
('HR', 'Croatia', 'Republic of Croatia', 'HRV', 191),
('HT', 'Haiti', 'Republic of Haiti', 'HTI', 332),
('HU', 'Hungary', 'Hungary', 'HUN', 348),
('ID', 'Indonesia', 'Republic of Indonesia', 'IDN', 360),
('IE', 'Ireland', 'Ireland', 'IRL', 372),
('IL', 'Israel', 'State of Israel', 'ISR', 376),
('IM', 'Isle of Man', 'Isle of Man', 'IMN', 833),
('IN', 'India', 'Republic of India', 'IND', 356),
('IO', 'British Indian Ocean Terr', 'British Indian Ocean Terr', 'IOT', 86),
('IQ', 'Iraq', 'Republic of Iraq', 'IRQ', 368),
('IR', 'Iran', 'Islamic Republic of Iran', 'IRN', 364),
('IS', 'Iceland', 'Republic of Iceland', 'ISL', 352),
('IT', 'Italy', 'Italian Republic', 'ITA', 380),
('JE', 'Jersey', 'Bailiwick of Jersey', 'JEY', 832),
('JM', 'Jamaica', 'Jamaica', 'JAM', 388),
('JO', 'Jordan', 'Hashemite Kingdom of Jord', 'JOR', 400),
('JP', 'Japan', 'Japan', 'JPN', 392),
('KE', 'Kenya', 'Republic of Kenya', 'KEN', 404),
('KG', 'Kyrgyz Republic', 'Kyrgyz Republic', 'KGZ', 417),
('KH', 'Cambodia', 'Kingdom of Cambodia', 'KHM', 116),
('KI', 'Kiribati', 'Republic of Kiribati', 'KIR', 296),
('KM', 'Comoros', 'Union of the Comoros', 'COM', 174),
('KN', 'Saint Kitts and Nevis', 'Federation of Saint Kitts', 'KNA', 659),
('KP', 'Korea', 'Democratic People''s Repub', 'PRK', 408),
('KR', 'Korea', 'Republic of Korea', 'KOR', 410),
('KW', 'Kuwait', 'State of Kuwait', 'KWT', 414),
('KY', 'Cayman Islands', 'Cayman Islands', 'CYM', 136),
('KZ', 'Kazakhstan', 'Republic of Kazakhstan', 'KAZ', 398),
('LA', 'Lao People''s Democratic R', 'Lao People''s Democratic R', 'LAO', 418),
('LB', 'Lebanon', 'Lebanese Republic', 'LBN', 422),
('LC', 'Saint Lucia', 'Saint Lucia', 'LCA', 662),
('LI', 'Liechtenstein', 'Principality of Liechtens', 'LIE', 438),
('LK', 'Sri Lanka', 'Democratic Socialist Repu', 'LKA', 144),
('LR', 'Liberia', 'Republic of Liberia', 'LBR', 430),
('LS', 'Lesotho', 'Kingdom of Lesotho', 'LSO', 426),
('LT', 'Lithuania', 'Republic of Lithuania', 'LTU', 440),
('LU', 'Luxembourg', 'Grand Duchy of Luxembourg', 'LUX', 442),
('LV', 'Latvia', 'Republic of Latvia', 'LVA', 428),
('LY', 'Libya', 'Libya', 'LBY', 434),
('MA', 'Morocco', 'Kingdom of Morocco', 'MAR', 504),
('MC', 'Monaco', 'Principality of Monaco', 'MCO', 492),
('MD', 'Moldova', 'Republic of Moldova', 'MDA', 498),
('ME', 'Montenegro', 'Montenegro', 'MNE', 499),
('MF', 'Saint Martin', 'Saint Martin (French part', 'MAF', 663),
('MG', 'Madagascar', 'Republic of Madagascar', 'MDG', 450),
('MH', 'Marshall Islands', 'Republic of the Marshall ', 'MHL', 584),
('MK', 'Macedonia', 'Republic of Macedonia', 'MKD', 807),
('ML', 'Mali', 'Republic of Mali', 'MLI', 466),
('MM', 'Myanmar', 'Republic of the Union of ', 'MMR', 104),
('MN', 'Mongolia', 'Mongolia', 'MNG', 496),
('MO', 'Macao', 'Macao Special Administrat', 'MAC', 446),
('MP', 'Northern Mariana Islands', 'Commonwealth of the North', 'MNP', 580),
('MQ', 'Martinique', 'Martinique', 'MTQ', 474),
('MR', 'Mauritania', 'Islamic Republic of Mauri', 'MRT', 478),
('MS', 'Montserrat', 'Montserrat', 'MSR', 500),
('MT', 'Malta', 'Republic of Malta', 'MLT', 470),
('MU', 'Mauritius', 'Republic of Mauritius', 'MUS', 480),
('MV', 'Maldives', 'Republic of Maldives', 'MDV', 462),
('MW', 'Malawi', 'Republic of Malawi', 'MWI', 454),
('MX', 'Mexico', 'United Mexican States', 'MEX', 484),
('MY', 'Malaysia', 'Malaysia', 'MYS', 458),
('MZ', 'Mozambique', 'Republic of Mozambique', 'MOZ', 508),
('NA', 'Namibia', 'Republic of Namibia', 'NAM', 516),
('NC', 'New Caledonia', 'New Caledonia', 'NCL', 540),
('NE', 'Niger', 'Republic of Niger', 'NER', 562),
('NF', 'Norfolk Island', 'Norfolk Island', 'NFK', 574),
('NG', 'Nigeria', 'Federal Republic of Niger', 'NGA', 566),
('NI', 'Nicaragua', 'Republic of Nicaragua', 'NIC', 558),
('NL', 'Netherlands', 'Kingdom of the Netherland', 'NLD', 528),
('NO', 'Norway', 'Kingdom of Norway', 'NOR', 578),
('NP', 'Nepal', 'Federal Democratic Republ', 'NPL', 524),
('NR', 'Nauru', 'Republic of Nauru', 'NRU', 520),
('NU', 'Niue', 'Niue', 'NIU', 570),
('NZ', 'New Zealand', 'New Zealand', 'NZL', 554),
('OM', 'Oman', 'Sultanate of Oman', 'OMN', 512),
('PA', 'Panama', 'Republic of Panama', 'PAN', 591),
('PE', 'Peru', 'Republic of Peru', 'PER', 604),
('PF', 'French Polynesia', 'French Polynesia', 'PYF', 258),
('PG', 'Papua New Guinea', 'Independent State of Papu', 'PNG', 598),
('PH', 'Philippines', 'Republic of the Philippin', 'PHL', 608),
('PK', 'Pakistan', 'Islamic Republic of Pakis', 'PAK', 586),
('PL', 'Poland', 'Republic of Poland', 'POL', 616),
('PM', 'Saint Pierre and Miquelon', 'Saint Pierre and Miquelon', 'SPM', 666),
('PN', 'Pitcairn Islands', 'Pitcairn Islands', 'PCN', 612),
('PR', 'Puerto Rico', 'Commonwealth of Puerto Ri', 'PRI', 630),
('PS', 'Palestine', 'State of Palestine', 'PSE', 275),
('PT', 'Portugal', 'Portuguese Republic', 'PRT', 620),
('PW', 'Palau', 'Republic of Palau', 'PLW', 585),
('PY', 'Paraguay', 'Republic of Paraguay', 'PRY', 600),
('QA', 'Qatar', 'State of Qatar', 'QAT', 634),
('RE', 'Réunion', 'Réunion', 'REU', 638),
('RO', 'Romania', 'Romania', 'ROU', 642),
('RS', 'Serbia', 'Republic of Serbia', 'SRB', 688),
('RU', 'Russian Federation', 'Russian Federation', 'RUS', 643),
('RW', 'Rwanda', 'Republic of Rwanda', 'RWA', 646),
('SA', 'Saudi Arabia', 'Kingdom of Saudi Arabia', 'SAU', 682),
('SB', 'Solomon Islands', 'Solomon Islands', 'SLB', 90),
('SC', 'Seychelles', 'Republic of Seychelles', 'SYC', 690),
('SD', 'Sudan', 'Republic of Sudan', 'SDN', 729),
('SE', 'Sweden', 'Kingdom of Sweden', 'SWE', 752),
('SG', 'Singapore', 'Republic of Singapore', 'SGP', 702),
('SH', 'Saint Helena, Ascension a', 'Saint Helena, Ascension a', 'SHN', 654),
('SI', 'Slovenia', 'Republic of Slovenia', 'SVN', 705),
('SJ', 'Svalbard & Jan Mayen Isla', 'Svalbard & Jan Mayen Isla', 'SJM', 744),
('SK', 'Slovakia (Slovak Republic', 'Slovakia (Slovak Republic', 'SVK', 703),
('SL', 'Sierra Leone', 'Republic of Sierra Leone', 'SLE', 694),
('SM', 'San Marino', 'Republic of San Marino', 'SMR', 674),
('SN', 'Senegal', 'Republic of Senegal', 'SEN', 686),
('SO', 'Somalia', 'Federal Republic of Somal', 'SOM', 706),
('SR', 'Suriname', 'Republic of Suriname', 'SUR', 740),
('SS', 'South Sudan', 'Republic of South Sudan', 'SSD', 728),
('ST', 'Sao Tome and Principe', 'Democratic Republic of Sa', 'STP', 678),
('SV', 'El Salvador', 'Republic of El Salvador', 'SLV', 222),
('SX', 'Sint Maarten (Dutch part)', 'Sint Maarten (Dutch part)', 'SXM', 534),
('SY', 'Syrian Arab Republic', 'Syrian Arab Republic', 'SYR', 760),
('SZ', 'Swaziland', 'Kingdom of Swaziland', 'SWZ', 748),
('TC', 'Turks and Caicos Islands', 'Turks and Caicos Islands', 'TCA', 796),
('TD', 'Chad', 'Republic of Chad', 'TCD', 148),
('TF', 'French Southern Territori', 'French Southern Territori', 'ATF', 260),
('TG', 'Togo', 'Togolese Republic', 'TGO', 768),
('TH', 'Thailand', 'Kingdom of Thailand', 'THA', 764),
('TJ', 'Tajikistan', 'Republic of Tajikistan', 'TJK', 762),
('TK', 'Tokelau', 'Tokelau', 'TKL', 772),
('TL', 'Timor-Leste', 'Democratic Republic of Ti', 'TLS', 626),
('TM', 'Turkmenistan', 'Turkmenistan', 'TKM', 795),
('TN', 'Tunisia', 'Tunisian Republic', 'TUN', 788),
('TO', 'Tonga', 'Kingdom of Tonga', 'TON', 776),
('TR', 'Turkey', 'Republic of Turkey', 'TUR', 792),
('TT', 'Trinidad and Tobago', 'Republic of Trinidad and ', 'TTO', 780),
('TV', 'Tuvalu', 'Tuvalu', 'TUV', 798),
('TW', 'Taiwan', 'Taiwan, Province of China', 'TWN', 158),
('TZ', 'Tanzania', 'United Republic of Tanzan', 'TZA', 834),
('UA', 'Ukraine', 'Ukraine', 'UKR', 804),
('UG', 'Uganda', 'Republic of Uganda', 'UGA', 800),
('UM', 'United States Minor Outly', 'United States Minor Outly', 'UMI', 581),
('US', 'United States of America', 'United States of America', 'USA', 840),
('UY', 'Uruguay', 'Eastern Republic of Urugu', 'URY', 858),
('UZ', 'Uzbekistan', 'Republic of Uzbekistan', 'UZB', 860),
('VA', 'Holy See (Vatican City St', 'Holy See (Vatican City St', 'VAT', 336),
('VC', 'Saint Vincent and the Gre', 'Saint Vincent and the Gre', 'VCT', 670),
('VE', 'Venezuela', 'Bolivarian Republic of Ve', 'VEN', 862),
('VG', 'British Virgin Islands', 'British Virgin Islands', 'VGB', 92),
('VI', 'United States Virgin Isla', 'United States Virgin Isla', 'VIR', 850),
('VN', 'Vietnam', 'Socialist Republic of Vie', 'VNM', 704),
('VU', 'Vanuatu', 'Republic of Vanuatu', 'VUT', 548),
('WF', 'Wallis and Futuna', 'Wallis and Futuna', 'WLF', 876),
('WS', 'Samoa', 'Independent State of Samo', 'WSM', 882),
('YE', 'Yemen', 'Yemen', 'YEM', 887),
('YT', 'Mayotte', 'Mayotte', 'MYT', 175),
('ZA', 'South Africa', 'Republic of South Africa', 'ZAF', 710),
('ZM', 'Zambia', 'Republic of Zambia', 'ZMB', 894),
('ZW', 'Zimbabwe', 'Republic of Zimbabwe', 'ZWE', 716);

-- --------------------------------------------------------

--
-- Structure de la table `reserver`
--

CREATE TABLE IF NOT EXISTS `reserver` (
  `ID_RESERVATION` int(11) NOT NULL AUTO_INCREMENT,
  `DATE_RESERVATION` datetime NOT NULL,
  `LECTEUR` int(11) DEFAULT NULL,
  `LIVRE` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID_RESERVATION`),
  KEY `FK_1hr2msvi4hwn3eg79a2vryu1` (`LECTEUR`),
  KEY `FK_q9puou8pixcq1h46wmsn31kcn` (`LIVRE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `theme`
--

CREATE TABLE IF NOT EXISTS `theme` (
  `IDTHEME` int(11) NOT NULL AUTO_INCREMENT,
  `THEME` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`IDTHEME`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Contenu de la table `theme`
--

INSERT INTO `theme` (`IDTHEME`, `THEME`) VALUES
(1, 'Loisir'),
(2, 'Science'),
(3, 'Geographie'),
(4, 'Physique');

--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `auteur`
--
ALTER TABLE `auteur`
  ADD CONSTRAINT `FK_a4pi7lqxqnrdecbto4n5m1mf8` FOREIGN KEY (`PAYS`) REFERENCES `pays` (`CODE`);

--
-- Contraintes pour la table `emprunter`
--
ALTER TABLE `emprunter`
  ADD CONSTRAINT `FK_5octnuplaud3ln13dx0pm8qqu` FOREIGN KEY (`EXEMPLAIRE`) REFERENCES `examplaire` (`IDEXAMPLAIRE`),
  ADD CONSTRAINT `FK_b2b17uq9skt0tp6tj8193fmvs` FOREIGN KEY (`LECTEUR`) REFERENCES `lecteur` (`IDLECTEUR`);

--
-- Contraintes pour la table `examplaire`
--
ALTER TABLE `examplaire`
  ADD CONSTRAINT `FK_drpoe5d4m0phlfqbf64tclgf8` FOREIGN KEY (`IDLIVRE`) REFERENCES `livre` (`IDLIVRE`);

--
-- Contraintes pour la table `livre`
--
ALTER TABLE `livre`
  ADD CONSTRAINT `FK_j0rc9st0e24hnyyih77rpo9h4` FOREIGN KEY (`IDAUTEUR`) REFERENCES `auteur` (`IDAUTEUR`);

--
-- Contraintes pour la table `livre_theme`
--
ALTER TABLE `livre_theme`
  ADD CONSTRAINT `FK_kajingwcb2f3f835k650524x4` FOREIGN KEY (`IDLIVRE`) REFERENCES `livre` (`IDLIVRE`),
  ADD CONSTRAINT `FK_kuhwbiv7kva4eq0dfpoyxl5pt` FOREIGN KEY (`IDTHEME`) REFERENCES `theme` (`IDTHEME`);

--
-- Contraintes pour la table `reserver`
--
ALTER TABLE `reserver`
  ADD CONSTRAINT `FK_1hr2msvi4hwn3eg79a2vryu1` FOREIGN KEY (`LECTEUR`) REFERENCES `lecteur` (`IDLECTEUR`),
  ADD CONSTRAINT `FK_q9puou8pixcq1h46wmsn31kcn` FOREIGN KEY (`LIVRE`) REFERENCES `livre` (`IDLIVRE`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
