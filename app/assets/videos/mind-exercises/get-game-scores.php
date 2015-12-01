<?

include "braingames_connect.php";

$username = $_POST['username'];
$game = $_POST['game'];
$scores = "";



for($i=1; $i <= 5; $i++) {

	$results = mysql_query("SELECT * FROM `exercise_scores` WHERE `game`= '$game' AND `username`='$username' AND `difficulty`='$i' ORDER BY `timestamp` ASC");
	while($entry = mysql_fetch_object($results)) {
		$score = $entry -> score;
		$scores .= $score." ";
	}
	$scores .= "|";
}
echo("nnull=null");
echo("&scores=$scores");
echo("&null=null");


?>