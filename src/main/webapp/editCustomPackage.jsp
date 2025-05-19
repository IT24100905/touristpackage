<%@ page import="com.example.touristpackage.util.CustomPackageUtil" %>
<%@ page import="com.example.touristpackage.entity.CustomPackage" %>
<%@ page session="true" %>

<%
  String country = request.getParameter("country");
  CustomPackage cp = CustomPackageUtil.getByCountry(country);

  if (cp == null) {
    response.sendRedirect("manageCustomPackages.jsp");
    return;
  }
%>

<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Edit Custom Package</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
  <style>
    body {
      background: #f4f6f9;
      font-family: 'Segoe UI', sans-serif;
    }

    .form-container {
      max-width: 600px;
      margin: 50px auto;
      background: #fff;
      padding: 30px;
      border-radius: 12px;
      box-shadow: 0 0 15px rgba(0,0,0,0.08);
    }

    .form-title {
      font-weight: 600;
      margin-bottom: 20px;
    }
  </style>
</head>
<body>

<div class="form-container">
  <h3 class="form-title">Edit Package Rate - <%= cp.getCountry() %></h3>
  <form action="UpdateCustomPackageServlet" method="post">
    <input type="hidden" name="country" value="<%= cp.getCountry() %>">

    <div class="mb-3">
      <label class="form-label">Flight Price (LKR)</label>
      <input type="number" name="flight" class="form-control" required value="<%= cp.getFlightPrice() %>">
    </div>

    <div class="mb-3">
      <label class="form-label">Day Rate (LKR)</label>
      <input type="number" name="day" class="form-control" required value="<%= cp.getDayPrice() %>">
    </div>

    <button type="submit" class="btn btn-primary">Update</button>
    <a href="manageCustomPackages.jsp" class="btn btn-secondary">Cancel</a>
  </form>
</div>

</body>
</html>