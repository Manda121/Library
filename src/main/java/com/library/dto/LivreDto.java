package com.library.dto;

import java.util.List;

public class LivreDto {
    private Integer id;
    private Integer nbpage;

    public LivreDto() {}

    public LivreDto(Integer id, Integer nbpage) {
        this.id = id;
        this.nbpage = nbpage;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getNbpage() {
        return nbpage;
    }

    public void setNbpage(Integer nbpage) {
        this.nbpage = nbpage;
    }
}