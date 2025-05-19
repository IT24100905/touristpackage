package com.example.touristpackage.controller;

import com.example.touristpackage.util.ReviewUtil;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.*;

@WebServlet("/DeleteReviewServlet")
public class DeleteReviewServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String user = request.getParameter("user");
        String date = request.getParameter("date");

        if (user == null || date == null) {
            response.sendRedirect("manageFeedback");
            return;
        }

        // Use the utility method to delete the review
        boolean deleted = ReviewUtil.deleteReview(user, date);

        // Redirect to the servlet, not directly to the JSP
        response.sendRedirect("manageFeedback");
    }
}