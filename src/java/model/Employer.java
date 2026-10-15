package model;

import util.MapFile;

public class Employer {
    private String nom;
    private String poste;
    private MapFile photo;

    public Employer() {
    }

    public String getNom() {
        return nom;
    }

    public void setNom(String nom) {
        this.nom = nom;
    }

    public String getPoste() {
        return poste;
    }

    public void setPoste(String poste) {
        this.poste = poste;
    }

    public MapFile getPhoto() {
        return photo;
    }

    public void setPhoto(MapFile photo) {
        this.photo = photo;
    }
}