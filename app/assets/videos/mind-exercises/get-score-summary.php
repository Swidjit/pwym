<?

include "braingames_connect.php";

$username = $_POST['username'];
$game = $_POST['game'];
$difficulty = $_POST['difficulty'];

//$username = "alex";
//$game = "Arrange Colors";
//$difficulty = 1;
$results = mysql_query("SELECT AVG(`score`) as `avg` FROM `exercise_scores` WHERE `game`= '$game' AND `username`='$username' AND `difficulty`='$difficulty'");
$entry = mysql_fetch_object($results);
$avgscore = $entry -> avg;
$results = mysql_query("SELECT * FROM `exercise_scores` WHERE `game`= '$game' AND `username`='$username' AND `difficulty`='$difficulty' ORDER BY `score` DESC");
$entry = mysql_fetch_object($results);
$highscore = $entry -> score;

echo("null=null");
echo("&highscore=$highscore");
echo("&avgscore=$avgscore");
echo("&null=null");


?>