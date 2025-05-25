<?php
require_once 'db.php';

if (!isset($_GET['judul'])) {
  die('Judul tidak ditemukan.');
}

$judul = urldecode($_GET['judul']);
$film = null;
$table = null;

// Coba dari tabel films
$query = "SELECT *, 'films' AS sumber FROM films WHERE judul = ?";
$stmt = $conn->prepare($query);
$stmt->bind_param("s", $judul);
$stmt->execute();
$result = $stmt->get_result();
if ($result && $result->num_rows > 0) {
  $film = $result->fetch_assoc();
  $table = 'films';
}

// Jika tidak ada di films, coba dari tv_series
if (!$film) {
  $query = "SELECT *, 'tv_series' AS sumber FROM tv_series WHERE judul = ?";
  $stmt = $conn->prepare($query);
  $stmt->bind_param("s", $judul);
  $stmt->execute();
  $result = $stmt->get_result();
  if ($result && $result->num_rows > 0) {
    $film = $result->fetch_assoc();
    $table = 'tv_series';
  }
}

// Jika masih tidak ada, coba dari movies
if (!$film) {
  $query = "SELECT *, 'movies' AS sumber FROM movies WHERE judul = ?";
  $stmt = $conn->prepare($query);
  $stmt->bind_param("s", $judul);
  $stmt->execute();
  $result = $stmt->get_result();
  if ($result && $result->num_rows > 0) {
    $film = $result->fetch_assoc();
    $table = 'movies';
  }
}

if (!$film) {
  die('Judul tidak ditemukan di database.');
}

// Ganti field poster jika tabel bukan dari `films`
$poster = ($table == 'films') ? $film['poster'] : $film['gambar'];

// Ambil metadata dari tabel anime_metadata
$anime_name = $film['judul'];
$source = $table;

$description = "Deskripsi belum tersedia.";
$genres = [];
$characters = [];

$query = "SELECT description, genres, characters FROM anime_metadata WHERE anime_name = ? AND source = ?";
$stmt = $conn->prepare($query);
$stmt->bind_param("ss", $anime_name, $source);
$stmt->execute();
$meta_result = $stmt->get_result();

if ($meta_result && $meta_result->num_rows > 0) {
  $meta = $meta_result->fetch_assoc();
  $description = $meta['description'] ?? $description;
  $genres = explode(',', $meta['genres'] ?? '');
  $characters = json_decode($meta['characters'], true) ?? [];
}
?>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title><?= htmlspecialchars($film['judul']) ?></title>
  <link rel="stylesheet" href="./css/style.css" />
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" />
</head>
<body>
  <div class="details-container">
    <div class="details-header">
      <a href="index.php">
        <img src="images/logo.png" alt="" />
      </a>
      <div class="search-container-details">
        <input type="text" placeholder="Search.." name="search" />
        <i class="fa-solid fa-magnifying-glass"></i>
      </div>
    </div>

    <div class="details-content">
      <img src="<?= htmlspecialchars($poster) ?>" alt="<?= htmlspecialchars($film['judul']) ?>" />
      <div class="details-image-right">
        <div class="details-image-right-top">
          <h1><?= htmlspecialchars($film['judul']) ?></h1>
          <i class="fa-regular fa-star">
            <span><?= htmlspecialchars($film['rating']) ?></span>
          </i>
        </div>
        <p id="details-overview">
          <?= nl2br(htmlspecialchars($description)) ?>
        </p>
        <button onclick="readMore()" id="myBtn">Read more</button>

        <h2>Genres</h2>
        <div class="details-genres-container">
          <div class="genres-side-left"><i class="fa-solid fa-caret-left"></i></div>
          <div class="details-genres">
            <?php foreach ($genres as $genre): ?>
              <div class="genre-boxes"><p><?= htmlspecialchars(trim($genre)) ?></p></div>
            <?php endforeach; ?>
          </div>
          <div class="genres-side-right"><i class="fa-solid fa-caret-right"></i></div>
        </div>
      </div>
    </div>

    <div class="actors">
      <div class="actors-top">
        <h2>Characters</h2>
        <div class="actors-scroll-controls">
          <div class="actors-controls-left"><i class="fa-solid fa-angle-left"></i></div>
          <div class="actors-controls-right"><i class="fa-solid fa-angle-right"></i></div>
        </div>
      </div>
      <div class="actors-scroll">
        <?php foreach ($characters as $char): ?>
          <div class="actors-card">
            <div class="crop-container">
              <img src="<?= htmlspecialchars($char['image_url']) ?>" alt="<?= htmlspecialchars($char['name']) ?>" />
            </div>
            <div class="card-details">
              <p><?= htmlspecialchars($char['name']) ?></p>
              <p><?= htmlspecialchars($char['voice_actor']) ?></p>
            </div>
          </div>
        <?php endforeach; ?>
      </div>
    </div>
  </div>
  <script type="module" src="./js/details.js"></script>
</body>
</html>
