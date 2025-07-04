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
   name = "pret"
)
public class Pret {
   @Id
   @GeneratedValue(
      strategy = GenerationType.IDENTITY
   )
   @Column(
      name = "id_pret"
   )
   private int idPret;
   @ManyToOne
   @JoinColumn(
      name = "id_exemplaire"
   )
   private Exemplaire exemplaire;
   @Column(
      name = "date_pret"
   )
   private LocalDate datePret;
   @Column(
      name = "date_remise"
   )
   private LocalDate dateRemise;
   @ManyToOne
   @JoinColumn(
      name = "id_type_lecture",
      nullable = false
   )
   private TypeLecture typeLecture;
   @ManyToOne
   @JoinColumn(
      name = "id_adherent",
      nullable = false
   )
   private Adherent adherent;

   public Pret() {
   }

   public int getIdPret() {
      return this.idPret;
   }

   public void setIdPret(int idPret) {
      this.idPret = idPret;
   }

   public Exemplaire getExemplaire() {
      return this.exemplaire;
   }

   public void setExemplaire(Exemplaire exemplaire) {
      this.exemplaire = exemplaire;
   }

   public LocalDate getDatePret() {
      return this.datePret;
   }

   public void setDatePret(LocalDate datePret) {
      this.datePret = datePret;
   }

   public LocalDate getDateRemise() {
      return this.dateRemise;
   }

   public void setDateRemise(LocalDate dateRemise) {
      this.dateRemise = dateRemise;
   }

   public TypeLecture getTypeLecture() {
      return this.typeLecture;
   }

   public void setTypeLecture(TypeLecture typeLecture) {
      this.typeLecture = typeLecture;
   }

   public Adherent getAdherent() {
      return this.adherent;
   }

   public void setAdherent(Adherent adherent) {
      this.adherent = adherent;
   }
}
