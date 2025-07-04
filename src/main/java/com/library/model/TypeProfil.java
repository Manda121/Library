package com.library.model;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(
   name = "type_profil"
)
public class TypeProfil {
   @Id
   @GeneratedValue(
      strategy = GenerationType.IDENTITY
   )
   @Column(
      name = "id_type_profil"
   )
   private int idTypeProfil;
   @Column(
      name = "nom"
   )
   private String nom;
   @Column(
      name = "nb_livre_max"
   )
   private int nbLivreMax;
   @Column(
      name = "nb_jour_penalite"
   )
   private int nbJourPenalite;
   @Column(
      name = "nb_prologement_max"
   )
   private int nbProlongementMax;
   @Column(
      name = "amande_penalite"
   )
   private int amandePenalite;
   @Column(
      name = "description"
   )
   private String description;

   public TypeProfil() {
   }

   public int getIdTypeProfil() {
      return this.idTypeProfil;
   }

   public void setIdTypeProfil(int idTypeProfil) {
      this.idTypeProfil = idTypeProfil;
   }

   public String getNom() {
      return this.nom;
   }

   public void setNom(String nom) {
      this.nom = nom;
   }

   public int getNbLivreMax() {
      return this.nbLivreMax;
   }

   public void setNbLivreMax(int nbLivreMax) {
      this.nbLivreMax = nbLivreMax;
   }

   public int getNbJourPenalite() {
      return this.nbJourPenalite;
   }

   public void setNbJourPenalite(int nbJourPenalite) {
      this.nbJourPenalite = nbJourPenalite;
   }

   public int getNbProlongementMax() {
      return this.nbProlongementMax;
   }

   public void setNbProlongementMax(int nbProlongementMax) {
      this.nbProlongementMax = nbProlongementMax;
   }

   public int getAmandePenalite() {
      return this.amandePenalite;
   }

   public void setAmandePenalite(int amandePenalite) {
      this.amandePenalite = amandePenalite;
   }

   public String getDescription() {
      return this.description;
   }

   public void setDescription(String description) {
      this.description = description;
   }
}
