INSERT INTO bibliothecaire (nom, prenom, tel, email, mot_de_passe) VALUES
('Dupont', 'Marie', '0612345678', 'marie.dupont@biblio.fr', 'mdp'),
('Martin', 'Pierre', '0698765432', 'pierre.martin@biblio.fr', 'mdp'),
('Bernard', 'Sophie', '0678912345', 'sophie.bernard@biblio.fr', 'mdp'),
('Petit', 'Luc', '0654321890', 'luc.petit@biblio.fr', 'mdp'),
('Moreau', 'Elodie', '0687654321', 'elodie.moreau@biblio.fr', 'mdp');

INSERT INTO type_profil (nom, nb_livre_max, nb_jour_penalite, description) VALUES
('Enfant', 5, 3, 'Profil pour les enfants de moins de 12 ans'),
('Adolescent', 7, 2, 'Profil pour les jeunes de 12 à 18 ans'),
('Adulte', 10, 1, 'Profil standard pour les adultes'),
('Senior', 10, 1, 'Profil pour les personnes de plus de 65 ans');

INSERT INTO status (nom, description) VALUES
('Actif', 'Adhérent actif avec cotisation à jour'),
('Suspendu', 'Adhérent suspendu pour retard ou autre raison'),
('Inactif', 'Adhérent inactif (cotisation non renouvelée)'),
('Nouveau', 'Nouvel adhérent, première inscription');

INSERT INTO adherent (nom, email, prenom, tel, date_naissance, id_statut, id_type_profil, mot_de_passe) VALUES
('Durand', 'jean.durand@email.com', 'Jean', '0611223344', '1980-05-15', 1, 3, 'mdp'),
('Leroy', 'sarah.leroy@email.com', 'Sarah', '0622334455', '1995-08-22', 1, 2, 'mdp'),
('Morel', 'paul.morel@email.com', 'Paul', '0633445566', '1972-11-30', 1, 3, 'mdp'),
('Simon', 'lucie.simon@email.com', 'Lucie', '0644556677', '2010-03-10', 1, 1, 'mdp'),
('Laurent', 'marc.laurent@email.com', 'Marc', '0655667788', '1955-07-25', 1, 4, 'mdp'),
('Michel', 'anne.michel@email.com', 'Anne', '0666778899', '1988-09-05', 2, 3, 'mdp'),
('Garcia', 'thomas.garcia@email.com', 'Thomas', '0677889900', '2005-12-18', 1, 2, 'mdp'),
('Roux', 'claire.roux@email.com', 'Claire', '0688990011', '1978-04-20', 1, 3, 'mdp'),
('Fournier', 'julie.fournier@email.com', 'Julie', '0699001122', '1960-06-12', 1, 4, 'mdp'),
('Lefebvre', 'pierre.lefebvre@email.com', 'Pierre', '0600112233', '1992-02-28', 4, 3, 'mdp');

INSERT INTO mode_paiment (nom, description) VALUES
('Carte bancaire', 'Paiement par carte bancaire'),
('Espèces', 'Paiement en espèces'),
('Chèque', 'Paiement par chèque'),
('Virement', 'Paiement par virement bancaire'),
('Prélèvement', 'Paiement par prélèvement automatique');

INSERT INTO cotisation (montant, periodicite, id_type_profil) VALUES
(15.00, 12, 1),
(25.00, 12, 2),
(35.00, 12, 3),
(25.00, 12, 4);

INSERT INTO abonnement (date_abnnement, id_adherent, id_mode_paiment) VALUES
('2023-01-15', 1, 1),
('2023-02-20', 2, 3),
('2023-03-10', 3, 2),
('2023-01-05', 4, 1),
('2023-04-18', 5, 5),
('2023-05-22', 6, 1),
('2023-06-30', 7, 4),
('2023-02-15', 8, 1),
('2023-03-25', 9, 3),
('2023-07-01', 10, 2);

INSERT INTO type_lecture (nom, description) VALUES
('Sur place', 'Lecture uniquement dans la bibliothèque'),
('Emprunt', 'Emprunt à domicile'),
('Consultation rapide', 'Consultation sur place limitée à 2 heures');

INSERT INTO exemplaire (nom, description, image_couverture, titre, age_minimal) VALUES
('Roman classique', 'Exemplaire de collection avec reliure en cuire', 'roman_classique.jpg', 'Les Misérables', 12),
('Science-fiction', 'Edition spéciale avec illustrations', 'science_fiction.jpg', 'Dune', 14),
('Policier', 'Exemplaire standard en bon état', 'policier.jpg', 'Le Crime de l Orient-Express', 16),
('Fantasy', 'Edition collector avec couverture rigide', 'fantasy.jpg', 'Le Seigneur des Anneaux', 12),
('Biographie', 'Exemplaire dédicacé par l auteur', 'biographie.jpg', 'Steve Jobs', 10),
('Jeunesse', 'Livre interactif avec pop-up', 'jeunesse.jpg', 'Harry Potter à l école des sorciers', 8),
('Histoire', 'Edition annotée par un historien', 'histoire.jpg', 'La Seconde Guerre mondiale', 14),
('Poésie', 'Petit format de poche', 'poesie.jpg', 'Les Fleurs du Mal', 12),
('Théâtre', 'Edition scolaire avec notes', 'theatre.jpg', 'Le Cid', 10),
('Bande dessinée', 'Album grand format couleur', 'bd.jpg', 'Astérix le Gaulois', 6),
('Science', 'Livre avec schémas et illustrations', 'science.jpg', 'Une brève histoire du temps', 14),
('Art', 'Livre d art avec reproductions', 'art.jpg', 'Histoire de l art', 10),
('Cuisine', 'Livre avec photos des plats', 'cuisine.jpg', 'La cuisine française', 0),
('Voyage', 'Guide touristique illustré', 'voyage.jpg', 'Le guide du routard: Japon', 0),
('Développement personnel', 'Edition avec marque-pages', 'dev_perso.jpg', 'Les 7 habitudes des gens efficaces', 12);

