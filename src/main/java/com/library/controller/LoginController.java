package com.library.controller;

import com.library.service.UserService;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class LoginController {
   @Autowired
   private UserService userService;

   public LoginController() {
   }

   @GetMapping({"/login"})
   public String showLoginForm() {
      return "login";
   }

   @PostMapping({"/login"})
   public String processLogin(@RequestParam("email") String email, @RequestParam("password") String password, HttpSession session, Model model) {
      Object user = this.userService.authenticate(email, password);
      if (user != null) {
         session.setAttribute("user", user);
         return "redirect:/exemplaires";
      } else {
         model.addAttribute("error", "Email ou mot de passe incorrect");
         return "login";
      }
   }

   @GetMapping({"/logout"})
   public String logout(HttpSession session) {
      session.invalidate();
      return "redirect:/login";
   }
}
