package com.example.touristpackage.controller;

import com.example.touristpackage.util.AdminAccountUtil;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;

@WebServlet("/ResetAdminServlet")
public class ResetAdminServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String user = request.getParameter("user");
        String password = request.getParameter("password");

        if (user != null && password != null && !user.isEmpty() && !password.isEmpty()) {
            AdminAccountUtil.updateAdminPassword(user, password);
        }

        response.sendRedirect("manageAdmins.jsp");
    }
}