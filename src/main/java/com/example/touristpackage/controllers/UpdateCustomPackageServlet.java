package com.example.touristpackage.controllers;

import com.example.touristpackage.entity.CustomPackage;
import com.example.touristpackage.util.CustomPackageUtil;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;

@WebServlet("/UpdateCustomPackageServlet")
public class UpdateCustomPackageServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String country = request.getParameter("country");
        int flight = Integer.parseInt(request.getParameter("flight"));
        int day = Integer.parseInt(request.getParameter("day"));

        CustomPackage updated = new CustomPackage(country, flight, day);
        CustomPackageUtil.update(updated);

        response.sendRedirect("manageCustomPackages.jsp");
    }
}