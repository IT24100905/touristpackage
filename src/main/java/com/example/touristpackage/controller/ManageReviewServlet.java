package com.example.touristpackage.controller;

import com.example.touristpackage.entity.Review;
import com.example.touristpackage.util.ReviewUtil;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.util.List;

@WebServlet("/manageFeedback")
public class ManageReviewServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        List<Review> reviews = ReviewUtil.getAllReviews();
        request.setAttribute("reviews", reviews);
        request.getRequestDispatcher("manageFeedback.jsp").forward(request, response);
    }
}