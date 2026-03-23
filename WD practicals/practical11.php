<!DOCTYPE html>
<html>
<head>
    <title>Extended String Functions in PHP</title>
</head>
<body>

<h2>PHP String Manipulation (Extended)</h2>

<form method="post">
    Enter a String: <input type="text" name="inputString" required>
    <input type="submit" value="Submit">
</form>

<?php
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $str = $_POST['inputString'];

    echo "<h3>Results:</h3>";

    // Length
    echo "Length: " . strlen($str) . "<br>";

    // Reverse
    echo "Reverse: " . strrev($str) . "<br>";

    // Uppercase & Lowercase
    echo "Uppercase: " . strtoupper($str) . "<br>";
    echo "Lowercase: " . strtolower($str) . "<br>";

    // First letter uppercase
    echo "Ucfirst: " . ucfirst($str) . "<br>";

    // First letter of each word uppercase
    echo "Ucwords: " . ucwords($str) . "<br>";

    // Substring
    echo "Substring (0-5): " . substr($str, 0, 5) . "<br>";

    // Position of a word (search)
    echo "Position of 'a': " . strpos($str, "a") . "<br>";

    // Replace word
    echo "Replace 'a' with '@': " . str_replace("a", "@", $str) . "<br>";

    // Word count
    echo "Word Count: " . str_word_count($str) . "<br>";

    // Shuffle string
    echo "Shuffled String: " . str_shuffle($str) . "<br>";

    // Repeat string
    echo "Repeat (2 times): " . str_repeat($str, 2) . "<br>";

    // Trim spaces
    echo "Trimmed String: " . trim($str) . "<br>";

    // Compare strings
    echo "Compare with 'test': " . strcmp($str, "test") . "<br>";

    // Palindrome check
    if ($str == strrev($str)) {
        echo "Palindrome: Yes<br>";
    } else {
        echo "Palindrome: No<br>";
    }
}
?>

</body>
</html>