<%@ page import="java.util.List" %>
<%@ page import="com.example.touristpackage.entity.Review" %>
<%@ page import="com.example.touristpackage.util.ReviewUtil" %>

<%
  List<Review> reviews = ReviewUtil.getAllReviews();
%>

<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Manage Reviews</title>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css">
</head>
<body class="bg-light">
<div class="container py-5">
  <h3 class="mb-4">User Reviews & Feedback</h3>

  <div class="table-responsive">
    <table class="table table-bordered bg-white align-middle">
      <thead class="table-light">
      <tr>
        <th>#</th>
        <th>Username</th>
        <th>Date</th>
        <th>Rating</th>
        <th>Review</th>
        <th>Action</th>
      </tr>
      </thead>
      <tbody>
      <% if (reviews.isEmpty()) { %>
      <tr><td colspan="6" class="text-center text-muted">No reviews yet.</td></tr>
      <% } else {
        int count = 1;
        for (Review r : reviews) { %>
      <tr>
        <td><%= count++ %></td>
        <td><%= r.getUsername() %></td>
        <td><%= r.getDate() %></td>
        <td>
          <% for (int i = 0; i < r.getRating(); i++) { %>
          &#9733;
          <% } %>
        </td>
        <td><%= r.getReviewText() %></td>
        <td>
          <a href="DeleteReviewServlet?user=<%= r.getUsername() %>&date=<%= r.getDate() %>"
             class="btn btn-sm btn-outline-danger"
             onclick="return confirm('Delete this review?');">
            Delete
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