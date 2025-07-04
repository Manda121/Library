package com.library.service;

import com.library.model.Adherent;
import com.library.model.Pret;
import com.library.model.Prolongement;
import com.library.model.Reservation;
import com.library.model.StatutProlongement;
import com.library.repository.AdherentRepository;
import com.library.repository.JourFerierRepository;
import com.library.repository.PretRenduRepository;
import com.library.repository.PretRepository;
import com.library.repository.ProlongementRepository;
import com.library.repository.ReservationRepository;
import com.library.repository.StatutProlongementRepository;
import java.time.LocalDate;
import java.util.List;
import java.util.stream.Collectors;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class ProlongementService {
   @Autowired
   private AdherentRepository adherentRepository;
   @Autowired
   private PretRepository pretRepository;
   @Autowired
   private PretRenduRepository pretRenduRepository;
   @Autowired
   private ProlongementRepository prolongementRepository;
   @Autowired
   private StatutProlongementRepository statutProlongementRepository;
   @Autowired
   private ReservationRepository reservationRepository;
   @Autowired
   private JourFerierRepository jourFerierRepository;

   public ProlongementService() {
   }

   public List<Pret> getActivePretsForAdherent(int adherentId) {
      return this.pretRepository.findActivePretsByAdherentId(adherentId);
   }

   public List<Prolongement> getPendingProlongements() {
      return this.prolongementRepository.findPendingProlongements();
   }

   @Transactional
    public String processProlongement(int adherentId, int pretId, int nbJourProlongement) {
        // Check adherent status
        Adherent adherent = adherentRepository.findById(adherentId).orElse(null);
        if (adherent == null || adherent.getStatut().getIdStatut() != 1) {
            return "L'adhérent n'est pas actif ou n'existe pas.";
        }

        // Check if pret exists and is active
        Pret pret = pretRepository.findById(pretId).orElse(null);
        if (pret == null || pret.getAdherent().getIdAdherent() != adherentId) {
            return "Prêt non trouvé ou ne appartient pas à cet adhérent.";
        }
        if (pretRenduRepository.existsByPret(pret)) {
            return "Ce prêt a déjà été rendu.";
        }

        // Check extension limit
        int maxProlongements = adherent.getTypeProfil().getNbProlongementMax();
        List<Prolongement> activeProlongements = prolongementRepository.findActiveProlongementsByPretId(pretId);
        if (activeProlongements.size() >= maxProlongements) {
            return "La limite de prolongements (" + maxProlongements + ") pour ce prêt est atteinte.";
        }

        // Calculate new return date
        LocalDate newReturnDate = pret.getDateRemise().plusDays(nbJourProlongement);

        // Adjust new return date if it falls on a holiday
        String holidayMessage = "";
        LocalDate adjustedReturnDate = newReturnDate;
        while (jourFerierRepository.existsByDateJourFerier(adjustedReturnDate)) {
            adjustedReturnDate = adjustedReturnDate.minusDays(1);
            holidayMessage = "La date de remise prolongée a été ajustée au " + adjustedReturnDate + " car le jour initial était férié.";
        }

        // Check for accepted reservations before adjusted return date
        LocalDate finalReturnDate = adjustedReturnDate; // Effectively final for lambda
        List<Reservation> acceptedReservations = reservationRepository.findPendingOrAcceptedReservationsByExemplaireId(pret.getExemplaire().getIdExemplaire())
                .stream()
                .filter(r -> r.getEtatReservation().getIdEtatReservation() == 2)
                .filter(r -> r.getDatePret().isBefore(finalReturnDate))
                .collect(Collectors.toList());
        if (!acceptedReservations.isEmpty()) {
            return "Une réservation acceptée existe pour cet exemplaire avant la nouvelle date de remise.";
        }

        // Create prolongement request
        Prolongement prolongement = new Prolongement();
        prolongement.setPret(pret);
        prolongement.setNbJourProlongement(nbJourProlongement);
        StatutProlongement pendingState = statutProlongementRepository.findById(3).orElseThrow(() -> new RuntimeException("Pending prolongement state not found"));
        prolongement.setStatutProlongement(pendingState);
        prolongementRepository.save(prolongement);

        return holidayMessage.isEmpty() ? "Demande de prolongement enregistrée avec succès." : holidayMessage;
    }
    
   @Transactional
   public String processProlongementDecision(int prolongementId, boolean accept) {
      Prolongement prolongement = (Prolongement)this.prolongementRepository.findById(prolongementId).orElse(null);
      if (prolongement == null) {
         return "Demande de prolongement non trouvée.";
      } else if (prolongement.getStatutProlongement().getIdStatutProlongement() != 3) {
         return "Cette demande de prolongement a déjà été traitée.";
      } else {
         StatutProlongement newStatus = (StatutProlongement)this.statutProlongementRepository.findById(accept ? 1 : 2).orElseThrow(() -> {
            return new RuntimeException("Statut prolongement not found");
         });
         prolongement.setStatutProlongement(newStatus);
         this.prolongementRepository.save(prolongement);
         if (accept) {
            Pret pret = prolongement.getPret();
            LocalDate newReturnDate = pret.getDateRemise().plusDays((long)prolongement.getNbJourProlongement());
            pret.setDateRemise(newReturnDate);
            this.pretRepository.save(pret);
            return "Prolongement accepté. Nouvelle date de remise: " + newReturnDate + ".";
         } else {
            return "Prolongement rejeté.";
         }
      }
   }
}
