package com.library.dto;

import java.util.List;

public class ExemplaireDetailDto {
    private Integer id;
    private String nom;
    private String description;
    private String imageCouverture;
    private String titre;
    private Integer ageMinimal;
    private List<LivreDto> livres;
    private boolean disponible;
    private String statusDisponibilite;

    // Constructeurs
    public ExemplaireDetailDto() {}

    public ExemplaireDetailDto(Integer id, String nom, String description, String imageCouverture, 
                              String titre, Integer ageMinimal, List<LivreDto> livres, 
                              boolean disponible, String statusDisponibilite) {
        this.id = id;
        this.nom = nom;
        this.description = description;
        this.imageCouverture = imageCouverture;
        this.titre = titre;
        this.ageMinimal = ageMinimal;
        this.livres = livres;
        this.disponible = disponible;
        this.statusDisponibilite = statusDisponibilite;
    }

    // Getters et Setters
    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getNom() {
        return nom;
    }

    public void setNom(String nom) {
        this.nom = nom;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getImageCouverture() {
        return imageCouverture;
    }

    public void setImageCouverture(String imageCouverture) {
        this.imageCouverture = imageCouverture;
    }

    public String getTitre() {
        return titre;
    }

    public void setTitre(String titre) {
        this.titre = titre;
    }

    public Integer getAgeMinimal() {
        return ageMinimal;
    }

    public void setAgeMinimal(Integer ageMinimal) {
        this.ageMinimal = ageMinimal;
    }

    public List<LivreDto> getLivres() {
        return livres;
    }

    public void setLivres(List<LivreDto> livres) {
        this.livres = livres;
    }

    public boolean isDisponible() {
        return disponible;
    }

    public void setDisponible(boolean disponible) {
        this.disponible = disponible;
    }

    public String getStatusDisponibilite() {
        return statusDisponibilite;
    }

    public void setStatusDisponibilite(String statusDisponibilite) {
        this.statusDisponibilite = statusDisponibilite;
    }
}
