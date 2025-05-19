package com.example.touristpackage.controller;

import com.example.touristpackage.util.AdminAccountUtil;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;

@WebServlet("/AddAdminServlet")
public class AddAdminServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String username = request.getParameter("username");
        String password = request.getParameter("password");

        String message = "";

        if (username != null && password != null && !username.isEmpty() && !password.isEmpty()) {
            boolean success = AdminAccountUtil.addAdmin(username, password);

            if (success) {
                message = "Admin successfully added!";
            } else {
                message = "Failed to add admin. Username may already exist.";
            }

            request.getSession().setAttribute("adminMessage", message);
        }

        response.sendRedirect("manageAdmins.jsp");
    }
}