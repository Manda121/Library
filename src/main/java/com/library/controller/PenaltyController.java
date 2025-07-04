package com.library.controller;

import com.library.model.Bibliothecaire;
import com.library.service.PenaltyService;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class PenaltyController {
   @Autowired
   private PenaltyService penaltyService;

   public PenaltyController() {
   }

   @GetMapping({"/penalty-list"})
   public String showPenaltyList(HttpSession session, Model model) {
      Object user = session.getAttribute("user");
      if (!(user instanceof Bibliothecaire)) {
         return "redirect:/login";
      } else {
         model.addAttribute("adherents", this.penaltyService.getPenalizedAdherents());
         return "penalty_list";
      }
   }

   @PostMapping({"/remove-penalty"})
   public String removePenalty(@RequestParam("adherentId") int adherentId, HttpSession session, Model model) {
      Object user = session.getAttribute("user");
      if (!(user instanceof Bibliothecaire)) {
         return "redirect:/login";
      } else {
         String result = this.penaltyService.removePenalty(adherentId);
         model.addAttribute("message", result);
         model.addAttribute("adherents", this.penaltyService.getPenalizedAdherents());
         return "penalty_list";
      }
   }
}
