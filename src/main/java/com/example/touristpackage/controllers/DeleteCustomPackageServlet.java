package com.example.touristpackage.controllers;

import com.example.touristpackage.util.CustomPackageUtil;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;

@WebServlet("/deleteCustomPackage")
public class DeleteCustomPackageServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String country = request.getParameter("country");
        if (country != null && !country.trim().isEmpty()) {
            CustomPackageUtil.delete(country);
        }
        response.sendRedirect("manageCustomPackages.jsp");
    }
}