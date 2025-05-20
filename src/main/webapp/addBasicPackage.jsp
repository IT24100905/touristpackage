<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Add New Package</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
  <style>
    body {
      background-color: #f4f6f9;
      font-family: 'Segoe UI', sans-serif;
    }
    .form-wrapper {
      max-width: 600px;
      margin: 60px auto;
      background: white;
      padding: 30px;
      border-radius: 12px;
      box-shadow: 0 0 15px rgba(0,0,0,0.1);
    }
    .form-title {
      margin-bottom: 25px;
    }
  </style>
</head>
<body>

<div class="form-wrapper">
  <h3 class="form-title text-center fw-bold">Add New Package</h3>

  <form action="AddBasicPackageServlet" method="post">
    <div class="mb-3">
      <label class="form-label">Package ID</label>
      <input type="text" class="form-control" name="id" required>
    </div>

    <div class="mb-3">
      <label class="form-label">Package Name</label>
      <input type="text" class="form-control" name="name" required>
    </div>

    <div class="mb-3">
      <label class="form-label">Country</label>
      <input type="text" class="form-control" name="destination" required>
    </div>

    <div class="mb-3">
      <label class="form-label">No. of Days</label>
      <input type="number" class="form-control" name="days" min="1" required>
    </div>

    <div class="mb-3">
      <label class="form-label">Price</label>
      <input type="number" class="form-control" name="price" min="0" step="1000" required>
    </div>

    <div class="mb-3">
      <label class="form-label">Description</label>
      <textarea class="form-control" name="description" rows="3" required></textarea>
    </div>

    <div class="mb-3">
      <label class="form-label">Image URL</label>
      <input type="text" class="form-control" name="imageUrl" required>
    </div>

    <div class="text-center">
      <button type="submit" class="btn btn-primary px-4">Add Package</button>
      <a href="manageBasicPackages.jsp" class="btn btn-secondary ms-2">Cancel</a>
    </div>
  </form>
</div>

</body>
</html>
