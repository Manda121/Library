package com.library.controller;

import com.library.model.Bibliothecaire;
import com.library.service.UserService;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class AdherentStatusController {
   @Autowired
   private UserService userService;

   public AdherentStatusController() {
   }

   @GetMapping({"/adherent-status-update"})
   public String showStatusUpdatePage(HttpSession session, Model model) {
      Object user = session.getAttribute("user");
      if (!(user instanceof Bibliothecaire)) {
         return "redirect:/login";
      } else {
         String result = this.userService.updateAllAdherentStatuses();
         model.addAttribute("message", result);
         return "redirect:/exemplaires";
      }
   }

   @PostMapping({"/adherent-status-update"})
   public String updateAdherentStatuses(HttpSession session, Model model) {
      Object user = session.getAttribute("user");
      if (!(user instanceof Bibliothecaire)) {
         return "redirect:/login";
      } else {
         String result = this.userService.updateAllAdherentStatuses();
         model.addAttribute("message", result);
         return "redirect:/exemplaires";
      }
   }
}
