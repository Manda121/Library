package com.library.model;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(
   name = "exemplaire"
)
public class Exemplaire {
   @Id
   @GeneratedValue(
      strategy = GenerationType.IDENTITY
   )
   @Column(
      name = "id_exemplaire"
   )
   private int idExemplaire;
   @Column(
      name = "nom"
   )
   private String nom;
   @Column(
      name = "description"
   )
   private String description;
   @Column(
      name = "image_couverture"
   )
   private String imageCouverture;
   @Column(
      name = "titre"
   )
   private String titre;
   @Column(
      name = "age_minimal"
   )
   private int ageMinimal;

   public Exemplaire() {
   }

   public int getIdExemplaire() {
      return this.idExemplaire;
   }

   public void setIdExemplaire(int idExemplaire) {
      this.idExemplaire = idExemplaire;
   }

   public String getNom() {
      return this.nom;
   }

   public void setNom(String nom) {
      this.nom = nom;
   }

   public String getDescription() {
      return this.description;
   }

   public void setDescription(String description) {
      this.description = description;
   }

   public String getImageCouverture() {
      return this.imageCouverture;
   }

   public void setImageCouverture(String imageCouverture) {
      this.imageCouverture = imageCouverture;
   }

   public String getTitre() {
      return this.titre;
   }

   public void setTitre(String titre) {
      this.titre = titre;
   }

   public int getAgeMinimal() {
      return this.ageMinimal;
   }

   public void setAgeMinimal(int ageMinimal) {
      this.ageMinimal = ageMinimal;
   }
}
