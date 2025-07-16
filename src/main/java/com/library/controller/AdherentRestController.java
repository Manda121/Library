package com.library.controller;

import com.library.dto.AdherentDetailDto;
import com.library.service.AdherentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api/adherent")
public class AdherentRestController {

    @Autowired
    private AdherentService adherentService;

    @GetMapping(value = "/{id}", produces = MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity<AdherentDetailDto> getAdherentById(@PathVariable("id") Integer id) {
        AdherentDetailDto adherentDetail = adherentService.getAdherentWithDetails(id);
        
        if (adherentDetail != null) {
            return ResponseEntity.ok(adherentDetail);
        } else {
            return ResponseEntity.notFound().build();
        }
    }
}