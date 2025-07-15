package com.library.controller;

import com.library.model.Bibliothecaire;
import com.library.service.UserService;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class PretListController {
   @Autowired
   private UserService userService;

   public PretListController() {
   }

   @GetMapping({"/pret-list"})
   public String showPretList(HttpSession session, Model model) {
      Object user = session.getAttribute("user");
      if (!(user instanceof Bibliothecaire)) {
         return "redirect:/login";
      } else {
         model.addAttribute("prets", this.userService.getActivePrets());
         return "pret_list";
      }
   }

   @PostMapping({"/pret-return"})
   public String processReturn(@RequestParam("pretId") int pretId, @RequestParam("dateReel") String dateReel, HttpSession session, Model model) {
      Object user = session.getAttribute("user");
      if (!(user instanceof Bibliothecaire)) {
         return "redirect:/login";
      } else {
         String result = this.userService.processReturn(pretId, dateReel);
         model.addAttribute("message", result);
         model.addAttribute("prets", this.userService.getActivePrets());
         return "pret_list";
      }
   }

   // @PostMapping({"/pret-return"})
   // public String processReturn(@RequestParam("pretId") int pretId, HttpSession session, Model model) {
   //    Object user = session.getAttribute("user");
   //    if (!(user instanceof Bibliothecaire)) {
   //       return "redirect:/login";
   //    } else {
   //       String result = this.userService.processReturn(pretId);
   //       model.addAttribute("message", result);
   //       model.addAttribute("prets", this.userService.getActivePrets());
   //       return "pret_list";
   //    }
   // }
}
