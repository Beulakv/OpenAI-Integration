<?php
session_start();
require "db.php";

if ($_SERVER['REQUEST_METHOD'] === 'POST') {

    $email = $_POST['email'];
    $password = $_POST['password'];

    $stmt = $conn->prepare("SELECT * FROM users WHERE email = ?");
    $stmt->bind_param("s", $email);
    $stmt->execute();
    $user = $stmt->get_result()->fetch_assoc();

    if ($user && password_verify($password, $user['password'])) {
        $_SESSION['user_id'] = $user['id'];
        $_SESSION['user_name'] = $user['name'];
        $_SESSION['user_role'] = $user['user_role'];

        header("Location: index.php");
        exit;
    } else {
        $error = "Invalid login!";
    }
}
?>

<!DOCTYPE html>
<html>
<head>
    <title>Login</title>
    <style>
body {
    font-family: Arial;
    background: #f5f5f5;
    text-align: center;
}
form {
    background: #fff;
    padding: 20px;
    display: inline-block;
    margin-top: 50px;
    border-radius: 8px;
}
input {
    padding: 10px;
    width: 250px;
}
button {
    padding: 10px 20px;
    background: #2c4152;
    color: #fff;
    border: none;
}
</style>
</head>
<body>

<h2>Login</h2>

<form method="POST">
    <input type="email" name="email" placeholder="Email" required><br><br>
    <input type="password" name="password" placeholder="Password" required><br><br>
    <button type="submit">Login</button>
</form>

<p style="color:red;"><?php echo $error ?? ''; ?></p>

<a href="signup.php">Create account</a>

</body>
</html>