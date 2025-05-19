package com.example.touristpackage.controller;

import com.example.touristpackage.entity.Review;
import com.example.touristpackage.util.ReviewUtil;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.time.LocalDate;

@WebServlet("/submitReview")
public class ReviewServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        String username = (String) session.getAttribute("user");

        if (username == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        String reviewText = request.getParameter("reviewText");
        int rating = Integer.parseInt(request.getParameter("rating"));
        String date = LocalDate.now().toString();

        Review review = new Review(username, date, rating, reviewText);
        ReviewUtil.saveReview(review);

        response.sendRedirect("homepage.jsp");
    }
}