package com.example.touristpackage.controller;

import com.example.touristpackage.util.AdminOrderService;
import com.example.touristpackage.util.FilePathUtil;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;

@WebServlet("/UpdateOrderStatusServlet")
public class UpdateOrderStatusServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String user = request.getParameter("user");
        String ref = request.getParameter("ref");
        String action = request.getParameter("action");
        String type = request.getParameter("type");

        if (user == null || ref == null || action == null || type == null) {
            response.sendRedirect("AdminDashboard.jsp"); // fallback
            return;
        }

        String status = action.equalsIgnoreCase("approve") ? "Approved"
                : action.equalsIgnoreCase("reject") ? "Rejected"
                : "Pending";

        String filePath = type.equals("basic") ? FilePathUtil.BASIC_ORDER_FILE : FilePathUtil.ORDER_FILE;

        AdminOrderService.updateOrderStatus(user, filePath, ref, status);

        // redirect back to the same type page
        if ("basic".equals(type)) {
            response.sendRedirect("manageBasicOrders.jsp");
        } else {
            response.sendRedirect("manageCustomOrders.jsp");
        }
    }
}
