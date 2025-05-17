<%@ page session="true" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
  String error = request.getParameter("error");
%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>TwistnTrip - Login</title>

  <!-- Bootstrap CSS -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

  <!-- Google Fonts -->
  <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@300;400;500;600;700&family=Playfair+Display:wght@400;500;600;700&display=swap" rel="stylesheet">

  <!-- Font Awesome -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">

  <!-- AOS Animation Library -->
  <link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">

  <style>
    :root {
      --primary-color: #3498db;
      --secondary-color: #2ecc71;
      --accent-color: #f39c12;
      --text-color: #2c3e50;
      --light-color: #ecf0f1;
      --dark-color: #34495e;
    }

    * {
      margin: 0;
      padding: 0;
      box-sizing: border-box;
    }

    body {
      font-family: 'Montserrat', sans-serif;
      height: 100vh;
      overflow: hidden;
      background-color: #a1deff;
      position: relative;
    }

    /* Background and Overlay Animation */
    .background-container {
      position: absolute;
      top: 0;
      left: 0;
      width: 100%;
      height: 100%;
      z-index: -1;
      overflow: hidden;
    }

    .background-image {
      width: 100%;
      height: 100%;
      object-fit: cover;
      filter: brightness(0.8);
      transform: scale(1.05);
      animation: subtleZoom 30s infinite alternate ease-in-out;
      transition: transform 0.5s ease-out;
    }


    .overlay {
      position: absolute;
      top: 0;
      left: 0;
      width: 100%;
      height: 100%;
      background: linear-gradient(135deg,
      rgba(0, 0, 0, 0.7) 0%,
      rgba(212, 230, 235, 0.4) 100%);
      backdrop-filter: blur(5px);
      z-index: 5;
    }

    /* Mouse interaction light effect */
    .mouse-glow {
      position: absolute;
      width: 400px;
      height: 400px;
      border-radius: 50%;
      background: radial-gradient(circle, rgba(255,255,255,0.15) 0%, rgba(255,255,255,0) 70%);
      pointer-events: none;
      transform: translate(-50%, -50%);
      z-index: -1;
      opacity: 0;
      transition: opacity 0.3s ease;
    }

    /* Animated light particles overlay */
    .particles {
      position: absolute;
      top: 0;
      left: 0;
      width: 100%;
      height: 100%;
      overflow: hidden;
      z-index: -1;
    }

    .particle {
      position: absolute;
      display: block;
      pointer-events: none;
      width: 5px;
      height: 5px;
      background-color: rgba(255, 255, 255, 0.4);
      border-radius: 50%;
      animation: float 25s infinite linear;
      transition: transform 1s ease;
    }


    /* Perspective elements for 3D effect */
    .perspective-container {
      perspective: 1000px;
      height: 100vh;
      width: 100vw;
      overflow: hidden;
    }

    .tilt-layer {
      transform-style: preserve-3d;
      width: 100%;
      height: 100%;
      display: flex;
      align-items: center;
      justify-content: center;
      transition: transform 0.1s ease-out;
    }

    .login-container {
      height: 100vh;
      display: flex;
      align-items: center;
      justify-content: center;
      transform-style: preserve-3d;
    }

    .login-card {
      width: 100%;
      max-width: 450px;
      background: rgba(255, 255, 255, 0.9);
      backdrop-filter: blur(10px);
      border-radius: 15px;
      box-shadow: 0 15px 35px rgba(0, 0, 0, 0.2);
      padding: 40px;
      overflow: hidden;
      position: relative;
      animation: cardAppear 1s forwards ease-out;
      transition: transform 0.3s ease, box-shadow 0.3s ease;
    }

    .login-card:hover {
      box-shadow: 0 20px 40px rgba(0, 0, 0, 0.3);
    }

    @keyframes cardAppear {
      0% {
        opacity: 0;
        transform: translateY(30px);
      }
      100% {
        opacity: 1;
        transform: translateY(0);
      }
    }

    /* Animated shapes */
    .shape-top {
      position: absolute;
      top: -50px;
      right: -50px;
      width: 150px;
      height: 150px;
      background: var(--accent-color);
      border-radius: 50%;
      opacity: 0.3;
      animation: shapeFloat 8s infinite alternate ease-in-out;
      transition: transform 0.3s ease-out;
    }

    .shape-bottom {
      position: absolute;
      bottom: -60px;
      left: -60px;
      width: 180px;
      height: 180px;
      background: var(--primary-color);
      border-radius: 50%;
      opacity: 0.2;
      animation: shapeFloat 12s infinite alternate-reverse ease-in-out;
      transition: transform 0.3s ease-out;
    }

    @keyframes shapeFloat {
      0% {
        transform: translateY(0) translateX(0) scale(1);
      }
      50% {
        transform: translateY(-15px) translateX(10px) scale(1.05);
      }
      100% {
        transform: translateY(15px) translateX(-10px) scale(0.95);
      }
    }

    .brand {
      font-family: 'Playfair Display', serif;
      font-size: 32px;
      font-weight: 700;
      color: var(--primary-color);
      text-align: center;
      margin-bottom: 10px;
      position: relative;
    }

    .brand-accent {
      color: var(--accent-color);
      display: inline-block;
      animation: brandPulse 2s infinite alternate ease-in-out;
    }

    @keyframes brandPulse {
      0% {
        transform: scale(1);
      }
      100% {
        transform: scale(1.1);
      }
    }

    .tagline {
      text-align: center;
      margin-bottom: 30px;
      color: var(--text-color);
      font-weight: 500;
    }

    .welcome-text {
      font-family: 'Playfair Display', serif;
      font-size: 24px;
      color: var(--dark-color);
      text-align: center;
      margin-bottom: 5px;
    }

    .subtitle {
      font-size: 14px;
      color: #777;
      text-align: center;
      margin-bottom: 30px;
    }

    /* Fixed form input styling */
    .input-container {
      position: relative;
      margin-bottom: 20px;
    }

    .input-container label {
      position: absolute;
      left: 45px;
      top: 18px;
      color: #777;
      transition: all 0.3s ease;
      pointer-events: none;
      font-size: 14px;
      background: transparent;
    }

    .input-container .form-icon {
      position: absolute;
      left: 15px;
      top: 50%;
      transform: translateY(-50%);
      color: var(--primary-color);
      z-index: 2;
      animation: iconPulse 2s infinite alternate ease-in-out;
    }

    @keyframes iconPulse {
      0% {
        transform: translateY(-50%) scale(1);
      }
      100% {
        transform: translateY(-50%) scale(1.15);
      }
    }

    .input-container input {
      width: 100%;
      padding: 17px 15px 17px 45px;
      border-radius: 10px;
      border: 1px solid #ddd;
      font-size: 15px;
      background-color: #fff;
      transition: all 0.3s ease;
    }

    .input-container input:focus {
      border-color: var(--primary-color);
      box-shadow: 0 0 0 0.25rem rgba(52, 152, 219, 0.25);
      outline: none;
    }

    .input-container input:focus + label,
    .input-container input:not(:placeholder-shown) + label {
      top: -10px;
      left: 15px;
      font-size: 12px;
      padding: 0 5px;
      background: white;
      color: var(--primary-color);
    }

    .input-container input::placeholder {
      color: transparent; /* Hide the placeholder when label is visible */
    }

    .btn-login {
      width: 100%;
      padding: 12px;
      border-radius: 10px;
      background: linear-gradient(to right, var(--primary-color), var(--secondary-color));
      border: none;
      color: white;
      font-weight: 600;
      font-size: 16px;
      transition: all 0.3s ease;
      margin-top: 10px;
      position: relative;
      overflow: hidden;
    }

    .btn-login:hover {
      transform: translateY(-2px);
      box-shadow: 0 5px 15px rgba(52, 152, 219, 0.4);
    }

    .btn-login::after {
      content: '';
      position: absolute;
      top: 0;
      left: -100%;
      width: 100%;
      height: 100%;
      background: linear-gradient(to right, transparent, rgba(255, 255, 255, 0.2), transparent);
      transition: all 0.5s ease;
    }

    .btn-login:hover::after {
      left: 100%;
    }

    .error-msg {
      padding: 10px;
      background-color: rgba(231, 76, 60, 0.2);
      border-radius: 8px;
      color: #e74c3c;
      font-size: 14px;
      margin-bottom: 20px;
      display: flex;
      align-items: center;
    }

    .error-msg i {
      margin-right: 8px;
    }

    @media (max-width: 768px) {
      .login-card {
        margin: 0 20px;
        padding: 30px;
      }
    }

    .travel-icon {
      color: var(--accent-color);
      margin-right: 5px;
      display: inline-block;
      animation: flyIcon 4s infinite alternate ease-in-out;
    }

    @keyframes flyIcon {
      0% {
        transform: translateY(0) rotate(0deg);
      }
      50% {
        transform: translateY(-5px) rotate(15deg);
      }
      100% {
        transform: translateY(5px) rotate(-5deg);
      }
    }

    .footer-text {
      font-size: 12px;
      text-align: center;
      margin-top: 20px;
      color: #777;
    }

    .registration-link {
      margin-top: 20px;
      text-align: center;
    }

    .registration-link a {
      color: var(--primary-color);
      text-decoration: none;
      font-weight: 500;
      transition: all 0.3s ease;
    }

    .registration-link a:hover {
      color: var(--secondary-color);
      text-decoration: underline;
    }
  </style>
