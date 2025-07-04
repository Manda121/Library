package com.library.model;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;
import java.time.LocalDate;

@Entity
@Table(
   name = "pret_rendu"
)
public class PretRendu {
   @Id
   @GeneratedValue(
      strategy = GenerationType.IDENTITY
   )
   @Column(
      name = "id_pret_rendu"
   )
   private int idPretRendu;
   @Column(
      name = "id_pret"
   )
   private int idPret;
   @Column(
      name = "date_remise_reel"
   )
   private LocalDate dateRemiseReel;
   @ManyToOne
   @JoinColumn(
      name = "id_pret_1",
      nullable = false
   )
   private Pret pret;

   public PretRendu() {
   }

   public int getIdPretRendu() {
      return this.idPretRendu;
   }

   public void setIdPretRendu(int idPretRendu) {
      this.idPretRendu = idPretRendu;
   }

   public int getIdPret() {
      return this.idPret;
   }

   public void setIdPret(int idPret) {
      this.idPret = idPret;
   }

   public LocalDate getDateRemiseReel() {
      return this.dateRemiseReel;
   }

   public void setDateRemiseReel(LocalDate dateRemiseReel) {
      this.dateRemiseReel = dateRemiseReel;
   }

   public Pret getPret() {
      return this.pret;
   }

   public void setPret(Pret pret) {
      this.pret = pret;
   }
}
