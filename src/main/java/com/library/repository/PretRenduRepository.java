package com.library.repository;

import com.library.model.Pret;
import com.library.model.PretRendu;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

public interface PretRenduRepository extends JpaRepository<PretRendu, Integer> {
   @Query("SELECT COUNT(pr) > 0 FROM PretRendu pr WHERE pr.pret = :pret")
   boolean existsByPret(@Param("pret") Pret var1);
}
