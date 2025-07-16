INSERT INTO bibliothecaire (nom, prenom, tel, email, mot_de_passe) VALUES
('Dupont', 'Marie', '0612345678', 'marie.dupont@biblio.fr', 'mdp'),
('Martin', 'Pierre', '0698765432', 'pierre.martin@biblio.fr', 'mdp'),
('Bernard', 'Sophie', '0678912345', 'sophie.bernard@biblio.fr', 'mdp'),
('Petit', 'Luc', '0654321890', 'luc.petit@biblio.fr', 'mdp'),
('Moreau', 'Elodie', '0687654321', 'elodie.moreau@biblio.fr', 'mdp');

INSERT INTO type_profil (nom, nb_livre_max, nb_jour_penalite, description, nb_prologement_max) VALUES
('Etudiant', 2, 10, 'Profil pour les enfants de moins de 12 ans', 3),
('Enseignant', 3, 9, 'Profil pour les jeunes de 12 à 18 ans', 5),
('Professionnel', 4, 8, 'Profil standard pour les adultes', 7);

INSERT INTO status (nom, description) VALUES
('Actif', 'Adhérent actif avec cotisation à jour'),
('Suspendu', 'Adhérent suspendu pour retard ou autre raison'),
('Inactif', 'Adhérent inactif (cotisation non renouvelée)'),
('Nouveau', 'Nouvel adhérent, première inscription');

INSERT INTO adherent (nom, email, prenom, tel, date_naissance, id_statut, id_type_profil, mot_de_passe) VALUES
('ETU001', 'jean.durand@email.com', 'Jean', '0611223344', '1980-05-15', 1, 1, 'mdp'),
('ETU002', 'sarah.leroy@email.com', 'Sarah', '0622334455', '1995-08-22', 3, 1, 'mdp'),
('ETU003', 'paul.morel@email.com', 'Paul', '0633445566', '1972-11-30', 1, 1, 'mdp'),
('ENS001', 'lucie.simon@email.com', 'Lucie', '0644556677', '2010-03-10', 1, 2, 'mdp'),
('ENS002', 'marc.laurent@email.com', 'Marc', '0655667788', '1955-07-25', 3, 2, 'mdp'),
('ENS003', 'anne.michel@email.com', 'Anne', '0666778899', '1988-09-05', 1, 2, 'mdp'),
('PROF001', 'thomas.garcia@email.com', 'Thomas', '0677889900', '2005-12-18', 1, 3, 'mdp'),
('PROF002', 'claire.roux@email.com', 'Claire', '0688990011', '1978-04-20', 3, 3, 'mdp');

INSERT INTO mode_paiment (nom, description) VALUES
('Carte bancaire', 'Paiement par carte bancaire'),
('Espèces', 'Paiement en espèces'),
('Chèque', 'Paiement par chèque'),
('Virement', 'Paiement par virement bancaire'),
('Prélèvement', 'Paiement par prélèvement automatique');

INSERT INTO cotisation (montant, periodicite, id_type_profil) VALUES
(15.00, 5, 1),
(25.00, 12, 2),
(35.00, 6, 3);

INSERT INTO abonnement (date_abnnement, date_abonnement, id_adherent, id_mode_paiment) VALUES
('2025-02-1', '2025-02-1', 1, 1),
('2025-02-1', '2025-02-1', 2, 3),
('2025-04-1', '2025-04-1', 3, 2),
('2025-07-1', '2025-07-1', 4, 1),
('2025-08-1', '2025-08-1', 5, 5),
('2025-07-1', '2025-07-1', 6, 1),
('2025-06-1', '2025-06-1', 7, 4),
('2025-10-1', '2025-10-1', 8, 1);

INSERT INTO type_lecture (nom, description) VALUES
('Sur place', 'Lecture uniquement dans la bibliothèque'),
('Emprunt', 'Emprunt à domicile'),
('Consultation rapide', 'Consultation sur place limitée à 2 heures');

