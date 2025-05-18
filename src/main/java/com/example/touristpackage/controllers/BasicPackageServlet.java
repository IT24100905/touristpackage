package com.example.touristpackage.controllers;

import com.example.touristpackage.util.FilePathUtil;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.*;

@WebServlet("/addBasicPackage")
public class BasicPackageServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String id = request.getParameter("packageId").trim();
        String name = request.getParameter("name").trim();
        String country = request.getParameter("country").trim();
        String days = request.getParameter("days").trim();
        String description = request.getParameter("description").trim();
        String imageUrl = request.getParameter("imageUrl").trim();

        // Write to basicpackages.txt
        try (BufferedWriter writer = new BufferedWriter(new FileWriter(FilePathUtil.BASIC_PACKAGES_FILE, true))) {
            writer.write(String.join(",", id, name, country, days, description));
            writer.newLine();
        } catch (IOException e) {
            e.printStackTrace();
        }

        // Write to packageimages.txt
        try (BufferedWriter writer = new BufferedWriter(new FileWriter(FilePathUtil.PACKAGE_IMAGE_FILE, true))) {
            writer.write(id + "," + imageUrl);
            writer.newLine();
        } catch (IOException e) {
            e.printStackTrace();
        }

        response.sendRedirect("manageBasicPackages.jsp"); // Refresh page
    }
}
