<%@ page import="com.example.touristpackage.entity.User" %>
<%@ page import="com.example.touristpackage.util.BasicPackageUtil" %>
<%@ page import="com.example.touristpackage.util.PackageImageUtil" %>
<%@ page import="com.example.touristpackage.util.ReviewUtil" %>
<%@ page import="com.example.touristpackage.entity.BasicPackage" %>
<%@ page import="com.example.touristpackage.entity.Review" %>
<%@ page import="java.util.*" %>
<%@ page session="true" %>

<%
  String user = (String) session.getAttribute("user");
  String customizeLink = (user != null) ? "customize" : "login.jsp";

  List<BasicPackage> packages = com.example.touristpackage.util.BasicPackageUtil.getAllPackages();
  Map<String, String> imageMap = com.example.touristpackage.util.PackageImageUtil.getImageMap();
  List<com.example.touristpackage.entity.Review> reviewList = com.example.touristpackage.util.ReviewUtil.getAllReviews();
%>

<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Tourist Package</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
  <link rel="stylesheet" href="css/home.css">
  <style>
    body {
      background-color: #ffffff;
      color: #000;
      font-family: 'Segoe UI', sans-serif;
    }
    .carousel-control-prev-icon,
    .carousel-control-next-icon {
      filter: invert(1); /* turns white icons to black */
      background-color: transparent; /* keep transparent background */
      background-size: 100% 100%;
    }


    .navbar {
      background-color: #ffffff;
      padding: 12px 30px;
      display: flex;
      justify-content: space-between;
      align-items: center;
      box-shadow: 0 2px 8px rgba(0, 0, 0, 0.08);
    }

    .navbar .logo {
      font-weight: 700;
      font-size: 22px;
      color: #000;
    }

    .nav-links {
      display: flex;
      gap: 20px;
      align-items: center;
    }

    .nav-links a,
    .nav-links span {
      text-decoration: none;
      color: #000 !important;
      font-weight: 500;
      font-size: 16px;
      transition: color 0.2s ease;
    }

    .nav-links a:hover {
      color: #0d6efd !important;
    }

    .banner {
      background: url('https://images.unsplash.com/photo-1507525428034-b723cf961d3e') center center/cover no-repeat;
      color: #fff;
      padding: 100px 30px;
      text-align: center;
    }

    .banner h1 {
      font-size: 3rem;
      font-weight: bold;
      margin-bottom: 15px;
    }

    .banner p {
      font-size: 1.25rem;
      margin-bottom: 25px;
    }

    .banner .custom-btn {
      background-color: #fff;
      color: #0d6efd;
      border: none;
      padding: 10px 20px;
      font-weight: 500;
      text-decoration: none;
      border-radius: 5px;
      transition: all 0.3s ease;
    }

    .banner .custom-btn:hover {
      background-color: #e2e6ea;
      text-decoration: none;
    }

    section, .card-body, .about {
      background-color: #ffffff;
      color: #000;
    }
  </style>
</head>
<body>

<!-- Navbar -->
<div class="navbar">
  <div class="logo">TouristPackage</div>
  <div class="nav-links">
    <% if (user != null) { %>
    <span><%= user %></span>
    <a href="myorders.jsp">My Orders</a>
    <a href="logout.jsp">Logout</a>
    <% } else { %>
    <a href="login.jsp">Login</a>
    <a href="signup.jsp">Signup</a>
    <% } %>

  </div>
</div>

<!-- Banner -->
<section class="banner">
  <h1>Customize Your Own Package</h1>
  <p>Plan your perfect trip with ease</p>
  <a href="<%= customizeLink %>" class="custom-btn">Start Customizing</a>
</section>

