package com.library.repository;

import com.library.model.Pret;
import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

public interface PretRepository extends JpaRepository<Pret, Integer> {
   @Query("SELECT p FROM Pret p WHERE p.exemplaire.idExemplaire = :exemplaireId AND p.idPret NOT IN (SELECT pr.pret.idPret FROM PretRendu pr)")
   List<Pret> findActivePretsByExemplaireId(@Param("exemplaireId") int var1);

   @Query("SELECT p FROM Pret p WHERE p.adherent.idAdherent = :adherentId AND p.idPret NOT IN (SELECT pr.pret.idPret FROM PretRendu pr)")
   List<Pret> findActivePretsByAdherentId(@Param("adherentId") int var1);

   @Query("SELECT p FROM Pret p WHERE p.idPret NOT IN (SELECT pr.pret.idPret FROM PretRendu pr)")
   List<Pret> findActivePrets();

   // Méthode existante pour les prêts actifs par exemplaire
    @Query("SELECT p FROM Pret p WHERE p.exemplaire.id = :exemplaireId AND p.id NOT IN " +
           "(SELECT pr.pret.id FROM PretRendu pr)")
    List<Pret> findActivePretsByExemplaireId(@Param("exemplaireId") Integer exemplaireId);
    
    // Nouvelle méthode pour les prêts actifs par adhérent
    @Query("SELECT p FROM Pret p WHERE p.adherent.idAdherent = :adherentId AND p.id NOT IN " +
           "(SELECT pr.pret.id FROM PretRendu pr)")
    List<Pret> findActivePretsByAdherentId(@Param("adherentId") Integer adherentId);
    
    // Méthode pour compter les prêts actifs d'un adhérent
    @Query("SELECT COUNT(p) FROM Pret p WHERE p.adherent.idAdherent = :adherentId AND p.id NOT IN " +
           "(SELECT pr.pret.id FROM PretRendu pr)")
    Long countActivePretsByAdherentId(@Param("adherentId") Integer adherentId);
}