<?php 


$mysqli = mysqli_connect("localhost", "celian", "password");

if ($mysqli != false) 
{
	echo "test";
}


    $req = file_get_contents("BDD.sql");
    $array = explode(PHP_EOL, $req);
    foreach ($array as $sql) {
        if ($sql != '') {
            mysqli_query($mysqli, $sql);
        }
    }



mysql_close($mysqli);
?>
