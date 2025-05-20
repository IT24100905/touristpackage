package com.example.touristpackage.controller;

import com.example.touristpackage.entity.BasicOrder;
import com.example.touristpackage.util.BasicPackageUtil;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;

@WebServlet("/basicOrder")
public class BasicOrderServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        if (session == null || session.getAttribute("user") == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        String username = (String) session.getAttribute("user");
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        int adults = Integer.parseInt(request.getParameter("adults"));
        int kids = Integer.parseInt(request.getParameter("kids"));
        String arrival = request.getParameter("arrival");
        double totalCost = Double.parseDouble(request.getParameter("totalCost"));
        String packageId = request.getParameter("packageId");

        String packageName = BasicPackageUtil.getPackageNameById(packageId);

        BasicOrder order = new BasicOrder(
                username, packageId, name, email, adults, kids,
                arrival, packageName, totalCost, null, null, null
        );

        session.setAttribute("basicOrder", order);
        session.setAttribute("orderType", "basic");
        response.sendRedirect("payment.jsp");
    }
}
