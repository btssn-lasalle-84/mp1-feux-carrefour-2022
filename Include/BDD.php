<?php

$mysqli = mysqli_connect("localhost", "celian", "password");
if (!$mysqli)
{
	exit("Erreur de connexion au serveur de base de données !");
}

$fichier = "bddCopie.sql";
if (!file_exists($fichier))
{
    exit("Erreur fichier $fichier !");
}

$contenu = file_get_contents($fichier);
if (!$contenu)
{
    exit("Erreur récupération contenu $fichier !");
}

$requetes = explode(PHP_EOL, $contenu);
foreach ($requetes as $requete)
{
    if (!empty($requete))
    {
        //var_dump($requete);
        mysqli_query($mysqli, $requete);
    }
}

$mysqli->close();
?>
