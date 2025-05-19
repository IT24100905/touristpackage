<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
  <title>Add New Basic Package</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet">
  <style>
    body {
      background-color: #f4f6f9;
      font-family: 'Segoe UI', sans-serif;
    }
    .form-wrapper {
      max-width: 650px;
      margin: 60px auto;
      background: #fff;
      border-radius: 10px;
      padding: 30px;
      box-shadow: 0 4px 16px rgba(0, 0, 0, 0.08);
    }
    .form-title {
      margin-bottom: 20px;
    }
    .form-control:focus {
      border-color: #0d6efd;
      box-shadow: 0 0 0 0.15rem rgba(13, 110, 253, 0.25);
    }
  </style>
</head>
<body>

<div class="form-wrapper">
  <h3 class="form-title text-center fw-bold">Add New Package</h3>
  <form action="addBasicPackage" method="post">
    <div class="mb-3">
      <label class="form-label">Package ID</label>
      <input type="text" class="form-control" name="packageId" required>
    </div>
    <div class="mb-3">
      <label class="form-label">Package Name</label>
      <input type="text" class="form-control" name="name" required>
    </div>
    <div class="mb-3">
      <label class="form-label">Country</label>
      <input type="text" class="form-control" name="country" required>
    </div>
    <div class="mb-3">
      <label class="form-label">No. of Days</label>
      <input type="number" class="form-control" name="days" required>
    </div>
    <div class="mb-3">
      <label class="form-label">Description</label>
      <textarea class="form-control" name="description" rows="3" required></textarea>
    </div>
    <div class="mb-3">
      <label class="form-label">Image URL</label>
      <input type="text" class="form-control" name="imageUrl" required>
    </div>

    <div class="d-grid gap-2">
      <button type="submit" class="btn btn-primary">Add Package</button>
      <a href="manageBasicPackages.jsp" class="btn btn-outline-secondary">Cancel</a>
    </div>

    <!-- Add below the "No. of Days" field -->
    <div class="mb-3">
      <label class="form-label">Price (LKR)</label>
      <input type="number" class="form-control" name="price" required step="0.01" min="0">
    </div>


  </form>
</div>

</body>
</html>
