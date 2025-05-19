
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Payment Information</title>
  <style>
    :root {
      --primary-color: #4a6fa5;
      --secondary-color: #f8f9fa;
      --accent-color: #6c63ff;
      --text-color: #333;
      --border-radius: 8px;
      --box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
    }

    * {
      margin: 0;
      padding: 0;
      box-sizing: border-box;
    }

    body {
      font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
      line-height: 1.6;
      color: var(--text-color);
      background-color: #f5f7fa;
      padding: 20px;
    }

    .container {
      max-width: 600px;
      margin: 40px auto;
      background: white;
      border-radius: var(--border-radius);
      box-shadow: var(--box-shadow);
      overflow: hidden;
    }

    .header {
      background: var(--primary-color);
      color: white;
      padding: 20px;
      text-align: center;
    }

    .header h1 {
      font-size: 24px;
      font-weight: 500;
    }

    .payment-form {
      padding: 30px;
    }

    .form-group {
      margin-bottom: 25px;
    }

    .form-group label {
      display: block;
      margin-bottom: 8px;
      font-weight: 500;
      color: #555;
    }

    .form-control {
      width: 100%;
      padding: 12px 15px;
      border: 1px solid #ddd;
      border-radius: var(--border-radius);
      font-size: 16px;
      transition: border 0.3s;
    }

    .form-control:focus {
      border-color: var(--accent-color);
      outline: none;
      box-shadow: 0 0 0 3px rgba(108, 99, 255, 0.1);
    }

    select.form-control {
      appearance: none;
      background-image: url("data:image/svg+xml;charset=UTF-8,%3csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 24 24' fill='none' stroke='currentColor' stroke-width='2' stroke-linecap='round' stroke-linejoin='round'%3e%3cpolyline points='6 9 12 15 18 9'%3e%3c/polyline%3e%3c/svg%3e");
      background-repeat: no-repeat;
      background-position: right 15px center;
      background-size: 15px;
      padding-right: 40px;
    }

    .btn {
      display: inline-block;
      background: var(--accent-color);
      color: white;
      border: none;
      padding: 12px 25px;
      border-radius: var(--border-radius);
      cursor: pointer;
      font-size: 16px;
      font-weight: 500;
      transition: background 0.3s;
      width: 100%;
    }

    .btn:hover {
      background: #564dff;
    }

    @media (max-width: 768px) {
      .container {
        margin: 20px auto;
      }

      .payment-form {
        padding: 20px;
      }
    }
  </style>
</head>
<body>
<div class="container">
  <div class="header">
    <h1>Payment Information</h1>
  </div>

  <form class="payment-form" action="processPayment.jsp" method="post">
    <div class="form-group">
      <label for="paymentMethod">Payment Method:</label>
      <select class="form-control" id="paymentMethod" name="paymentMethod" required>
        <option value="" disabled selected>-- Select --</option>
        <option value="online">Online</option>
        <option value="bank">Bank Transfer</option>
      </select>
    </div>

    <div class="form-group">
      <label for="paymentDate">Payment Date:</label>
      <input type="date" class="form-control" id="paymentDate" name="paymentDate" required>
    </div>

    <div class="form-group">
      <label for="referenceNo">Reference No:</label>
      <input type="text" class="form-control" id="referenceNo" name="referenceNo" required>
    </div>

    <button type="submit" class="btn">Confirm Payment</button>
  </form>
</div>
</body>
</html>