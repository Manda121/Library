package com.library.controller;

import com.library.model.Adherent;
import com.library.model.Bibliothecaire;
import com.library.service.ReservationService;
import jakarta.servlet.http.HttpSession;
import java.time.LocalDate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class ReservationController {
   @Autowired
   private ReservationService reservationService;

   public ReservationController() {
   }

   @GetMapping({"/reservation"})
   public String showReservationForm(HttpSession session, Model model) {
      Object user = session.getAttribute("user");
      if (!(user instanceof Adherent)) {
         return "redirect:/login";
      } else {
         model.addAttribute("exemplaires", this.reservationService.getAllExemplaires());
         return "reservation";
      }
   }

   @PostMapping({"/reservation"})
   public String processReservation(@RequestParam("exemplaireId") int exemplaireId, @RequestParam("datePret") String datePret, HttpSession session, Model model) {
      Object user = session.getAttribute("user");
      if (!(user instanceof Adherent)) {
         return "redirect:/login";
      } else {
         int adherentId = ((Adherent)user).getIdAdherent();
         String result = this.reservationService.processReservation(adherentId, exemplaireId, LocalDate.parse(datePret));
         model.addAttribute("message", result);
         model.addAttribute("exemplaires", this.reservationService.getAllExemplaires());
         return "reservation";
      }
   }

   @GetMapping({"/reservation-list"})
   public String showReservationList(HttpSession session, Model model) {
      Object user = session.getAttribute("user");
      if (!(user instanceof Bibliothecaire)) {
         return "redirect:/login";
      } else {
         model.addAttribute("reservations", this.reservationService.getPendingReservations());
         return "reservation_list";
      }
   }

   @PostMapping({"/reservation-action"})
   public String processReservationAction(@RequestParam int reservationId, @RequestParam String action, HttpSession session, Model model) {
      Object user = session.getAttribute("user");
      if (!(user instanceof Bibliothecaire)) {
         return "redirect:/login";
      } else {
         boolean accept = "accept".equals(action);
         String result = this.reservationService.processReservationAction(reservationId, accept);
         model.addAttribute("message", result);
         model.addAttribute("reservations", this.reservationService.getPendingReservations());
         return "reservation_list";
      }
   }
}
