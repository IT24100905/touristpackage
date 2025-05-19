<%@ page import="com.example.touristpackage.entity.CustomPackage" %>
<%@ page import="com.example.touristpackage.util.CustomPackageUtil" %>
<%@ page session="true" %>
<%@ page import="java.util.List" %>

<%
  List<CustomPackage> list = CustomPackageUtil.getAll();
%>

<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Manage Custom Packages</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet">
  <style>
    body {
      background-color: #f4f6f9;
      font-family: 'Segoe UI', sans-serif;
    }

    .wrapper {
      padding: 40px 60px;
    }

    .table th, .table td {
      vertical-align: middle;
    }
  </style>
</head>
<body>

<div class="wrapper">
  <div class="d-flex justify-content-between align-items-center mb-4">
    <h3 class="fw-bold">Manage Custom Package Prices</h3>
  </div>

  <div class="table-responsive">
    <table class="table table-bordered align-middle bg-white">
      <thead class="table-light">
      <tr>
        <th>#</th>
        <th>Country</th>
        <th>Flight Price (LKR)</th>
        <th>Day Rate (LKR)</th>
        <th>Actions</th>
      </tr>
      </thead>
      <tbody>
      <% if (list.isEmpty()) { %>
      <tr><td colspan="5" class="text-center text-muted">No entries available.</td></tr>
      <% } else {
        int count = 1;
        for (CustomPackage cp : list) { %>
      <tr>
        <td><%= count++ %></td>
        <td><%= cp.getCountry() %></td>
        <td><%= cp.getFlightPrice() %></td>
        <td><%= cp.getDayPrice() %></td>
        <td>
          <a href="editCustomPackage.jsp?country=<%= cp.getCountry() %>" class="btn btn-sm btn-outline-success">
            <i class="bi bi-pencil-square"></i> Edit
          </a>
          <a href="deleteCustomPackage?country=<%= cp.getCountry() %>" class="btn btn-sm btn-outline-danger" onclick="return confirm('Delete this entry?');">
            <i class="bi bi-trash"></i> Delete
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