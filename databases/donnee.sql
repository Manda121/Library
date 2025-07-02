INSERT INTO bibliothecaire (id_bibliothecaire, nom, prenom, tel, email) VALUES
(1, 'Dupont', 'Marie', '0612345678', 'marie.dupont@biblio.fr'),
(2, 'Martin', 'Pierre', '0698765432', 'pierre.martin@biblio.fr'),
(3, 'Bernard', 'Sophie', '0678912345', 'sophie.bernard@biblio.fr'),
(4, 'Petit', 'Luc', '0654321890', 'luc.petit@biblio.fr'),
(5, 'Moreau', 'Elodie', '0687654321', 'elodie.moreau@biblio.fr');

INSERT INTO type_profil (id_type_profil, nom, nb_livre_max, nb_jour_penalite, description) VALUES
(1, 'Enfant', 5, 3, 'Profil pour les enfants de moins de 12 ans'),
(2, 'Adolescent', 7, 2, 'Profil pour les jeunes de 12 à 18 ans'),
(3, 'Adulte', 10, 1, 'Profil standard pour les adultes'),
(4, 'Senior', 10, 1, 'Profil pour les personnes de plus de 65 ans');


INSERT INTO status (id_statut, nom, description) VALUES
(1, 'Actif', 'Adhérent actif avec cotisation à jour'),
(2, 'Suspendu', 'Adhérent suspendu pour retard ou autre raison'),
(3, 'Inactif', 'Adhérent inactif (cotisation non renouvelée)'),
(4, 'Nouveau', 'Nouvel adhérent, première inscription');

INSERT INTO adherent (id_adherent, nom, email, prenom, tel, date_naissance, id_statut, id_type_profil) VALUES
(1, 'Durand', 'jean.durand@email.com', 'Jean', '0611223344', '1980-05-15', 1, 3),
(2, 'Leroy', 'sarah.leroy@email.com', 'Sarah', '0622334455', '1995-08-22', 1, 2),
(3, 'Morel', 'paul.morel@email.com', 'Paul', '0633445566', '1972-11-30', 1, 3),
(4, 'Simon', 'lucie.simon@email.com', 'Lucie', '0644556677', '2010-03-10', 1, 1),
(5, 'Laurent', 'marc.laurent@email.com', 'Marc', '0655667788', '1955-07-25', 1, 4),
(6, 'Michel', 'anne.michel@email.com', 'Anne', '0666778899', '1988-09-05', 2, 3),
(7, 'Garcia', 'thomas.garcia@email.com', 'Thomas', '0677889900', '2005-12-18', 1, 2),
(8, 'Roux', 'claire.roux@email.com', 'Claire', '0688990011', '1978-04-20', 1, 3),
(9, 'Fournier', 'julie.fournier@email.com', 'Julie', '0699001122', '1960-06-12', 1, 4),
(10, 'Lefebvre', 'pierre.lefebvre@email.com', 'Pierre', '0600112233', '1992-02-28', 4, 3);

INSERT INTO mode_paiment (id_mode_paiment, nom, description) VALUES
(1, 'Carte bancaire', 'Paiement par carte bancaire'),
(2, 'Espèces', 'Paiement en espèces'),
(3, 'Chèque', 'Paiement par chèque'),
(4, 'Virement', 'Paiement par virement bancaire'),
(5, 'Prélèvement', 'Paiement par prélèvement automatique');

INSERT INTO cotisation (id_cotisation, montant, periodicite, id_type_profil) VALUES
(1, 15.00, 12, 1),
(2, 25.00, 12, 2),
(3, 35.00, 12, 3),
(4, 25.00, 12, 4);

INSERT INTO abonnement (id_abonnement, date_abnnement, id_adherent, id_mode_paiment) VALUES
(1, '2023-01-15', 1, 1),
(2, '2023-02-20', 2, 3),
(3, '2023-03-10', 3, 2),
(4, '2023-01-05', 4, 1),
(5, '2023-04-18', 5, 5),
(6, '2023-05-22', 6, 1),
(7, '2023-06-30', 7, 4),
(8, '2023-02-15', 8, 1),
(9, '2023-03-25', 9, 3),
(10, '2023-07-01', 10, 2);

INSERT INTO type_lecture (id_type_lecture, nom, description) VALUES
(1, 'Sur place', 'Lecture uniquement dans la bibliothèque'),
(2, 'Emprunt', 'Emprunt à domicile'),
(3, 'Consultation rapide', 'Consultation sur place limitée à 2 heures');

