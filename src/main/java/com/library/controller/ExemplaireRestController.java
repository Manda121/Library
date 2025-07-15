package com.library.controller;

import com.library.model.Exemplaire;
import com.library.service.ExemplaireService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api/exemplaire")
public class ExemplaireRestController {

    @Autowired
    private ExemplaireService exemplaireService;

    @GetMapping(value = "/{id}", produces = MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity<Exemplaire> getExemplaireById(@PathVariable("id") Integer id) {
        return exemplaireService.getExemplaireById(id)
                .map(exemplaire -> ResponseEntity.ok(exemplaire))
                .orElseGet(() -> ResponseEntity.notFound().build());
    }
}