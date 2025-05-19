<%@ page import="java.util.Map" %>
<%@ page session="true" %>
<%
  Map<String, int[]> destinations = (Map<String, int[]>) request.getAttribute("destinations");
  if (session.getAttribute("user") == null) {
    response.sendRedirect("login.jsp");
    return;
  }
%>
<!DOCTYPE html>
<html>
<head>
  <title>Customize Package - TwistnTrip</title>
  <meta charset="UTF-8">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
  <style>
    body {
      background: #f4f7f8;
      font-family: 'Segoe UI', sans-serif;
    }

    .custom-container {
      max-width: 600px;
      margin: 50px auto;
      background: #fff;
      padding: 30px;
      border-radius: 12px;
      box-shadow: 0 0 15px rgba(0,0,0,0.08);
    }

    h2 {
      text-align: center;
      font-weight: 600;
      margin-bottom: 25px;
      color: #333;
    }

    .form-label svg {
      width: 16px;
      height: 16px;
      margin-right: 5px;
    }

    .btn-primary {
      width: 100%;
      border-radius: 8px;
      font-weight: 500;
    }

    #displayCost {
      text-align: center;
      font-weight: 500;
      color: #0d6efd;
      margin-top: 15px;
    }
  </style>

  <script>
    const prices = {
      <% for (Map.Entry<String, int[]> entry : destinations.entrySet()) { %>
      "<%= entry.getKey() %>": { flight: <%= entry.getValue()[0] %>, day: <%= entry.getValue()[1] %> },
      <% } %>
    };

    function calculateTotal() {
      const country = document.getElementById("country").value;
      const duration = parseInt(document.getElementById("duration").value) || 0;
      const adults = parseInt(document.getElementById("adults").value) || 0;
      const kids = parseInt(document.getElementById("kids").value) || 0;

      if (country && prices[country]) {
        const flight = prices[country].flight;
        const day = prices[country].day;
        const base = flight + (day * duration);
        const total = (adults * base) + (kids * 0.5 * base);
        document.getElementById("totalPrice").value = total.toFixed(2);
        document.getElementById("displayCost").innerText = "Estimated Cost: LKR " + total.toLocaleString();
      } else {
        document.getElementById("displayCost").innerText = "";
      }
    }
  </script>
</head>
<body>

<div class="custom-container">
  <h2>Customize Your Tour Package</h2>
  <form action="preparePayment" method="post">

    <div class="row mb-3">
      <div class="col-md-4">
        <select class="form-select" name="title">
          <option>Mr.</option>
          <option>Ms.</option>
        </select>
      </div>
      <div class="col-md-8">
        <input type="text" class="form-control" name="name" placeholder="Full Name" required>
      </div>
    </div>

    <div class="mb-3">
      <input type="text" class="form-control" name="contact" placeholder="Contact No." required>
    </div>

    <div class="mb-3">
      <select class="form-select" name="nationality" required>
        <option value="">-- Nationality --</option>
        <option>Sri Lanka</option>
        <option>India</option>
        <option>UK</option>
        <option>USA</option>
      </select>
    </div>

    <div class="mb-3">
      <input type="email" class="form-control" name="email" placeholder="Email Address" required>
    </div>

    <div class="row mb-3">
      <div class="col">
        <input type="number" class="form-control" name="adults" id="adults" placeholder="No. of Adults" oninput="calculateTotal()" required>
      </div>
      <div class="col">
        <input type="number" class="form-control" name="kids" id="kids" placeholder="No. of Kids" oninput="calculateTotal()" required>
      </div>
    </div>

    <div class="row mb-3">
      <div class="col">
        <input type="date" class="form-control" name="arrival" required>
      </div>
      <div class="col">
        <input type="number" class="form-control" name="duration" id="duration" placeholder="Tour Duration (days)" oninput="calculateTotal()" required>
      </div>
    </div>

    <div class="mb-3">
      <select class="form-select" id="country" name="country" onchange="calculateTotal()" required>
        <option value="">-- Select Country --</option>
        <% for (String country : destinations.keySet()) { %>
        <option value="<%= country %>"><%= country %></option>
        <% } %>
      </select>
    </div>

    <div class="mb-3">
      <textarea class="form-control" name="message" rows="3" placeholder="Enter your message..."></textarea>
    </div>

    <input type="hidden" name="totalPrice" id="totalPrice">

    <p id="displayCost">Estimated Cost: LKR 0</p>

    <button type="submit" class="btn btn-primary">Proceed to Payment</button>
  </form>
</div>

</body>
</html>
