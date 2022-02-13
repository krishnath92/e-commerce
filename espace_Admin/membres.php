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
    <link rel="stylesheet" type="text/css" href="../design/accueil.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.2/font/bootstrap-icons.css">
    

    
    <title>Afficher les membres</title>
</head>
<body>
    <?php logoAdmin(); ?>
    <h1 style='font-size:48px; text-align:center;'>Les membres</h1>
        <form method='get' action=''>
            <div class="search-container">
                    <input type="text" placeholder="Search.." name="search">
                    <button class="bi bi-search"  type="submit" name ="ok"></button>
            </div><hr/>
        </form>
    
    <!--Afficher tous les membres-->
    <?php

    
    if (!isset($_GET['search'])){
        //Afficher tous les articles
        $res = $db->query('SELECT count(*) from membres');
        $recupUsers = $db->query('SELECT * from membres');

        $nbrClients = $res->fetchColumn();
    }

    if (isset($_GET['search'])){
        $carac = $_GET['search'];
        $res = $db->query("SELECT count(*) from membres where civilité = '$carac' or prenom = '$carac' or nom = '$carac' or email = '$carac' or adresse_livraison = '$carac'");
        $nbrClients = $res->fetchColumn();
        $recupUsers = $db->prepare('SELECT * from membres where civilité = ? or prenom = ? or nom = ? or email = ? or adresse_livraison = ?');
        $recupUsers->execute(array($carac,$carac,$carac,$carac,$carac));
        
    }

    echo"<table class = 'table-membre' border = '3' cellpadding='4' cellspacing ='1'>
                <tr> 
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
