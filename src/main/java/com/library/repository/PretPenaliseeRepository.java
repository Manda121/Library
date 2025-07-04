package com.library.repository;

import com.library.model.Pret;
import com.library.model.PretPenalisee;
import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

public interface PretPenaliseeRepository extends JpaRepository<PretPenalisee, Integer> {
   boolean existsByPret(Pret var1);

   @Query("SELECT pp FROM PretPenalisee pp WHERE pp.pret.adherent.idAdherent = :adherentId")
   List<PretPenalisee> findByAdherentId(@Param("adherentId") int var1);
}
