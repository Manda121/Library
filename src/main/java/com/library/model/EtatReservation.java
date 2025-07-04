package com.library.model;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(
   name = "etat_reservation"
)
public class EtatReservation {
   @Id
   @GeneratedValue(
      strategy = GenerationType.IDENTITY
   )
   @Column(
      name = "id_etat_reservation"
   )
   private int idEtatReservation;
   @Column(
      name = "etat"
   )
   private String etat;

   public EtatReservation() {
   }

   public int getIdEtatReservation() {
      return this.idEtatReservation;
   }

   public void setIdEtatReservation(int idEtatReservation) {
      this.idEtatReservation = idEtatReservation;
   }

   public String getEtat() {
      return this.etat;
   }

   public void setEtat(String etat) {
      this.etat = etat;
   }
}
