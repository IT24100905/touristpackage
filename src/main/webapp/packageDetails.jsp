<%@ page import="com.example.touristpackage.entity.BasicPackage" %>
<%@ page import="com.example.touristpackage.util.BasicPackageUtil" %>
<%@ page import="com.example.touristpackage.util.PackageImageUtil" %>
<%@ page import="java.util.*" %>
<%
  String id = request.getParameter("id");
  BasicPackage pkg = BasicPackageUtil.getPackageById(id);
  List<BasicPackage> others = BasicPackageUtil.getAllPackages();
  Map<String, String> imageMap = PackageImageUtil.getImageMap();
  if (pkg == null) {
    out.println("Package not found.");
    return;
  }
  String imageUrl = imageMap.getOrDefault(pkg.getId(), "images/default.jpg");
%>
<!DOCTYPE html>
<html>
<head>
  <title><%= pkg.getName() %> - Package Details</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
  <style>
    .package-image {
      max-width: 100%;
      height: 420px;
      object-fit: cover;
      border-radius: 10px;
    }
    .detail-box {
      background-color: #f8f9fa;
      border-radius: 10px;
      padding: 25px;
    }
    .highlight {
      font-weight: bold;
      font-size: 1.5rem;
    }
    .label {
      font-size: 0.9rem;
      color: #888;
    }
  </style>
</head>
<body class="bg-light">
<div class="container py-5">
  <div class="row mb-4">
    <div class="col-md-8">
      <img src="<%= imageUrl %>" alt="<%= pkg.getName() %>" class="package-image w-100">
      
    </div>
    <div class="col-md-4">
      <div class="detail-box">
        <p class="label">Destination</p>
        <p class="mb-2"><strong><%= pkg.getDestination() %></strong></p>
        <p class="label">Duration</p>
        <p class="mb-2"><strong><%= pkg.getDays() %> Days</strong></p>
        <p class="label">Starting at</p>
        <p class="highlight">LKR <%= String.format("%,.2f", pkg.getPrice()) %></p>

        <form action="basicBooking.jsp" method="post">
          <input type="hidden" name="packageId" value="<%= pkg.getId() %>">
          <button type="submit" class="btn btn-success w-100 mt-3">Book This Package</button>
        </form>
        <a href="homepage.jsp" class="btn btn-outline-secondary w-100 mt-2">Back to Home</a>
      </div>
    </div>
  </div>
  <div class="row">
    <div class="col-12">
      <h3><%= pkg.getName() %></h3>
      <p><%= pkg.getDescription() %></p>
    </div>
  </div>

  <hr class="my-5">
  <h4>Other Packages You Might Like</h4>
  <div class="row row-cols-1 row-cols-md-3 g-4 mt-2">
    <% int count = 0;
      for (BasicPackage p : others) {
        if (!p.getId().equals(pkg.getId()) && count < 3) {
          String img = imageMap.getOrDefault(p.getId(), "images/default.jpg");
          count++;
    %>
    <div class="col">
      <div class="card h-100">
        <img src="<%= img %>" class="card-img-top" style="height:200px; object-fit:cover">
        <div class="card-body">
          <h5 class="card-title"><%= p.getName() %></h5>
          <p class="card-text"><%= p.getDestination() %> - <%= p.getDays() %> Days</p>
          <a href="packageDetails.jsp?id=<%= p.getId() %>" class="btn btn-primary btn-sm">View</a>
        </div>
      </div>
    </div>
    <% }} %>
  </div>
</div>
</body>
</html>