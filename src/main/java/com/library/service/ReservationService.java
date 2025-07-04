package com.library.service;

import com.library.model.Adherent;
import com.library.model.EtatReservation;
import com.library.model.Exemplaire;
import com.library.model.Pret;
import com.library.model.Reservation;
import com.library.repository.AdherentRepository;
import com.library.repository.EtatReservationRepository;
import com.library.repository.ExemplaireRepository;
import com.library.repository.JourFerierRepository;
import com.library.repository.PretRenduRepository;
import com.library.repository.PretRepository;
import com.library.repository.ReservationRepository;
import java.time.LocalDate;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class ReservationService {
   @Autowired
   private AdherentRepository adherentRepository;
   @Autowired
   private ExemplaireRepository exemplaireRepository;
   @Autowired
   private ReservationRepository reservationRepository;
   @Autowired
   private PretRepository pretRepository;
   @Autowired
   private PretRenduRepository pretRenduRepository;
   @Autowired
   private JourFerierRepository jourFerierRepository;
   @Autowired
   private EtatReservationRepository etatReservationRepository;

   public ReservationService() {
   }

   public List<Exemplaire> getAllExemplaires() {
      return this.exemplaireRepository.findAll();
   }

   public List<Reservation> getPendingReservations() {
      return this.reservationRepository.findPendingReservations();
   }

   public List<Pret> getActivePretsForAdherent(int adherentId) {
      return this.pretRepository.findActivePretsByAdherentId(adherentId);
   }

   @Transactional
   public String processReservation(int adherentId, int exemplaireId, LocalDate datePret) {
      Adherent adherent = (Adherent)this.adherentRepository.findById(adherentId).orElse(null);
      if (adherent == null) {
         return "Adhérent non trouvé.";
      } else if (adherent.getStatut().getIdStatut() == 2) {
         return "L'adhérent est suspendu.";
      } else if (adherent.getStatut().getIdStatut() == 3) {
         return "L'adhérent est inactif et doit se réabonner.";
      } else {
         long activeReservations = this.reservationRepository.countActiveReservationsByAdherentId(adherentId);
         if (activeReservations >= 3L) {
            return "L'adhérent a atteint la limite de 3 réservations actives.";
         } else {
            Exemplaire exemplaire = (Exemplaire)this.exemplaireRepository.findById(exemplaireId).orElse(null);
            if (exemplaire == null) {
               return "Exemplaire non trouvé.";
            } else {
               List<Pret> activeExemplairePrets = this.pretRepository.findActivePretsByExemplaireId(exemplaireId);
               List<Reservation> activeReservationsForExemplaire = this.reservationRepository.findPendingOrAcceptedReservationsByExemplaireId(exemplaireId);
               if (activeExemplairePrets.isEmpty() && !activeReservationsForExemplaire.stream().anyMatch((r) -> {
                  return r.getEtatReservation().getIdEtatReservation() == 2;
               })) {
                  String holidayMessage;
                  for(holidayMessage = ""; this.jourFerierRepository.existsByDateJourFerier(datePret); holidayMessage = "La date de prêt a été ajustée au " + datePret + " car le jour initial était férié.") {
                     datePret = datePret.plusDays(1L);
                  }

                  Reservation reservation = new Reservation();
                  reservation.setAdherent(adherent);
                  reservation.setExemplaire(exemplaire);
                  reservation.setDatePret(datePret);
                  EtatReservation pendingState = (EtatReservation)this.etatReservationRepository.findById(1).orElseThrow(() -> {
                     return new RuntimeException("Pending state not found");
                  });
                  reservation.setEtatReservation(pendingState);
                  this.reservationRepository.save(reservation);
                  return holidayMessage.isEmpty() ? "Réservation enregistrée avec succès." : holidayMessage;
               } else {
                  return "L'exemplaire est déjà prêté ou réservé (accepté).";
               }
            }
         }
      }
   }

   @Transactional
   public String processReservationAction(int reservationId, boolean accept) {
      Reservation reservation = (Reservation)this.reservationRepository.findById(reservationId).orElse(null);
      if (reservation != null && reservation.getEtatReservation().getIdEtatReservation() == 1) {
         if (accept) {
            Adherent adherent = reservation.getAdherent();
            if (adherent.getStatut().getIdStatut() != 1) {
               return "L'adhérent n'est pas actif.";
            } else {
               List<Pret> activePrets = this.pretRepository.findActivePretsByAdherentId(adherent.getIdAdherent());
               int maxLoans = adherent.getTypeProfil().getNbLivreMax();
               if (activePrets.size() >= maxLoans) {
                  return "L'adhérent a atteint le nombre maximum de prêts autorisés.";
               } else {
                  int exemplaireId = reservation.getExemplaire().getIdExemplaire();
                  List<Pret> activeExemplairePrets = this.pretRepository.findActivePretsByExemplaireId(exemplaireId);
                  List<Reservation> activeReservations = this.reservationRepository.findPendingOrAcceptedReservationsByExemplaireId(exemplaireId);
                  if (activeExemplairePrets.isEmpty() && !activeReservations.stream().anyMatch((r) -> {
                     return r.getIdReservation() != reservationId && r.getEtatReservation().getIdEtatReservation() == 2;
                  })) {
                     EtatReservation acceptedState = (EtatReservation)this.etatReservationRepository.findById(2).orElseThrow(() -> {
                        return new RuntimeException("Accepted state not found");
                     });
                     reservation.setEtatReservation(acceptedState);
                     this.reservationRepository.save(reservation);
                     return "Réservation acceptée avec succès.";
                  } else {
                     return "L'exemplaire est déjà prêté ou réservé (accepté).";
                  }
               }
            }
         } else {
            EtatReservation rejectedState = (EtatReservation)this.etatReservationRepository.findById(3).orElseThrow(() -> {
               return new RuntimeException("Rejected state not found");
            });
            reservation.setEtatReservation(rejectedState);
            this.reservationRepository.save(reservation);
            return "Réservation refusée avec succès.";
         }
      } else {
         return "Réservation non trouvée ou déjà traitée.";
      }
   }
}
