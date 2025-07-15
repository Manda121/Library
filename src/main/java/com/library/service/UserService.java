package com.library.service;

import com.library.model.Abonnement;
import com.library.model.Adherent;
import com.library.model.Bibliothecaire;
import com.library.model.Cotisation;
import com.library.model.EtatReservation;
import com.library.model.Exemplaire;
import com.library.model.Pret;
import com.library.model.PretPenalisee;
import com.library.model.PretRendu;
import com.library.model.Reservation;
import com.library.model.Statut;
import com.library.model.TypeLecture;
import com.library.repository.AbonnementRepository;
import com.library.repository.AdherentRepository;
import com.library.repository.BibliothecaireRepository;
import com.library.repository.CotisationRepository;
import com.library.repository.EtatReservationRepository;
import com.library.repository.ExemplaireRepository;
import com.library.repository.JourFerierRepository;
import com.library.repository.PretPenaliseeRepository;
import com.library.repository.PretRenduRepository;
import com.library.repository.PretRepository;
import com.library.repository.ReservationRepository;
import com.library.repository.StatutRepository;
import com.library.repository.TypeLectureRepository;
import java.time.LocalDate;
import java.time.Period;
import java.time.format.DateTimeFormatter;
import java.time.format.DateTimeParseException;
import java.util.Iterator;
import java.util.List;
import java.util.stream.Collectors;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class UserService {
   @Autowired
   private AdherentRepository adherentRepository;
   @Autowired
   private BibliothecaireRepository bibliothecaireRepository;
   @Autowired
   private ExemplaireRepository exemplaireRepository;
   @Autowired
   private PretRepository pretRepository;
   @Autowired
   private PretRenduRepository pretRenduRepository;
   @Autowired
   private PretPenaliseeRepository pretPenaliseeRepository;
   @Autowired
   private ReservationRepository reservationRepository;
   @Autowired
   private JourFerierRepository jourFerierRepository;
   @Autowired
   private TypeLectureRepository typeLectureRepository;
   @Autowired
   private EtatReservationRepository etatReservationRepository;
   @Autowired
   private StatutRepository statutRepository;
   @Autowired
   private AbonnementRepository abonnementRepository;
   @Autowired
   private CotisationRepository cotisationRepository;

   public UserService() {
   }

   public Object authenticate(String email, String password) {
      Adherent adherent = this.adherentRepository.findByEmailAndMotDePasse(email, password);
      if (adherent != null) {
         return adherent;
      } else {
         Bibliothecaire bibliothecaire = this.bibliothecaireRepository.findByEmailAndMotDePasse(email, password);
         return bibliothecaire;
      }
   }

   public List<Exemplaire> getAllExemplaires() {
      return this.exemplaireRepository.findAll();
   }

   public List<Adherent> getAllAdherents() {
      return this.adherentRepository.findAll();
   }

   public List<Pret> getActivePrets() {
      return this.pretRepository.findActivePrets();
   }

   public List<Adherent> getPenalizedAdherents() {
      return (List) this.adherentRepository.findAll().stream().filter((adherent) -> {
         return adherent.getStatut().getIdStatut() == 2;
      }).collect(Collectors.toList());
   }

   @Transactional
   public String updateAllAdherentStatuses() {
      List<Adherent> adherents = this.adherentRepository.findAll();
      boolean statusChanged = false;
      LocalDate today = LocalDate.now();
      int activeCount = 0;
      int inactiveCount = 0;
      Iterator var6 = adherents.iterator();

      while (var6.hasNext()) {
         Adherent adherent = (Adherent) var6.next();
         int currentStatutId = adherent.getStatut().getIdStatut();
         int newStatutId = currentStatutId;
         List<Abonnement> abonnements = this.abonnementRepository.findByAdherentId(adherent.getIdAdherent());
         boolean hasValidSubscription = false;
         if (!abonnements.isEmpty()) {
            Abonnement latestAbonnement = (Abonnement) abonnements.get(0);
            Cotisation cotisation = (Cotisation) this.cotisationRepository.findAll().stream().filter((c) -> {
               return c.getTypeProfil().getIdTypeProfil() == adherent.getTypeProfil().getIdTypeProfil();
            }).findFirst().orElse(null);
            if (cotisation != null) {
               LocalDate subscriptionEndDate = latestAbonnement.getDateAbonnement()
                     .plusDays((long) cotisation.getPeriodicite());
               hasValidSubscription = !today.isAfter(subscriptionEndDate);
            }
         }

         if (currentStatutId != 2) {
            newStatutId = hasValidSubscription ? 1 : 3;
         } else {
            List<PretPenalisee> penalties = this.pretPenaliseeRepository.findByAdherentId(adherent.getIdAdherent());
            boolean allPenaltiesExpired = penalties.isEmpty() || penalties.stream().allMatch((p) -> {
               return today
                     .isAfter(p.getDateRemisePenalisee().plusDays((long) adherent.getTypeProfil().getNbJourPenalite()));
            });
            if (allPenaltiesExpired) {
               newStatutId = hasValidSubscription ? 1 : 3;
            }
         }

         if (newStatutId != currentStatutId) {
            Statut newStatut = (Statut) this.statutRepository.findById(newStatutId).orElseThrow(() -> {
               return new RuntimeException("Statut not found");
            });
            adherent.setStatut(newStatut);
            this.adherentRepository.save(adherent);
            statusChanged = true;
         }

         if (newStatutId == 1) {
            ++activeCount;
         } else if (newStatutId == 3) {
            ++inactiveCount;
         }
      }

      String message = statusChanged
            ? "Mise à jour des statuts terminée. " + activeCount + " adhérents actifs, " + inactiveCount
                  + " adhérents inactifs."
            : "Aucun changement de statut requis.";
      return message;
   }

   @Transactional
   public String processLoan(int exemplaireId, int adherentId, LocalDate datePret, LocalDate dateRemise) {
      Adherent adherent = (Adherent) this.adherentRepository.findById(adherentId).orElse(null);
      if (adherent != null && adherent.getStatut().getIdStatut() == 1) {
         List<Pret> activePrets = this.pretRepository.findActivePretsByAdherentId(adherentId);
         boolean hasPenalizedLoan = activePrets.stream().anyMatch((pretx) -> {
            return this.pretPenaliseeRepository.existsByPret(pretx);
         });
         if (hasPenalizedLoan) {
            return "L'adhérent a un prêt pénalisé en cours.";
         } else {
            int maxLoans = adherent.getTypeProfil().getNbLivreMax();
            if (activePrets.size() >= maxLoans) {
               return "L'adhérent a atteint le nombre maximum de prêts autorisés.";
            } else {
               Exemplaire exemplaire = (Exemplaire) this.exemplaireRepository.findById(exemplaireId).orElse(null);
               if (exemplaire == null) {
                  return "Exemplaire non trouvé.";
               } else {
                  int nbreservation = this.exemplaireRepository.countAcceptedReservationsByExemplaireId(exemplaireId);
                  int nbpret = this.exemplaireRepository.countActivePretsByExemplaireId(exemplaireId);
                  int nblivres = this.exemplaireRepository.countLivresByExemplaireId(exemplaireId);
                  if (nblivres <= nbreservation + nbpret) {
                     return "Exemplaire epuisee";
                  } else {
                     if (exemplaire.getAgeMinimal() != 0 && adherent.getDateNaissance() != null) {
                        try {
                           LocalDate dateNaissance = LocalDate.parse(adherent.getDateNaissance());
                           int ageAdherent = Period.between(dateNaissance, LocalDate.now()).getYears();
                           if (ageAdherent < exemplaire.getAgeMinimal()) {
                              int var10000 = exemplaire.getAgeMinimal();
                              return "L'adhérent n'a pas l'âge minimum requis (" + var10000
                                    + " ans) pour emprunter cet exemplaire. Il(elle) a actuellement " + ageAdherent;
                           }
                        } catch (DateTimeParseException var19) {
                           return "Date de naissance de l'adhérent invalide.";
                        }
                     }

                     boolean hasSameExemplaire = activePrets.stream().anyMatch((pretx) -> {
                        return pretx.getExemplaire().getIdExemplaire() == exemplaireId;
                     });
                     if (hasSameExemplaire) {
                        return "L'adhérent a déjà un prêt actif pour cet exemplaire.";
                     } else {
                        this.pretRepository.findActivePretsByExemplaireId(exemplaireId);
                        List<Reservation> activeReservations = this.reservationRepository
                              .findPendingOrAcceptedReservationsByExemplaireId(exemplaireId);
                        EtatReservation canceledState = (EtatReservation) this.etatReservationRepository.findById(3)
                              .orElseThrow(() -> {
                                 return new RuntimeException("Canceled state not found");
                              });
                        Iterator var16 = activeReservations.iterator();

                        while (var16.hasNext()) {
                           Reservation reservation = (Reservation) var16.next();
                           int currentState = reservation.getEtatReservation().getIdEtatReservation();
                           if (currentState == 1) {
                              reservation.setEtatReservation(canceledState);
                              this.reservationRepository.save(reservation);
                           }
                        }

                        String holidayMessage;
                        for (holidayMessage = ""; this.jourFerierRepository.existsByDateJourFerier(
                              dateRemise); holidayMessage = "La date de remise a été ajustée au " + dateRemise
                                    + " car le jour initial était férié.") {
                           dateRemise = dateRemise.plusDays(1L);
                        }

                        Pret pret = new Pret();
                        pret.setExemplaire(exemplaire);
                        pret.setAdherent(adherent);
                        pret.setDatePret(datePret);
                        pret.setDateRemise(dateRemise);
                        TypeLecture defaultTypeLecture = (TypeLecture) this.typeLectureRepository.findById(1)
                              .orElseThrow(() -> {
                                 return new RuntimeException("TypeLecture not found");
                              });
                        pret.setTypeLecture(defaultTypeLecture);
                        this.pretRepository.save(pret);
                        return holidayMessage.isEmpty() ? "Prêt enregistré avec succès." : holidayMessage;
                     }
                  }
               }
            }
         }
      } else {
         return adherent.getStatut().getIdStatut() == 2 ? "L aderent est suspendu"
               : "L'adhérent n'est pas actif ou n'existe pas.";
      }
   }

   @Transactional
   public String processReturn(int pretId, String dateReel) {
      Pret pret = pretRepository.findById(pretId).orElse(null);
      if (pret == null) {
         return "Prêt non trouvé.";
      }

      // Parse the dateReel string into a LocalDate
      DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd"); // Adjust pattern as needed
      LocalDate dateRemise;
      try {
         dateRemise = LocalDate.parse(dateReel, formatter);
      } catch (DateTimeParseException e) {
         return "Format de date invalide. Utilisez le format yyyy-MM-dd.";
      }

      // Check if the return is overdue
      LocalDate today = LocalDate.now();
      boolean isOverdue = pret.getDateRemise().isBefore(dateRemise);

      // Save PretRendu
      PretRendu pretRendu = new PretRendu();
      pretRendu.setPret(pret);
      pretRendu.setIdPret(pretId);
      pretRendu.setDateRemiseReel(dateRemise); // Use parsed dateReel
      pretRenduRepository.save(pretRendu);

      if (isOverdue) {
         // Handle overdue case
         PretPenalisee pretPenalisee = new PretPenalisee();
         pretPenalisee.setPret(pret);
         pretPenalisee.setDateRemisePenalisee(dateRemise);
         pretPenalisee.setDescription("Prêt rendu en retard, dépassement de la date prévue: " + pret.getDateRemise());
         pretPenaliseeRepository.save(pretPenalisee);

         // Update adherent status to suspended
         Adherent adherent = pret.getAdherent();
         Statut suspendedStatus = statutRepository.findById(2)
               .orElseThrow(() -> new RuntimeException("Suspended status not found"));
         adherent.setStatut(suspendedStatus);
         adherentRepository.save(adherent);

         return "Prêt rendu avec retard. L'adhérent est maintenant suspendu.";
      }

      return "Prêt rendu avec succès.";
   }

   // @Transactional
   // public String processLoan(int exemplaireId, int adherentId, LocalDate
   // dateRemise) {
   // Adherent adherent =
   // (Adherent)this.adherentRepository.findById(adherentId).orElse(null);
   // if (adherent != null && adherent.getStatut().getIdStatut() == 1) {
   // List<Pret> activePrets =
   // this.pretRepository.findActivePretsByAdherentId(adherentId);
   // boolean hasPenalizedLoan = activePrets.stream().anyMatch((pretx) -> {
   // return this.pretPenaliseeRepository.existsByPret(pretx);
   // });
   // if (hasPenalizedLoan) {
   // return "L'adhérent a un prêt pénalisé en cours.";
   // } else {
   // int maxLoans = adherent.getTypeProfil().getNbLivreMax();
   // if (activePrets.size() >= maxLoans) {
   // return "L'adhérent a atteint le nombre maximum de prêts autorisés.";
   // } else {
   // Exemplaire exemplaire =
   // (Exemplaire)this.exemplaireRepository.findById(exemplaireId).orElse(null);
   // if (exemplaire == null) {
   // return "Exemplaire non trouvé.";
   // } else {
   // int nbreservation =
   // this.exemplaireRepository.countAcceptedReservationsByExemplaireId(exemplaireId);
   // int nbpret =
   // this.exemplaireRepository.countActivePretsByExemplaireId(exemplaireId);
   // int nblivres =
   // this.exemplaireRepository.countLivresByExemplaireId(exemplaireId);
   // if (nblivres <= nbreservation + nbpret) {
   // return "Exemplaire epuisee";
   // } else {
   // if (exemplaire.getAgeMinimal() != 0 && adherent.getDateNaissance() != null) {
   // try {
   // LocalDate dateNaissance = LocalDate.parse(adherent.getDateNaissance());
   // int ageAdherent = Period.between(dateNaissance, LocalDate.now()).getYears();
   // if (ageAdherent < exemplaire.getAgeMinimal()) {
   // int var10000 = exemplaire.getAgeMinimal();
   // return "L'adhérent n'a pas l'âge minimum requis (" + var10000 + " ans) pour
   // emprunter cet exemplaire. Il(elle) a actuellement " + ageAdherent;
   // }
   // } catch (DateTimeParseException var19) {
   // return "Date de naissance de l'adhérent invalide.";
   // }
   // }

   // boolean hasSameExemplaire = activePrets.stream().anyMatch((pretx) -> {
   // return pretx.getExemplaire().getIdExemplaire() == exemplaireId;
   // });
   // if (hasSameExemplaire) {
   // return "L'adhérent a déjà un prêt actif pour cet exemplaire.";
   // } else {
   // this.pretRepository.findActivePretsByExemplaireId(exemplaireId);
   // List<Reservation> activeReservations =
   // this.reservationRepository.findPendingOrAcceptedReservationsByExemplaireId(exemplaireId);
   // EtatReservation canceledState =
   // (EtatReservation)this.etatReservationRepository.findById(3).orElseThrow(() ->
   // {
   // return new RuntimeException("Canceled state not found");
   // });
   // Iterator var16 = activeReservations.iterator();

   // while(var16.hasNext()) {
   // Reservation reservation = (Reservation)var16.next();
   // int currentState = reservation.getEtatReservation().getIdEtatReservation();
   // if (currentState == 1) {
   // reservation.setEtatReservation(canceledState);
   // this.reservationRepository.save(reservation);
   // }
   // }

   // String holidayMessage;
   // for(holidayMessage = "";
   // this.jourFerierRepository.existsByDateJourFerier(dateRemise); holidayMessage
   // = "La date de remise a été ajustée au " + dateRemise + " car le jour initial
   // était férié.") {
   // dateRemise = dateRemise.plusDays(1L);
   // }

   // Pret pret = new Pret();
   // pret.setExemplaire(exemplaire);
   // pret.setAdherent(adherent);
   // pret.setDatePret(LocalDate.now());
   // pret.setDateRemise(dateRemise);
   // TypeLecture defaultTypeLecture =
   // (TypeLecture)this.typeLectureRepository.findById(1).orElseThrow(() -> {
   // return new RuntimeException("TypeLecture not found");
   // });
   // pret.setTypeLecture(defaultTypeLecture);
   // this.pretRepository.save(pret);
   // return holidayMessage.isEmpty() ? "Prêt enregistré avec succès." :
   // holidayMessage;
   // }
   // }
   // }
   // }
   // }
   // } else {
   // return adherent.getStatut().getIdStatut() == 2 ? "L aderent est suspendu" :
   // "L'adhérent n'est pas actif ou n'existe pas.";
   // }
   // }

   // @Transactional
   // public String processReturn(int pretId) {
   // Pret pret = (Pret)this.pretRepository.findById(pretId).orElse(null);
   // if (pret == null) {
   // return "Prêt non trouvé.";
   // } else {
   // LocalDate today = LocalDate.now();
   // boolean isOverdue = pret.getDateRemise().isBefore(today);
   // PretRendu pretRendu = new PretRendu();
   // pretRendu.setPret(pret);
   // pretRendu.setIdPret(pretId);
   // pretRendu.setDateRemiseReel(today);
   // this.pretRenduRepository.save(pretRendu);
   // if (isOverdue) {
   // PretPenalisee pretPenalisee = new PretPenalisee();
   // pretPenalisee.setPret(pret);
   // pretPenalisee.setDateRemisePenalisee(today);
   // pretPenalisee.setDescription("Prêt rendu en retard, dépassement de la date
   // prévue: " + pret.getDateRemise());
   // this.pretPenaliseeRepository.save(pretPenalisee);
   // Adherent adherent = pret.getAdherent();
   // Statut suspendedStatus =
   // (Statut)this.statutRepository.findById(2).orElseThrow(() -> {
   // return new RuntimeException("Suspended status not found");
   // });
   // adherent.setStatut(suspendedStatus);
   // this.adherentRepository.save(adherent);
   // return "Prêt rendu avec retard. L'adhérent est maintenant suspendu.";
   // } else {
   // return "Prêt rendu avec succès.";
   // }
   // }
   // }
}
