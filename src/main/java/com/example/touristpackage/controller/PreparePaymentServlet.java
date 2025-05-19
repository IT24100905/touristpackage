package com.example.touristpackage.controller;

import com.example.touristpackage.entity.Order;
import com.example.touristpackage.entity.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;

@WebServlet("/preparePayment")
public class PreparePaymentServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("user") == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        User user = (User) session.getAttribute("user");

        String title = request.getParameter("title");
        String name = request.getParameter("name");
        String contact = request.getParameter("contact");
        String nationality = request.getParameter("nationality");
        String email = request.getParameter("email");
        int adults = Integer.parseInt(request.getParameter("adults"));
        int kids = Integer.parseInt(request.getParameter("kids"));
        String arrival = request.getParameter("arrival");
        int duration = Integer.parseInt(request.getParameter("duration"));
        String country = request.getParameter("country");
        String message = request.getParameter("message");
        double total = Double.parseDouble(request.getParameter("totalPrice"));

        Order order = new Order(
                user.getUsername(), "Custom Package", title + " " + name, email, contact, nationality,
                adults, kids, arrival, duration, country, message, total,
                null, null, null, null  // payment details not yet filled
        );

        session.setAttribute("orderTemp", order);
        response.sendRedirect("payment.jsp");
    }
}
