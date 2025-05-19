<%
  String username = request.getParameter("user");
  if (username == null) {
    response.sendRedirect("manageAdmins.jsp");
    return;
  }
%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Reset Admin Password</title>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css">
</head>
<body class="bg-light">
<div class="container py-5" style="max-width: 500px;">
  <h3 class="mb-4">Reset Password for <%= username %></h3>
  <form method="post" action="ResetAdminServlet">
    <input type="hidden" name="user" value="<%= username %>">
    <div class="mb-3">
      <label class="form-label">New Password</label>
      <input type="password" name="password" class="form-control" required>
    </div>
    <button type="submit" class="btn btn-primary">Reset Password</button>
    <a href="manageAdmins.jsp" class="btn btn-secondary">Cancel</a>
  </form>
</div>
</body>
</html>