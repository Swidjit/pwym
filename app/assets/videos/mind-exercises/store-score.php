<?

include "braingames_connect.php";

$difficulty = $_POST['difficulty'];
$score = $_POST['score'];
$username = $_POST['username'];
$game = $_POST['game'];

$timestamp = time();

$results = mysql_query("SELECT AVG(`score`) as `avg` FROM `exercise_scores` WHERE `game`= '$game' AND `username`='$username' AND `difficulty`='$difficulty'");
$entry = mysql_fetch_object($results);
$avgscore = floor($entry -> avg);
$results = mysql_query("SELECT * FROM `exercise_scores` WHERE `game`= '$game' AND `username`='$username' AND `difficulty`='$difficulty' ORDER BY `score` DESC");
$entry = mysql_fetch_object($results);
$highscore = $entry -> score;

if(mysql_query("INSERT INTO `exercise_scores` (`username`,`game`,`score`,`difficulty`,`timestamp`) VALUES ('$username','$game','$score','$difficulty','$timestamp')")) {
	echo("msg=success");
}
else echo("msg=failed");



echo("&highscore=$highscore");
echo("&avgscore=$avgscore");
echo("&null=null");


?>