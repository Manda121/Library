package com.library.controller;

import com.library.model.Bibliothecaire;
import com.library.service.ExemplaireService;
import com.library.service.UserService;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class ExemplaireController {
   @Autowired
   private UserService userService;
   @Autowired
   private ExemplaireService exemplaireService;

   public ExemplaireController() {
   }

   @GetMapping({"/exemplaires"})
   public String showExemplaires(Model model, HttpSession session) {
      if (session.getAttribute("user") == null) {
         return "redirect:/login";
      } else {
         model.addAttribute("exemplaires", this.userService.getAllExemplaires());
         return "exemplaires";
      }
   }

   @GetMapping({"/exemplaire-crud"})
   public String showExemplaireCrudPage(HttpSession session, Model model) {
      Object user = session.getAttribute("user");
      if (!(user instanceof Bibliothecaire)) {
         return "redirect:/login";
      } else {
         model.addAttribute("exemplaires", this.exemplaireService.getAllExemplaires());
         return "exemplaire-crud";
      }
   }

   @PostMapping({"/exemplaire-create"})
   public String createExemplaire(@RequestParam("nom") String nom, @RequestParam("description") String description, @RequestParam("ageMinimal") int ageMinimal, HttpSession session, Model model) {
      Object user = session.getAttribute("user");
      if (!(user instanceof Bibliothecaire)) {
         return "redirect:/login";
      } else {
         String result = this.exemplaireService.createExemplaire(nom, description, ageMinimal);
         model.addAttribute("message", result);
         model.addAttribute("exemplaires", this.exemplaireService.getAllExemplaires());
         return "exemplaire-crud";
      }
   }

   @PostMapping({"/exemplaire-update"})
   public String updateExemplaire(@RequestParam("idExemplaire") int idExemplaire, @RequestParam("nom") String nom, @RequestParam("description") String description, @RequestParam("ageMinimal") int ageMinimal, HttpSession session, Model model) {
      Object user = session.getAttribute("user");
      if (!(user instanceof Bibliothecaire)) {
         return "redirect:/login";
      } else {
         String result = this.exemplaireService.updateExemplaire(idExemplaire, nom, description, ageMinimal);
         model.addAttribute("message", result);
         model.addAttribute("exemplaires", this.exemplaireService.getAllExemplaires());
         return "exemplaire-crud";
      }
   }

   @PostMapping({"/exemplaire-delete"})
   public String deleteExemplaire(@RequestParam("idExemplaire") int idExemplaire, HttpSession session, Model model) {
      Object user = session.getAttribute("user");
      if (!(user instanceof Bibliothecaire)) {
         return "redirect:/login";
      } else {
         String result = this.exemplaireService.deleteExemplaire(idExemplaire);
         model.addAttribute("message", result);
         model.addAttribute("exemplaires", this.exemplaireService.getAllExemplaires());
         return "exemplaire-crud";
      }
   }
}
