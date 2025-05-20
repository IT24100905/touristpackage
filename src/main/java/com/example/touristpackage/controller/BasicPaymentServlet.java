package com.example.touristpackage.controller;

import com.example.touristpackage.entity.BasicOrder;
import com.example.touristpackage.util.OrderUtil;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;

@WebServlet("/processBasicPayment")
public class BasicPaymentServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("basicOrder") == null) {
            response.sendRedirect("homepage.jsp");
            return;
        }

        try {
            BasicOrder temp = (BasicOrder) session.getAttribute("basicOrder");

            // ✅ These must match your form's input "name" fields
            String method = request.getParameter("paymentMethod");
            String date = request.getParameter("paymentDate");
            String reference = request.getParameter("referenceNo").trim();

            // ✅ Null or blank check
            if (method == null || date == null || reference == null ||
                    method.trim().isEmpty() || date.trim().isEmpty() || reference.trim().isEmpty()) {
                request.setAttribute("error", "All payment fields are required.");
                request.getRequestDispatcher("payment.jsp").forward(request, response);
                return;
            }

            BasicOrder finalOrder = new BasicOrder(
                    temp.getUsername(), temp.getPackageId(), temp.getName(), temp.getEmail(),
                    temp.getAdults(), temp.getKids(), temp.getArrivalDate(), temp.getPackageName(),
                    temp.getTotalCost(), method.trim(), reference.trim(), date.trim()
            );

            OrderUtil.saveBasicOrder(finalOrder);

            session.removeAttribute("basicOrder");
            session.removeAttribute("orderType");

            response.sendRedirect("success.jsp");

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Something went wrong while processing your payment.");
            request.getRequestDispatcher("payment.jsp").forward(request, response);
        }
    }
}
