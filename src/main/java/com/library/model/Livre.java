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
   name = "livre"
)
public class Livre {
   @Id
   @GeneratedValue(
      strategy = GenerationType.IDENTITY
   )
   @Column(
      name = "id_livre"
   )
   private int idLivre;
   @Column(
      name = "nbpage"
   )
   private int nbPage;
   @ManyToOne
   @JoinColumn(
      name = "id_exemplaire",
      nullable = false
   )
   private Exemplaire exemplaire;

   public Livre() {
   }

   public int getIdLivre() {
      return this.idLivre;
   }

   public void setIdLivre(int idLivre) {
      this.idLivre = idLivre;
   }

   public int getNbPage() {
      return this.nbPage;
   }

   public void setNbPage(int nbPage) {
      this.nbPage = nbPage;
   }

   public Exemplaire getExemplaire() {
      return this.exemplaire;
   }

   public void setExemplaire(Exemplaire exemplaire) {
      this.exemplaire = exemplaire;
   }
}
