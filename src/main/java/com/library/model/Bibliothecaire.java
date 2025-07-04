package com.library.model;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(
   name = "bibliothecaire"
)
public class Bibliothecaire {
   @Id
   @GeneratedValue(
      strategy = GenerationType.IDENTITY
   )
   @Column(
      name = "id_bibliothecaire"
   )
   private int idBibliothecaire;
   @Column(
      name = "nom"
   )
   private String nom;
   @Column(
      name = "prenom"
   )
   private String prenom;
   @Column(
      name = "tel"
   )
   private String tel;
   @Column(
      name = "email"
   )
   private String email;
   @Column(
      name = "mot_de_passe"
   )
   private String motDePasse;

   public Bibliothecaire() {
   }

   public int getIdBibliothecaire() {
      return this.idBibliothecaire;
   }

   public void setIdBibliothecaire(int idBibliothecaire) {
      this.idBibliothecaire = idBibliothecaire;
   }

   public String getNom() {
      return this.nom;
   }

   public void setNom(String nom) {
      this.nom = nom;
   }

   public String getPrenom() {
      return this.prenom;
   }

   public void setPrenom(String prenom) {
      this.prenom = prenom;
   }

   public String getTel() {
      return this.tel;
   }

   public void setTel(String tel) {
      this.tel = tel;
   }

   public String getEmail() {
      return this.email;
   }

   public void setEmail(String email) {
      this.email = email;
   }

   public String getMotDePasse() {
      return this.motDePasse;
   }

   public void setMotDePasse(String motDePasse) {
      this.motDePasse = motDePasse;
   }
}
