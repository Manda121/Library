package com.library.model;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(
   name = "mode_paiment"
)
public class ModePaiment {
   @Id
   @GeneratedValue(
      strategy = GenerationType.IDENTITY
   )
   @Column(
      name = "id_mode_paiment"
   )
   private int idModePaiment;
   @Column(
      name = "nom"
   )
   private String nom;
   @Column(
      name = "description"
   )
   private String description;

   public ModePaiment() {
   }

   public int getIdModePaiment() {
      return this.idModePaiment;
   }

   public void setIdModePaiment(int idModePaiment) {
      this.idModePaiment = idModePaiment;
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
}
