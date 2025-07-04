package com.library.controller;

import com.library.model.Bibliothecaire;
import com.library.service.ProlongementService;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class ProlongementDecisionController {
   @Autowired
   private ProlongementService prolongementService;

   public ProlongementDecisionController() {
   }

   @GetMapping({"/prolongement-list"})
   public String showProlongementList(HttpSession session, Model model) {
      Object user = session.getAttribute("user");
      if (!(user instanceof Bibliothecaire)) {
         return "redirect:/login";
      } else {
         model.addAttribute("prolongements", this.prolongementService.getPendingProlongements());
         return "prolongement-list";
      }
   }

   @PostMapping({"/prolongement-decision"})
   public String processProlongementDecision(@RequestParam int prolongementId, @RequestParam String action, HttpSession session, Model model) {
      Object user = session.getAttribute("user");
      if (!(user instanceof Bibliothecaire)) {
         return "redirect:/login";
      } else {
         boolean accept = "accept".equals(action);
         String result = this.prolongementService.processProlongementDecision(prolongementId, accept);
         model.addAttribute("message", result);
         model.addAttribute("prolongements", this.prolongementService.getPendingProlongements());
         return "prolongement-list";
      }
   }
}
