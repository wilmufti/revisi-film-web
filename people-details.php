<?php
// Koneksi database
require_once 'db.php';

// Ambil NAMA dari URL. Jika tidak ada, tampilkan pesan error.
if (!isset($_GET['name'])) {
    die("Nama orang tidak disediakan.");
}
$person_name_to_display = urldecode($_GET['name']); // Decode nama dari URL

// Query data orang berdasarkan NAMA
// Pastikan ada kolom 'name' di tabel 'people_details' yang sesuai
$sql = "SELECT * FROM people_details WHERE name = ?";
$stmt = $conn->prepare($sql);
if (!$stmt) {
    die("Error preparing statement: " . $conn->error);
}

// Bind parameter NAMA sebagai string
$stmt->bind_param("s", $person_name_to_display);
$stmt->execute();
$result = $stmt->get_result();

if ($result->num_rows === 0) {
    // Tambahkan pengecekan untuk nama yang mungkin tidak ditemukan
    die("Orang dengan nama '" . htmlspecialchars($person_name_to_display) . "' tidak ditemukan.");
}

$person = $result->fetch_assoc();

// Decode JSON (tetap sama)
$person['also_known_as'] = json_decode($person['also_known_as'], true) ?: [];
$person['known_for_films'] = json_decode($person['known_for_films'], true) ?: [];
$person['film_credits'] = json_decode($person['film_credits'], true) ?: [];

// Hitung umur (tetap sama)
$birthday_display = '-';
if (!empty($person['birth_date'])) {
    try {
        $birthDate = new DateTime($person['birth_date']);
        $today = new DateTime();
        $age = $today->diff($birthDate)->y;
        $birthday_display = htmlspecialchars($person['birth_date']) . " ({$age} years old)";
    } catch (Exception $e) {
        // Jika tanggal lahir tidak valid, tampilkan tanggal lahir saja
        $birthday_display = htmlspecialchars($person['birth_date']);
    }
}

$stmt->close();
$conn->close();
?>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta http-equiv="X-UA-Compatible" content="IE=edge" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>People Details - <?php echo htmlspecialchars($person['name']); // Menambahkan nama orang di title ?></title>
  <link rel="stylesheet" href="./css/style.css" />
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" />
</head>
<body>
  <div class="details-container">
    <div class="details-header">
      <a href="people.php"><img src="./images/logo.png" alt="Logo" /></a>
      <div class="search-container-details">
        <input type="text" placeholder="Search.." name="search" />
        <i class="fa-solid fa-magnifying-glass"></i>
      </div>
    </div>
    <div class="people-details-content">
      <div class="personal-info">
        <img
          src="<?php echo htmlspecialchars($person['profile_image_url'] ?: './images/default-profile.png'); ?>"
          alt="<?php echo htmlspecialchars($person['name']); ?>"
        />
        <h1 class="people-details-name-mobile"><?php echo htmlspecialchars($person['name']); ?></h1>
        <h3 class="personal-info-text">Personal Info</h3>
        <div class="personal-info-items">
          <strong>Known For</strong>
          <p><?php echo htmlspecialchars($person['known_for_department']); ?></p>
        </div>
        <div class="personal-info-items">
          <strong>Known Credits</strong>
          <p><?php echo htmlspecialchars($person['known_credits_count']); ?></p>
        </div>
        <div class="personal-info-items">
          <strong>Gender</strong>
          <p><?php echo htmlspecialchars($person['gender']); ?></p>
        </div>
        <div class="personal-info-items">
          <strong>Birthday</strong>
          <p><?php echo $birthday_display; ?></p>
        </div>
        <div class="personal-info-items">
          <strong>Place of Birth</strong>
          <p><?php echo htmlspecialchars($person['place_of_birth']); ?></p>
        </div>
        <?php if (!empty($person['also_known_as'])): ?>
        <div class="personal-info-items also-known-as">
          <strong>Also Known As</strong>
          <ul>
            <?php foreach ($person['also_known_as'] as $aka_name): ?>
            <li><?php echo htmlspecialchars($aka_name); ?></li>
            <?php endforeach; ?>
          </ul>
        </div>
        <?php endif; ?>
      </div>

      <div class="people-details-right">
        <h1 class="people-details-name"><?php echo htmlspecialchars($person['name']); ?></h1>
        <div class="biography">
          <h3>Biography</h3>
          <p><?php echo nl2br(htmlspecialchars($person['biography'])); ?></p>
        </div>

        <?php if (!empty($person['known_for_films'])): ?>
        <div class="people-details-scroll-container">
          <h3>Known For</h3>
          <div class="people-details-scroll">
            <?php foreach ($person['known_for_films'] as $film): ?>
            <div class="people-details-scroll-item">
              <img src="<?php echo htmlspecialchars($film['image_url']); ?>" alt="<?php echo htmlspecialchars($film['alt']); ?>" />
              <p><?php echo htmlspecialchars($film['title']); ?></p>
            </div>
            <?php endforeach; ?>
          </div>
        </div>
        <?php endif; ?>

        <?php if (!empty($person['film_credits'])): ?>
        <div class="credits">
          <h3>Credits</h3>
          <table>
            <tbody>
              <?php
              $credits_by_year = [];
              foreach ($person['film_credits'] as $credit) {
                  $year = $credit['year'] ?: '-'; // Gunakan '-' jika tahun tidak ada
                  $credits_by_year[$year][] = $credit;
              }
              krsort($credits_by_year); // Urutkan berdasarkan tahun (terbaru dulu)
              ?>

              <?php foreach ($credits_by_year as $year => $credits_in_year): ?>
              <tr>
                <td>
                  <table class="credit-group">
                    <tbody>
                      <?php foreach ($credits_in_year as $credit): ?>
                      <tr>
                        <td class="year"><?php echo htmlspecialchars($year); ?></td>
                        <td class="separator">
                          <div class="people-details-circle" onclick="togglePopup(this)">
                            <div class="popup">
                              <img class="popup-img" src="<?php echo htmlspecialchars($credit['popup_image_url']); ?>" />
                              <div class="popup-right">
                                <h3 class="popup-title"><?php echo htmlspecialchars($credit['popup_title']); ?></h3>
                                <h5 class="popup-description"><?php echo nl2br(htmlspecialchars($credit['popup_description'])); ?></h5>
                              </div>
                            </div>
                          </div>
                        </td>
                        <td class="name">
                          <?php echo htmlspecialchars($credit['credit_role_main']); ?>
                          <?php if (!empty($credit['credit_role_secondary'])): ?>
                            <span><?php echo htmlspecialchars($credit['credit_role_secondary']); ?></span>
                          <?php endif; ?>
                        </td>
                      </tr>
                      <?php endforeach; ?>
                    </tbody>
                  </table>
                </td>
              </tr>
              <?php endforeach; ?>
            </tbody>
          </table>
        </div>
        <?php endif; ?>
      </div>
    </div>
  </div>
  <script type="module" src="./js/people-details.js"></script>
</body>
</html>