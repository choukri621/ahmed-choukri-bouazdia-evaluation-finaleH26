-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : mar. 16 juin 2026 à 21:08
-- Version du serveur : 10.4.32-MariaDB
-- Version de PHP : 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `bibliotheque`
--

-- --------------------------------------------------------

--
-- Structure de la table `emprunts`
--

CREATE TABLE `emprunts` (
  `id_emprunt` int(11) NOT NULL,
  `id_utilisateur` int(11) NOT NULL,
  `id_livre` int(11) NOT NULL,
  `date_emprunt` date NOT NULL,
  `date_retour_prevue` date NOT NULL,
  `date_retour_reelle` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `emprunts`
--

INSERT INTO `emprunts` (`id_emprunt`, `id_utilisateur`, `id_livre`, `date_emprunt`, `date_retour_prevue`, `date_retour_reelle`) VALUES
(1, 1, 1, '2026-06-01', '2026-06-15', NULL),
(2, 1, 3, '2026-06-08', '2026-06-22', NULL),
(3, 2, 2, '2026-06-03', '2026-06-17', NULL),
(4, 3, 6, '2026-05-25', '2026-06-08', NULL),
(5, 4, 9, '2026-06-05', '2026-06-19', NULL),
(6, 5, 12, '2026-06-02', '2026-06-16', NULL),
(7, 6, 5, '2026-05-01', '2026-05-15', '2026-05-13'),
(8, 7, 4, '2026-05-10', '2026-05-24', '2026-05-20'),
(9, 8, 7, '2026-05-28', '2026-06-11', '2026-06-10');

-- --------------------------------------------------------

--
-- Structure de la table `livres`
--

CREATE TABLE `livres` (
  `id_livre` int(11) NOT NULL,
  `titre` varchar(255) NOT NULL,
  `auteur` varchar(255) NOT NULL,
  `isbn` varchar(20) DEFAULT NULL,
  `categorie` varchar(100) DEFAULT NULL,
  `disponible` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `livres`
--

INSERT INTO `livres` (`id_livre`, `titre`, `auteur`, `isbn`, `categorie`, `disponible`) VALUES
(1, 'Le Petit Prince', 'Antoine de Saint-Exupéry', '9782070612758', 'Roman', 0),
(2, 'L\'Étranger', 'Albert Camus', '9782070360024', 'Roman', 0),
(3, '1984', 'George Orwell', '9782070368228', 'Science-fiction', 0),
(4, 'Harry Potter à l\'école des sorciers', 'J.K. Rowling', '9782070643028', 'Fantastique', 1),
(5, 'Les Misérables', 'Victor Hugo', '9782253004226', 'Classique', 1),
(6, 'Le Seigneur des Anneaux', 'J.R.R. Tolkien', '9782266282366', 'Fantastique', 0),
(7, 'Da Vinci Code', 'Dan Brown', '9782253006329', 'Thriller', 1),
(8, 'Le Comte de Monte-Cristo', 'Alexandre Dumas', '9782253096337', 'Classique', 1),
(9, 'La Peste', 'Albert Camus', '9782070360420', 'Roman', 0),
(10, 'Dune', 'Frank Herbert', '9782221255893', 'Science-fiction', 1),
(11, 'Fondation', 'Isaac Asimov', '9782070415731', 'Science-fiction', 1),
(12, 'Le Hobbit', 'J.R.R. Tolkien', '9782253000716', 'Fantastique', 0),
(13, 'Orgueil et Préjugés', 'Jane Austen', '9782070409303', 'Roman', 1),
(14, 'Le Rouge et le Noir', 'Stendhal', '9782080701701', 'Classique', 1),
(15, 'Vingt mille lieues sous les mers', 'Jules Verne', '9782253000532', 'Aventure', 1);

-- --------------------------------------------------------

--
-- Structure de la table `utilisateurs`
--

CREATE TABLE `utilisateurs` (
  `id_utilisateur` int(11) NOT NULL,
  `nom` varchar(100) NOT NULL,
  `prenom` varchar(100) NOT NULL,
  `email` varchar(150) NOT NULL,
  `mot_de_passe` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `utilisateurs`
--

INSERT INTO `utilisateurs` (`id_utilisateur`, `nom`, `prenom`, `email`, `mot_de_passe`) VALUES
(1, 'Dupont', 'Jean', 'jean.dupont@biblio.com', '123456'),
(2, 'Martin', 'Sophie', 'sophie.martin@biblio.com', '123456'),
(3, 'Bernard', 'Lucas', 'lucas.bernard@biblio.com', '123456'),
(4, 'Petit', 'Emma', 'emma.petit@biblio.com', '123456'),
(5, 'Robert', 'Nicolas', 'nicolas.robert@biblio.com', '123456'),
(6, 'Moreau', 'Julie', 'julie.moreau@biblio.com', '123456'),
(7, 'Lefebvre', 'Thomas', 'thomas.lefebvre@biblio.com', '123456'),
(8, 'Garcia', 'Camille', 'camille.garcia@biblio.com', '123456');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `emprunts`
--
ALTER TABLE `emprunts`
  ADD PRIMARY KEY (`id_emprunt`),
  ADD KEY `id_utilisateur` (`id_utilisateur`),
  ADD KEY `id_livre` (`id_livre`);

--
-- Index pour la table `livres`
--
ALTER TABLE `livres`
  ADD PRIMARY KEY (`id_livre`),
  ADD UNIQUE KEY `isbn` (`isbn`);

--
-- Index pour la table `utilisateurs`
--
ALTER TABLE `utilisateurs`
  ADD PRIMARY KEY (`id_utilisateur`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `emprunts`
--
ALTER TABLE `emprunts`
  MODIFY `id_emprunt` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT pour la table `livres`
--
ALTER TABLE `livres`
  MODIFY `id_livre` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT pour la table `utilisateurs`
--
ALTER TABLE `utilisateurs`
  MODIFY `id_utilisateur` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `emprunts`
--
ALTER TABLE `emprunts`
  ADD CONSTRAINT `emprunts_ibfk_1` FOREIGN KEY (`id_utilisateur`) REFERENCES `utilisateurs` (`id_utilisateur`),
  ADD CONSTRAINT `emprunts_ibfk_2` FOREIGN KEY (`id_livre`) REFERENCES `livres` (`id_livre`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
