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

        String id = request.getParameter("id");
        String name = request.getParameter("name");
        String destination = request.getParameter("destination");
        int days = Integer.parseInt(request.getParameter("days"));
        double price = Double.parseDouble(request.getParameter("price")); // ✅ NEW
        String description = request.getParameter("description");

        BasicPackage updated = new BasicPackage(id, name, destination, days, price, description);
        BasicPackageUtil.updatePackage(updated);

        response.sendRedirect("manageBasicPackages.jsp");
    }
}
