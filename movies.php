<?php include "db.php"; ?>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta http-equiv="X-UA-Compatible" content="IE=edge" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Movies</title>
  <link rel="stylesheet" href="./css/style.css" />
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" />
</head>
<body>
<div class="container">
  <!-- header -->
  <header>
    <div class="mobile-nav">
      <button class="burger"><i class="fa-solid fa-bars"></i></button>
      <div class="search-container">
        <i class="fa-solid fa-magnifying-glass"></i>
        <input type="text" placeholder="Search.." name="search" />
      </div>
    </div>
    <a href="index.php"><img src="./images/logo.png" alt="" /></a>
    <nav>
      <h2>Browse</h2>
      <ul class="nav-links">
        <li><i class="fa-solid fa-layer-group"></i><a href="index.php">Discover</a></li>
        <li class="active-link"><i class="fa-solid fa-video"></i><a href="movies.php">Movies</a></li>
        <li><i class="fa-solid fa-tv"></i><a href="tv.php">Tv Series</a></li>
        <li><i class="fa-solid fa-users"></i><a href="people.php">People</a></li>
      </ul>
    </nav>
  </header>

  <div id="mobile-menu" class="overlay">
    <a class="close">&times;</a>
    <div class="overlay-content">
      <div><i class="fa-solid fa-layer-group"></i><a href="index.php">Discover</a></div>
      <div class="active-link-mobile"><i class="fa-solid fa-video"></i><a href="movies.php">Movies</a></div>
      <div><i class="fa-solid fa-tv"></i><a href="tv.php">TvSeries</a></div>
      <div><i class="fa-solid fa-users"></i><a href="people.php">People</a></div>
    </div>
  </div>
  <!-- end header -->

  <main class="list">
    <div class="list-top">
      <h1>Movies</h1>
      <select id="select-category">
        <option value="popular">Popular</option>
        <option value="toprated">Top Rated</option>
        <option value="upcoming">Upcoming</option>
      </select>
    </div>

    <div class="genres-container">
      <div class="genres-left-arrow"><i class="fa-solid fa-angle-left"></i></div>
      <div class="genre-box-container">
        <div class="genre-box genre-box-active">All</div>
        <div class="genre-box">Action</div>
        <div class="genre-box">Adventure</div>
        <div class="genre-box">Animation</div>
        <div class="genre-box">Comedy</div>
        <div class="genre-box">Crime</div>
        <div class="genre-box">Documentary</div>
        <div class="genre-box">Drama</div>
        <div class="genre-box">Family</div>
        <div class="genre-box">History</div>
        <div class="genre-box">Horror</div>
        <div class="genre-box">Music</div>
        <div class="genre-box">Mystery</div>
        <div class="genre-box">Romance</div>
        <div class="genre-box">Science Fiction</div>
        <div class="genre-box">Tv Movie</div>
        <div class="genre-box">Thriller</div>
        <div class="genre-box">War</div>
        <div class="genre-box">Western</div>
      </div>
      <div class="genres-right-arrow"><i class="fa-solid fa-angle-right"></i></div>
    </div>

    <div class="list-items-container">
      <?php
      $result = $conn->query("SELECT * FROM movies");
      while ($row = $result->fetch_assoc()) {
        echo '<div class="list-item">
                <img class="list-item-image" src="' . $row['gambar'] . '" alt="img" />
                <div class="list-item-details">
                  <p class="item-title">' . $row['judul'] . '</p>
                  <div class="list-item-details-year-rating">
                    <h5>' . $row['tahun'] . '</h5>
                    <i class="fa-solid fa-star"></i>
                    <h5>' . $row['rating'] . '</h5>
                  </div>
                </div>
              </div>';
      }
      ?>
    </div>

    <div class="pagination-container">
      <div class="pagination-box active-page">1</div>
      <div class="pagination-box">2</div>
      <div class="pagination-box">Next Page</div>
    </div>
  </main>
</div>
<script type="module" src="./js/header.js"></script>
<script type="module" src="./js/movies-tv.js"></script>
</body>
</html>
