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
   name = "prolongement"
)
public class Prolongement {
   @Id
   @GeneratedValue(
      strategy = GenerationType.IDENTITY
   )
   @Column(
      name = "id_prolongement"
   )
   private int idProlongement;
   @ManyToOne
   @JoinColumn(
      name = "id_pret",
      nullable = false
   )
   private Pret pret;
   @Column(
      name = "nb_jour_prolongement"
   )
   private int nbJourProlongement;
   @ManyToOne
   @JoinColumn(
      name = "id_statut_prolongement",
      nullable = false
   )
   private StatutProlongement statutProlongement;

   public Prolongement() {
   }

   public int getIdProlongement() {
      return this.idProlongement;
   }

   public void setIdProlongement(int idProlongement) {
      this.idProlongement = idProlongement;
   }

   public Pret getPret() {
      return this.pret;
   }

   public void setPret(Pret pret) {
      this.pret = pret;
   }

   public int getNbJourProlongement() {
      return this.nbJourProlongement;
   }

   public void setNbJourProlongement(int nbJourProlongement) {
      this.nbJourProlongement = nbJourProlongement;
   }

   public StatutProlongement getStatutProlongement() {
      return this.statutProlongement;
   }

   public void setStatutProlongement(StatutProlongement statutProlongement) {
      this.statutProlongement = statutProlongement;
   }
}
