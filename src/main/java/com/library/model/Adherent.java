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
   name = "adherent"
)
public class Adherent {
   @Id
   @GeneratedValue(
      strategy = GenerationType.IDENTITY
   )
   @Column(
      name = "id_adherent"
   )
   private int idAdherent;
   @Column(
      name = "nom"
   )
   private String nom;
   @Column(
      name = "email"
   )
   private String email;
   @Column(
      name = "prenom"
   )
   private String prenom;
   @Column(
      name = "tel"
   )
   private String tel;
   @Column(
      name = "date_naissance"
   )
   private String dateNaissance;
   @Column(
      name = "mot_de_passe"
   )
   private String motDePasse;
   @ManyToOne
   @JoinColumn(
      name = "id_statut",
      nullable = false
   )
   private Statut statut;
   @ManyToOne
   @JoinColumn(
      name = "id_type_profil",
      nullable = false
   )
   private TypeProfil typeProfil;

   public Adherent() {
   }

   public int getIdAdherent() {
      return this.idAdherent;
   }

   public void setIdAdherent(int idAdherent) {
      this.idAdherent = idAdherent;
   }

   public String getNom() {
      return this.nom;
   }

   public void setNom(String nom) {
      this.nom = nom;
   }

   public String getEmail() {
      return this.email;
   }

   public void setEmail(String email) {
      this.email = email;
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

   public String getDateNaissance() {
      return this.dateNaissance;
   }

   public void setDateNaissance(String dateNaissance) {
      this.dateNaissance = dateNaissance;
   }

   public String getMotDePasse() {
      return this.motDePasse;
   }

   public void setMotDePasse(String motDePasse) {
      this.motDePasse = motDePasse;
   }

   public Statut getStatut() {
      return this.statut;
   }

   public void setStatut(Statut statut) {
      this.statut = statut;
   }

   public TypeProfil getTypeProfil() {
      return this.typeProfil;
   }

   public void setTypeProfil(TypeProfil typeProfil) {
      this.typeProfil = typeProfil;
   }
}
