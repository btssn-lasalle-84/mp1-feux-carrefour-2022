<html>
<head>
<meta charset="utf-8" />
<title>
Formulaire html
</title>
</head>
<body>
<form action="identification.php" method="GET">
Votre nom :<input type="text" name="nom">
Votre mot de passe :<input type="text" name="mdp">
<p>
<input type=submit value="Envoyer">
</form>

<?php

$user = $_GET['nom'];
$password = $_GET['mdp'];


echo $user;
echo $password;






?>


</body>
</html>