<!-- Our Packages -->
<section class="container my-5">
  <h2 class="text-center fw-bold mb-4">Our Packages</h2>
  <div class="row">
    <% for (BasicPackage p : packages) { %>
    <div class="col-md-4 mb-4">
      <div class="card h-100 shadow-sm border-0">
        <img src="<%= imageMap.getOrDefault(p.getId(), "images/default.jpg") %>" class="card-img-top" alt="Tour Image" style="height: 200px; object-fit: cover;">
        <div class="card-body">
          <p class="text-primary mb-1"><%= p.getDestination() %></p>
          <h5 class="card-title fw-semibold"><%= p.getDays() %> Days - <%= p.getName() %></h5>
          <p class="card-text small text-muted"><%= p.getDescription() %></p>
          <div class="d-flex justify-content-between align-items-center mt-3">
            <a href="packageDetails.jsp?id=<%= p.getId() %>" class="btn btn-outline-primary btn-sm">View Details</a>
          </div>
        </div>
      </div>
    </div>
    <% } %>
  </div>
</section>

<!-- Reviews & Feedback -->
<section class="container my-5">
  <div class="d-flex justify-content-between align-items-center mb-3">
    <h2 class="fw-bold text-secondary">What our customers think about us</h2>
    <% if (user != null) { %>
    <button class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#reviewModal">Add Review</button>
    <% } %>
  </div>

  <div id="reviewCarousel" class="carousel slide" data-bs-ride="carousel">
    <div class="carousel-inner">
      <% for (int i = 0; i < reviewList.size(); i++) {
        Review r = reviewList.get(i); %>
      <div class="carousel-item <%= (i == 0) ? "active" : "" %>">
        <div class="card mx-auto p-4 shadow-sm text-center" style="max-width: 600px;">
          <h5 class="fw-semibold text-dark"><%= r.getUsername() %></h5>
          <p class="text-muted small mb-2"><%= r.getDate() %></p>
          <div class="mb-2">
            <% for (int star = 0; star < r.getRating(); star++) { %>
            <span class="text-warning">&#9733;</span>
            <% } %>
          </div>
          <p class="mb-0 fst-italic">"<%= r.getReviewText() %>"</p>
        </div>
      </div>
      <% } %>
    </div>

    <button class="carousel-control-prev" type="button" data-bs-target="#reviewCarousel" data-bs-slide="prev">
      <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    </button>
    <button class="carousel-control-next" type="button" data-bs-target="#reviewCarousel" data-bs-slide="next">
      <span class="carousel-control-next-icon" aria-hidden="true"></span>
    </button>
  </div>

</section>

<!-- Review Modal -->
<% if (user != null) { %>
<div class="modal fade" id="reviewModal" tabindex="-1" aria-labelledby="reviewModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <form action="submitReview" method="post" class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="reviewModalLabel">Submit Your Review</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <div class="mb-3">
          <label for="reviewText" class="form-label">Review</label>
          <textarea class="form-control" id="reviewText" name="reviewText" required></textarea>
        </div>
        <div class="mb-3">
          <label for="rating" class="form-label">Rating (1 to 5)</label>
          <select class="form-select" id="rating" name="rating" required>
            <option selected disabled>Select rating</option>
            <option value="5">&#9733;&#9733;&#9733;&#9733;&#9733;</option>
            <option value="4">&#9733;&#9733;&#9733;&#9733;</option>
            <option value="3">&#9733;&#9733;&#9733;</option>
            <option value="2">&#9733;&#9733;</option>
            <option value="1">&#9733;</option>
          </select>
        </div>
      </div>
      <div class="modal-footer">
        <button type="submit" class="btn btn-success">Submit Review</button>
      </div>
    </form>
  </div>
</div>
<% } %>

<!-- About Us -->
<section class="about container my-5">
  <h2>About Us</h2>
  <p>
    We are passionate about helping travelers create personalized journeys. Whether you're looking for an adventurous escape or a peaceful retreat, our platform empowers you to build your dream tour package with flexibility and ease.
  </p>
</section>

<!-- Login required alert -->
<% if (request.getAttribute("loginRequired") != null) { %>
<script>
  alert("Please login to continue.");
</script>
<% } %>

</body>
</html>
