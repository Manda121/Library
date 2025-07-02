CREATE TABLE bibliothecaire(
   id_bibliothecaire INT,
   nom VARCHAR(50),
   prenom VARCHAR(100),
   tel VARCHAR(50),
   email VARCHAR(100),
   PRIMARY KEY(id_bibliothecaire)
);

CREATE TABLE exemplaire(
   id_exemplaire INT,
   nom VARCHAR(50),
   description TEXT,
   image_couverture VARCHAR(100),
   titre TEXT,
   age_minimal INT,
   PRIMARY KEY(id_exemplaire)
);

CREATE TABLE mode_paiment(
   id_mode_paiment INT,
   nom VARCHAR(50),
   description TEXT,
   PRIMARY KEY(id_mode_paiment)
);

CREATE TABLE jour_ferier(
   id_jour_ferier INT,
   date_jour_ferier DATE,
   description TEXT,
   PRIMARY KEY(id_jour_ferier)
);

CREATE TABLE type_profil(
   id_type_profil INT,
   nom VARCHAR(50),
   nb_livre_max INT,
   nb_jour_penalite INT,
   description TEXT,
   PRIMARY KEY(id_type_profil)
);

CREATE TABLE type_lecture(
   id_type_lecture INT,
   nom VARCHAR(50),
   description TEXT,
   PRIMARY KEY(id_type_lecture)
);

CREATE TABLE reservation(
   id_reservation INT,
   date_pret DATE,
   id_exemplaire INT NOT NULL,
   PRIMARY KEY(id_reservation),
   FOREIGN KEY(id_exemplaire) REFERENCES exemplaire(id_exemplaire)
);

CREATE TABLE status(
   id_statut INT,
   nom VARCHAR(50),
   description TEXT,
   PRIMARY KEY(id_statut)
);

CREATE TABLE adherent(
   id_adherent INT,
   nom VARCHAR(50),
   email VARCHAR(100),
   prenom VARCHAR(100),
   tel VARCHAR(50),
   date_naissance VARCHAR(50),
   id_statut INT NOT NULL,
   id_type_profil INT NOT NULL,
   PRIMARY KEY(id_adherent),
   FOREIGN KEY(id_statut) REFERENCES status(id_statut),
   FOREIGN KEY(id_type_profil) REFERENCES type_profil(id_type_profil)
);

CREATE TABLE livre(
   id_livre INT,
   nbpage INT,
   id_exemplaire INT NOT NULL,
   PRIMARY KEY(id_livre),
   FOREIGN KEY(id_exemplaire) REFERENCES exemplaire(id_exemplaire)
);

CREATE TABLE pret(
   id_pret INT,
   id_exemplaire INT,
   date_pret DATE,
   date_remise DATE,
   id_type_lecture INT NOT NULL,
   id_adherent INT NOT NULL,
   PRIMARY KEY(id_pret),
   FOREIGN KEY(id_type_lecture) REFERENCES type_lecture(id_type_lecture),
   FOREIGN KEY(id_adherent) REFERENCES adherent(id_adherent)
);

CREATE TABLE cotisation(
   id_cotisation INT,
   montant DECIMAL(15,2),
   periodicite INT,
   id_type_profil INT NOT NULL,
   PRIMARY KEY(id_cotisation),
   FOREIGN KEY(id_type_profil) REFERENCES type_profil(id_type_profil)
);

CREATE TABLE abonnement(
   id_abonnement INT,
   date_abnnement DATE,
   id_adherent INT NOT NULL,
   id_mode_paiment INT NOT NULL,
   PRIMARY KEY(id_abonnement),
   FOREIGN KEY(id_adherent) REFERENCES adherent(id_adherent),
   FOREIGN KEY(id_mode_paiment) REFERENCES mode_paiment(id_mode_paiment)
);

CREATE TABLE pret_penalisee(
   id_pret_penalisee INT,
   date_remise_penalisee DATE,
   description TEXT,
   id_pret INT NOT NULL,
   PRIMARY KEY(id_pret_penalisee),
   FOREIGN KEY(id_pret) REFERENCES pret(id_pret)
);

CREATE TABLE prolongement(
   id_prolongement INT,
   id_pret INT,
   nb_jour_prolongement INT,
   description TEXT,
   id_pret_1 INT NOT NULL,
   PRIMARY KEY(id_prolongement),
   FOREIGN KEY(id_pret_1) REFERENCES pret(id_pret)
);

CREATE TABLE pret_rendu(
   id_pret_rendu INT,
   id_pret INT,
   date_remise_reel DATE,
   id_pret_1 INT NOT NULL,
   PRIMARY KEY(id_pret_rendu),
   FOREIGN KEY(id_pret_1) REFERENCES pret(id_pret)
);
