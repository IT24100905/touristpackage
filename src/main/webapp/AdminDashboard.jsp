<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Admin Dashboard - TwistnTrip</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet">
  <style>
    body {
      font-family: 'Segoe UI', sans-serif;
      background-color: #f5f6fa;
    }
    .sidebar {
      height: 100vh;
      background-color: #2c3e50;
      color: white;
      position: fixed;
      width: 240px;
    }
    .sidebar a {
      color: white;
      text-decoration: none;
    }
    .sidebar .nav-link:hover {
      background-color: #34495e;
    }
    .main-content {
      margin-left: 240px;
      padding: 20px;
    }
    .topbar {
      background-color: #ffffff;
      padding: 10px 20px;
      box-shadow: 0 2px 4px rgba(0,0,0,0.1);
    }
    iframe {
      border: none;
      width: 100%;
      height: 80vh;
    }
  </style>
  <script>
    function loadPage(url) {
      document.getElementById("contentFrame").src = url;
    }
  </script>
</head>
<body>

<!-- Sidebar -->
<div class="sidebar d-flex flex-column p-3">
  <h4 class="text-center mb-4">Admin Panel</h4>
  <ul class="nav nav-pills flex-column">
    <li class="nav-item mb-2">
      <a href="#" onclick="loadPage('manageUsers')" class="nav-link"><i class="bi bi-people"></i> Manage Users</a>
    </li>
    <li class="nav-item mb-2">
      <a href="#" onclick="loadPage('manageCustomOrders.jsp')" class="nav-link"><i class="bi bi-box-seam"></i> Manage Custom Orders</a>
    </li>
    <li class="nav-item mb-2">
      <a href="#" onclick="loadPage('manageBasicOrders.jsp')" class="nav-link"><i class="bi bi-cart-check"></i> Manage Basic Orders</a>
    </li>
    <li class="nav-item mb-2">
      <a href="#" onclick="loadPage('manageAdmins.jsp')" class="nav-link"><i class="bi bi-person-badge"></i> Manage Admins</a>
    </li>
    <li class="nav-item mb-2">
      <a href="#" onclick="loadPage('manageFeedback')" class="nav-link"><i class="bi bi-chat-left-text"></i> Manage Feedback</a>
    </li>
    <li class="nav-item mb-2">
      <a href="#" onclick="loadPage('manageBasicPackages.jsp')" class="nav-link"><i class="bi bi-box"></i> Manage Basic Packages</a>
    </li>
    <li class="nav-item mb-2">
      <a href="#" onclick="loadPage('manageCustomPackages.jsp')" class="nav-link"><i class="bi bi-globe2"></i> Manage Custom Packages</a>
    </li>

    <li class="nav-item mt-4">
      <a href="logout.jsp" class="nav-link text-danger"><i class="bi bi-box-arrow-right"></i> Logout</a>
    </li>
  </ul>
</div>

<!-- Main Content -->
<div class="main-content">
  <div class="topbar d-flex justify-content-between align-items-center">
    <h5>Welcome, <%= request.getSession().getAttribute("adminUsername") %></h5>
    <span class="text-muted">TwistnTrip Admin Dashboard</span>
  </div>

  <div class="container-fluid mt-4">
    <iframe id="contentFrame" src="" title="Dashboard View"></iframe>
  </div>
</div>

</body>
</html>