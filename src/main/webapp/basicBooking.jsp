<%@ page session="true" %>
<%
  String packageId = request.getParameter("packageId");
  if (session.getAttribute("user") == null) {
    response.sendRedirect("login.jsp");
    return;
  }
%>
<!DOCTYPE html>
<html>
<head>
  <title>Basic Package Booking - TwistnTrip</title>
  <meta charset="UTF-8">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
  <style>
    body {
      background: #f4f7f8;
      font-family: 'Segoe UI', sans-serif;
    }

    .booking-container {
      max-width: 480px;
      margin: 60px auto;
      background: #fff;
      border-radius: 12px;
      box-shadow: 0 0 20px rgba(0,0,0,0.08);
      padding: 30px;
    }

    .booking-container h2 {
      font-weight: 600;
      font-size: 24px;
      text-align: center;
      margin-bottom: 25px;
      color: #333;
    }

    .form-control {
      border-radius: 8px;
      font-size: 14px;
    }

    .form-label svg {
      width: 16px;
      height: 16px;
      margin-right: 5px;
    }

    .btn-primary {
      width: 100%;
      padding: 10px;
      font-weight: 500;
      border-radius: 8px;
      margin-top: 15px;
    }

    #costDisplay {
      margin-top: 15px;
      font-weight: 500;
      text-align: center;
      color: #0d6efd;
    }
  </style>

  <script>
    function updateEstimate() {
      const adults = parseInt(document.getElementById("adults").value) || 0;
      const kids = parseInt(document.getElementById("kids").value) || 0;
      const price = 500000;
      const total = (adults * price) + (kids * 0.5 * price);
      document.getElementById("totalCost").value = total.toFixed(2);
      document.getElementById("costDisplay").innerText = "Estimated Cost: LKR " + total.toLocaleString();
    }
  </script>
</head>
<body>

<div class="booking-container">
  <h2>Basic Package Booking</h2>
  <form action="basicOrder" method="post">
    <input type="hidden" name="packageId" value="<%= packageId %>">
    <input type="hidden" id="totalCost" name="totalCost">

    <div class="mb-3">
      <label class="form-label"><svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M5.121 17.804A10.95 10.95 0 0112 15c2.387 0 4.596.775 6.465 2.09M15 10a3 3 0 11-6 0 3 3 0 016 0z" /></svg> Full Name</label>
      <input type="text" class="form-control" name="name" required>
    </div>

    <div class="mb-3">
      <label class="form-label"><svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M16 12h2a2 2 0 002-2V5a2 2 0 00-2-2h-4l-2 2H8a2 2 0 00-2 2v2h6" /></svg> Email</label>
      <input type="email" class="form-control" name="email" required>
    </div>

    <div class="mb-3 row g-3">
      <div class="col">
        <label class="form-label">Adults</label>
        <input type="number" class="form-control" name="adults" id="adults" min="0" required oninput="updateEstimate()">
      </div>
      <div class="col">
        <label class="form-label">Kids</label>
        <input type="number" class="form-control" name="kids" id="kids" min="0" required oninput="updateEstimate()">
      </div>
    </div>

    <div class="mb-3">
      <label class="form-label">Arrival Date</label>
      <input type="date" class="form-control" name="arrival" required>
    </div>

    <p id="costDisplay">Estimated Cost: LKR 0</p>

    <button type="submit" class="btn btn-primary">Proceed to Payment</button>
  </form>
</div>

</body>
</html>
