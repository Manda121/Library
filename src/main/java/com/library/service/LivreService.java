package com.library.service;

import com.library.model.Livre;
import com.library.repository.LivreRepository;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class LivreService {
   @Autowired
   private LivreRepository livreRepository;

   public LivreService() {
   }

   public List<Livre> getAllLivres() {
      return this.livreRepository.findAll();
   }
}
