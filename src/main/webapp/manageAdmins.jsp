<%@ page import="java.util.List" %>
<%@ page import="com.example.touristpackage.util.AdminAccountUtil" %>

<%
  List<String[]> admins = AdminAccountUtil.getAllAdmins();
%>

<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Manage Admins</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
<div class="container py-5">
  <h3 class="mb-4">Manage Admin Accounts</h3>
  <table class="table table-bordered bg-white">
    <thead class="table-light">
    <tr>
      <th>#</th>
      <th>Username</th>
      <th>Password</th>
      <th>Actions</th>
    </tr>
    </thead>
    <tbody>
    <% int i = 1;
      for (String[] a : admins) { %>
    <tr>
      <td><%= i++ %></td>
      <td><%= a[0] %></td>
      <td><%= a[1] %></td>
      <td>
        <a href="DeleteAdminServlet?user=<%= a[0] %>" class="btn btn-sm btn-outline-danger">Delete</a>
        <a href="ResetAdminForm.jsp?user=<%= a[0] %>" class="btn btn-sm btn-outline-primary">Reset Password</a>
      </td>
    </tr>
    <% } %>
    </tbody>
  </table>
</div>
</body>
</html>