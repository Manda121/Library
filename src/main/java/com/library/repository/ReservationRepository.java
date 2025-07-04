package com.library.repository;

import com.library.model.Reservation;
import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

public interface ReservationRepository extends JpaRepository<Reservation, Integer> {
   @Query("SELECT r FROM Reservation r WHERE r.exemplaire.idExemplaire = :exemplaireId AND r.etatReservation.idEtatReservation = 2")
   List<Reservation> findPendingOrAcceptedReservationsByExemplaireId(@Param("exemplaireId") int var1);

   @Query("SELECT COUNT(r) FROM Reservation r WHERE r.adherent.idAdherent = :adherentId AND r.etatReservation.idEtatReservation IN (1, 2)")
   long countActiveReservationsByAdherentId(@Param("adherentId") int var1);

   @Query("SELECT r FROM Reservation r WHERE r.etatReservation.idEtatReservation = 1")
   List<Reservation> findPendingReservations();
}
