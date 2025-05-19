package com.example.touristpackage.controller;

import com.example.touristpackage.util.BasicPackageUtil;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;

@WebServlet("/deleteBasicPackage")
public class DeleteBasicPackageServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String id = request.getParameter("id");

        if (id != null && !id.trim().isEmpty()) {
            BasicPackageUtil.deletePackage(id);
        }

        response.sendRedirect("manageBasicPackages.jsp");
    }
}