<?php
session_start();

// Cegah cache
header("Cache-Control: no-store, no-cache, must-revalidate, max-age=0");
header("Cache-Control: post-check=0, pre-check=0", false);
header("Pragma: no-cache");

// Cek login admin
if (!isset($_SESSION['admin_logged_in']) || $_SESSION['admin_logged_in'] !== true) {
    header("Location: loginadmin.php");
    exit;
}

include 'db.php';

$table = $_GET['table'] ?? null;
$id = $_GET['id'] ?? null;

if (!$table) {
    echo "Parameter 'table' tidak ditemukan.";
    exit;
}

function json_field($json) {
    return json_decode($json, true) ?: [];
}

// Ambil kolom
$columns = [];
$res = mysqli_query($conn, "SHOW COLUMNS FROM `$table`");
while ($row = mysqli_fetch_assoc($res)) {
    $columns[] = $row;
}

// Ambil primary key
$pk_result = mysqli_query($conn, "SHOW KEYS FROM `$table` WHERE Key_name = 'PRIMARY'");
$primary_key = mysqli_fetch_assoc($pk_result)['Column_name'] ?? 'id';

$data = [];

if ($id) {
    $isStringPK = !is_numeric($id);
    $quoted_id = $isStringPK ? "'" . mysqli_real_escape_string($conn, $id) . "'" : intval($id);
    $data_result = mysqli_query($conn, "SELECT * FROM `$table` WHERE `$primary_key` = $quoted_id");
    $data = mysqli_fetch_assoc($data_result);

    if (!$data) {
        echo "Data tidak ditemukan.";
        exit;
    }
}

// Deteksi field JSON
$aka = json_field($data['also_known_as'] ?? '');
$films = json_field($data['known_for_films'] ?? '');
$credits = json_field($data['film_credits'] ?? '');

// Handle POST
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $fields_sql = [];
    $values_sql = [];
    $updates = [];

    foreach ($columns as $col) {
        $key = $col['Field'];
        if (!$id && $key === $primary_key) continue;

        if ($key === 'also_known_as') {
            $val = json_encode(array_filter($_POST['also_known_as'] ?? []));
        } elseif ($key === 'known_for_films') {
            $val = json_encode($_POST['known_for_films'] ?? []);
        } elseif ($key === 'film_credits') {
            $val = json_encode($_POST['film_credits'] ?? []);
        } else {
            $val = $_POST[$key] ?? '';
        }

        $safe_val = mysqli_real_escape_string($conn, $val);
        $fields_sql[] = "`$key`";
        $values_sql[] = "'$safe_val'";
        $updates[] = "`$key` = '$safe_val'";
    }

    if ($id) {
        $sql = "UPDATE `$table` SET " . implode(', ', $updates) . " WHERE `$primary_key` = $quoted_id";
    } else {
        $sql = "INSERT INTO `$table` (" . implode(', ', $fields_sql) . ") VALUES (" . implode(', ', $values_sql) . ")";
    }

    if (mysqli_query($conn, $sql)) {
        header("Location: admin.php?table=$table");
        exit;
    } else {
        echo "Gagal menyimpan: " . mysqli_error($conn);
    }
}
?>
<!DOCTYPE html>
<html lang="id">
<head>
  <meta charset="UTF-8">
  <title><?= $id ? "Edit" : "Tambah" ?> <?= htmlspecialchars($table) ?></title>
  <style>
    body {
      font-family: 'Segoe UI', sans-serif;
      background: #1e1e2f;
      color: #f5f6fa;
      padding: 30px;
    }
    .form-container {
      background: #2a2a3b;
      padding: 30px;
      max-width: 900px;
      margin: auto;
      border-radius: 12px;
      box-shadow: 0 8px 30px rgba(0,0,0,0.3);
    }
    h2 {
      text-align: center;
      color: #ffffff;
      margin-bottom: 25px;
    }
    label {
      display: block;
      margin-top: 20px;
      font-weight: 600;
      color: #dcdde1;
    }
    input, textarea {
      width: 100%;
      padding: 10px;
      margin-top: 6px;
      background: #3a3a4f;
      color: #ffffff;
      border: 1px solid #555;
      border-radius: 6px;
      font-size: 14px;
    }
    input::placeholder,
    textarea::placeholder {
      color: #999;
    }
    button {
      margin-top: 20px;
      padding: 10px 20px;
      background: #3498db;
      color: white;
      border: none;
      border-radius: 6px;
      font-size: 14px;
      cursor: pointer;
    }
    button:hover {
      background: #2980b9;
    }
    .btn-secondary {
      background: #7f8c8d;
      color: white;
      text-decoration: none;
      display: inline-block;
      padding: 10px 20px;
      border-radius: 6px;
    }
    .btn-secondary:hover {
      background: #95a5a6;
    }
    .multi-field {
      background: #353546;
      padding: 15px;
      border-radius: 8px;
      margin-top: 10px;
      border: 1px solid #444;
      position: relative;
    }
    .multi-field img.preview {
      max-width: 80px;
      max-height: 80px;
      margin-top: 8px;
      border-radius: 4px;
      border: 1px solid #777;
    }
    .remove-btn {
      position: absolute;
      top: 10px;
      right: 10px;
      background: #e74c3c;
      color: white;
      border: none;
      border-radius: 4px;
      padding: 4px 8px;
      cursor: pointer;
    }
    .remove-btn:hover {
      background: #c0392b;
    }
  </style>
  <script>
    function addField(containerId, inputName) {
        const container = document.getElementById(containerId);
        const input = document.createElement('input');
        input.name = inputName;
        input.placeholder = 'Nama alternatif';
        container.appendChild(input);
    }

    function addKnownForFilm() {
      const container = document.getElementById('known_for_films');
      const index = container.children.length;
      container.insertAdjacentHTML('beforeend', `
        <div class="multi-field">
          <button type="button" class="remove-btn" onclick="this.parentElement.remove()">×</button>
          <input name="known_for_films[${index}][title]" placeholder="Judul Film">
          <input name="known_for_films[${index}][alt]" placeholder="Alt">
          <input name="known_for_films[${index}][image_url]" placeholder="URL Gambar" oninput="previewImage(this)">
          <img class="preview" src="" style="display:none">
        </div>`);
    }

    function addFilmCredit() {
      const container = document.getElementById('film_credits');
      const index = container.children.length;
      container.insertAdjacentHTML('beforeend', `
        <div class="multi-field">
          <button type="button" class="remove-btn" onclick="this.parentElement.remove()">×</button>
          <input name="film_credits[${index}][year]" placeholder="Tahun">
          <input name="film_credits[${index}][popup_title]" placeholder="Judul">
          <input name="film_credits[${index}][popup_image_url]" placeholder="URL Gambar" oninput="previewImage(this)">
          <img class="preview" src="" style="display:none">
          <input name="film_credits[${index}][credit_role_main]" placeholder="Peran Utama">
          <textarea name="film_credits[${index}][popup_description]" placeholder="Deskripsi"></textarea>
          <input name="film_credits[${index}][credit_role_secondary]" placeholder="Peran Tambahan">
        </div>`);
    }

    function previewImage(input) {
      const preview = input.nextElementSibling;
      if (input.value.startsWith('http')) {
        preview.src = input.value;
        preview.style.display = 'block';
      } else {
        preview.style.display = 'none';
      }
    }

    window.addEventListener('DOMContentLoaded', () => {
      document.querySelectorAll('input[oninput="previewImage(this)"]').forEach(input => previewImage(input));
    });
  </script>
