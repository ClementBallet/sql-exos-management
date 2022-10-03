-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : lun. 30 mai 2022 à 10:23
-- Version du serveur : 10.4.24-MariaDB
-- Version de PHP : 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `management`
--

-- --------------------------------------------------------

--
-- Structure de la table `employe`
--

DROP TABLE IF EXISTS `employe`;
CREATE TABLE `employe` (
  `id_employe` int(11) NOT NULL,
  `nom` varchar(50) NOT NULL,
  `prenom` varchar(50) NOT NULL,
  `fonction` varchar(255) NOT NULL,
  `date_entree` datetime NOT NULL DEFAULT current_timestamp(),
  `salaire` double NOT NULL,
  `commission` int(11) NOT NULL,
  `service_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `employe`
--

INSERT INTO `employe` (`id_employe`, `nom`, `prenom`, `fonction`, `date_entree`, `salaire`, `commission`, `service_id`) VALUES
(1, 'Wallett', 'Everett', 'Physical Therapy Assistant', '2022-02-12 00:00:00', 2115, 4, 4),
(2, 'Coiley', 'Patty', 'Accountant I', '2021-08-15 00:00:00', 2546, 3, 4),
(3, 'Kennham', 'York', 'Staff Accountant I', '2022-04-23 00:00:00', 2586, 2, 4),
(4, 'Wykes', 'Enid', 'Compensation Analyst', '2022-03-17 00:00:00', 2514, 5, 3),
(5, 'Doud', 'Bathsheba', 'Senior Cost Accountant', '2021-07-23 00:00:00', 2311, 5, 4),
(6, 'Toope', 'Mable', 'Administrative Officer', '2021-10-15 00:00:00', 1869, 0, 3),
(7, 'Beek', 'Vicky', 'Operator', '2021-12-20 00:00:00', 2033, 2, 4),
(8, 'Farrans', 'Prudence', 'Associate Professor', '2021-06-02 00:00:00', 2090, 0, 3),
(9, 'Potkin', 'Hyatt', 'General Manager', '2021-08-17 00:00:00', 2779, 1, 4),
(10, 'Clemo', 'Janina', 'Senior Cost Accountant', '2021-08-18 00:00:00', 2434, 4, 1),
(11, 'Bollins', 'Brynn', 'Sales Representative', '2021-10-26 00:00:00', 2422, 5, 4),
(12, 'Lovett', 'Stella', 'Software Engineer I', '2021-08-18 00:00:00', 2886, 1, 3),
(13, 'Tierny', 'Brande', 'Administrative Assistant I', '2021-03-25 00:00:00', 2551, 0, 2),
(14, 'Dain', 'Nelli', 'Senior Sales Associate', '2021-08-05 00:00:00', 1880, 5, 4),
(15, 'Raden', 'Delia', 'Software Test Engineer I', '2021-05-06 00:00:00', 2055, 2, 5),
(16, 'Kubista', 'Gav', 'Human Resources Assistant IV', '2021-12-24 00:00:00', 1736, 5, 3),
(17, 'Neles', 'Lena', 'Assistant Professor', '2021-08-24 00:00:00', 2219, 3, 1),
(18, 'Rhodef', 'Mandel', 'Social Worker', '2021-03-05 00:00:00', 2142, 4, 1),
(19, 'Di Roberto', 'Jenda', 'Marketing Manager', '2021-03-16 00:00:00', 2855, 5, 4),
(20, 'Pagel', 'Menard', 'General Manager', '2021-11-18 00:00:00', 2126, 2, 5);

-- --------------------------------------------------------

--
-- Structure de la table `service`
--

DROP TABLE IF EXISTS `service`;
CREATE TABLE `service` (
  `id_service` int(11) NOT NULL,
  `nom` varchar(255) NOT NULL,
  `ville` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `service`
--

INSERT INTO `service` (`id_service`, `nom`, `ville`) VALUES
(1, 'Sales', 'Lyon'),
(2, 'Product Management', 'Lyon'),
(3, 'Legal', 'Dijon'),
(4, 'Accounting', 'Paris'),
(5, 'Research and Development', 'Nantes');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `employe`
--
ALTER TABLE `employe`
  ADD PRIMARY KEY (`id_employe`),
  ADD KEY `service_id` (`service_id`);

--
-- Index pour la table `service`
--
ALTER TABLE `service`
  ADD PRIMARY KEY (`id_service`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `employe`
--
ALTER TABLE `employe`
  MODIFY `id_employe` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT pour la table `service`
--
ALTER TABLE `service`
  MODIFY `id_service` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `employe`
--
ALTER TABLE `employe`
  ADD CONSTRAINT `employe_ibfk_1` FOREIGN KEY (`service_id`) REFERENCES `service` (`id_service`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
