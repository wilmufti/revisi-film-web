<?php
include 'db.php'; // koneksi database

$sql = "SELECT name, image_url FROM people";
$result = $conn->query($sql);

// jika error pada query
if (!$result) {
    die("Query error: " . $conn->error);
}
?>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta http-equiv="X-UA-Compatible" content="IE=edge" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Popular People</title>
  <link rel="stylesheet" href="./css/style.css" />
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" />
</head>
<body>
  <div class="container">
    <!-- header -->
    <header>
      <div class="mobile-nav">
        <button class="burger">
          <i class="fa-solid fa-bars"></i>
        </button>
      </div>
      <a href="index.php">
        <img src="./images/logo.png" alt="" />
      </a>
      <nav>
        <h2>Browse</h2>
        <ul class="nav-links">
          <li><i class="fa-solid fa-layer-group"></i><a href="index.php">Discover</a></li>
          <li><i class="fa-solid fa-video"></i><a href="movies.php">Movies</a></li>
          <li><i class="fa-solid fa-tv"></i><a href="tv.php">Tv Series</a></li>
          <li class="active-link"><i class="fa-solid fa-users"></i><a href="people.php">People</a></li>
        </ul>
      </nav>
    </header>

    <div id="mobile-menu" class="overlay">
      <a class="close">&times;</a>
      <div class="overlay-content">
        <div><i class="fa-solid fa-layer-group"></i><a href="index.php">Discover</a></div>
        <div><i class="fa-solid fa-video"></i><a href="movies.php">Movies</a></div>
        <div><i class="fa-solid fa-tv"></i><a href="tv.php">Tv Series</a></div>
        <div class="active-link-mobile"><i class="fa-solid fa-users"></i><a href="people.php">People</a></div>
      </div>
    </div>

    <!-- main content -->
    <main class="list">
      <div class="list-top">
        <h1 class="list-top-title-people">Popular People</h1>
      </div>
      <div class="list-items-container">
        <?php if ($result->num_rows > 0): ?>
          <?php while ($row = $result->fetch_assoc()): ?>
            <a href="people-details.php?name=<?= urlencode($row['name']) ?>" class="list-item-people">
              <img class="list-item-image" src="<?= htmlspecialchars($row['image_url']) ?>" alt="img" />
              <div class="list-item-details-people">
                <p class="item-title-people"><?= htmlspecialchars($row['name']) ?></p>
              </div>
            </a>
          <?php endwhile; ?>
        <?php else: ?>
          <p>Tidak ada data.</p>
        <?php endif; ?>
      </div>
      <div class="pagination-container">
        <div class="pagination-box active-page">1</div>
        <div class="pagination-box">2</div>
        <div class="pagination-box">Next Page</div>
      </div>
    </main>
  </div>
  <script type="module" src="./js/header.js"></script>
  <script type="module" src="./js/people.js"></script>
</body>
</html>
<?php
$conn->close();
?>