</head>
<body>
<div class="form-container">
  <h2><?= $id ? "Edit" : "Tambah" ?> Tabel: <?= htmlspecialchars($table) ?></h2>
  <form method="post">
    <?php foreach ($columns as $col):
        $field = $col['Field'];
        $value = $data[$field] ?? '';

        if ($id && $field === $primary_key) {
            echo "<label>$field (Primary Key)</label><input name=\"$field\" value=\"" . htmlspecialchars($value) . "\" readonly>";
            continue;
        }

        if ($field === 'also_known_as'): ?>
          <label>Also Known As:</label>
          <div id="also_known_as">
            <?php foreach ($aka as $val): ?>
              <input name="also_known_as[]" value="<?= htmlspecialchars($val) ?>">
            <?php endforeach; ?>
          </div>
          <button type="button" onclick="addField('also_known_as', 'also_known_as[]')">+ Tambah Nama</button>

        <?php elseif ($field === 'known_for_films'): ?>
          <label>Known For Films:</label>
          <div id="known_for_films">
            <?php foreach ($films as $i => $f): ?>
              <div class="multi-field">
                <button type="button" class="remove-btn" onclick="this.parentElement.remove()">×</button>
                <input name="known_for_films[<?= $i ?>][title]" value="<?= htmlspecialchars($f['title']) ?>" placeholder="Judul Film">
                <input name="known_for_films[<?= $i ?>][alt]" value="<?= htmlspecialchars($f['alt']) ?>" placeholder="Alt">
                <input name="known_for_films[<?= $i ?>][image_url]" value="<?= htmlspecialchars($f['image_url']) ?>" placeholder="URL Gambar" oninput="previewImage(this)">
                <img class="preview" src="<?= htmlspecialchars($f['image_url']) ?>">
              </div>
            <?php endforeach; ?>
          </div>
          <button type="button" onclick="addKnownForFilm()">+ Tambah Film</button>

        <?php elseif ($field === 'film_credits'): ?>
          <label>Film Credits:</label>
          <div id="film_credits">
            <?php foreach ($credits as $i => $c): ?>
              <div class="multi-field">
                <button type="button" class="remove-btn" onclick="this.parentElement.remove()">×</button>
                <input name="film_credits[<?= $i ?>][year]" value="<?= htmlspecialchars($c['year']) ?>" placeholder="Tahun">
                <input name="film_credits[<?= $i ?>][popup_title]" value="<?= htmlspecialchars($c['popup_title']) ?>" placeholder="Judul">
                <input name="film_credits[<?= $i ?>][popup_image_url]" value="<?= htmlspecialchars($c['popup_image_url']) ?>" placeholder="URL Gambar" oninput="previewImage(this)">
                <img class="preview" src="<?= htmlspecialchars($c['popup_image_url']) ?>">
                <input name="film_credits[<?= $i ?>][credit_role_main]" value="<?= htmlspecialchars($c['credit_role_main']) ?>" placeholder="Peran Utama">
                <textarea name="film_credits[<?= $i ?>][popup_description]" placeholder="Deskripsi"><?= htmlspecialchars($c['popup_description']) ?></textarea>
                <input name="film_credits[<?= $i ?>][credit_role_secondary]" value="<?= htmlspecialchars($c['credit_role_secondary']) ?>" placeholder="Peran Tambahan">
              </div>
            <?php endforeach; ?>
          </div>
          <button type="button" onclick="addFilmCredit()">+ Tambah Credit</button>

        <?php else: ?>
          <label><?= htmlspecialchars($field) ?>:</label>
          <input name="<?= $field ?>" value="<?= htmlspecialchars($value) ?>">
        <?php endif; ?>
    <?php endforeach; ?>

    <br><button type="submit"><?= $id ? "Simpan Perubahan" : "Tambah Data" ?></button>
  </form>
  <br><a class="btn-secondary" href="admin.php?table=<?= urlencode($table) ?>">&larr; Kembali ke Admin</a>
</div>
</body>
</html>
