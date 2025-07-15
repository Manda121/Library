package com.library.service;

import com.library.model.Exemplaire;
import com.library.model.Livre;
import com.library.model.Pret;
import com.library.model.Reservation;
import com.library.repository.ExemplaireRepository;
import com.library.repository.LivreRepository;
import com.library.repository.PretRepository;
import com.library.repository.ReservationRepository;
import java.util.List;
import java.util.Optional;

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
