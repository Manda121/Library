package com.library.controller;

import com.library.dto.ExemplaireDetailDto;
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
    public ResponseEntity<ExemplaireDetailDto> getExemplaireById(@PathVariable("id") Integer id) {
        ExemplaireDetailDto exemplaireDetail = exemplaireService.getExemplaireWithDetails(id);
        
        if (exemplaireDetail != null) {
            return ResponseEntity.ok(exemplaireDetail);
        } else {
            return ResponseEntity.notFound().build();
        }
    }
}