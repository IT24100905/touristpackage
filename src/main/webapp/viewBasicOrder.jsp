<%@ page import="com.example.touristpackage.entity.Order" %>
<%@ page import="com.example.touristpackage.util.AdminOrderService" %>
<%@ page session="true" %>
<%@ page import="java.util.List" %>

<%
  String username = request.getParameter("user");
  String ref = request.getParameter("ref");

  Order foundOrder = null;
  for (Order o : AdminOrderService.getAllBasicOrders()) {
    if (o.getUsername().equals(username) && o.getPaymentReference().equals(ref)) {
      foundOrder = o;
      break;
    }
  }

  if (foundOrder == null) {
    response.sendRedirect("manageBasicOrders.jsp");
    return;
  }
%>

<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>View Basic Order</title>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
  <style>
    body {
      background-color: #f8f9fa;
      font-family: 'Segoe UI', sans-serif;
    }

    .details-container {
      max-width: 700px;
      margin: 40px auto;
      background: #fff;
      border-radius: 12px;
      padding: 30px;
      box-shadow: 0 0 15px rgba(0,0,0,0.07);
    }

    .details-title {
      font-weight: 600;
      margin-bottom: 20px;
      color: #333;
    }

    .info-label {
      font-weight: 500;
      color: #555;
    }

    .btn-back {
      margin-top: 30px;
    }
  </style>
</head>
<body>

<div class="details-container">
  <h3 class="details-title">Basic Order Details</h3>

  <div class="mb-3"><span class="info-label">Username:</span> <%= foundOrder.getUsername() %></div>
  <div class="mb-3"><span class="info-label">Package Title:</span> <%= foundOrder.getTitle() %></div>
  <div class="mb-3"><span class="info-label">Full Name:</span> <%= foundOrder.getName() %></div>
  <div class="mb-3"><span class="info-label">Email:</span> <%= foundOrder.getEmail() %></div>
  <div class="mb-3"><span class="info-label">Adults:</span> <%= foundOrder.getAdults() %></div>
  <div class="mb-3"><span class="info-label">Kids:</span> <%= foundOrder.getKids() %></div>
  <div class="mb-3"><span class="info-label">Arrival:</span> <%= foundOrder.getArrival() %></div>
  <div class="mb-3"><span class="info-label">Duration:</span> <%= foundOrder.getDuration() %> days</div>
  <div class="mb-3"><span class="info-label">Package:</span> <%= foundOrder.getCountry() %></div>
  <div class="mb-3"><span class="info-label">Total Cost:</span> LKR <%= foundOrder.getTotalCost() %></div>
  <div class="mb-3"><span class="info-label">Payment Method:</span> <%= foundOrder.getPaymentMethod() %></div>
  <div class="mb-3"><span class="info-label">Payment Date:</span> <%= foundOrder.getPaymentDate() %></div>
  <div class="mb-3"><span class="info-label">Payment Reference:</span> <%= foundOrder.getPaymentReference() %></div>
  <div class="mb-3"><span class="info-label">Status:</span> <%= foundOrder.getStatus() %></div>

  <a href="manageBasicOrders.jsp" class="btn btn-outline-secondary btn-back">
    <i class="bi bi-arrow-left"></i> Back to Basic Orders
  </a>
</div>

</body>
</html>
