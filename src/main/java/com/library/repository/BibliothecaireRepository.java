package com.library.repository;

import com.library.model.Bibliothecaire;
import org.springframework.data.jpa.repository.JpaRepository;

public interface BibliothecaireRepository extends JpaRepository<Bibliothecaire, Integer> {
   Bibliothecaire findByEmailAndMotDePasse(String var1, String var2);
}
