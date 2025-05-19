<%@ page import="com.example.touristpackage.entity.Order" %>
<%@ page import="com.example.touristpackage.util.AdminOrderService" %>
<%@ page session="true" %>
<%@ page import="java.util.List" %>

<%
  List<Order> orders = AdminOrderService.getAllCustomOrders();
%>

<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Manage Custom Orders</title>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
  <style>
    body {
      background-color: #f4f6f9;
      font-family: 'Segoe UI', sans-serif;
    }

    .table-wrapper {
      padding: 40px 60px;
    }

    .status-pending {
      color: #856404;
      background-color: #fff3cd;
      border-radius: 12px;
      padding: 4px 10px;
      font-size: 0.85rem;
    }

    .status-approved {
      color: #155724;
      background-color: #d4edda;
      border-radius: 12px;
      padding: 4px 10px;
      font-size: 0.85rem;
    }

    .status-rejected {
      color: #721c24;
      background-color: #f8d7da;
      border-radius: 12px;
      padding: 4px 10px;
      font-size: 0.85rem;
    }
  </style>
</head>
<body>

<div class="table-wrapper">
  <h3 class="mb-4 fw-semibold text-dark">Manage Custom Orders</h3>

  <div class="table-responsive">
    <table class="table table-bordered align-middle bg-white">
      <thead class="table-light">
      <tr>
        <th>#</th>
        <th>User</th>
        <th>Package</th>
        <th>Total (LKR)</th>
        <th>Status</th>
        <th>Actions</th>
      </tr>
      </thead>
      <tbody>
      <% if (orders.isEmpty()) { %>
      <tr>
        <td colspan="6" class="text-center text-muted">No orders available.</td>
      </tr>
      <% } else {
        int count = 1;
        for (Order o : orders) {
          String badge = o.getStatus().equalsIgnoreCase("approved") ? "status-approved" :
                  o.getStatus().equalsIgnoreCase("rejected") ? "status-rejected" : "status-pending";
      %>
      <tr>
        <td><%= count++ %></td>
        <td><%= o.getUsername() %></td>
        <td><%= o.getTitle() %></td>
        <td><%= o.getTotalCost() %></td>
        <td><span class="<%= badge %>"><%= o.getStatus() %></span></td>
        <td>
          <a href="viewCustomOrder.jsp?user=<%= o.getUsername() %>&ref=<%= o.getPaymentReference() %>" class="btn btn-sm btn-outline-primary">
            <i class="bi bi-eye"></i> View
          </a>
          <a href="UpdateOrderStatusServlet?type=custom&action=approve&user=<%= o.getUsername() %>&ref=<%= o.getPaymentReference() %>" class="btn btn-sm btn-outline-success">
            <i class="bi bi-check-circle"></i> Approve
          </a>
          <a href="UpdateOrderStatusServlet?type=custom&action=reject&user=<%= o.getUsername() %>&ref=<%= o.getPaymentReference() %>" class="btn btn-sm btn-outline-danger">
            <i class="bi bi-x-circle"></i> Reject
          </a>
        </td>
      </tr>
      <% } } %>
      </tbody>
    </table>
  </div>
</div>

</body>
</html>
