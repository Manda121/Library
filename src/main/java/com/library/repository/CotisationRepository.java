package com.library.repository;

import com.library.model.Cotisation;
import org.springframework.data.jpa.repository.JpaRepository;

public interface CotisationRepository extends JpaRepository<Cotisation, Integer> {
}
