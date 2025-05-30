<?php
session_start();

header("Cache-Control: no-store, no-cache, must-revalidate, max-age=0");
header("Cache-Control: post-check=0, pre-check=0", false);
header("Pragma: no-cache");

// Validasi login
if (!isset($_SESSION['admin_logged_in']) || $_SESSION['admin_logged_in'] !== true) {
    header("Location: loginadmin.php");
    exit;
}

include 'db.php'; // koneksi database

// Daftar semua tabel yang ingin kamu tampilkan
$tables = ['films', 'tv_series', 'movies', 'anime_metadata', 'people', 'people_details'];
$table = $_GET['table'] ?? $tables[0];

// Validasi tabel
if (!in_array($table, $tables)) {
    echo "Tabel tidak ditemukan.";
    exit;
}

// Ambil data
$query = "SELECT * FROM `$table`";
$result = mysqli_query($conn, $query);

// Cari primary key
$primary_key = null;
$pk_res = mysqli_query($conn, "SHOW KEYS FROM `$table` WHERE Key_name = 'PRIMARY'");
if ($pk_res && $pk = mysqli_fetch_assoc($pk_res)) {
    $primary_key = $pk['Column_name'];
}
?>

<!DOCTYPE html>
<html lang="id">
<head>
  <meta charset="UTF-8">
  <title>Admin Panel</title>
  <style>
    :root {
      --primary: #1e1e2f;
      --secondary: #3498db;
      --light: #ffffff;
      --dark: #151521;
      --text: #ecf0f1;
      --highlight: #2980b9;
    }

    * {
      box-sizing: border-box;
      margin: 0;
      padding: 0;
      font-family: 'Segoe UI', sans-serif;
    }

    body {
      background-color: var(--dark);
      color: var(--text);
      display: flex;
      min-height: 100vh;
    }

    .sidebar {
      width: 220px;
      background-color: var(--primary);
      padding: 20px;
      flex-shrink: 0;
    }

    .sidebar h1 {
      font-size: 22px;
      margin-bottom: 20px;
      color: var(--secondary);
    }

    .sidebar nav a {
      display: block;
      color: var(--text);
      text-decoration: none;
      margin-bottom: 10px;
      padding: 8px 10px;
      border-radius: 4px;
    }

    .sidebar nav a:hover,
    .sidebar nav a.active {
      background-color: var(--highlight);
    }

    .sidebar nav .logout {
      color: red;
      font-weight: bold;
      margin-top: 30px;
      display: block;
    }

    .main-content {
      flex-grow: 1;
      padding: 30px;
    }

    h2 {
      font-size: 24px;
      margin-bottom: 20px;
    }

    .grid {
      display: grid;
      grid-template-columns: repeat(auto-fill, minmax(160px, 1fr));
      gap: 20px;
    }

    .card {
      background-color: #1f1f2e;
      border-radius: 8px;
      overflow: hidden;
      text-align: center;
      color: var(--text);
      box-shadow: 0 4px 8px rgba(0,0,0,0.2);
    }

    .card img {
      width: 100%;
      height: 200px;
      object-fit: cover;
    }

    .card .name {
      padding: 10px;
      background-color: #2c2c3e;
      font-weight: bold;
    }

    .action-links a {
      background-color: #16a085;
      padding: 5px 10px;
      color: white;
      border-radius: 4px;
      text-decoration: none;
      font-size: 13px;
      display: inline-block;
      margin-top: 5px;
    }

    .action-links a:hover {
      background-color: #138d75;
    }

    table {
      width: 100%;
      border-collapse: collapse;
      margin-top: 20px;
    }

    th, td {
      padding: 10px;
      border: 1px solid #333;
      text-align: left;
      vertical-align: top;
    }

    th {
      background-color: var(--primary);
    }

    pre {
      white-space: pre-wrap;
      word-break: break-word;
    }

    a.add-btn {
      display: inline-block;
      background: #27ae60;
      color: white;
      padding: 8px 14px;
      margin-bottom: 15px;
      border-radius: 5px;
      text-decoration: none;
      font-weight: bold;
    }

    img {
      max-height: 100px;
    }
  </style>
