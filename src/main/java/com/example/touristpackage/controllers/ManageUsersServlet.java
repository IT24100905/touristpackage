package com.example.touristpackage.controllers;

import com.example.touristpackage.entity.UserDetail;
import com.example.touristpackage.util.AdminUserService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/manageUsers")
public class ManageUsersServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String searchTerm = request.getParameter("search");
        List<UserDetail> users;

        if (searchTerm != null && !searchTerm.trim().isEmpty()) {
            // Search for users by username or fullname
            users = AdminUserService.searchUsers(searchTerm);
        } else {
            // Get all users
            users = AdminUserService.getAllUsers();
        }

        request.setAttribute("users", users);
        request.getRequestDispatcher("manageUsers.jsp").forward(request, response);
    }
}