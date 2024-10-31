<?php
$host = "localhost";     // Change according to your configuration
$user = "root";          // Change according to your configuration
$password = "";          // Change according to your configuration
$database = "hidroponik";

// Create connection
$conn = new mysqli($host, $user, $password, $database);

// Check connection
if ($conn->connect_error) {
    die(json_encode([
        "status" => "error",
        "message" => "Koneksi gagal: " . $conn->connect_error
    ]));
} else {
    echo json_encode([
        "status" => "success",
        "message" => "Koneksi berhasil"
    ]);
}

// Close connection (optional for testing)
$conn->close();
?>
