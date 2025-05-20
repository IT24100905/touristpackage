package com.example.touristpackage.controller;

import com.example.touristpackage.util.FilePathUtil;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.*;

@WebServlet("/AddBasicPackageServlet")
public class AddBasicPackageServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String id = request.getParameter("id");
        String name = request.getParameter("name");
        String destination = request.getParameter("destination");
        String daysStr = request.getParameter("days");
        String priceStr = request.getParameter("price");
        String description = request.getParameter("description");
        String imageUrl = request.getParameter("imageUrl");

        // Basic validation
        if (id == null || name == null || destination == null || daysStr == null ||
                priceStr == null || description == null || imageUrl == null ||
                id.isEmpty() || name.isEmpty() || destination.isEmpty() ||
                daysStr.isEmpty() || priceStr.isEmpty() || description.isEmpty() || imageUrl.isEmpty()) {

            request.setAttribute("error", "All fields are required.");
            request.getRequestDispatcher("addBasicPackage.jsp").forward(request, response);
            return;
        }

        try {
            int days = Integer.parseInt(daysStr.trim());
            double price = Double.parseDouble(priceStr.trim());

            // Save package details
            try (BufferedWriter writer = new BufferedWriter(new FileWriter(FilePathUtil.BASIC_PACKAGES_FILE, true))) {
                String line = String.join(",", id.trim(), name.trim(), destination.trim(),
                        String.valueOf(days), String.valueOf(price), description.trim());
                writer.write(line);
                writer.newLine();
            }

            // Save image URL separately
            try (BufferedWriter imageWriter = new BufferedWriter(new FileWriter(FilePathUtil.PACKAGE_IMAGE_FILE, true))) {
                imageWriter.write(id.trim() + "," + imageUrl.trim());
                imageWriter.newLine();
            }

            response.sendRedirect("manageBasicPackages.jsp");

        } catch (NumberFormatException e) {
            request.setAttribute("error", "Days and Price must be valid numbers.");
            request.getRequestDispatcher("addBasicPackage.jsp").forward(request, response);
        }
    }
}
