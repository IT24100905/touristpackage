package com.example.touristpackage.controller;

import com.example.touristpackage.entity.BasicOrder;
import com.example.touristpackage.entity.Order;
import com.example.touristpackage.util.AdminOrderService;
import com.example.touristpackage.util.FilePathUtil;
import com.example.touristpackage.util.OrderUtil;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.util.List;

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

        if ("basic".equalsIgnoreCase(type)) {
            // ✅ Handle basic order update
            List<Order> orders = OrderUtil.getAllBasicOrders();
            for (Order order : orders) {
                if (order.getUsername().equals(user) &&
                        order.getPaymentReference().equals(ref)) {
                    order.setStatus(status);
                }
            }
            OrderUtil.saveAllOrdersAsBasic(orders);
            response.sendRedirect("manageBasicOrders.jsp");

        } else {
            // ✅ Handle custom order update via AdminOrderService
            AdminOrderService.updateOrderStatus(user, FilePathUtil.ORDER_FILE, ref, status);
            response.sendRedirect("manageCustomOrders.jsp");
        }
    }
}
