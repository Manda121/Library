package com.library.repository;

import com.library.model.Exemplaire;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

public interface ExemplaireRepository extends JpaRepository<Exemplaire, Integer> {
   @Query("SELECT COUNT(r) FROM Reservation r WHERE r.exemplaire.idExemplaire = :exemplaireId AND r.etatReservation.idEtatReservation = 2")
   int countAcceptedReservationsByExemplaireId(@Param("exemplaireId") int var1);

   @Query("SELECT COUNT(p) FROM Pret p WHERE p.exemplaire.idExemplaire = :exemplaireId AND p.idPret NOT IN (SELECT pr.pret.idPret FROM PretRendu pr)")
   int countActivePretsByExemplaireId(@Param("exemplaireId") int var1);

   @Query("SELECT COUNT(l) FROM Livre l WHERE l.exemplaire.idExemplaire = :exemplaireId")
   int countLivresByExemplaireId(@Param("exemplaireId") int var1);
}
