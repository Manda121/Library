package com.library.dto;

public class AdherentDetailDto {
    private Integer id;
    private String nom;
    private String email;
    private String prenom;
    private String tel;
    private String dateNaissance;
    private Integer nbPretRestant;
    private boolean estActif;
    private boolean estSuspendu;
    private String statutDescription;
    private String typeProfilNom;

    // Constructeurs
    public AdherentDetailDto() {}

    public AdherentDetailDto(Integer id, String nom, String email, String prenom, String tel, 
                            String dateNaissance, Integer nbPretRestant, boolean estActif, 
                            boolean estSuspendu, String statutDescription, String typeProfilNom) {
        this.id = id;
        this.nom = nom;
        this.email = email;
        this.prenom = prenom;
        this.tel = tel;
        this.dateNaissance = dateNaissance;
        this.nbPretRestant = nbPretRestant;
        this.estActif = estActif;
        this.estSuspendu = estSuspendu;
        this.statutDescription = statutDescription;
        this.typeProfilNom = typeProfilNom;
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

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPrenom() {
        return prenom;
    }

    public void setPrenom(String prenom) {
        this.prenom = prenom;
    }

    public String getTel() {
        return tel;
    }

    public void setTel(String tel) {
        this.tel = tel;
    }

    public String getDateNaissance() {
        return dateNaissance;
    }

    public void setDateNaissance(String dateNaissance) {
        this.dateNaissance = dateNaissance;
    }

    public Integer getNbPretRestant() {
        return nbPretRestant;
    }

    public void setNbPretRestant(Integer nbPretRestant) {
        this.nbPretRestant = nbPretRestant;
    }

    public boolean isEstActif() {
        return estActif;
    }

    public void setEstActif(boolean estActif) {
        this.estActif = estActif;
    }

    public boolean isEstSuspendu() {
        return estSuspendu;
    }

    public void setEstSuspendu(boolean estSuspendu) {
        this.estSuspendu = estSuspendu;
    }

    public String getStatutDescription() {
        return statutDescription;
    }

    public void setStatutDescription(String statutDescription) {
        this.statutDescription = statutDescription;
    }

    public String getTypeProfilNom() {
        return typeProfilNom;
    }

    public void setTypeProfilNom(String typeProfilNom) {
        this.typeProfilNom = typeProfilNom;
    }
}