-- DROP DATABASE IF EXISTS bibliotheque;
-- CREATE DATABASE bibliotheque;
-- use bibliotheque;

-- Désactiver les contraintes de clés étrangères temporairement
SET FOREIGN_KEY_CHECKS = 0;

-- Vider les tables dépendantes d'abord
TRUNCATE TABLE pret_rendu;
TRUNCATE TABLE prolongement;
TRUNCATE TABLE statut_prolongement;
TRUNCATE TABLE pret_penalisee;
TRUNCATE TABLE abonnement;
TRUNCATE TABLE cotisation;
TRUNCATE TABLE pret;
TRUNCATE TABLE livre;
TRUNCATE TABLE reservation;
TRUNCATE TABLE adherent;
TRUNCATE TABLE status;
TRUNCATE TABLE etat_reservation;
TRUNCATE TABLE type_lecture;
TRUNCATE TABLE type_profil;
TRUNCATE TABLE jour_ferier;
TRUNCATE TABLE mode_paiment;
TRUNCATE TABLE exemplaire;
TRUNCATE TABLE bibliothecaire;

-- Réactiver les contraintes
SET FOREIGN_KEY_CHECKS = 1;
