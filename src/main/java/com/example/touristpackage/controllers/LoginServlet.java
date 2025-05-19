package com.example.touristpackage.controllers;

import com.example.touristpackage.util.FilePathUtil;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.*;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String username = request.getParameter("username");
        String password = request.getParameter("password");

        File userFile = new File(FilePathUtil.USER_FILE);
        if (!userFile.exists()) {
            response.sendRedirect("login.jsp?error=true");
            return;
        }

        boolean valid = false;
        String role = "";

        try (BufferedReader reader = new BufferedReader(new FileReader(userFile))) {
            String line;
            while ((line = reader.readLine()) != null) {
                String[] parts = line.split(",");
                if (parts.length >= 3 && parts[0].equals(username) && parts[1].equals(password)) {
                    role = parts[2];
                    valid = true;
                    break;
                }
            }
        }

        if (valid) {
            HttpSession session = request.getSession();
            session.setAttribute("user", username);
            session.setAttribute("loggedUsername", username);
            session.setAttribute("role", role);

            if ("admin".equals(role)) {
                response.sendRedirect("AdminDashboard.jsp");
            } else {
                response.sendRedirect("homepage.jsp");
            }
        } else {
            response.sendRedirect("login.jsp?error=true");
        }
    }
}