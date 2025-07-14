package com.library.repository;

import com.library.model.Abonnement;
import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

public interface AbonnementRepository extends JpaRepository<Abonnement, Integer> {
   @Query("SELECT a FROM Abonnement a WHERE a.adherent.idAdherent = :adherentId ORDER BY a.dateAbonnement DESC")
   List<Abonnement> findByAdherentId(@Param("adherentId") int var1);
}
