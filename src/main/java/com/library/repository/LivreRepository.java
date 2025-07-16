package com.library.repository;

import com.library.model.Livre;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface LivreRepository extends JpaRepository<Livre, Integer> {
    
    // Méthode pour trouver tous les livres d'un exemplaire donné
    @Query("SELECT l FROM Livre l WHERE l.exemplaire.id = :exemplaireId")
    List<Livre> findByExemplaireId(@Param("exemplaireId") Integer exemplaireId);
}