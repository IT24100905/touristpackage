package com.example.touristpackage.controller;

import com.example.touristpackage.entity.Order;

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

        try {
            // Get username stored as String in session
            String username = (String) session.getAttribute("user");

            // Retrieve and sanitize input parameters
            String title = request.getParameter("title").trim();
            String name = request.getParameter("name").trim();
            String contact = request.getParameter("contact").trim();
            String nationality = request.getParameter("nationality").trim();
            String email = request.getParameter("email").trim();
            int adults = Integer.parseInt(request.getParameter("adults").trim());
            int kids = Integer.parseInt(request.getParameter("kids").trim());
            String arrival = request.getParameter("arrival").trim();
            int duration = Integer.parseInt(request.getParameter("duration").trim());
            String country = request.getParameter("country").trim();
            String message = request.getParameter("message").trim();
            double total = Double.parseDouble(request.getParameter("totalPrice").trim());

            // Create Order object without payment details
            Order order = new Order(
                    username, "Custom Package", title + " " + name, email, contact, nationality,
                    adults, kids, arrival, duration, country, message, total,
                    null, null, null, null
            );

            session.setAttribute("orderTemp", order);
            session.setAttribute("orderType", "custom");
            response.sendRedirect("payment.jsp");


        } catch (NumberFormatException | NullPointerException e) {
            // Invalid input or missing fields — return to form with message
            request.setAttribute("error", "Invalid or missing input. Please fill all fields correctly.");
            request.getRequestDispatcher("customizeForm.jsp").forward(request, response);
        }
    }
}
