package com.library.model;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;
import java.time.LocalDate;

@Entity
@Table(
   name = "reservation"
)
public class Reservation {
   @Id
   @GeneratedValue(
      strategy = GenerationType.IDENTITY
   )
   @Column(
      name = "id_reservation"
   )
   private int idReservation;
   @Column(
      name = "date_pret"
   )
   private LocalDate datePret;
   @ManyToOne
   @JoinColumn(
      name = "id_exemplaire",
      nullable = false
   )
   private Exemplaire exemplaire;
   @ManyToOne
   @JoinColumn(
      name = "id_etat_reservation"
   )
   private EtatReservation etatReservation;
   @ManyToOne
   @JoinColumn(
      name = "id_adherent",
      nullable = false
   )
   private Adherent adherent;

   public Reservation() {
   }

   public int getIdReservation() {
      return this.idReservation;
   }

   public void setIdReservation(int idReservation) {
      this.idReservation = idReservation;
   }

   public LocalDate getDatePret() {
      return this.datePret;
   }

   public void setDatePret(LocalDate datePret) {
      this.datePret = datePret;
   }

   public Exemplaire getExemplaire() {
      return this.exemplaire;
   }

   public void setExemplaire(Exemplaire exemplaire) {
      this.exemplaire = exemplaire;
   }

   public EtatReservation getEtatReservation() {
      return this.etatReservation;
   }

   public void setEtatReservation(EtatReservation etatReservation) {
      this.etatReservation = etatReservation;
   }

   public Adherent getAdherent() {
      return this.adherent;
   }

   public void setAdherent(Adherent adherent) {
      this.adherent = adherent;
   }
}
