package com.example.touristpackage.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import com.example.touristpackage.util.DestinationUtil;

import java.io.IOException;
import java.util.Map;


@WebServlet("/customize")
public class CustomizePackageServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("user") == null) {
            request.setAttribute("loginRequired", true);
            request.getRequestDispatcher("homepage.jsp").forward(request, response);
            return;
        }

        Map<String, int[]> destinations = DestinationUtil.getDestinationData();
        request.setAttribute("destinations", destinations);
        request.getRequestDispatcher("customizeForm.jsp").forward(request, response);
    }
}
