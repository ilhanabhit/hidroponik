<?php
include 'db_config.php';

header("Content-Type: application/json");

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    // Retrieve and sanitize data from the request body
    $username = isset($_POST['username']) ? trim(filter_var($_POST['username'], FILTER_SANITIZE_STRING)) : '';
    $password = isset($_POST['password']) ? trim($_POST['password']) : '';

    // Check if username and password are provided
    if (empty($username) || empty($password)) {
        echo json_encode(["status" => "error", "message" => "Username and password are required"]);
        exit();
    }

    // Prepare query to find the user by username
    $stmt = $conn->prepare("SELECT * FROM user WHERE username = ?");
    if (!$stmt) {
        echo json_encode(["status" => "error", "message" => "Database query preparation failed"]);
        exit();
    }
    
    $stmt->bind_param("s", $username);

    if ($stmt->execute()) {
        $result = $stmt->get_result();

        if ($result->num_rows > 0) {
            $user = $result->fetch_assoc();

            // Verify the password (hashed password comparison)
            if (password_verify($password, $user['password'])) {
                // Remove the password from the response data
                unset($user['password']);
                echo json_encode(["status" => "success", "message" => "Login berhasil", "data" => $user]);
            } else {
                echo json_encode(["status" => "error", "message" => "Password salah"]);
            }
        } else {
            echo json_encode(["status" => "error", "message" => "Username tidak ditemukan"]);
        }
    } else {
        echo json_encode(["status" => "error", "message" => "Query execution failed"]);
    }

    $stmt->close();
} else {
    echo json_encode(["status" => "error", "message" => "Unsupported request method"]);
}

$conn->close();
?>
