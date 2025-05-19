<%@ page import="com.example.touristpackage.entity.UserDetail" %>
<%@ page import="java.util.List" %>
<%@ page session="true" %>

<%
  List<UserDetail> users = (List<UserDetail>) request.getAttribute("users");
  if (users == null) {
    response.sendRedirect("manageUsers");
    return;
  }
%>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Manage Users - TwistnTrip</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet">
  <style>
    body {
      font-family: 'Segoe UI', sans-serif;
    }
    .card {
      border-radius: 12px;
      box-shadow: 0 2px 8px rgba(0,0,0,0.05);
    }
    .btn-sm {
      font-size: 0.8rem;
    }
  </style>
</head>
<body class="bg-light">

<div class="container py-5">
  <h3 class="mb-4">Manage Users</h3>

  <form class="d-flex mb-4" method="get" action="manageUsers">
    <input type="text" name="search" class="form-control me-2" placeholder="Search by username or name..." />
    <button type="submit" class="btn btn-outline-primary">Search</button>
  </form>

  <% if (users.isEmpty()) { %>
  <div class="alert alert-warning">No users found.</div>
  <% } else { %>
  <div class="row row-cols-1 row-cols-md-2 g-4">
    <% for (UserDetail u : users) { %>
    <div class="col">
      <div class="card p-3">
        <h5 class="fw-semibold mb-1"><%= u.getFullname() %></h5>
        <p class="text-muted mb-1"><strong>Username:</strong> <%= u.getUsername() %></p>
        <p class="text-muted mb-1"><strong>Email:</strong> <%= u.getEmail() %></p>
        <p class="text-muted"><strong>NIC:</strong> <%= u.getNic() %></p>

        <div class="d-flex gap-2 mt-2">
          <a href="viewUser.jsp?username=<%= u.getUsername() %>" class="btn btn-sm btn-outline-secondary">
            <i class="bi bi-eye"></i> View
          </a>
          <a href="updateUser.jsp?username=<%= u.getUsername() %>" class="btn btn-sm btn-outline-success">
            <i class="bi bi-pencil"></i> Update
          </a>
          <a href="deleteUser?username=<%= u.getUsername() %>" class="btn btn-sm btn-outline-danger" onclick="return confirm('Delete this user?')">
            <i class="bi bi-trash"></i> Delete
          </a>
        </div>
      </div>
    </div>
    <% } %>
  </div>
  <% } %>
</div>

</body>
</html>