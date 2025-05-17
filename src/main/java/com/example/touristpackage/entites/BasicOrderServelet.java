package com.example.touristpackage.controller;

import com.example.touristpackage.entity.BasicOrder;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;

@WebServlet("/basicOrder")
public class BasicOrderServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("user") == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        String username = (String) session.getAttribute("user"); // this is the username string
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        int adults = Integer.parseInt(request.getParameter("adults"));
        int kids = Integer.parseInt(request.getParameter("kids"));
        String arrival = request.getParameter("arrival");
        double total = Double.parseDouble(request.getParameter("totalCost"));
        String packageId = request.getParameter("packageId");

        // Use username directly
        BasicOrder order = new BasicOrder(username, packageId, name, email,
                adults, kids, arrival, "", total, null, null, null);

        session.setAttribute("basicOrder", order);
        response.sendRedirect("payment.jsp"); // ✔️ make sure this path exists

    }
}
