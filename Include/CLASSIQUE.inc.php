
<?php

$fichierPort = "/dev/ttyUSB0";
$port = fopen($fichierPort, 'a+');
if(!$port)
{
   exit("Impossible d'ouvrir le port $fichierPort");
}

$mysqli = mysqli_connect("localhost", "celian", "password", "FEUX");
if (!$mysqli)
{
    exit("Erreur de connexion à la base de données FEUX !");
}

$requete = "SELECT * FROM SEQUENCE INNER JOIN MODE ON MODE.idMode = SEQUENCE.idMode WHERE MODE.nomMode = 'CLASSIQUE' ORDER BY SEQUENCE.numeroSequence ASC;";
$resultat = mysqli_query($mysqli, $requete);
while ($enregistrement = mysqli_fetch_assoc($resultat))
{
    $trame = "$"."F1".'.'.$enregistrement['F1'].";".''."F2".'.'.$enregistrement['F2'].";".''."F3".'.'.$enregistrement['F3'].";".''."F4".'.'.$enregistrement['F4'].";".''."F5".'.'.$enregistrement['F5'].";".''."FP1".'.'.$enregistrement['FP1'].";".''."FP2".'.'.$enregistrement['FP2'].";".''."D".'.'.$enregistrement['Duree'].'*'."\n";
    fputs($port, $trame);
}

$mysqli->close();

fclose($port);
?>