</head>
<body>
<div class="sidebar">
  <h1>RMF</h1>
  <nav>
    <?php foreach ($tables as $t): ?>
      <a href="?table=<?= htmlspecialchars($t) ?>" class="<?= ($table === $t) ? 'active' : '' ?>">
        <?= ucwords(str_replace('_', ' ', $t)) ?>
      </a>
    <?php endforeach; ?>
    <a href="logout.php" class="logout">Logout</a>
  </nav>
</div>

<div class="main-content">
  <h2><?= ucwords(str_replace('_', ' ', $table)) ?></h2>

  <a href="edit.php?table=<?= urlencode($table) ?>" class="add-btn">+ Tambah Data</a>

  <?php if ($result && mysqli_num_rows($result) > 0): ?>
    <?php
    $field_names = array_column(mysqli_fetch_fields($result), 'name');
    $has_photo = in_array('photo', $field_names) || in_array('profile_image_url', $field_names);
    $has_name = in_array('name', $field_names) || in_array('person_name', $field_names);
    ?>

    <?php if ($has_photo && $has_name): ?>
      <div class="grid">
        <?php while ($row = mysqli_fetch_assoc($result)): ?>
          <div class="card">
            <?php
              $img = $row['photo'] ?? $row['profile_image_url'] ?? '';
              if (filter_var($img, FILTER_VALIDATE_URL)) {
                  echo "<img src='" . htmlspecialchars($img) . "' alt='img'>";
              } else {
                  echo "<img src='https://via.placeholder.com/150x200?text=No+Image' alt='img'>";
              }

              $display_name = $row['name'] ?? $row['person_name'] ?? '(No Name)';
            ?>
            <div class="name"><?= htmlspecialchars($display_name) ?></div>
            <div class="action-links">
              <?php if ($primary_key && isset($row[$primary_key])): ?>
                <a href="edit.php?table=<?= urlencode($table) ?>&id=<?= urlencode($row[$primary_key]) ?>">Edit</a>
                <a href="delete.php?table=<?= urlencode($table) ?>&id=<?= urlencode($row[$primary_key]) ?>" onclick="return confirm('Yakin ingin menghapus data ini?')">Hapus</a>
              <?php endif; ?>
            </div>
          </div>
        <?php endwhile; ?>
      </div>
    <?php else: ?>
      <table>
        <thead>
          <tr>
            <?php $fields = []; ?>
            <?php while ($finfo = mysqli_fetch_field($result)): ?>
              <?php $fields[] = $finfo->name; ?>
              <th><?= htmlspecialchars($finfo->name) ?></th>
            <?php endwhile; ?>
            <th>Aksi</th>
          </tr>
        </thead>
        <tbody>
          <?php mysqli_data_seek($result, 0); ?>
          <?php while ($row = mysqli_fetch_assoc($result)): ?>
            <tr>
              <?php foreach ($fields as $key): ?>
                <td>
                  <?php
                  $value = $row[$key];
                  if (filter_var($value, FILTER_VALIDATE_URL)) {
                      echo "<img src='" . htmlspecialchars($value) . "' alt='img'>";
                  } elseif (is_string($value) && (str_starts_with($value, '[') || str_starts_with($value, '{'))) {
                      echo "<pre>" . htmlspecialchars(substr($value, 0, 300)) . "</pre>";
                  } else {
                      echo htmlspecialchars($value);
                  }
                  ?>
                </td>
              <?php endforeach; ?>
              <td class="action-links">
                <?php if ($primary_key && isset($row[$primary_key])): ?>
                  <a href="edit.php?table=<?= urlencode($table) ?>&id=<?= urlencode($row[$primary_key]) ?>">Edit</a>
                  <a href="delete.php?table=<?= urlencode($table) ?>&id=<?= urlencode($row[$primary_key]) ?>" onclick="return confirm('Yakin ingin menghapus data ini?')">Hapus</a>
                <?php else: ?>
                  <span>-</span>
                <?php endif; ?>
              </td>
            </tr>
          <?php endwhile; ?>
        </tbody>
      </table>
    <?php endif; ?>
  <?php else: ?>
    <p>Tidak ada data untuk ditampilkan dari tabel <strong><?= htmlspecialchars($table) ?></strong>.</p>
  <?php endif; ?>
</div>
</body>
</html>
