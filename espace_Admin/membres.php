<?php
session_start();
require_once("mesFonctions.php");
require("../src/connect.php");
if(!$_SESSION['mdp']){
    header('location: index.php');
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
      <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
    <link rel="stylesheet" href="style/stylesheet.css" >
    <link rel="icon" type="image/png" href="../img/favicon.png">
    <link href="https://fonts.googleapis.com/css2?family=Barlow:wght@300;400&display=swap" rel="stylesheet">
    

    
    <title>Afficher les membres</title>
</head>
<body>
    <?php 
        logoAdmin();
        //Mise en place du menu
        //initMenuAdminMembres();
        
    ?>
    
    <!--Afficher tous les membres-->
    <?php
    $res = $db->query('SELECT count(*) from membres');
    $recupUsers = $db->query('SELECT * from membres');
    $nbrClients = $res->fetchColumn();

    echo"<table class = 'table-membre' border = '3' cellpadding='4' cellspacing ='1'>
                <tr> 
            <h1 style='text-align:center;'> Les clients-membres </h1> 
            <div style='text-align:center; margin-bottom:5px;'>
                <b>Il y a " .  $nbrClients . " clients inscrits.</b>
            </div>" ?>
            <!-- Bouton ALLER EN BAS DE PAGE -->
            <button style="margin-left:95%; margin-bottom:15px;"> 
                    <img style ="width:40px;" src="../img/to_down.png" onclick="window.scrollTo(0,document.body.scrollHeight);" title="Aller en bas de page"/> 
                </button>                
            
            <?= "<th>ID</th>
            <th>Civilité</th>
            <th>Nom</th>
            <th>Prénom</th>
            <th>Adresse mail</th>
            <th>Adresse de livraison</th>
            <th>Bannir ?</th>
        </tr>";
    while($user = $recupUsers->fetch()){
        echo"<tr>";
        echo "<td>" .$user['id']. "</td>";
        echo  "<td>". $user['civilité']. "</td>";
        echo "<td>". $user['nom']. "</td>";
        echo "<td>". $user['prenom']. "</td>";
        echo "<td>". $user['email']. "</td>";
        echo "<td>". $user['adresse_livraison']. "</td>";
        echo"<td>"?> 
        <a href = "bannir.php?email=<?= $user['email']; ?>" style="color:red; text-decoration: none;"> Bannir le membre</a>
            <?= "</td>";
        echo"</tr>";
    }
    echo "</table>";
    ?>
 
    
    <br>
    <div id="button-listemembre"> 
        <!--button class="publie-article-button" onclick="window.location.href='publier_Article.php';">Ajouter un article</button-->
        <button class="accueil-membre" onclick="window.location.href='../espace_commun/accueilCommun.php?accueil=1';">Revenir à l'accueil</button>
    </div>
</body>
</html>
