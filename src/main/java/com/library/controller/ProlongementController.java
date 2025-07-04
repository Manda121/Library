package com.library.controller;

import com.library.model.Adherent;
import com.library.service.ProlongementService;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class ProlongementController {
   @Autowired
   private ProlongementService userService;

   public ProlongementController() {
   }

   @GetMapping({"/prolongement"})
   public String showProlongementForm(HttpSession session, Model model) {
      Object user = session.getAttribute("user");
      if (!(user instanceof Adherent)) {
         return "redirect:/login";
      } else {
         int adherentId = ((Adherent)user).getIdAdherent();
         model.addAttribute("prets", this.userService.getActivePretsForAdherent(adherentId));
         return "prolongement";
      }
   }

   @PostMapping({"/prolongement"})
   public String processProlongement(@RequestParam("pretId") int pretId, @RequestParam("nbJourProlongement") int nbJourProlongement, HttpSession session, Model model) {
      Object user = session.getAttribute("user");
      if (!(user instanceof Adherent)) {
         return "redirect:/login";
      } else {
         int adherentId = ((Adherent)user).getIdAdherent();
         String result = this.userService.processProlongement(adherentId, pretId, nbJourProlongement);
         model.addAttribute("message", result);
         model.addAttribute("prets", this.userService.getActivePretsForAdherent(adherentId));
         return "prolongement";
      }
   }
}
