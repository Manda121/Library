package com.library.model;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(
   name = "status"
)
public class Statut {
   @Id
   @GeneratedValue(
      strategy = GenerationType.IDENTITY
   )
   @Column(
      name = "id_statut"
   )
   private int idStatut;
   @Column(
      name = "nom"
   )
   private String nom;
   @Column(
      name = "description"
   )
   private String description;

   public Statut() {
   }

   public int getIdStatut() {
      return this.idStatut;
   }

   public void setIdStatut(int idStatut) {
      this.idStatut = idStatut;
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
