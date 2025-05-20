package com.example.touristpackage.controller;

import com.example.touristpackage.entity.Order;
import com.example.touristpackage.util.OrderUtil;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;

@WebServlet("/processPayment")
public class PaymentServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("user") == null || session.getAttribute("orderTemp") == null) {
            response.sendRedirect("homepage.jsp");
            return;
        }

        try {
            String username = (String) session.getAttribute("user");
            Order temp = (Order) session.getAttribute("orderTemp");

            // Match field names from JSP exactly
            String method = request.getParameter("paymentMethod").trim();
            String date = request.getParameter("paymentDate").trim();
            String reference = request.getParameter("referenceNo").trim();

            // Create final order with payment info
            Order finalOrder = new Order(
                    username, temp.getTitle(), temp.getName(), temp.getEmail(), temp.getContact(), temp.getNationality(),
                    temp.getAdults(), temp.getKids(), temp.getArrival(), temp.getDuration(), temp.getCountry(), temp.getMessage(),
                    temp.getTotalCost(), method, date, reference, "pending"
            );

            // Save order
            OrderUtil.saveOrder(finalOrder);

            // Clear session and redirect
            session.removeAttribute("orderTemp");
            response.sendRedirect("success.jsp");

        } catch (Exception e) {
            e.printStackTrace(); // Log the error
            request.setAttribute("error", "Payment failed: " + e.getMessage());
            request.getRequestDispatcher("payment.jsp").forward(request, response);
        }
    }
}
