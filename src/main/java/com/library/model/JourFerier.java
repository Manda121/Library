package com.library.model;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import java.time.LocalDate;

@Entity
@Table(
   name = "jour_ferier"
)
public class JourFerier {
   @Id
   @GeneratedValue(
      strategy = GenerationType.IDENTITY
   )
   @Column(
      name = "id_jour_ferier"
   )
   private int idJourFerier;
   @Column(
      name = "date_jour_ferier"
   )
   private LocalDate dateJourFerier;
   @Column(
      name = "description"
   )
   private String description;

   public JourFerier() {
   }

   public int getIdJourFerier() {
      return this.idJourFerier;
   }

   public void setIdJourFerier(int idJourFerier) {
      this.idJourFerier = idJourFerier;
   }

   public LocalDate getDateJourFerier() {
      return this.dateJourFerier;
   }

   public void setDateJourFerier(LocalDate dateJourFerier) {
      this.dateJourFerier = dateJourFerier;
   }

   public String getDescription() {
      return this.description;
   }

   public void setDescription(String description) {
      this.description = description;
   }
}
