<?php
session_start();
if(!$_SESSION['mdp']){
    header('location: index.php');
}
require('../src/connect.php');
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="../design/menu.css">
    <link rel="stylesheet" type="text/css" href="../design/boutiqueFooter.css">
	<link rel="icon" type="image/png" href="../img/favicon.png">
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
    <link rel="stylesheet" type="text/css" href="../design/accueil.css">
    
    <title>Espace Administrateur </title>
</head>
<body>
    <header>
        <div id="brand">
            <a href="accueilAdmin.php?accueil=1" ><img src="../img/logo.png" alt="LOGO" /></a>
            <h1 class= "h1 text-gradiant-admin" >Bienvenue sur l'espace admin de Stunning Outfit Shop !</h1> <br>   
            <button class="glow-on-hover-connexion" onclick="window.location.href='logout.php';">Se déconnecter</button>
        </div>
           <!-- MENU CENTRALE-->
        <nav >
            <ul>
                <div class="menucontent">
                    <li><a class ="menu" href="accueilAdmin.php?accueil=1" title="Aller à l'accueil">Accueil</a></li>

                    <li> <a class = "menu" href="accueilAdmin.php?homme=1" title="Homme">Homme</a>
                        <ul class="submenu">
                            <li><a href = "accueilAdmin.php?categoriehomme=1&homme=1">joggings</a></li>
                            <li><a href = "accueilAdmin.php?categoriehomme=2&homme=1">shorts</a></li>
                            <li><a href = "accueilAdmin.php?categoriehomme=3&homme=1">Sweat</a></li>
                            <li><a href = "accueilAdmin.php?categoriehomme=4&homme=1">Polo</a></li>
                            <li><a href = "accueilAdmin.php?categoriehomme=5&homme=1">T-shirt</a></li>
                            <li><a href = "accueilAdmin.php?categoriehomme=6&homme=1">blouson</a></li>
                        </ul>
                    </li>
                    <li> <a class = "menu" href="accueilAdmin.php?femme=1" title="Femme">Femme</a>
                        <ul class="submenu">
                            <li><a href = "accueilAdmin.php?categoriefemme=1&femme=1">leggings</a></li>
                            <li><a href = "accueilAdmin.php?categoriefemme=2&femme=1">joggings</a></li>
                            <li><a href = "accueilAdmin.php?categoriefemme=3&femme=1">cycliste</a></li>
                            <li><a href = "accueilAdmin.php?categoriefemme=4&femme=1">Sweat</a></li>
                            <li><a href = "accueilAdmin.php?categoriefemme=5&femme=1">crop-top</a></li>
                            <li><a href = "accueilAdmin.php?categoriefemme=6&femme=1">brassière</a></li>
                            <li><a href = "accueilAdmin.php?categoriefemme=7&femme=1">T-shirt</a></li>
                            <li><a href = "accueilAdmin.php?categoriefemme=8&femme=1">blouson</a></li>
                        </ul>
                    </li>
                    <li> <a class = "menu" href="accueilAdmin.php?remise=1" title="remise">Remise</a></li>
                </div>
            </ul>
        </nav>


            
            <?php
                if(isset($_GET['success']))
                    echo'<div class="alert success">Vous êtes maintenant connecté en tant qu\'administrateur du site web.</div>';
                ?>
    
            <!--button id="deco" onclick="window.location.href='accueil.php';">compte administrateur</button-->
            
    </header>

 

    <!-- MENU RECHERCHE-->
    <?php
        if(!isset($_GET['accueil']) and !isset($_GET['remise'])){ ?>
    <?php
        $rescouleur = $db->query('SELECT distinct couleur FROM products');
        $resmarque = $db->query('SELECT distinct marque FROM products');
        $restaille = $db->query('SELECT distinct taille FROM products');
    ?>

    <form method="POST" action="" enctype="multipart/form-data">
        <div class="searchcontent">
            <label id = "label-search" for="marque">Marque:</label>
            <select name="marque" id="marque">
                <option  selected disabled hidden>Choose here</option>
                <option value="adidas"> adidas</option>
                <option value="nike">nike</option>
                <option value="The North Face"> The North Face </option>
            </select>

            <label id = "label-search" for="couleur">Couleur:</label>
            <select name="couleur" id="couleur">
                <option  selected disabled hidden>Choose here</option>
                    <?php 
                        while($article = $rescouleur->fetch())
                        {
                            echo "<option value=".$article['couleur'].">".$article['couleur']."</option>";
                        }
                    ?> 
            </select>

            <label id = "label-search" for="prix">Prix:</label>
            <select name="prix" id="prix">
                <option  selected disabled hidden>Choose here</option>
                <option value="0">0 à 50</option>
                <option value="50">50 à 100</option>
                <option value="100">100 à 150</option>
                <option value="150">150 à 200</option>
                <option value="200"> &gt; 200  </option>
            </select>

            <input id ="search-button" type="submit" value="Search">
        </div>
    </form>
    <?php } ?>


    <?php
    if(isset($_GET['accueil'])){ ?>

    <h3 style="text-align:center; padding-top:100px" >Quelle action souhaitez-vous réaliser ?</h3>
    <!--a href="membres.php">afficher tous les membres</a><br-->
    <button class = "boutonAdmin" style="margin:40px 700px;"  onclick="window.location.href='membres.php';">Afficher tous les membres</button>

    <!--a href="publier_Article.php">Publier un article</a><br-->
    <button class = "boutonAdmin" style="margin:40px 700px;" onclick="window.location.href='publier_Article.php';">Mettre en vente un article</button>
    
    <!--a href="articles.php">afficher tous les article</a><br-->
    <button class = "boutonAdmin" style="margin:40px 700px;" onclick="window.location.href='articles.php';">Afficher tous les article</button>
    <?php } ?>

    <div class="contener">
        <!-- Les Vêtements -->
        <section>
            <!-- INCLUDE -->
            <?php include("../espace_commun/rechercheMenu.php"); ?>
            <!-- INCLUDE -->
            <?php include("../espace_commun/remise.php"); ?>

        </section>
    </div>

    <!-- Bouton RETOUR EN HAUT DE PAGE -->
    <div id="scroll_to_top">
        <a href="#top"><img src="../img/to_top.png" title="Retourner en haut" /></a>
    </div> 
       
    <?php include('../src/boutiqueFooter.php'); ?>
    <script src = ../js/script.js></script>
</body>
</html>