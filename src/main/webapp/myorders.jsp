<%@ page import="com.example.touristpackage.entity.Order" %>
<%@ page import="com.example.touristpackage.util.OrderUtil" %>
<%@ page session="true" %>
<%@ page import="java.util.List" %>

<%
  String username = (String) session.getAttribute("user");
  if (username == null) {
    response.sendRedirect("login.jsp");
    return;
  }

  List<Order> orders = OrderUtil.getOrdersForUser(username);
%>

<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>My Orders - TwistnTrip</title>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
  <style>
    body {
      background-color: #f4f6f9;
      font-family: 'Segoe UI', sans-serif;
    }

    .status-badge {
      padding: 6px 12px;
      font-size: 0.85rem;
      border-radius: 12px;
    }

    .status-pending {
      background-color: #fff3cd;
      color: #856404;
    }

    .status-complete {
      background-color: #d4edda;
      color: #155724;
    }

    .status-rejected {
      background-color: #f8d7da;
      color: #721c24;
    }

    .table-wrapper {
      padding: 40px 60px;
    }

    @media (max-width: 768px) {
      .table-wrapper {
        padding: 20px;
      }
    }

    .title-bar {
      display: flex;
      justify-content: space-between;
      align-items: center;
      margin-bottom: 25px;
    }
  </style>
</head>
<body>

<div class="table-wrapper">
  <div class="title-bar">
    <h3 class="text-dark fw-semibold">Order History</h3>
    <a href="homepage.jsp" class="btn btn-outline-secondary">
      <i class="bi bi-arrow-left-circle me-1"></i> Back to Home
    </a>
  </div>

  <div class="table-responsive">
    <table class="table table-bordered table-hover align-middle bg-white">
      <thead class="table-light">
      <tr>
        <th>#</th>
        <th>Package Title</th>
        <th>Total Price</th>
        <th>Status</th>
        <th>Action</th>
      </tr>
      </thead>
      <tbody>
      <% if (orders == null || orders.isEmpty()) { %>
      <tr>
        <td colspan="5" class="text-center text-muted">No orders found.</td>
      </tr>
      <% } else {
        int count = 1;
        for (Order o : orders) {
          String status = o.getStatus() != null ? o.getStatus().toLowerCase() : "pending";
          String badgeClass = status.equals("pending") ? "status-pending"
                  : status.equals("approved") ? "status-complete"
                  : "status-rejected";
      %>
      <tr>
        <td><%= count++ %></td>
        <td><%= o.getTitle() %></td>
        <td>LKR <%= o.getTotalCost() %></td>
        <td><span class="status-badge <%= badgeClass %>"><%= o.getStatus() %></span></td>
        <td><a href="#" class="btn btn-sm btn-outline-primary">View Details</a></td>
      </tr>
      <% } } %>
      </tbody>
    </table>
  </div>
</div>

</body>
</html>
