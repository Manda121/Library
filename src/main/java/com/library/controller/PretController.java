package com.library.controller;

import com.library.model.Bibliothecaire;
import com.library.service.UserService;
import jakarta.servlet.http.HttpSession;
import java.time.LocalDate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class PretController {
   @Autowired
   private UserService userService;

   public PretController() {
   }

   @GetMapping({"/pret"})
   public String showPretForm(HttpSession session, Model model) {
      Object user = session.getAttribute("user");
      if (!(user instanceof Bibliothecaire)) {
         return "redirect:/login";
      } else {
         model.addAttribute("exemplaires", this.userService.getAllExemplaires());
         model.addAttribute("adherents", this.userService.getAllAdherents());
         return "pret";
      }
   }

   @PostMapping({"/pret"})
   public String processPret(@RequestParam("exemplaireId") int exemplaireId, @RequestParam("adherentId") int adherentId, @RequestParam("dateRemise") String dateRemise, HttpSession session, Model model) {
      Object user = session.getAttribute("user");
      if (!(user instanceof Bibliothecaire)) {
         return "redirect:/login";
      } else {
         String result = this.userService.processLoan(exemplaireId, adherentId, LocalDate.parse(dateRemise));
         model.addAttribute("message", result);
         model.addAttribute("exemplaires", this.userService.getAllExemplaires());
         model.addAttribute("adherents", this.userService.getAllAdherents());
         return "pret";
      }
   }
}
