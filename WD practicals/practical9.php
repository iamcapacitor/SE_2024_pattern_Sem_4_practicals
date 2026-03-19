<!DOCTYPE html>
<html>

<head>
    <title>Welcome page</title>
</head>

<body>
    <?php
    // 1. create welcome.php file and add this full code in it
    // 2. install XAMPP if not installed already
        // display welcome message
        echo "<h1>Welcome to Bharat</h1>";

        // set timezone (important for current time)
        date_default_timezone_set("Asia/Kolkata");

        // Display current date and time
        echo"<p>Current Date and time: ".date("Y-m-d H:i:s")."</p>";
    ?>
</body>

</html>