INSERT INTO exemplaire (nom, description, image_couverture, titre, age_minimal) VALUES
('Roman classique', 'Exemplaire de collection avec reliure en cuire', 'roman_classique.jpg', 'Les Misérables', 12),
('Théâtre', 'Edition scolaire avec notes', 'theatre.jpg', 'L etranger', 10),
('Jeunesse', 'Livre interactif avec pop-up', 'jeunesse.jpg', 'Harry Potter à l école des sorciers', 8);

INSERT INTO livre (nbpage, id_exemplaire) VALUES
(365, 1),
(372, 1),
(380, 1);

INSERT INTO livre (nbpage, id_exemplaire) VALUES
(412, 2),
(420, 2);

INSERT INTO livre (nbpage, id_exemplaire) VALUES
(256, 3);

INSERT INTO jour_ferier (date_jour_ferier, description) VALUES
('2025-07-26', 'Nouvel An'),
('2025-07-19', 'Lundi de Pâques'),
('2025-07-13', 'Fête du Travail'),
('2025-07-20', 'Victoire 1945'),
('2025-07-27', 'Ascension'),
('2025-08-03', 'Lundi de Pentecôte'),
('2025-08-10', 'Fête Nationale'),
('2025-08-17', 'Assomption');

INSERT INTO etat_reservation (etat) VALUES
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

-- INSERT INTO pret (id_exemplaire, date_pret, date_remise, id_type_lecture, id_adherent) VALUES
-- (1, '2023-02-10', '2023-03-10', 2, 1),
-- (2, '2023-03-05', '2023-04-05', 2, 2),
-- (3, '2023-04-15', '2023-05-15', 2, 3),
-- (4, '2023-05-20', '2023-06-20', 2, 4),
-- (5, '2023-06-10', '2023-07-10', 2, 5),
-- (6, '2023-07-05', '2023-08-05', 2, 6),
-- (7, '2023-08-15', '2023-09-15', 2, 7),
-- (8, '2023-09-20', '2023-10-20', 2, 8),
-- (9, '2023-10-10', '2023-11-10', 2, 9),
-- (10, '2023-11-05', '2023-12-05', 2, 10),
-- (11, '2023-01-15', '2023-02-15', 2, 1),
-- (12, '2023-02-20', '2023-03-20', 2, 2),
-- (13, '2023-03-10', '2023-04-10', 2, 3),
-- (14, '2023-04-18', '2023-05-18', 2, 4),
-- (15, '2023-05-22', '2023-06-22', 2, 5);

-- INSERT INTO pret_penalisee (date_remise_penalisee, description, id_pret) VALUES
-- ('2023-03-15', 'Retard de 5 jours', 1),
-- ('2023-04-10', 'Retard de 5 jours', 2),
-- ('2023-05-20', 'Retard de 5 jours', 3),
-- ('2023-06-25', 'Retard de 5 jours', 4),
-- ('2023-07-15', 'Retard de 5 jours', 5);

INSERT INTO statut_prolongement (id_statut_prolongement, nom) VALUES
(1,'accepter'),
(2,'refuser'),
(3,'en attente');

-- INSERT INTO prolongement (id_pret, nb_jour_prolongement, description, id_statut_prolongement) VALUES
-- (6, 7, 'Première prolongation', 2),
-- (7, 7, 'Première prolongation', 2),
-- (8, 7, 'Première prolongation', 2),
-- (9, 7, 'Première prolongation', 2),
-- (10, 7, 'Première prolongation', 2);

-- INSERT INTO pret_rendu (id_pret, date_remise_reel, id_pret_1) VALUES
-- (1, '2023-03-15', 1),
-- (2, '2023-04-10', 2),
-- (3, '2023-05-20', 3),
-- (4, '2023-06-25', 4),
-- (5, '2023-07-15', 5),
-- (6, '2023-08-12', 6),
-- (7, '2023-09-22', 7),
-- (8, '2023-10-27', 8),
-- (9, '2023-11-17', 9),
-- (10, '2023-12-12', 10);