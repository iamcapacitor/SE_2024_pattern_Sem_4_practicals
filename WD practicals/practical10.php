<!DOCTYPE html>
<html>
<head>
    <title>POST Method Example</title>
</head>
<body>

<h2>User Form</h2>

<form method="post" action="">
    Name: <input type="text" name="name"><br><br>
    Email: <input type="email" name="email"><br><br>
    Age: <input type="number" name="age"><br><br>
    
    <input type="submit" name="submit" value="Submit">
</form>

<?php
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $name = $_POST['name'];
    $email = $_POST['email'];
    $age = $_POST['age'];

    echo "<h2>Form Data Received:</h2>";
    echo "Name: " . $name . "<br>";
    echo "Email: " . $email . "<br>";
    echo "Age: " . $age . "<br>";
}
?>

</body>
</html>