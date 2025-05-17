package com.example.touristpackage.controller;

import com.example.touristpackage.util.FilePathUtil;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.*;

@WebServlet("/signup")
public class SignupServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String username = request.getParameter("username").trim();
        String password = request.getParameter("password").trim();
        String fullname = request.getParameter("fullname").trim();
        String contact = request.getParameter("contact").trim();
        String email = request.getParameter("email").trim();
        String nic = request.getParameter("nic").trim();

        // Save credentials with role = user
        try (BufferedWriter bw = new BufferedWriter(new FileWriter(FilePathUtil.USER_FILE, true))) {
            bw.write(username + "," + password + ",user");
            bw.newLine();
        }

        // Save additional user details
        try (BufferedWriter bw = new BufferedWriter(new FileWriter(FilePathUtil.USER_DETAILS_FILE, true))) {
            bw.write(username + "," + fullname + "," + contact + "," + email + "," + nic);
            bw.newLine();
        }

        request.setAttribute("message", "Signup successful. Please login.");
        request.getRequestDispatcher("login.jsp").forward(request, response);
    }
}
