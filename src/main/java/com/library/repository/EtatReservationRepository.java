package com.library.repository;

import com.library.model.EtatReservation;
import org.springframework.data.jpa.repository.JpaRepository;

public interface EtatReservationRepository extends JpaRepository<EtatReservation, Integer> {
}
