package com.library.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class RootController {
   public RootController() {
   }

   @GetMapping({"/"})
   public String home() {
      return "index";
   }
}
