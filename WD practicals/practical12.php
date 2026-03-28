<!DOCTYPE html>
<html>
<head>
    <title>Array Example</title>
</head>
<body>

<h2>Student List</h2>

<?php
// creating array and storing values in it
$students = array("Amit", "Neha", "Suresh", "Priya"); 

// Display using loop
echo "<ul>";
foreach($students as $name) {
    echo "<li>$name</li>";
}
echo "</ul>";
?>

</body>
</html>