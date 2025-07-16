package com.library.service;

import com.library.dto.AdherentDetailDto;
import com.library.model.Adherent;
import com.library.model.Pret;
import com.library.repository.AdherentRepository;
import com.library.repository.PretRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class AdherentService {
    
    @Autowired
    private AdherentRepository adherentRepository;
    
    @Autowired
    private PretRepository pretRepository;

    public AdherentService() {
    }

    // Nouvelle méthode pour récupérer l'adhérent avec détails
    public AdherentDetailDto getAdherentWithDetails(Integer id) {
        Optional<Adherent> adherentOpt = adherentRepository.findById(id);
        
        if (adherentOpt.isEmpty()) {
            return null;
        }
        
        Adherent adherent = adherentOpt.get();
        
        // Calculer le nombre de prêts restants
        Integer nbPretRestant = calculateNbPretRestant(adherent);
        
        // Vérifier si l'adhérent est actif
        boolean estActif = adherent.getStatut().getIdStatut() == 1;
        
        // Vérifier si l'adhérent est suspendu
        boolean estSuspendu = adherent.getStatut().getIdStatut() == 2;
        
        // Déterminer la description du statut
        String statutDescription = getStatutDescription(adherent.getStatut().getIdStatut());
        
        return new AdherentDetailDto(
            adherent.getIdAdherent(),
            adherent.getNom(),
            adherent.getEmail(),
            adherent.getPrenom(),
            adherent.getTel(),
            adherent.getDateNaissance(),
            nbPretRestant,
            estActif,
            estSuspendu,
            statutDescription,
            adherent.getTypeProfil().getNom()
        );
    }

    // Méthode pour calculer le nombre de prêts restants
    private Integer calculateNbPretRestant(Adherent adherent) {
        // Récupérer le nombre maximum de livres autorisés selon le type de profil
        Integer nbLivreMax = adherent.getTypeProfil().getNbLivreMax();
        
        // Compter les prêts actifs (non rendus) de l'adhérent
        List<Pret> pretsActifs = pretRepository.findActivePretsByAdherentId(adherent.getIdAdherent());
        int nbPretsActifs = pretsActifs.size();
        
        // Calculer le nombre de prêts restants
        return nbLivreMax - nbPretsActifs;
    }

    // Méthode pour obtenir la description du statut
    private String getStatutDescription(Integer idStatut) {
        switch (idStatut) {
            case 1:
                return "Actif";
            case 2:
                return "Suspendu";
            default:
                return "Inactif";
        }
    }

    // Méthode pour vérifier si un adhérent peut emprunter
    public boolean canBorrow(Integer adherentId) {
        Optional<Adherent> adherentOpt = adherentRepository.findById(adherentId);
        
        if (adherentOpt.isEmpty()) {
            return false;
        }
        
        Adherent adherent = adherentOpt.get();
        
        // Vérifier si l'adhérent est actif
        if (adherent.getStatut().getIdStatut() != 1) {
            return false;
        }
        
        // Vérifier si l'adhérent a encore des prêts disponibles
        Integer nbPretRestant = calculateNbPretRestant(adherent);
        return nbPretRestant > 0;
    }

    // Méthode pour obtenir le message d'erreur si l'adhérent ne peut pas emprunter
    public String getBorrowErrorMessage(Integer adherentId) {
        Optional<Adherent> adherentOpt = adherentRepository.findById(adherentId);
        
        if (adherentOpt.isEmpty()) {
            return "Adhérent non trouvé.";
        }
        
        Adherent adherent = adherentOpt.get();
        
        // Vérifier le statut de l'adhérent
        if (adherent.getStatut().getIdStatut() != 1) {
            if (adherent.getStatut().getIdStatut() == 2) {
                return "L'adhérent est suspendu.";
            } else {
                return "L'adhérent n'est pas actif.";
            }
        }
        
        // Vérifier le nombre de prêts restants
        Integer nbPretRestant = calculateNbPretRestant(adherent);
        if (nbPretRestant <= 0) {
            return "L'adhérent a atteint le nombre maximum de prêts autorisés.";
        }
        
        return "L'adhérent peut emprunter.";
    }
}