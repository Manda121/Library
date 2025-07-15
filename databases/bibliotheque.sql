-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost
-- Généré le : ven. 04 juil. 2025 à 13:38
-- Version du serveur : 10.4.25-MariaDB
-- Version de PHP : 8.1.10

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
-- Structure de la table `abonnement`
--

CREATE TABLE `abonnement` (
  `id_abonnement` int(11) NOT NULL,
  `date_abnnement` date DEFAULT NULL,
  `id_adherent` int(11) NOT NULL,
  `id_mode_paiment` int(11) NOT NULL,
  `date_abonnement` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `abonnement`
--

INSERT INTO `abonnement` (`id_abonnement`, `date_abnnement`, `id_adherent`, `id_mode_paiment`, `date_abonnement`) VALUES
(1, '2023-01-15', 1, 1, NULL),
(2, '2023-02-20', 2, 3, NULL),
(3, '2023-03-10', 3, 2, NULL),
(4, '2023-01-05', 4, 1, NULL),
(5, '2023-04-18', 5, 5, NULL),
(6, '2023-05-22', 6, 1, NULL),
(7, '2023-06-30', 7, 4, NULL),
(8, '2023-02-15', 8, 1, NULL),
(9, '2023-03-25', 9, 3, NULL),
(10, '2023-07-01', 10, 2, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `adherent`
--

CREATE TABLE `adherent` (
  `id_adherent` int(11) NOT NULL,
  `nom` varchar(50) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `prenom` varchar(100) DEFAULT NULL,
  `tel` varchar(50) DEFAULT NULL,
  `date_naissance` varchar(50) DEFAULT NULL,
  `id_statut` int(11) NOT NULL,
  `id_type_profil` int(11) NOT NULL,
  `mot_de_passe` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `adherent`
--

INSERT INTO `adherent` (`id_adherent`, `nom`, `email`, `prenom`, `tel`, `date_naissance`, `id_statut`, `id_type_profil`, `mot_de_passe`) VALUES
(1, 'Durand', 'jean.durand@email.com', 'Jean', '0611223344', '1980-05-15', 2, 3, 'mdp'),
(2, 'Leroy', 'sarah.leroy@email.com', 'Sarah', '0622334455', '1995-08-22', 2, 2, 'mdp'),
(3, 'Morel', 'paul.morel@email.com', 'Paul', '0633445566', '1972-11-30', 2, 3, 'mdp'),
(4, 'Simon', 'lucie.simon@email.com', 'Lucie', '0644556677', '2010-03-10', 1, 1, 'mdp'),
(5, 'Laurent', 'marc.laurent@email.com', 'Marc', '0655667788', '1955-07-25', 2, 4, 'mdp'),
(6, 'Michel', 'anne.michel@email.com', 'Anne', '0666778899', '1988-09-05', 2, 3, 'mdp'),
(7, 'Garcia', 'thomas.garcia@email.com', 'Thomas', '0677889900', '2005-12-18', 1, 2, 'mdp'),
(8, 'Roux', 'claire.roux@email.com', 'Claire', '0688990011', '1978-04-20', 1, 3, 'mdp'),
(9, 'Fournier', 'julie.fournier@email.com', 'Julie', '0699001122', '1960-06-12', 1, 4, 'mdp'),
(10, 'Lefebvre', 'pierre.lefebvre@email.com', 'Pierre', '0600112233', '1992-02-28', 4, 3, 'mdp');

-- --------------------------------------------------------

--
-- Structure de la table `bibliothecaire`
--

CREATE TABLE `bibliothecaire` (
  `id_bibliothecaire` int(11) NOT NULL,
  `nom` varchar(50) DEFAULT NULL,
  `prenom` varchar(100) DEFAULT NULL,
  `tel` varchar(50) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `mot_de_passe` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `bibliothecaire`
--

INSERT INTO `bibliothecaire` (`id_bibliothecaire`, `nom`, `prenom`, `tel`, `email`, `mot_de_passe`) VALUES
(1, 'Dupont', 'Marie', '0612345678', 'marie.dupont@biblio.fr', 'mdp'),
(2, 'Martin', 'Pierre', '0698765432', 'pierre.martin@biblio.fr', 'mdp'),
(3, 'Bernard', 'Sophie', '0678912345', 'sophie.bernard@biblio.fr', 'mdp'),
(4, 'Petit', 'Luc', '0654321890', 'luc.petit@biblio.fr', 'mdp'),
(5, 'Moreau', 'Elodie', '0687654321', 'elodie.moreau@biblio.fr', 'mdp');

-- --------------------------------------------------------

--
-- Structure de la table `cotisation`
--

CREATE TABLE `cotisation` (
  `id_cotisation` int(11) NOT NULL,
  `montant` double DEFAULT NULL,
  `periodicite` int(11) DEFAULT 0,
  `id_type_profil` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `cotisation`
--

INSERT INTO `cotisation` (`id_cotisation`, `montant`, `periodicite`, `id_type_profil`) VALUES
(1, 15, 12, 1),
(2, 25, 12, 2),
(3, 35, 12, 3),
(4, 25, 12, 4);

-- --------------------------------------------------------

--
-- Structure de la table `etat_reservation`
--

CREATE TABLE `etat_reservation` (
  `id_etat_reservation` int(11) NOT NULL,
  `etat` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `etat_reservation`
--

INSERT INTO `etat_reservation` (`id_etat_reservation`, `etat`) VALUES
(1, 'en attente'),
(2, 'acceptee'),
(3, 'annulee');

-- --------------------------------------------------------

--
-- Structure de la table `exemplaire`
--

CREATE TABLE `exemplaire` (
  `id_exemplaire` int(11) NOT NULL,
  `nom` varchar(50) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `image_couverture` varchar(100) DEFAULT NULL,
  `titre` text DEFAULT NULL,
  `age_minimal` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `exemplaire`
--

INSERT INTO `exemplaire` (`id_exemplaire`, `nom`, `description`, `image_couverture`, `titre`, `age_minimal`) VALUES
(1, 'Roman class', 'Exemplaire de collection avec reliure en cuire', 'roman_classique.jpg', 'Les Misérables', 50),
(2, 'Science-fiction', 'Edition spéciale avec illustrations', 'science_fiction.jpg', 'Dune', 50),
(3, 'Policier', 'Exemplaire standard en bon état', 'policier.jpg', 'Le Crime de l Orient-Express', 50),
(4, 'Fantasy', 'Edition collector avec couverture rigide', 'fantasy.jpg', 'Le Seigneur des Anneaux', 50),
(5, 'Biographie', 'Exemplaire dédicacé par l auteur', 'biographie.jpg', 'Steve Jobs', 50),
(6, 'Jeunesse', 'Livre interactif avec pop-up', 'jeunesse.jpg', 'Harry Potter à l école des sorciers', 50),
(7, 'Histoire', 'Edition annotée par un historien', 'histoire.jpg', 'La Seconde Guerre mondiale', 50),
(8, 'Poésie', 'Petit format de poche', 'poesie.jpg', 'Les Fleurs du Mal', 50),
(9, 'Théâtre', 'Edition scolaire avec notes', 'theatre.jpg', 'Le Cid', 50),
(10, 'Bande dessinée', 'Album grand format couleur', 'bd.jpg', 'Astérix le Gaulois', 50),
(11, 'Science', 'Livre avec schémas et illustrations', 'science.jpg', 'Une brève histoire du temps', 50),
(12, 'Art', 'Livre d art avec reproductions', 'art.jpg', 'Histoire de l art', 50),
(13, 'Cuisine', 'Livre avec photos des plats', 'cuisine.jpg', 'La cuisine française', 50),
(14, 'Voyage', 'Guide touristique illustré', 'voyage.jpg', 'Le guide du routard: Japon', 50),
(15, 'Développement personnel', 'Edition avec marque-pages', 'dev_perso.jpg', 'Les 7 habitudes des gens efficaces', 10),
(16, 'nom', 'desc', NULL, NULL, 10),
(17, 'nom2', 'desc2', NULL, NULL, 10);

-- --------------------------------------------------------

--
-- Structure de la table `jour_ferier`
--

CREATE TABLE `jour_ferier` (
  `id_jour_ferier` int(11) NOT NULL,
  `date_jour_ferier` date DEFAULT NULL,
  `description` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `jour_ferier`
--

INSERT INTO `jour_ferier` (`id_jour_ferier`, `date_jour_ferier`, `description`) VALUES
(1, '2023-01-01', 'Nouvel An'),
(2, '2023-04-10', 'Lundi de Pâques'),
(3, '2023-05-01', 'Fête du Travail'),
(4, '2023-05-08', 'Victoire 1945'),
(5, '2023-05-18', 'Ascension'),
(6, '2023-05-29', 'Lundi de Pentecôte'),
(7, '2023-07-14', 'Fête Nationale'),
(8, '2023-08-15', 'Assomption'),
(9, '2023-11-01', 'Toussaint'),
(10, '2023-11-11', 'Armistice 1918'),
(11, '2023-12-25', 'Noël');

-- --------------------------------------------------------

--
-- Structure de la table `livre`
--

CREATE TABLE `livre` (
  `id_livre` int(11) NOT NULL,
  `nbpage` int(11) DEFAULT 0,
  `id_exemplaire` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `livre`
--

INSERT INTO `livre` (`id_livre`, `nbpage`, `id_exemplaire`) VALUES
(1, 412, 2),
(2, 420, 2),
(3, 412, 2),
(4, 420, 2);

-- --------------------------------------------------------

--
-- Structure de la table `mode_paiment`
--

CREATE TABLE `mode_paiment` (
  `id_mode_paiment` int(11) NOT NULL,
  `nom` varchar(50) DEFAULT NULL,
  `description` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `mode_paiment`
--

INSERT INTO `mode_paiment` (`id_mode_paiment`, `nom`, `description`) VALUES
(1, 'Carte bancaire', 'Paiement par carte bancaire'),
(2, 'Espèces', 'Paiement en espèces'),
(3, 'Chèque', 'Paiement par chèque'),
(4, 'Virement', 'Paiement par virement bancaire'),
(5, 'Prélèvement', 'Paiement par prélèvement automatique');

-- --------------------------------------------------------

--
-- Structure de la table `pret`
--

CREATE TABLE `pret` (
  `id_pret` int(11) NOT NULL,
  `id_exemplaire` int(11) DEFAULT NULL,
  `date_pret` date DEFAULT NULL,
  `date_remise` date DEFAULT NULL,
  `id_type_lecture` int(11) NOT NULL,
  `id_adherent` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `pret`
--

INSERT INTO `pret` (`id_pret`, `id_exemplaire`, `date_pret`, `date_remise`, `id_type_lecture`, `id_adherent`) VALUES
(1, 1, '2023-02-10', '2023-03-10', 2, 1),
(2, 2, '2023-03-05', '2023-04-05', 2, 2),
(3, 3, '2023-04-15', '2023-05-15', 2, 3),
(4, 4, '2023-05-20', '2023-06-20', 2, 4),
(5, 5, '2023-06-10', '2023-07-10', 2, 5),
(6, 6, '2023-07-05', '2023-08-05', 2, 6),
(7, 7, '2023-08-15', '2023-09-15', 2, 7),
(8, 8, '2023-09-20', '2023-10-20', 2, 8),
(9, 9, '2023-10-10', '2023-11-10', 2, 9),
(10, 10, '2023-11-05', '2023-12-05', 2, 10),
(11, 11, '2023-01-15', '2023-02-15', 2, 1),
(12, 12, '2023-02-20', '2023-03-20', 2, 2),
(13, 13, '2023-03-10', '2023-04-10', 2, 3),
(14, 14, '2023-04-18', '2023-05-18', 2, 4),
(15, 15, '2023-05-22', '2023-06-22', 2, 5),
(16, 1, '2025-07-03', '2025-07-10', 1, 1),
(17, 2, '2025-07-03', '2025-07-10', 1, 1),
(18, 3, '2025-07-03', '2025-07-10', 1, 1),
(19, 4, '2025-07-03', '2025-07-10', 1, 1),
(20, 5, '2025-07-03', '2025-07-10', 1, 1),
(21, 6, '2025-07-03', '2025-07-10', 1, 1),
(22, 7, '2025-07-03', '2025-07-10', 1, 1),
(23, 9, '2025-07-03', '2025-07-10', 1, 1),
(24, 10, '2025-07-03', '2025-07-10', 1, 1),
(26, 2, '2025-07-03', '2025-07-10', 1, 3),
(27, 2, '2025-07-03', '2025-07-10', 1, 4);

-- --------------------------------------------------------

--
-- Structure de la table `pret_penalisee`
--

CREATE TABLE `pret_penalisee` (
  `id_pret_penalisee` int(11) NOT NULL,
  `date_remise_penalisee` date DEFAULT NULL,
  `description` text DEFAULT NULL,
  `id_pret` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `pret_penalisee`
--

INSERT INTO `pret_penalisee` (`id_pret_penalisee`, `date_remise_penalisee`, `description`, `id_pret`) VALUES
(1, '2023-03-15', 'Retard de 5 jours', 1),
(2, '2023-04-10', 'Retard de 5 jours', 2),
(3, '2023-05-20', 'Retard de 5 jours', 3),
(4, '2023-06-25', 'Retard de 5 jours', 4),
(5, '2023-07-15', 'Retard de 5 jours', 5),
(6, '2025-07-03', 'Prêt rendu en retard, dépassement de la date prévue: 2023-02-15', 11),
(7, '2025-07-03', 'Prêt rendu en retard, dépassement de la date prévue: 2023-03-20', 12),
(8, '2025-07-03', 'Prêt rendu en retard, dépassement de la date prévue: 2023-06-22', 15),
(9, '2025-07-03', 'Prêt rendu en retard, dépassement de la date prévue: 2023-04-10', 13);

-- --------------------------------------------------------

--
-- Structure de la table `pret_rendu`
--

CREATE TABLE `pret_rendu` (
  `id_pret_rendu` int(11) NOT NULL,
  `id_pret` int(11) DEFAULT NULL,
  `date_remise_reel` date DEFAULT NULL,
  `id_pret_1` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `pret_rendu`
--

INSERT INTO `pret_rendu` (`id_pret_rendu`, `id_pret`, `date_remise_reel`, `id_pret_1`) VALUES
(1, 1, '2023-03-15', 1),
(2, 2, '2023-04-10', 2),
(3, 3, '2023-05-20', 3),
(4, 4, '2023-06-25', 4),
(5, 5, '2023-07-15', 5),
(6, 6, '2023-08-12', 6),
(7, 7, '2023-09-22', 7),
(8, 8, '2023-10-27', 8),
(9, 9, '2023-11-17', 9),
(10, 10, '2023-12-12', 10),
(11, 11, '2025-07-03', 11),
(12, 12, '2025-07-03', 12),
(13, 27, '2025-07-03', 27),
(14, 15, '2025-07-03', 15),
(15, 13, '2025-07-03', 13);

-- --------------------------------------------------------

--
-- Structure de la table `prolongement`
--

CREATE TABLE `prolongement` (
  `id_prolongement` int(11) NOT NULL,
  `nb_jour_prolongement` int(11) DEFAULT 0,
  `description` text DEFAULT NULL,
  `id_pret` int(11) NOT NULL,
  `id_status_prolongement` int(11) DEFAULT 0,
  `id_statut_prolongement` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `reservation`
--

CREATE TABLE `reservation` (
  `id_reservation` int(11) NOT NULL,
  `date_pret` date DEFAULT NULL,
  `id_adherent` int(11) NOT NULL,
  `id_etat_reservation` int(11) DEFAULT NULL,
  `id_exemplaire` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `status`
--

CREATE TABLE `status` (
  `id_statut` int(11) NOT NULL,
  `nom` varchar(50) DEFAULT NULL,
  `description` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `status`
--

INSERT INTO `status` (`id_statut`, `nom`, `description`) VALUES
(1, 'Actif', 'Adhérent actif avec cotisation à jour'),
(2, 'Suspendu', 'Adhérent suspendu pour retard ou autre raison'),
(3, 'Inactif', 'Adhérent inactif (cotisation non renouvelée)'),
(4, 'Nouveau', 'Nouvel adhérent, première inscription');

-- --------------------------------------------------------

--
-- Structure de la table `status_prolongement`
--

CREATE TABLE `status_prolongement` (
  `id_status_prolongement` int(11) NOT NULL,
  `status_prolongement` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `statut_prolongement`
--

CREATE TABLE `statut_prolongement` (
  `id_statut_prolongement` int(11) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `nom` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `type_lecture`
--

CREATE TABLE `type_lecture` (
  `id_type_lecture` int(11) NOT NULL,
  `nom` varchar(50) DEFAULT NULL,
  `description` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `type_lecture`
--

INSERT INTO `type_lecture` (`id_type_lecture`, `nom`, `description`) VALUES
(1, 'Sur place', 'Lecture uniquement dans la bibliothèque'),
(2, 'Emprunt', 'Emprunt à domicile'),
(3, 'Consultation rapide', 'Consultation sur place limitée à 2 heures');

-- --------------------------------------------------------

--
-- Structure de la table `type_profil`
--

CREATE TABLE `type_profil` (
  `id_type_profil` int(11) NOT NULL,
  `nom` varchar(50) DEFAULT NULL,
  `nb_livre_max` int(11) DEFAULT 0,
  `nb_jour_penalite` int(11) DEFAULT 0,
  `nb_prologement_max` int(11) DEFAULT 0,
  `amande_penalite` int(11) DEFAULT 0,
  `description` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `type_profil`
--

INSERT INTO `type_profil` (`id_type_profil`, `nom`, `nb_livre_max`, `nb_jour_penalite`, `nb_prologement_max`, `amande_penalite`, `description`) VALUES
(1, 'Enfant', 5, 3, 0, 0, 'Profil pour les enfants de moins de 12 ans'),
(2, 'Adolescent', 7, 2, 0, 0, 'Profil pour les jeunes de 12 à 18 ans'),
(3, 'Adulte', 10, 1, 0, 0, 'Profil standard pour les adultes'),
(4, 'Senior', 10, 1, 0, 0, 'Profil pour les personnes de plus de 65 ans');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `abonnement`
--
ALTER TABLE `abonnement`
  ADD PRIMARY KEY (`id_abonnement`),
  ADD KEY `id_adherent` (`id_adherent`),
  ADD KEY `id_mode_paiment` (`id_mode_paiment`);

--
-- Index pour la table `adherent`
--
ALTER TABLE `adherent`
  ADD PRIMARY KEY (`id_adherent`),
  ADD KEY `id_statut` (`id_statut`),
  ADD KEY `id_type_profil` (`id_type_profil`);

--
-- Index pour la table `bibliothecaire`
--
ALTER TABLE `bibliothecaire`
  ADD PRIMARY KEY (`id_bibliothecaire`);

--
-- Index pour la table `cotisation`
--
ALTER TABLE `cotisation`
  ADD PRIMARY KEY (`id_cotisation`),
  ADD KEY `id_type_profil` (`id_type_profil`);

--
-- Index pour la table `etat_reservation`
--
ALTER TABLE `etat_reservation`
  ADD PRIMARY KEY (`id_etat_reservation`);

--
-- Index pour la table `exemplaire`
--
ALTER TABLE `exemplaire`
  ADD PRIMARY KEY (`id_exemplaire`);

--
-- Index pour la table `jour_ferier`
--
ALTER TABLE `jour_ferier`
  ADD PRIMARY KEY (`id_jour_ferier`);

--
-- Index pour la table `livre`
--
ALTER TABLE `livre`
  ADD PRIMARY KEY (`id_livre`),
  ADD KEY `id_exemplaire` (`id_exemplaire`);

--
-- Index pour la table `mode_paiment`
--
ALTER TABLE `mode_paiment`
  ADD PRIMARY KEY (`id_mode_paiment`);

--
-- Index pour la table `pret`
--
ALTER TABLE `pret`
  ADD PRIMARY KEY (`id_pret`),
  ADD KEY `id_type_lecture` (`id_type_lecture`),
  ADD KEY `id_adherent` (`id_adherent`),
  ADD KEY `FKn7tvrkjvh9cs2k6kj3p1bp7ph` (`id_exemplaire`);

--
-- Index pour la table `pret_penalisee`
--
ALTER TABLE `pret_penalisee`
  ADD PRIMARY KEY (`id_pret_penalisee`),
  ADD KEY `id_pret` (`id_pret`);

--
-- Index pour la table `pret_rendu`
--
ALTER TABLE `pret_rendu`
  ADD PRIMARY KEY (`id_pret_rendu`),
  ADD KEY `id_pret_1` (`id_pret_1`);

--
-- Index pour la table `prolongement`
--
ALTER TABLE `prolongement`
  ADD PRIMARY KEY (`id_prolongement`),
  ADD KEY `id_pret` (`id_pret`),
  ADD KEY `id_status_prolongement` (`id_status_prolongement`),
  ADD KEY `FKtc5aq94nm23d51euw95vogxvy` (`id_statut_prolongement`);

--
-- Index pour la table `reservation`
--
ALTER TABLE `reservation`
  ADD PRIMARY KEY (`id_reservation`),
  ADD KEY `FKg2jlskil207bmif1d6ao1f889` (`id_adherent`),
  ADD KEY `FKm5jadfbutov5vup0m7t7ay97n` (`id_etat_reservation`),
  ADD KEY `FKmimnronyvs0e4uwwb7tjp3xxj` (`id_exemplaire`);

--
-- Index pour la table `status`
--
ALTER TABLE `status`
  ADD PRIMARY KEY (`id_statut`);

--
-- Index pour la table `status_prolongement`
--
ALTER TABLE `status_prolongement`
  ADD PRIMARY KEY (`id_status_prolongement`);

--
-- Index pour la table `statut_prolongement`
--
ALTER TABLE `statut_prolongement`
  ADD PRIMARY KEY (`id_statut_prolongement`);

--
-- Index pour la table `type_lecture`
--
ALTER TABLE `type_lecture`
  ADD PRIMARY KEY (`id_type_lecture`);

--
-- Index pour la table `type_profil`
--
ALTER TABLE `type_profil`
  ADD PRIMARY KEY (`id_type_profil`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `abonnement`
--
ALTER TABLE `abonnement`
  MODIFY `id_abonnement` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT pour la table `adherent`
--
ALTER TABLE `adherent`
  MODIFY `id_adherent` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT pour la table `bibliothecaire`
--
ALTER TABLE `bibliothecaire`
  MODIFY `id_bibliothecaire` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT pour la table `cotisation`
--
ALTER TABLE `cotisation`
  MODIFY `id_cotisation` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `etat_reservation`
--
ALTER TABLE `etat_reservation`
  MODIFY `id_etat_reservation` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `exemplaire`
--
ALTER TABLE `exemplaire`
  MODIFY `id_exemplaire` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT pour la table `jour_ferier`
--
ALTER TABLE `jour_ferier`
  MODIFY `id_jour_ferier` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT pour la table `livre`
--
ALTER TABLE `livre`
  MODIFY `id_livre` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `mode_paiment`
--
ALTER TABLE `mode_paiment`
  MODIFY `id_mode_paiment` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT pour la table `pret`
--
ALTER TABLE `pret`
  MODIFY `id_pret` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT pour la table `pret_penalisee`
--
ALTER TABLE `pret_penalisee`
  MODIFY `id_pret_penalisee` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT pour la table `pret_rendu`
--
ALTER TABLE `pret_rendu`
  MODIFY `id_pret_rendu` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT pour la table `prolongement`
--
ALTER TABLE `prolongement`
  MODIFY `id_prolongement` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `reservation`
--
ALTER TABLE `reservation`
  MODIFY `id_reservation` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `status`
--
ALTER TABLE `status`
  MODIFY `id_statut` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `status_prolongement`
--
ALTER TABLE `status_prolongement`
  MODIFY `id_status_prolongement` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `type_lecture`
--
ALTER TABLE `type_lecture`
  MODIFY `id_type_lecture` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `type_profil`
--
ALTER TABLE `type_profil`
  MODIFY `id_type_profil` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `abonnement`
--
ALTER TABLE `abonnement`
  ADD CONSTRAINT `abonnement_ibfk_1` FOREIGN KEY (`id_adherent`) REFERENCES `adherent` (`id_adherent`),
  ADD CONSTRAINT `abonnement_ibfk_2` FOREIGN KEY (`id_mode_paiment`) REFERENCES `mode_paiment` (`id_mode_paiment`);

--
-- Contraintes pour la table `adherent`
--
ALTER TABLE `adherent`
  ADD CONSTRAINT `adherent_ibfk_1` FOREIGN KEY (`id_statut`) REFERENCES `status` (`id_statut`),
  ADD CONSTRAINT `adherent_ibfk_2` FOREIGN KEY (`id_type_profil`) REFERENCES `type_profil` (`id_type_profil`);

--
-- Contraintes pour la table `cotisation`
--
ALTER TABLE `cotisation`
  ADD CONSTRAINT `cotisation_ibfk_1` FOREIGN KEY (`id_type_profil`) REFERENCES `type_profil` (`id_type_profil`);

--
-- Contraintes pour la table `livre`
--
ALTER TABLE `livre`
  ADD CONSTRAINT `livre_ibfk_1` FOREIGN KEY (`id_exemplaire`) REFERENCES `exemplaire` (`id_exemplaire`);

--
-- Contraintes pour la table `pret`
--
ALTER TABLE `pret`
  ADD CONSTRAINT `FKn7tvrkjvh9cs2k6kj3p1bp7ph` FOREIGN KEY (`id_exemplaire`) REFERENCES `exemplaire` (`id_exemplaire`),
  ADD CONSTRAINT `pret_ibfk_1` FOREIGN KEY (`id_type_lecture`) REFERENCES `type_lecture` (`id_type_lecture`),
  ADD CONSTRAINT `pret_ibfk_2` FOREIGN KEY (`id_adherent`) REFERENCES `adherent` (`id_adherent`);

--
-- Contraintes pour la table `pret_penalisee`
--
ALTER TABLE `pret_penalisee`
  ADD CONSTRAINT `pret_penalisee_ibfk_1` FOREIGN KEY (`id_pret`) REFERENCES `pret` (`id_pret`);

--
-- Contraintes pour la table `pret_rendu`
--
ALTER TABLE `pret_rendu`
  ADD CONSTRAINT `pret_rendu_ibfk_1` FOREIGN KEY (`id_pret_1`) REFERENCES `pret` (`id_pret`);

--
-- Contraintes pour la table `prolongement`
--
ALTER TABLE `prolongement`
  ADD CONSTRAINT `FKtc5aq94nm23d51euw95vogxvy` FOREIGN KEY (`id_statut_prolongement`) REFERENCES `statut_prolongement` (`id_statut_prolongement`),
  ADD CONSTRAINT `prolongement_ibfk_1` FOREIGN KEY (`id_pret`) REFERENCES `pret` (`id_pret`),
  ADD CONSTRAINT `prolongement_ibfk_2` FOREIGN KEY (`id_status_prolongement`) REFERENCES `status_prolongement` (`id_status_prolongement`);

--
-- Contraintes pour la table `reservation`
--
ALTER TABLE `reservation`
  ADD CONSTRAINT `FKg2jlskil207bmif1d6ao1f889` FOREIGN KEY (`id_adherent`) REFERENCES `adherent` (`id_adherent`),
  ADD CONSTRAINT `FKm5jadfbutov5vup0m7t7ay97n` FOREIGN KEY (`id_etat_reservation`) REFERENCES `etat_reservation` (`id_etat_reservation`),
  ADD CONSTRAINT `FKmimnronyvs0e4uwwb7tjp3xxj` FOREIGN KEY (`id_exemplaire`) REFERENCES `exemplaire` (`id_exemplaire`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
