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
   name = "abonnement"
)
public class Abonnement {
   @Id
   @GeneratedValue(
      strategy = GenerationType.IDENTITY
   )
   @Column(
      name = "id_abonnement"
   )
   private int idAbonnement;
   @Column(
      name = "date_abonnement"
   )
   private LocalDate dateAbonnement;
   @ManyToOne
   @JoinColumn(
      name = "id_adherent",
      nullable = false
   )
   private Adherent adherent;
   @ManyToOne
   @JoinColumn(
      name = "id_mode_paiment",
      nullable = false
   )
   private ModePaiment modePaiment;

   public Abonnement() {
   }

   public int getIdAbonnement() {
      return this.idAbonnement;
   }

   public void setIdAbonnement(int idAbonnement) {
      this.idAbonnement = idAbonnement;
   }

   public LocalDate getDateAbonnement() {
      return this.dateAbonnement;
   }

   public void setDateAbonnement(LocalDate dateAbonnement) {
      this.dateAbonnement = dateAbonnement;
   }

   public Adherent getAdherent() {
      return this.adherent;
   }

   public void setAdherent(Adherent adherent) {
      this.adherent = adherent;
   }

   public ModePaiment getModePaiment() {
      return this.modePaiment;
   }

   public void setModePaiment(ModePaiment modePaiment) {
      this.modePaiment = modePaiment;
   }
}
