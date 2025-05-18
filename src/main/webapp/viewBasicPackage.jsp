<%@ page import="com.example.touristpackage.entity.BasicPackage" %>
<%@ page import="com.example.touristpackage.util.BasicPackageUtil" %>
<%@ page session="true" %>

<%
  String id = request.getParameter("id");
  BasicPackage pack = BasicPackageUtil.getPackageById(id);

  if (pack == null) {
    response.sendRedirect("manageBasicPackages.jsp");
    return;
  }
%>

<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>View Package</title>
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

    .btn-bar {
      margin-top: 30px;
    }
  </style>
</head>
<body>

<div class="details-container">
  <h3 class="details-title">Package Details</h3>

  <div class="mb-3"><span class="info-label">Package ID:</span> <%= pack.getId() %></div>
  <div class="mb-3"><span class="info-label">Name:</span> <%= pack.getName() %></div>
  <div class="mb-3"><span class="info-label">Destination:</span> <%= pack.getDestination() %></div>
  <div class="mb-3"><span class="info-label">Duration:</span> <%= pack.getDays() %> days</div>
  <div class="mb-3"><span class="info-label">Description:</span> <%= pack.getDescription() %></div>

  <div class="btn-bar">
    <a href="manageBasicPackages.jsp" class="btn btn-outline-secondary">
      <i class="bi bi-arrow-left"></i> Back
    </a>
    <a href="editBasicPackage.jsp?id=<%= pack.getId() %>" class="btn btn-primary">
      <i class="bi bi-pencil-square"></i> Edit Package
    </a>
  </div>
</div>

</body>
</html>
