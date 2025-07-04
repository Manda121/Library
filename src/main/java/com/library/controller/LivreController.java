package com.library.controller;

import com.library.model.Livre;
import com.library.service.LivreService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping({"/livres"})
public class LivreController {
   @Autowired
   private LivreService livreService;

   public LivreController() {
   }

   @GetMapping
   public String listLivres(Model model) {
      List<Livre> livres = this.livreService.getAllLivres();
      model.addAttribute("livres", livres);
      return "liste_livre";
   }
}
