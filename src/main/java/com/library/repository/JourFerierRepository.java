package com.library.repository;

import com.library.model.JourFerier;
import java.time.LocalDate;
import org.springframework.data.jpa.repository.JpaRepository;

public interface JourFerierRepository extends JpaRepository<JourFerier, Integer> {
   boolean existsByDateJourFerier(LocalDate var1);
}
