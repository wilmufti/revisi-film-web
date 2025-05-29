<?php include "db.php"; ?>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta http-equiv="X-UA-Compatible" content="IE=edge" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>RMF Films</title>
  <link rel="stylesheet" href="css/style.css" />
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" />
</head>
<body>
<div class="container">
  <!-- header -->
  <header>
    <div class="mobile-nav">
      <button class="burger"><i class="fa-solid fa-bars"></i></button>
    </div>
    <a href="index.php"><img src="./images/logo.png" alt="" /></a>
    <nav>
      <h2>Browse</h2>
      <ul class="nav-links">
        <li class="active-link"><i class="fa-solid fa-layer-group"></i><a href="index.php">Discover</a></li>
        <li><i class="fa-solid fa-video"></i><a href="movies.php">Movies</a></li>
        <li><i class="fa-solid fa-tv"></i><a href="tv.php">Tv Series</a></li>
        <li><i class="fa-solid fa-users"></i><a href="people.php">People</a></li>
      </ul>
    </nav>
  </header>

  <div id="mobile-menu" class="overlay">
    <a class="close">&times;</a>
    <div class="overlay-content">
      <div class="active-link-mobile"><i class="fa-solid fa-layer-group"></i><a href="index.php">Discover</a></div>
      <div><i class="fa-solid fa-video"></i><a href="movies.php">Movies</a></div>
      <div><i class="fa-solid fa-tv"></i><a href="tv.php">TvSeries</a></div>
      <div><i class="fa-solid fa-users"></i><a href="people.php">People</a></div>
    </div>
  </div>

  <main>
    <!-- slider -->
    <div class="slideshow-container">
      <div class="mySlides fade">
        <img src="https://wallpaperaccess.com/full/9336992.gif" />
        <div class="slider-text">Kimi no Nawa</div>
      </div>
      <div class="mySlides fade">
        <img src="https://gifdb.com/images/high/sasuke-vs-naruto-digital-art-8tauqi3yvslpzy6x.gif" />
        <div class="slider-text">Naruto: Shippuuden</div>
      </div>
      <div class="mySlides fade">
        <img src="https://i.namu.wiki/i/0soiSnZ-swpt5XT0Xdg1f--aymZ6D82WT6JaOzX8zkdCX1Uf144dSkJjOa04t2se2ckk7jT-2hLyjDk-GdVCDg.gif" />
        <div class="slider-text">Doraemon</div>
      </div>
      <a class="prev" onclick="plusSlides(-1)">❮</a>
      <a class="next" onclick="plusSlides(1)">❯</a>
    </div>
    <br />
    <div class="dot-container">
      <span class="dot" onclick="currentSlide(1)"></span>
      <span class="dot" onclick="currentSlide(2)"></span>
      <span class="dot" onclick="currentSlide(3)"></span>
    </div>

    <!-- TRENDING -->
    <div class="custom-scrollbar-container">
      <div class="upper-scrollbar">
        <h3>Trending</h3>
        <div class="upper-scrollbar-right">
          <a href="#"> All </a>
          <a href="#"> Movies </a>
          <a href="#"> Tv Series </a>
          <a href="#"> People </a>
        </div>
      </div>
      <div id="custom-scrollbar-trending" class="custom-scrollbar">
        <button id="left-scroll" onclick="scrollLeftTrending()"><i class="fa-solid fa-angle-left"></i></button>
        <button id="right-scroll" onclick="scrollRightTrending()"><i class="fa-solid fa-angle-right"></i></button>

        <?php
        $trending = $conn->query("SELECT * FROM films WHERE category='trending'");
        while ($film = $trending->fetch_assoc()) {
          echo '<div class="info-box">
                  <a href="details.php?judul=' . urlencode($film['judul']) . '">
                    <img src="' . $film['poster'] . '" alt="' . $film['judul'] . '" />
                  </a>
                  <div class="home-scrollbar-title">' . $film['judul'] . '</div>
                  <div class="home-scrollbar-rating">' . $film['rating'] . '</div>
                </div>';
        }
        ?>
      </div>
    </div>

    <!-- POPULAR -->
    <div class="custom-scrollbar-container">
      <div class="upper-scrollbar">
        <h3>Popular</h3>
        <div class="upper-scrollbar-right">
          <a href="#"> All </a>
          <a href="#"> Movies </a>
          <a href="#"> Tv Series </a>
          <a href="#"> People </a>
        </div>
      </div>
      <div id="custom-scrollbar-popular" class="custom-scrollbar">
        <button id="left-scroll" onclick="scrollLeftPopular()"><i class="fa-solid fa-angle-left"></i></button>
        <button id="right-scroll" onclick="scrollRightPopular()"><i class="fa-solid fa-angle-right"></i></button>

        <?php
        $popular = $conn->query("SELECT * FROM films WHERE category='popular'");
        while ($film = $popular->fetch_assoc()) {
          echo '<div class="info-box">
                  <a href="details.php?judul=' . urlencode($film['judul']) . '">
                    <img src="' . $film['poster'] . '" alt="' . $film['judul'] . '" />
                  </a>
                  <div class="home-scrollbar-title">' . $film['judul'] . '</div>
                  <div class="home-scrollbar-rating">' . $film['rating'] . '</div>
                </div>';
        }
        ?>
      </div>
    </div>
  </main>
</div>
<script type="module" src="./js/header.js"></script>
<script type="module" src="./js/main.js"></script>
</body>
</html>
