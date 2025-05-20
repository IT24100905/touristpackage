<%@ page import="com.example.touristpackage.entity.BasicPackage" %>
<%@ page import="com.example.touristpackage.util.BasicPackageUtil" %>
<%@ page session="true" %>

<%
  String id = request.getParameter("id");
  BasicPackage bp = BasicPackageUtil.getPackageById(id);

  if (bp == null) {
    response.sendRedirect("manageBasicPackages.jsp");
    return;
  }
%>

<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Edit Package</title>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css">
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
  <h3 class="form-title">Edit Package</h3>
  <form action="UpdateBasicPackageServlet" method="post">
    <input type="hidden" name="id" value="<%= bp.getId() %>">

    <div class="mb-3">
      <label class="form-label">Package Name</label>
      <input type="text" name="name" class="form-control" required value="<%= bp.getName() %>">
    </div>

    <div class="mb-3">
      <label class="form-label">Destination</label>
      <input type="text" name="destination" class="form-control" required value="<%= bp.getDestination() %>">
    </div>

    <div class="mb-3">
      <label class="form-label">Duration (days)</label>
      <input type="number" name="days" class="form-control" min="1" required value="<%= bp.getDays() %>">
    </div>

    <div class="mb-3">
      <label class="form-label">Price</label>
      <input type="text" name="price" class="form-control" required value="<%= bp.getPrice() %>">
    </div>


    <div class="mb-3">
      <label class="form-label">Description</label>
      <textarea name="description" class="form-control" rows="3" required><%= bp.getDescription() %></textarea>
    </div>

    <button type="submit" class="btn btn-primary">Update Package</button>
    <a href="manageBasicPackages.jsp" class="btn btn-secondary">Cancel</a>
  </form>
</div>

</body>
</html>