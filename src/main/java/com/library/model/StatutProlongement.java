package com.library.model;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(
   name = "statut_prolongement"
)
public class StatutProlongement {
   @Id
   @Column(
      name = "id_statut_prolongement"
   )
   private int idStatutProlongement;
   @Column(
      name = "nom"
   )
   private String nom;
   @Column(
      name = "description"
   )
   private String description;

   public StatutProlongement() {
   }

   public int getIdStatutProlongement() {
      return this.idStatutProlongement;
   }

   public void setIdStatutProlongement(int idStatutProlongement) {
      this.idStatutProlongement = idStatutProlongement;
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
