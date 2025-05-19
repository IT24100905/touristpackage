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
  <title>Update User</title>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css">
</head>
<body class="bg-light">
<div class="container py-5">
  <form action="updateUser" method="post" class="card p-4 shadow-sm">
    <h3 class="mb-4">Update User</h3>
    <input type="hidden" name="username" value="<%= user.getUsername() %>">
    <div class="mb-3">
      <label class="form-label">Full Name</label>
      <input type="text" name="fullname" class="form-control" value="<%= user.getFullname() %>" required>
    </div>
    <div class="mb-3">
      <label class="form-label">Email</label>
      <input type="email" name="email" class="form-control" value="<%= user.getEmail() %>" required>
    </div>
    <div class="mb-3">
      <label class="form-label">Contact Number</label>
      <input type="text" name="contact" class="form-control" value="<%= user.getContact() %>" required>
    </div>
    <div class="mb-3">
      <label class="form-label">NIC</label>
      <input type="text" name="nic" class="form-control" value="<%= user.getNic() %>" required>
    </div>
    <div class="d-flex gap-2">
      <button type="submit" class="btn btn-primary">Update</button>
      <a href="manageUsers.jsp" class="btn btn-secondary">Cancel</a>
    </div>
  </form>
</div>
</body>
</html>