</head>
<body>
<!-- Mouse glow effect element -->
<div class="mouse-glow"></div>

<!-- Perspective container for 3D effect -->
<div class="perspective-container">
  <div class="tilt-layer">
    <!-- Background Image Container with specific wallpaper -->
    <div class="background-container">
      <!-- Updated to a color-coordinated wallpaper that matches the login form colors -->
      <img src="https://images.unsplash.com/photo-1501785888041-af3ef285b470?ixlib=rb-4.0.3" alt="Travel Customization Background" class="background-image">
      <div class="overlay"></div>

      <!-- Animated particles overlay -->
      <div class="particles">
        <!-- Particles will be added via JavaScript -->
      </div>
    </div>

    <div class="login-container">
      <div class="login-card" data-aos="fade-up" data-aos-duration="1000">
        <div class="shape-top"></div>
        <div class="shape-bottom"></div>

        <div class="brand">
          <i class="fa-solid fa-paper-plane travel-icon"></i>Twist<span class="brand-accent">n</span>Trip
        </div>
        <p class="tagline">Customize Your Perfect Adventure</p>

        <h2 class="welcome-text">Welcome Back</h2>
        <p class="subtitle">Login to create your personalized travel package</p>

        <% if ("true".equals(error)) { %>
        <div class="error-msg" data-aos="fade-in" data-aos-duration="800">
          <i class="fa-solid fa-circle-exclamation"></i> Invalid username or password
        </div>
        <% } %>

        <form action="login" method="post">
          <!-- Fixed username input container -->
          <div class="input-container" data-aos="fade-up" data-aos-delay="100">
            <i class="fa-solid fa-user form-icon"></i>
            <input type="text" id="username" name="username" placeholder="Username" required>
            <label for="username">Username</label>
          </div>

          <!-- Fixed password input container -->
          <div class="input-container" data-aos="fade-up" data-aos-delay="200">
            <i class="fa-solid fa-lock form-icon"></i>
            <input type="password" id="password" name="password" placeholder="Password" required>
            <label for="password">Password</label>
          </div>

          <button type="submit" class="btn btn-login" data-aos="fade-up" data-aos-delay="300">
            Sign In <i class="fa-solid fa-arrow-right ms-2"></i>
          </button>
        </form>

        <div class="registration-link" data-aos="fade-up" data-aos-delay="400">
          Don't have an account? <a href="signup.jsp">Sign up</a>
        </div>

        <p class="footer-text">
          <i class="fa-solid fa-globe"></i> Customize your dream journey with TwistnTrip
        </p>
      </div>
    </div>
  </div>
