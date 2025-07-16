package com.library.repository;

import com.library.model.Adherent;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

public interface AdherentRepository extends JpaRepository<Adherent, Integer> {
   Adherent findByEmailAndMotDePasse(String var1, String var2);
   // Méthode pour trouver un adhérent par email (utile pour l'authentification)
    Optional<Adherent> findByEmail(String email);
    
    // Méthode pour trouver un adhérent avec ses relations chargées
    @Query("SELECT a FROM Adherent a JOIN FETCH a.statut JOIN FETCH a.typeProfil WHERE a.idAdherent = :id")
    Optional<Adherent> findByIdWithDetails(@Param("id") Integer id);
}
