package com.library.repository;

import com.library.model.Adherent;
import org.springframework.data.jpa.repository.JpaRepository;

public interface AdherentRepository extends JpaRepository<Adherent, Integer> {
   Adherent findByEmailAndMotDePasse(String var1, String var2);
}
