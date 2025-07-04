package com.library.model;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(
   name = "type_lecture"
)
public class TypeLecture {
   @Id
   @GeneratedValue(
      strategy = GenerationType.IDENTITY
   )
   @Column(
      name = "id_type_lecture"
   )
   private int idTypeLecture;
   @Column(
      name = "nom"
   )
   private String nom;
   @Column(
      name = "description"
   )
   private String description;

   public TypeLecture() {
   }

   public int getIdTypeLecture() {
      return this.idTypeLecture;
   }

   public void setIdTypeLecture(int idTypeLecture) {
      this.idTypeLecture = idTypeLecture;
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
