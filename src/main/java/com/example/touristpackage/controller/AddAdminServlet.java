package com.example.touristpackage.controller;

import com.example.touristpackage.util.FilePathUtil;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.*;

@WebServlet("/AddAdminServlet")
public class AddAdminServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String username = request.getParameter("username").trim();
        String password = request.getParameter("password").trim();
        String role = request.getParameter("role").trim(); // Should be "admin"

        try (BufferedWriter writer = new BufferedWriter(new FileWriter(FilePathUtil.USER_FILE, true))) {
            writer.write(username + "," + password + "," + role);
            writer.newLine();
        }

        response.sendRedirect("manageAdmins.jsp");
    }
}
