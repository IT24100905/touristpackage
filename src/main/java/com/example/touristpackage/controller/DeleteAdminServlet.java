package com.example.touristpackage.controller;

import com.example.touristpackage.util.AdminAccountUtil;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;

@WebServlet("/DeleteAdminServlet")
public class DeleteAdminServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String username = request.getParameter("user");
        if (username != null && !username.trim().isEmpty()) {
            AdminAccountUtil.deleteAdmin(username);
        }
        response.sendRedirect("manageAdmins.jsp");
    }
}