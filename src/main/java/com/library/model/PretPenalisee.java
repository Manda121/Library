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
   name = "pret_penalisee"
)
public class PretPenalisee {
   @Id
   @GeneratedValue(
      strategy = GenerationType.IDENTITY
   )
   @Column(
      name = "id_pret_penalisee"
   )
   private int idPretPenalisee;
   @Column(
      name = "date_remise_penalisee"
   )
   private LocalDate dateRemisePenalisee;
   @Column(
      name = "description"
   )
   private String description;
   @ManyToOne
   @JoinColumn(
      name = "id_pret",
      nullable = false
   )
   private Pret pret;

   public PretPenalisee() {
   }

   public int getIdPretPenalisee() {
      return this.idPretPenalisee;
   }

   public void setIdPretPenalisee(int idPretPenalisee) {
      this.idPretPenalisee = idPretPenalisee;
   }

   public LocalDate getDateRemisePenalisee() {
      return this.dateRemisePenalisee;
   }

   public void setDateRemisePenalisee(LocalDate dateRemisePenalisee) {
      this.dateRemisePenalisee = dateRemisePenalisee;
   }

   public String getDescription() {
      return this.description;
   }

   public void setDescription(String description) {
      this.description = description;
   }

   public Pret getPret() {
      return this.pret;
   }

   public void setPret(Pret pret) {
      this.pret = pret;
   }
}
