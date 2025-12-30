<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Code Bloom</title>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/index.css">
</head>
<body>

  <!-- Navigation Bar -->
  <nav>
    <div class="logo">Code Bloom</div>
    <ul>
      <li><a href="#">Home</a></li>
      <li><a href="#">Courses</a></li>
      <li><a href="#">Projects</a></li>
      <li><a href="#">About</a></li>
      <li><a href="#">Contact</a></li>
    </ul>
    <div class="auth-buttons">
      <a href="/login" class="signup">Login</a>
      <a href="/signup" class="signup">Sign Up</a>
    </div>
  </nav>

  <!-- Hero Section -->
  <section class="hero">
    <div class="hero-text">
      <h1>Grow Your Coding Skills with Code Bloom</h1>
      <p>
        Code Bloom is a learning platform designed for developers who want to
        master modern technologies. From Java & Spring Boot to AI, Machine Learning,
        and Full Stack Development, we help your skills bloom.
      </p>
      <button>Get Started</button>
    </div>
    <div class="hero-image">
      <img src="images/Bg.jpg" alt="Coding Image" />
    </div>
  </section>

  <!-- Features Section -->
  <section class="features">
    <h2>Why Choose Code Bloom?</h2>
    <div class="feature-grid">
      <div class="card">
        <img src="https://cdn-icons-png.flaticon.com/512/919/919827.png" alt="Code" />
        <h3>Hands On Coding</h3>
        <p>Learn by building real world projects with clean and scalable code.</p>
      </div>
      <div class="card">
        <img src="https://cdn-icons-png.flaticon.com/512/2721/2721270.png" alt="Learning" />
        <h3>Beginner to Advanced</h3>
        <p>Structured learning paths for students, professionals, and job seekers.</p>
      </div>
      <div class="card">
        <img src="https://cdn-icons-png.flaticon.com/512/3135/3135715.png" alt="Career" />
        <h3>Career Focused</h3>
        <p>Interview preparations, system design, and industry ready skills.</p>
      </div>
    </div>
  </section>

  <!-- Footer -->
  <footer>
    © 2025 Code Bloom. Learn. Build. Bloom.
  </footer>

</body>
</html>
