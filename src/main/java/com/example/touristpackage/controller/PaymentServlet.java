package com.example.touristpackage.controller;

import com.example.touristpackage.entity.Order;
import com.example.touristpackage.entity.User;
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

        User user = (User) session.getAttribute("user");
        Order temp = (Order) session.getAttribute("orderTemp");

        String method = request.getParameter("method");
        String date = request.getParameter("date");
        String reference = request.getParameter("reference");

        Order finalOrder = new Order(
                user.getUsername(), temp.getTitle(), temp.getName(), temp.getEmail(), temp.getContact(), temp.getNationality(),
                temp.getAdults(), temp.getKids(), temp.getArrival(), temp.getDuration(), temp.getCountry(), temp.getMessage(),
                temp.getTotalCost(), method, date, reference, "pending"
        );

        OrderUtil.saveOrder(finalOrder);
        session.removeAttribute("orderTemp");
        response.sendRedirect("success.jsp");
    }

}
