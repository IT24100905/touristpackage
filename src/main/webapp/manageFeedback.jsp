<%@ page import="com.example.touristpackage.entity.Review" %>
<%@ page import="java.util.List" %>
<%@ page session="true" %>

<%
  List<Review> reviews = (List<Review>) request.getAttribute("reviews");
  if (reviews == null) {
    reviews = new java.util.ArrayList<>();
  }
%>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Manage Feedback - TwistnTrip</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet">
  <style>
    body {
      font-family: 'Segoe UI', sans-serif;
    }
    .card {
      border-radius: 10px;
      box-shadow: 0 2px 6px rgba(0, 0, 0, 0.05);
    }
    .review-rating {
      color: #f8c200;
    }
  </style>
</head>
<body class="bg-light">

<div class="container py-4">
  <h3 class="mb-4">Manage User Feedback</h3>

  <% if (reviews.isEmpty()) { %>
  <div class="alert alert-info">No reviews submitted yet.</div>
  <% } else { %>
  <div class="row row-cols-1 row-cols-md-2 g-4">
    <% for (Review r : reviews) { %>
    <div class="col">
      <div class="card p-3">
        <div class="d-flex justify-content-between align-items-center">
          <h5 class="mb-1"><i class="bi bi-person-circle me-1"></i> <%= r.getUsername() %></h5>
          <span class="text-muted small"><%= r.getDate() %></span>
        </div>
        <div class="mt-2">
          <% for (int i = 0; i < r.getRating(); i++) { %>
          <i class="bi bi-star-fill review-rating"></i>
          <% } %>
        </div>
        <p class="mt-2 mb-1"><%= r.getReviewText() %></p>
        <form action="DeleteReviewServlet" method="get" onsubmit="return confirm('Delete this review?')">
          <input type="hidden" name="user" value="<%= r.getUsername() %>">
          <input type="hidden" name="date" value="<%= r.getDate() %>">
          <button type="submit" class="btn btn-sm btn-outline-danger mt-2"><i class="bi bi-trash"></i> Delete</button>
        </form>
      </div>
    </div>
    <% } %>
  </div>
  <% } %>
</div>

</body>
</html>