INSERT INTO exemplaire (id_exemplaire, nom, description, image_couverture, titre, age_minimal) VALUES
(1, 'Roman classique', 'Exemplaire de collection avec reliure en cuire', 'roman_classique.jpg', 'Les Misérables', 12),
(2, 'Science-fiction', 'Edition spéciale avec illustrations', 'science_fiction.jpg', 'Dune', 14),
(3, 'Policier', 'Exemplaire standard en bon état', 'policier.jpg', 'Le Crime de l Orient-Express', 16),
(4, 'Fantasy', 'Edition collector avec couverture rigide', 'fantasy.jpg', 'Le Seigneur des Anneaux', 12),
(5, 'Biographie', 'Exemplaire dédicacé par l auteur', 'biographie.jpg', 'Steve Jobs', 10),
(6, 'Jeunesse', 'Livre interactif avec pop-up', 'jeunesse.jpg', 'Harry Potter à l école des sorciers', 8),
(7, 'Histoire', 'Edition annotée par un historien', 'histoire.jpg', 'La Seconde Guerre mondiale', 14),
(8, 'Poésie', 'Petit format de poche', 'poesie.jpg', 'Les Fleurs du Mal', 12),
(9, 'Théâtre', 'Edition scolaire avec notes', 'theatre.jpg', 'Le Cid', 10),
(10, 'Bande dessinée', 'Album grand format couleur', 'bd.jpg', 'Astérix le Gaulois', 6),
(11, 'Science', 'Livre avec schémas et illustrations', 'science.jpg', 'Une brève histoire du temps', 14),
(12, 'Art', 'Livre d art avec reproductions', 'art.jpg', 'Histoire de l art', 10),
(13, 'Cuisine', 'Livre avec photos des plats', 'cuisine.jpg', 'La cuisine française', 0),
(14, 'Voyage', 'Guide touristique illustré', 'voyage.jpg', 'Le guide du routard: Japon', 0),
(15, 'Développement personnel', 'Edition avec marque-pages', 'dev_perso.jpg', 'Les 7 habitudes des gens efficaces', 12);

-- Livres pour l'exemplaire 1 (Les Misérables)
INSERT INTO livre (id_livre, nbpage, id_exemplaire) VALUES
(1, 365, 1),
(2, 372, 1),
(3, 380, 1),
(4, 355, 1),
(5, 390, 1),
(6, 368, 1),
(7, 375, 1),
(8, 362, 1),
(9, 385, 1),
(10, 370, 1);

-- Livres pour l'exemplaire 2 (Dune)
INSERT INTO livre (id_livre, nbpage, id_exemplaire) VALUES
(11, 412, 2),
(12, 420, 2),
(13, 405, 2),
(14, 415, 2),
(15, 408, 2),
(16, 425, 2),
(17, 410, 2),
(18, 418, 2),
(19, 422, 2),
(20, 415, 2);

-- Livres pour l'exemplaire 3 (Le Crime de l'Orient-Express)
INSERT INTO livre (id_livre, nbpage, id_exemplaire) VALUES
(21, 256, 3),
(22, 260, 3),
(23, 255, 3),
(24, 258, 3),
(25, 262, 3),
(26, 257, 3),
(27, 259, 3),
(28, 261, 3),
(29, 263, 3),
(30, 260, 3);

-- Continuer ainsi pour les autres exemplaires...
-- (Je peux continuer avec les autres exemplaires si besoin)

INSERT INTO jour_ferier (id_jour_ferier, date_jour_ferier, description) VALUES
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

INSERT INTO reservation (id_reservation, date_pret, id_exemplaire) VALUES
(1, '2023-03-15', 1),
(2, '2023-04-20', 3),
(3, '2023-05-10', 5),
(4, '2023-06-05', 2),
(5, '2023-07-18', 4),
(6, '2023-08-22', 6),
(7, '2023-09-30', 7),
(8, '2023-10-15', 8),
(9, '2023-11-25', 9),
(10, '2023-12-01', 10);

INSERT INTO pret (id_pret, id_exemplaire, date_pret, date_remise, id_type_lecture, id_adherent) VALUES
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
(15, 15, '2023-05-22', '2023-06-22', 2, 5);

INSERT INTO pret_penalisee (id_pret_penalisee, date_remise_penalisee, description, id_pret) VALUES
(1, '2023-03-15', 'Retard de 5 jours', 1),
(2, '2023-04-10', 'Retard de 5 jours', 2),
(3, '2023-05-20', 'Retard de 5 jours', 3),
(4, '2023-06-25', 'Retard de 5 jours', 4),
(5, '2023-07-15', 'Retard de 5 jours', 5);

INSERT INTO prolongement (id_prolongement, id_pret, nb_jour_prolongement, description, id_pret_1) VALUES
(1, 6, 7, 'Première prolongation', 6),
(2, 7, 7, 'Première prolongation', 7),
(3, 8, 7, 'Première prolongation', 8),
(4, 9, 7, 'Première prolongation', 9),
(5, 10, 7, 'Première prolongation', 10);

INSERT INTO pret_rendu (id_pret_rendu, id_pret, date_remise_reel, id_pret_1) VALUES
(1, 1, '2023-03-15', 1),
(2, 2, '2023-04-10', 2),
(3, 3, '2023-05-20', 3),
(4, 4, '2023-06-25', 4),
(5, 5, '2023-07-15', 5),
(6, 6, '2023-08-12', 6),
(7, 7, '2023-09-22', 7),
(8, 8, '2023-10-27', 8),
(9, 9, '2023-11-17', 9),
(10, 10, '2023-12-12', 10);