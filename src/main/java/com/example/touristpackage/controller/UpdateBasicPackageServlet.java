package com.example.touristpackage.controller;

import com.example.touristpackage.entity.BasicPackage;
import com.example.touristpackage.util.BasicPackageUtil;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;

@WebServlet("/UpdateBasicPackageServlet")
public class UpdateBasicPackageServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            String id = request.getParameter("id");
            String name = request.getParameter("name");
            String destination = request.getParameter("destination");
            String daysStr = request.getParameter("days");
            String priceStr = request.getParameter("price");
            String description = request.getParameter("description");

            if (id == null || name == null || destination == null || daysStr == null || priceStr == null || description == null ||
                    id.isEmpty() || name.isEmpty() || destination.isEmpty() || daysStr.isEmpty() || priceStr.isEmpty() || description.isEmpty()) {
                request.setAttribute("error", "All fields are required.");
                request.getRequestDispatcher("editBasicPackage.jsp").forward(request, response);
                return;
            }

            int days = Integer.parseInt(daysStr.trim());
            double price = Double.parseDouble(priceStr.trim());

            BasicPackage updated = new BasicPackage(id.trim(), name.trim(), destination.trim(), days, price, description.trim());
            BasicPackageUtil.updatePackage(updated);

            response.sendRedirect("manageBasicPackages.jsp");

        } catch (NumberFormatException e) {
            request.setAttribute("error", "Invalid number format in days or price.");
            request.getRequestDispatcher("editBasicPackage.jsp").forward(request, response);
        } catch (Exception e) {
            request.setAttribute("error", "Unexpected error: " + e.getMessage());
            request.getRequestDispatcher("editBasicPackage.jsp").forward(request, response);
        }
    }
}
