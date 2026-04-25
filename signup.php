<?php
session_start();
require "db.php";

if ($_SERVER['REQUEST_METHOD'] === 'POST') {

    $name = $_POST['name'];
    $email = $_POST['email'];
    $password = password_hash($_POST['password'], PASSWORD_DEFAULT);

    $stmt = $conn->prepare("INSERT INTO users (name, email, password) VALUES (?, ?, ?)");
    $stmt->bind_param("sss", $name, $email, $password);

    if ($stmt->execute()) {
        header("Location: login.php");
        exit;
    } else {
        $error = "Email already exists!";
    }
}
?>

<!DOCTYPE html>
<html>
    <head>
    <title>signup</title>
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

<h2>Signup</h2>

<form method="POST">
    <input type="text" name="name" placeholder="Name" required><br><br>
    <input type="email" name="email" placeholder="Email" required><br><br>
    <input type="password" name="password" placeholder="Password" required><br><br>
    <button type="submit">Signup</button>
</form>

<p style="color:red;"><?php echo $error ?? ''; ?></p>

<a href="login.php">Already have an account? Login</a>

</body>
</html>