</div>

<!-- Bootstrap JS Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

<!-- AOS Animation Library -->
<script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>

<script>
  // Initialize AOS animation library
  document.addEventListener('DOMContentLoaded', function() {
    AOS.init();

    // Create animated particles
    const particlesContainer = document.querySelector('.particles');
    const particleElements = [];
    const particleCount = 30;

    for (let i = 0; i < particleCount; i++) {
      const particle = createParticle(particlesContainer);
      particleElements.push(particle);
    }

    // Mouse movement effect variables
    const mouseGlow = document.querySelector('.mouse-glow');
    const tiltLayer = document.querySelector('.tilt-layer');
    const backgroundImage = document.querySelector('.background-image');
    const shapeTop = document.querySelector('.shape-top');
    const shapeBottom = document.querySelector('.shape-bottom');
    const loginCard = document.querySelector('.login-card');

    // Track mouse movement
    document.addEventListener('mousemove', function(e) {
      // Mouse position
      const mouseX = e.clientX;
      const mouseY = e.clientY;

      // Window dimensions
      const windowWidth = window.innerWidth;
      const windowHeight = window.innerHeight;

      // Calculate mouse position as percentage
      const mouseXPercent = mouseX / windowWidth;
      const mouseYPercent = mouseY / windowHeight;

      // 1. Update glow effect position
      mouseGlow.style.left = `${mouseX}px`;
      mouseGlow.style.top = `${mouseY}px`;
      mouseGlow.style.opacity = '1';

      // 2. Parallax background movement
      const moveX = (mouseXPercent - 0.5) * 20; // 20px max movement
      const moveY = (mouseYPercent - 0.5) * 20; // 20px max movement
      backgroundImage.style.transform = `translate(${moveX * -1}px, ${moveY * -1}px) scale(1.15)`;

      // 3. 3D tilt effect on container
      const tiltX = (mouseYPercent - 0.5) * 8; // 8 degrees max rotation
      const tiltY = (mouseXPercent - 0.5) * -8; // 8 degrees max rotation
      tiltLayer.style.transform = `rotateX(${tiltX}deg) rotateY(${tiltY}deg)`;

      // 4. Move decorative shapes relative to mouse
      shapeTop.style.transform = `translateX(${moveX * 0.7}px) translateY(${moveY * 0.7}px)`;
      shapeBottom.style.transform = `translateX(${moveX * -0.5}px) translateY(${moveY * -0.5}px)`;

      // 5. Subtle card shadow movement
      loginCard.style.transform = `translateZ(40px) rotateX(${tiltX * 0.3}deg) rotateY(${tiltY * 0.3}deg)`;

      // 6. Affect particles based on mouse position
      particleElements.forEach((particle, index) => {
        const rect = particle.getBoundingClientRect();
        const particleX = rect.left + rect.width / 2;
        const particleY = rect.top + rect.height / 2;

        // Calculate distance from mouse to particle
        const distX = mouseX - particleX;
        const distY = mouseY - particleY;
        const distance = Math.sqrt(distX * distX + distY * distY);

        // Only affect particles within 200px of mouse
        if (distance < 200) {
          const influence = (200 - distance) / 200; // 0 to 1 based on distance
          const moveFactorX = distX * influence * 0.05;
          const moveFactorY = distY * influence * 0.05;

          // Apply slight movement away from mouse
          particle.style.transform = `translateX(${-moveFactorX}px) translateY(${-moveFactorY}px)`;
        } else {
          particle.style.transform = '';
        }
      });
    });

    // Reset when mouse leaves window
    document.addEventListener('mouseleave', function() {
      mouseGlow.style.opacity = '0';
      tiltLayer.style.transform = 'rotateX(0deg) rotateY(0deg)';
      backgroundImage.style.transform = 'scale(1.15)';
      shapeTop.style.transform = '';
      shapeBottom.style.transform = '';
      loginCard.style.transform = 'translateZ(0)';

      particleElements.forEach(particle => {
        particle.style.transform = '';
      });
    });

    // Check if inputs have values on page load
    const inputs = document.querySelectorAll('.input-container input');
    inputs.forEach(input => {
      if (input.value) {
        input.classList.add('has-value');
      }

      input.addEventListener('input', function() {
        if (this.value) {
          this.classList.add('has-value');
        } else {
          this.classList.remove('has-value');
        }
      });
    });
  });

  // Function to create animated particles
  function createParticle(container) {
    const particle = document.createElement('span');
    particle.classList.add('particle');

    // Random positioning
    const size = Math.random() * 8 + 3;
    particle.style.width = `${size}px`;
    particle.style.height = `${size}px`;
    particle.style.opacity = Math.random() * 0.5 + 0.3;

    // Random starting position
    const posX = Math.random() * 100;
    const posY = Math.random() * 100;
    particle.style.left = `${posX}%`;
    particle.style.top = `${posY}%`;

    // Random animation duration
    const duration = Math.random() * 15 + 15;
    particle.style.animationDuration = `${duration}s`;

    // Random animation delay
    const delay = Math.random() * 10;
    particle.style.animationDelay = `${delay}s`;

    container.appendChild(particle);
    return particle;
  }
</script>
</body>
</html>