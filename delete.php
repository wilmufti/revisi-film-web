<?php
session_start();
include 'db.php';

if (!isset($_SESSION['admin_logged_in']) || $_SESSION['admin_logged_in'] !== true) {
    header("Location: loginadmin.php");
    exit;
}

$table = $_GET['table'] ?? '';
$id = $_GET['id'] ?? '';

// Validasi tabel
$allowed_tables = ['films', 'tv_series', 'movies', 'anime_metadata', 'people', 'people_details'];
if (!in_array($table, $allowed_tables)) {
    die("Tabel tidak valid.");
}

// Cari primary key
$pk_res = mysqli_query($conn, "SHOW KEYS FROM `$table` WHERE Key_name = 'PRIMARY'");
if (!$pk_res || !$pk = mysqli_fetch_assoc($pk_res)) {
    die("Primary key tidak ditemukan.");
}
$primary_key = $pk['Column_name'];

// Hapus data
$stmt = $conn->prepare("DELETE FROM `$table` WHERE `$primary_key` = ?");
$stmt->bind_param("s", $id);
$stmt->execute();

if ($stmt->affected_rows > 0) {
    header("Location: admin.php?table=" . urlencode($table));
} else {
    echo "Gagal menghapus data.";
}
$stmt->close();
$conn->close();
