package com.library.service;

import com.library.dto.ExemplaireDetailDto;
import com.library.dto.LivreDto;
import com.library.model.Exemplaire;
import com.library.model.Livre;
import com.library.model.Pret;
import com.library.model.Reservation;
import com.library.repository.ExemplaireRepository;
import com.library.repository.LivreRepository;
import com.library.repository.PretRepository;
import com.library.repository.ReservationRepository;
import java.time.LocalDate;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class ExemplaireService {
   @Autowired
   private ExemplaireRepository exemplaireRepository;
   @Autowired
   private LivreRepository livreRepository;
   @Autowired
   private PretRepository pretRepository;
   @Autowired
   private ReservationRepository reservationRepository;

   public ExemplaireService() {
   }

   // Nouvelle méthode pour récupérer l'exemplaire avec détails
   public ExemplaireDetailDto getExemplaireWithDetails(Integer id) {
       Optional<Exemplaire> exemplaireOpt = exemplaireRepository.findById(id);
       
       if (exemplaireOpt.isEmpty()) {
           return null;
       }
       
       Exemplaire exemplaire = exemplaireOpt.get();
       
       // Récupérer les livres associés à cet exemplaire
       List<Livre> livres = livreRepository.findByExemplaireId(id);
       List<LivreDto> livresDto = livres.stream()
           .map(livre -> new LivreDto(livre.getIdLivre(), livre.getNbPage()))
           .collect(Collectors.toList());
       
       // Vérifier la disponibilité
       boolean disponible = isExemplaireDisponible(id);
       String statusDisponibilite = getStatusDisponibilite(id);
       
       return new ExemplaireDetailDto(
           exemplaire.getIdExemplaire(),
           exemplaire.getNom(),
           exemplaire.getDescription(),
           exemplaire.getImageCouverture(),
           exemplaire.getTitre(),
           exemplaire.getAgeMinimal(),
           livresDto,
           disponible,
           statusDisponibilite
       );
   }

   // Méthode pour vérifier la disponibilité d'un exemplaire
   private boolean isExemplaireDisponible(Integer exemplaireId) {
       // Vérifier s'il y a des prêts actifs (non rendus)
       List<Pret> activePrets = pretRepository.findActivePretsByExemplaireId(exemplaireId);
       
       // Vérifier s'il y a des réservations en attente ou acceptées
       List<Reservation> activeReservations = reservationRepository
           .findPendingOrAcceptedReservationsByExemplaireId(exemplaireId);
       
       return activePrets.isEmpty() && activeReservations.isEmpty();
   }

   // Méthode pour obtenir le statut détaillé de disponibilité
   private String getStatusDisponibilite(Integer exemplaireId) {
       List<Pret> activePrets = pretRepository.findActivePretsByExemplaireId(exemplaireId);
       List<Reservation> activeReservations = reservationRepository
           .findPendingOrAcceptedReservationsByExemplaireId(exemplaireId);
       
       if (!activePrets.isEmpty()) {
           // Trouver la date de remise la plus proche
           LocalDate dateRemisePlusProche = activePrets.stream()
               .map(Pret::getDateRemise)
               .min(LocalDate::compareTo)
               .orElse(null);
           
           if (dateRemisePlusProche != null) {
               return "Prêté - Retour prévu le " + dateRemisePlusProche;
           } else {
               return "Prêté";
           }
       } else if (!activeReservations.isEmpty()) {
           return "Réservé";
       } else {
           return "Disponible";
       }
   }

   // Méthodes existantes conservées...
   public List<Exemplaire> getAllExemplaires() {
      return this.exemplaireRepository.findAll();
   }

   public Optional<Exemplaire> getExemplaireById(Integer id) {
        return exemplaireRepository.findById(id);
    }

   public List<Livre> getAllLivres() {
      return this.livreRepository.findAll();
   }

   @Transactional
   public String createExemplaire(String nom, String description, int ageMinimal) {
      if (nom != null && !nom.trim().isEmpty()) {
         Exemplaire exemplaire = new Exemplaire();
         exemplaire.setNom(nom);
         exemplaire.setDescription(description != null ? description : "");
         exemplaire.setAgeMinimal(ageMinimal);
         this.exemplaireRepository.save(exemplaire);
         return "Exemplaire créé avec succès.";
      } else {
         return "Le nom de l'exemplaire est requis.";
      }
   }

   @Transactional
   public String updateExemplaire(int idExemplaire, String nom, String description, int ageMinimal) {
      Exemplaire exemplaire = exemplaireRepository.findById(idExemplaire).orElse(null);
      if (exemplaire == null) {
         return "Exemplaire non trouvé.";
      } else if (nom != null && !nom.trim().isEmpty()) {
         exemplaire.setNom(nom);
         exemplaire.setDescription(description != null ? description : "");
         exemplaire.setAgeMinimal(ageMinimal);
         this.exemplaireRepository.save(exemplaire);
         return "Exemplaire mis à jour avec succès.";
      } else {
         return "Le nom de l'exemplaire est requis.";
      }
   }

   @Transactional
   public String deleteExemplaire(int idExemplaire) {
      Exemplaire exemplaire = exemplaireRepository.findById(idExemplaire).orElse(null);
      if (exemplaire == null) {
         return "Exemplaire non trouvé.";
      } else {
         List<Pret> activePrets = this.pretRepository.findActivePretsByExemplaireId(idExemplaire);
         List<Reservation> activeReservations = this.reservationRepository.findPendingOrAcceptedReservationsByExemplaireId(idExemplaire);
         if (activePrets.isEmpty() && activeReservations.isEmpty()) {
            this.exemplaireRepository.delete(exemplaire);
            return "Exemplaire supprimé avec succès.";
         } else {
            return "L'exemplaire ne peut pas être supprimé car il est prêté ou réservé.";
         }
      }
   }
}