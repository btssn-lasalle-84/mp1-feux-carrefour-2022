
<?php
$mysqli = mysqli_connect("localhost", "celian", "password", "FEUX");
$requete = "SELECT * FROM CLASSIQUE";
$resultat = mysqli_query($mysqli, $requete);

                while ($ligne = mysqli_fetch_assoc($resultat))

                {



                        $fichier="/dev/ttyUSB0";
if($ouverture =fopen($fichier, 'a+'))
{





        $recuperation="$"."F1".'.'.$ligne['F1'].";".''."F2".'.'.$ligne['F2'].";".''."F3".'.'.$ligne['F3'].";".''."F4".'.'.$ligne['F4'].";".''."F5".'.'.$ligne['F5'].";".''."FP1".'.'.$ligne['FP1'].";".''."FP2".'.'.$ligne['FP2'].";".''."D".'.'.$ligne['D'].'*'."\n";

        fputs($ouverture, $recuperation);

        fclose($ouverture);
}

else echo 'error'.'<br>';

                }
mysqli_close($connexion);
?>

