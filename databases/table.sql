create table historique_status(
    id_historique int primary key,
    id_etat_reservation int,
    date_changement date,
    id_reservation int,
);