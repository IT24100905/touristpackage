<%@ page import="com.example.touristpackage.entity.UserDetail" %>
<%@ page import="com.example.touristpackage.util.AdminUserService" %>
<%@ page session="true" %>
<%
  String username = request.getParameter("username");
  UserDetail user = AdminUserService.getUserByUsername(username);
  if (user == null) {
    response.sendRedirect("manageUsers.jsp");
    return;
  }
%>
<!DOCTYPE html>
<html>
<head>
  <title>View User</title>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css">
</head>
<body class="bg-light">
<div class="container py-5">
  <div class="card p-4 shadow-sm">
    <h3 class="mb-4">User Details</h3>
    <p><strong>Username:</strong> <%= user.getUsername() %></p>
    <p><strong>Full Name:</strong> <%= user.getFullname() %></p>
    <p><strong>Email:</strong> <%= user.getEmail() %></p>
    <p><strong>Contact:</strong> <%= user.getContact() %></p>
    <p><strong>NIC:</strong> <%= user.getNic() %></p>
    <div class="mt-3 d-flex gap-2">
      <a href="updateUser.jsp?username=<%= user.getUsername() %>" class="btn btn-success">Update</a>
      <a href="deleteUser?username=<%= user.getUsername() %>" class="btn btn-danger" onclick="return confirm('Delete this user?')">Delete</a>
      <a href="manageUsers.jsp" class="btn btn-secondary">Back</a>
    </div>
  </div>
</div>
</body>
</html>
