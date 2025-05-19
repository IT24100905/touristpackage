<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>TwistnTrip - Sign Up</title>
  <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap" rel="stylesheet">
  <style>
    * {
      margin: 0;
      padding: 0;
      box-sizing: border-box;
      font-family: 'Poppins', sans-serif;
    }
    body {
      background: linear-gradient(to right, #f4f4f4, #dbeafe);
      display: flex;
      justify-content: center;
      align-items: center;
      height: 100vh;
    }
    .signup-container {
      background: #fff;
      border-radius: 12px;
      box-shadow: 0 10px 20px rgba(0,0,0,0.1);
      width: 450px;
      padding: 30px;
      text-align: center;
    }
    .signup-container h2 {
      color: #333;
      margin-bottom: 10px;
    }
    .signup-container p {
      font-size: 14px;
      color: #777;
      margin-bottom: 20px;
    }
    .form-group {
      position: relative;
      margin-bottom: 18px;
      text-align: left;
    }
    .form-group svg {
      position: absolute;
      top: 10px;
      left: 12px;
      width: 18px;
      height: 18px;
      fill: #888;
    }
    .form-group input {
      width: 100%;
      padding: 10px 12px 10px 40px;
      border: 1px solid #ccc;
      border-radius: 8px;
      font-size: 14px;
      background-color: #f9f9f9;
    }
    .form-group input:focus {
      outline: none;
      border-color: #2563eb;
    }
    .btn {
      background-color: #2563eb;
      color: white;
      border: none;
      padding: 12px;
      width: 100%;
      border-radius: 8px;
      cursor: pointer;
      font-weight: 600;
      transition: background-color 0.3s;
    }
    .btn:hover {
      background-color: #1e40af;
    }
    .brand {
      font-size: 24px;
      font-weight: 700;
      color: #2563eb;
      margin-bottom: 10px;
    }
  </style>
</head>
<body>
<div class="signup-container">
  <div class="brand">TwistnTrip</div>
  <h2>Create Your Account</h2>
  <p>Start customizing your travel experience</p>

  <form action="signup" method="post">
    <div class="form-group">
      <!-- Username -->
      <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"><path d="M12 12c2.7 0 5-2.3 5-5s-2.3-5-5-5-5 2.3-5 5 2.3 5 5 5zm0 2c-3.3 0-10 1.7-10 5v3h20v-3c0-3.3-6.7-5-10-5z"/></svg>
      <input type="text" name="username" placeholder="Username" required>
    </div>

    <div class="form-group">
      <!-- Password -->
      <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"><path d="M12 17c1.7 0 3-1.3 3-3s-1.3-3-3-3-3 1.3-3 3 1.3 3 3 3zm0-13C6.5 4 2 8.5 2 14s4.5 10 10 10 10-4.5 10-10S17.5 4 12 4z"/></svg>
      <input type="password" name="password" placeholder="Password" required>
    </div>

    <div class="form-group">
      <!-- Full Name -->
      <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"><path d="M5 20h14v-2c0-2.8-4.5-4-7-4s-7 1.2-7 4v2zM12 12c2.2 0 4-1.8 4-4S14.2 4 12 4 8 5.8 8 8s1.8 4 4 4z"/></svg>
      <input type="text" name="fullname" placeholder="Full Name" required>
    </div>

    <div class="form-group">
      <!-- Email -->
      <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"><path d="M12 13.5L0 6h24l-12 7.5zm0 2.5L0 8v12h24V8l-12 8z"/></svg>
      <input type="email" name="email" placeholder="Email" required>
    </div>

    <div class="form-group">
      <!-- Contact -->
      <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"><path d="M6.6 10.8c1.4 2.6 3.9 4.9 6.6 6.3l2.2-2.2c.2-.2.5-.3.8-.2 1 .3 2 .5 3 .5.6 0 1 .4 1 1v3c0 .6-.4 1-1 1C9.4 21.2 2.8 14.6 2 6c0-.6.4-1 1-1h3c.6 0 1 .4 1 1 0 1 .2 2 .5 3 .1.3 0 .6-.2.8L6.6 10.8z"/></svg>
      <input type="text" name="contact" placeholder="Contact Number" required>
    </div>

    <div class="form-group">
      <!-- NIC -->
      <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"><path d="M21 3H3c-1.1 0-2 .9-2 2v14l4-4h16c1.1 0 2-.9 2-2V5c0-1.1-.9-2-2-2z"/></svg>
      <input type="text" name="nic" placeholder="NIC" required>
    </div>

    <button type="submit" class="btn">Sign Up</button>
  </form>
</div>
</body>
</html>
