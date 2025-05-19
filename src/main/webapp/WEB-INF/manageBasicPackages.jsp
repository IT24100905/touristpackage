<%@ page import="com.example.touristpackage.entity.BasicPackage" %>
<%@ page import="com.example.touristpackage.util.BasicPackageUtil" %>
<%@ page import="java.util.List" %>
<%@ page session="true" %>

<%
  List<BasicPackage> packages = BasicPackageUtil.getAllPackages();
%>

<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Manage Basic Packages</title>
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
    <h3 class="fw-bold">Manage Basic Packages</h3>
    <button class="btn btn-primary mb-3" data-bs-toggle="modal" data-bs-target="#addPackageModal">
      <a href="addBasicPackage.jsp" class="btn btn-primary">
        <i class="bi bi-plus-circle"></i> Add New Package
      </a>
    </button>
  </div>

  <div class="table-responsive">
    <table class="table table-bordered align-middle bg-white">
      <thead class="table-light">
      <tr>
        <th>#</th>
        <th>Package Name</th>
        <th>Destination</th>
        <th>Duration</th>
        <th>Actions</th>
      </tr>
      </thead>
      <tbody>
      <% if (packages.isEmpty()) { %>
      <tr><td colspan="5" class="text-center text-muted">No packages available.</td></tr>
      <% } else {
        int count = 1;
        for (BasicPackage p : packages) { %>
      <tr>
        <td><%= count++ %></td>
        <td><%= p.getName() %></td>
        <td><%= p.getDestination() %></td>
        <td><%= p.getDays() %> days</td>
        <td>
          <a href="viewBasicPackage.jsp?id=<%= p.getId() %>" class="btn btn-sm btn-outline-primary">
            <i class="bi bi-eye"></i> View
          </a>
          <a href="editBasicPackage.jsp?id=<%= p.getId() %>" class="btn btn-sm btn-outline-success">
            <i class="bi bi-pencil-square"></i> Edit
          </a>
          <a href="deleteBasicPackage?id=<%= p.getId() %>" class="btn btn-sm btn-outline-danger" onclick="return confirm('Are you sure you want to delete this package?');">
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
