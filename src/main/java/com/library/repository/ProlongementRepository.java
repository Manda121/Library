package com.library.repository;

import com.library.model.Prolongement;
import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

public interface ProlongementRepository extends JpaRepository<Prolongement, Integer> {
   @Query("SELECT p FROM Prolongement p WHERE p.pret.idPret = :pretId AND p.statutProlongement.idStatutProlongement IN (1, 3)")
   List<Prolongement> findActiveProlongementsByPretId(@Param("pretId") int var1);

   @Query("SELECT p FROM Prolongement p WHERE p.statutProlongement.idStatutProlongement = 3")
   List<Prolongement> findPendingProlongements();
}
