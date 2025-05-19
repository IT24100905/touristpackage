package com.example.touristpackage.controllers;

import com.example.touristpackage.entity.UserDetail;
import com.example.touristpackage.util.AdminUserService;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import jakarta.servlet.ServletException;
import java.io.IOException;

@WebServlet("/updateUser")
public class UpdateUserServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String username = request.getParameter("username");
        String fullname = request.getParameter("fullname");
        String contact = request.getParameter("contact");
        String email = request.getParameter("email");
        String nic = request.getParameter("nic");

        UserDetail updatedUser = new UserDetail(username, fullname, contact, email, nic);
        AdminUserService.updateUser(updatedUser);

        response.sendRedirect("manageUsers.jsp");
    }
}