INSERT INTO livre (nbpage, id_exemplaire) VALUES
(365, 1),
(372, 1),
(380, 1),
(355, 1),
(390, 1),
(368, 1),
(375, 1),
(362, 1),
(385, 1),
(370, 1);

INSERT INTO livre (nbpage, id_exemplaire) VALUES
(412, 2),
(420, 2),
(405, 2),
(415, 2),
(408, 2),
(425, 2),
(410, 2),
(418, 2),
(422, 2),
(415, 2);

INSERT INTO livre (nbpage, id_exemplaire) VALUES
(256, 3),
(260, 3),
(255, 3),
(258, 3),
(262, 3),
(257, 3),
(259, 3),
(261, 3),
(263, 3),
(260, 3);

INSERT INTO jour_ferier (date_jour_ferier, description) VALUES
('2023-01-01', 'Nouvel An'),
('2023-04-10', 'Lundi de Pâques'),
('2023-05-01', 'Fête du Travail'),
('2023-05-08', 'Victoire 1945'),
('2023-05-18', 'Ascension'),
('2023-05-29', 'Lundi de Pentecôte'),
('2023-07-14', 'Fête Nationale'),
('2023-08-15', 'Assomption'),
('2023-11-01', 'Toussaint'),
('2023-11-11', 'Armistice 1918'),
('2023-12-25', 'Noël');

INSERT INTO etat_reservation (nom) VALUES
('en attente'),
('acceptee'),
('annulee');

-- INSERT INTO reservation (date_pret, id_exemplaire, id_etat_reservation) VALUES
-- ('2023-03-15', 1, 1),
-- ('2023-04-20', 3, 1),
-- ('2023-05-10', 5, 1),
-- ('2023-06-05', 2, 1),
-- ('2023-07-18', 4, 1),
-- ('2023-08-22', 6, 1),
-- ('2023-09-30', 7, 1),
-- ('2023-10-15', 8, 1),
-- ('2023-11-25', 9, 1),
-- ('2023-12-01', 10, 1);

INSERT INTO pret (id_exemplaire, date_pret, date_remise, id_type_lecture, id_adherent) VALUES
(1, '2023-02-10', '2023-03-10', 2, 1),
(2, '2023-03-05', '2023-04-05', 2, 2),
(3, '2023-04-15', '2023-05-15', 2, 3),
(4, '2023-05-20', '2023-06-20', 2, 4),
(5, '2023-06-10', '2023-07-10', 2, 5),
(6, '2023-07-05', '2023-08-05', 2, 6),
(7, '2023-08-15', '2023-09-15', 2, 7),
(8, '2023-09-20', '2023-10-20', 2, 8),
(9, '2023-10-10', '2023-11-10', 2, 9),
(10, '2023-11-05', '2023-12-05', 2, 10),
(11, '2023-01-15', '2023-02-15', 2, 1),
(12, '2023-02-20', '2023-03-20', 2, 2),
(13, '2023-03-10', '2023-04-10', 2, 3),
(14, '2023-04-18', '2023-05-18', 2, 4),
(15, '2023-05-22', '2023-06-22', 2, 5);

INSERT INTO pret_penalisee (date_remise_penalisee, description, id_pret) VALUES
('2023-03-15', 'Retard de 5 jours', 1),
('2023-04-10', 'Retard de 5 jours', 2),
('2023-05-20', 'Retard de 5 jours', 3),
('2023-06-25', 'Retard de 5 jours', 4),
('2023-07-15', 'Retard de 5 jours', 5);

INSERT INTO status_prolongement (nom) VALUES
('accepter'),
('refuser'),
('en attente');

INSERT INTO prolongement (id_pret, nb_jour_prolongement, description, id_status_prolongement) VALUES
(6, 7, 'Première prolongation', 2),
(7, 7, 'Première prolongation', 2),
(8, 7, 'Première prolongation', 2),
(9, 7, 'Première prolongation', 2),
(10, 7, 'Première prolongation', 2);

INSERT INTO pret_rendu (id_pret, date_remise_reel, id_pret_1) VALUES
(1, '2023-03-15', 1),
(2, '2023-04-10', 2),
(3, '2023-05-20', 3),
(4, '2023-06-25', 4),
(5, '2023-07-15', 5),
(6, '2023-08-12', 6),
(7, '2023-09-22', 7),
(8, '2023-10-27', 8),
(9, '2023-11-17', 9),
(10, '2023-12-12', 10);