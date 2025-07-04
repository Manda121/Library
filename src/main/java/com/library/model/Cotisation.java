package com.library.model;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;

@Entity
@Table(
   name = "cotisation"
)
public class Cotisation {
   @Id
   @GeneratedValue(
      strategy = GenerationType.IDENTITY
   )
   @Column(
      name = "id_cotisation"
   )
   private int idCotisation;
   @Column(
      name = "montant"
   )
   private double montant;
   @Column(
      name = "periodicite"
   )
   private int periodicite;
   @ManyToOne
   @JoinColumn(
      name = "id_type_profil",
      nullable = false
   )
   private TypeProfil typeProfil;

   public Cotisation() {
   }

   public int getIdCotisation() {
      return this.idCotisation;
   }

   public void setIdCotisation(int idCotisation) {
      this.idCotisation = idCotisation;
   }

   public double getMontant() {
      return this.montant;
   }

   public void setMontant(double montant) {
      this.montant = montant;
   }

   public int getPeriodicite() {
      return this.periodicite;
   }

   public void setPeriodicite(int periodicite) {
      this.periodicite = periodicite;
   }

   public TypeProfil getTypeProfil() {
      return this.typeProfil;
   }

   public void setTypeProfil(TypeProfil typeProfil) {
      this.typeProfil = typeProfil;
   }
}
