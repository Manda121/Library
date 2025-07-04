package com.library.service;

import com.library.model.Abonnement;
import com.library.model.Adherent;
import com.library.model.Cotisation;
import com.library.model.PretPenalisee;
import com.library.model.Statut;
import com.library.repository.AbonnementRepository;
import com.library.repository.AdherentRepository;
import com.library.repository.CotisationRepository;
import com.library.repository.PretPenaliseeRepository;
import com.library.repository.StatutRepository;
import java.time.LocalDate;
import java.util.List;
import java.util.stream.Collectors;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class PenaltyService {
   @Autowired
   private AdherentRepository adherentRepository;
   @Autowired
   private PretPenaliseeRepository pretPenaliseeRepository;
   @Autowired
   private AbonnementRepository abonnementRepository;
   @Autowired
   private CotisationRepository cotisationRepository;
   @Autowired
   private StatutRepository statutRepository;

   public PenaltyService() {
   }

   public List<Adherent> getPenalizedAdherents() {
      return (List)this.adherentRepository.findAll().stream().filter((adherent) -> {
         return adherent.getStatut().getIdStatut() == 2;
      }).collect(Collectors.toList());
   }

   @Transactional
   public String removePenalty(int adherentId) {
      Adherent adherent = adherentRepository.findById(adherentId).orElse(null);
      if (adherent != null && adherent.getStatut().getIdStatut() == 2) {
         List<PretPenalisee> penalties = this.pretPenaliseeRepository.findByAdherentId(adherentId);
         if (penalties.isEmpty()) {
            return "Aucune pénalité trouvée pour cet adhérent.";
         } else {
            LocalDate today = LocalDate.now();
            LocalDate latestPenaltyEndDate = (LocalDate)penalties.stream().map((p) -> {
               return p.getDateRemisePenalisee().plusDays((long)adherent.getTypeProfil().getNbJourPenalite());
            }).max(LocalDate::compareTo).orElseThrow(() -> {
               return new RuntimeException("Error calculating penalty end date");
            });
            if (today.isBefore(latestPenaltyEndDate)) {
               return "La période de pénalité n'est pas encore terminée. Peut être levée après le " + latestPenaltyEndDate + ".";
            } else {
               List<Abonnement> abonnements = this.abonnementRepository.findByAdherentId(adherentId);
               if (abonnements.isEmpty()) {
                  Statut inactiveStatus = (Statut)this.statutRepository.findById(3).orElseThrow(() -> {
                     return new RuntimeException("Inactive status not found");
                  });
                  adherent.setStatut(inactiveStatus);
                  this.adherentRepository.save(adherent);
                  return "Pénalité levée, mais l'adhérent n'a pas d'abonnement actif. Statut changé à inactif.";
               } else {
                  Abonnement latestAbonnement = (Abonnement)abonnements.get(0);
                  Cotisation cotisation = (Cotisation)this.cotisationRepository.findAll().stream().filter((c) -> {
                     return c.getTypeProfil().getIdTypeProfil() == adherent.getTypeProfil().getIdTypeProfil();
                  }).findFirst().orElseThrow(() -> {
                     return new RuntimeException("Cotisation not found for type_profil");
                  });
                  LocalDate subscriptionEndDate = latestAbonnement.getDateAbonnement().plusDays((long)cotisation.getPeriodicite());
                  Statut newStatus = today.isAfter(subscriptionEndDate) ? (Statut)this.statutRepository.findById(3).orElseThrow(() -> {
                     return new RuntimeException("Inactive status not found");
                  }) : (Statut)this.statutRepository.findById(1).orElseThrow(() -> {
                     return new RuntimeException("Active status not found");
                  });
                  adherent.setStatut(newStatus);
                  this.adherentRepository.save(adherent);
                  return newStatus.getIdStatut() == 1 ? "Pénalité levée avec succès. L'adhérent est maintenant actif." : "Pénalité levée, mais l'abonnement a expiré. Statut changé à inactif.";
               }
            }
         }
      } else {
         return "L'adhérent n'est pas suspendu ou n'existe pas.";
      }
   }
}
