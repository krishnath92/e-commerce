<?php
session_start();
require('../src/connect.php');
//$articles = $db->query('SELECT * FROM articles ORDER BY date_time_publication DESC');
?>


<?php
/* DOIT ETRE CONNECTE SINON REDIRIGER */
if(!isset($_SESSION["user"])){
        header('Location: ../espace_commun/connexion.php?error=1&message=Connectez-vous.');
        exit();
}?>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="../design/menu.css">
    <link rel="stylesheet" type="text/css" href="../design/boutiqueFooter.css">
    <link rel="icon" type="image/png" href="../img/favicon.png">
<!-- icone Bootstrap -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.2/font/bootstrap-icons.css">
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
    <link rel="stylesheet" type="text/css" href="../design/accueil.css">
   
    
    <title>Accueil </title>
    </head>
    <body id = "accueil-body" >
    <header>
        <div class="brand-client">
        <a href="accueilClient.php?accueil=1" ><img src="../img/logo.png" alt="LOGO" /></a>
        <h1 class= "h1 text-client" >Bienvenue sur Stunning Outfit Shop !</h1> <br>   
            <li class="dropdown">
                <a class="bi bi-person-circle" style="font-size: 2rem; color: white;"><?php echo $_SESSION['prenom']; ?></a>

                <div class="dropdown-content">          
                    <a style='color:white;' href="../espace_client/logout.php">Se déconnecter</a>
                    <a style='color:white;' href="../espace_client/profil.php">Consulter son profil</a>
                    <a style='color:white;' href="../espace_client/logout.php">Consulter ses commandes</a>
                
                </div>
            </li>
            <button class="glow-on-hover" onclick="window.location.href='../espace_client/panier.php';">Mon panier</button>
        </div>
                  <!-- MENU CENTRALE-->
        <nav >
            <ul>
                <div class="menucontent">
                    <li><a class ="menu" href="accueilClient.php?accueil=1" title="Aller à l'accueil">Accueil</a></li>

                    <li> <a class = "menu" href="accueilClient.php?homme=1" title="Homme">Homme</a>
                        <ul class="submenu">
                            <li><a href = "accueilClient.php?categoriehomme=1&homme=1">joggings</a></li>
                            <li><a href = "accueilClient.php?categoriehomme=2&homme=1">shorts</a></li>
                            <li><a href = "accueilClient.php?categoriehomme=3&homme=1">Sweat</a></li>
                            <li><a href = "accueilClient.php?categoriehomme=4&homme=1">Polo</a></li>
                            <li><a href = "accueilClient.php?categoriehomme=5&homme=1">T-shirt</a></li>
                            <li><a href = "accueilClient.php?categoriehomme=6&homme=1">blouson</a></li>
                        </ul>
                    </li>
                    <li> <a class = "menu" href="accueilClient.php?femme=1" title="Femme">Femme</a>
                        <ul class="submenu">
                            <li><a href = "accueilClient.php?categoriefemme=1&femme=1">leggings</a></li>
                            <li><a href = "accueilClient.php?categoriefemme=2&femme=1">joggings</a></li>
                            <li><a href = "accueilClient.php?categoriefemme=3&femme=1">cycliste</a></li>
                            <li><a href = "accueilClient.php?categoriefemme=4&femme=1">Sweat</a></li>
                            <li><a href = "accueilClient.php?categoriefemme=5&femme=1">crop-top</a></li>
                            <li><a href = "accueilClient.php?categoriefemme=6&femme=1">brassière</a></li>
                            <li><a href = "accueilClient.php?categoriefemme=7&femme=1">T-shirt</a></li>
                            <li><a href = "accueilClient.php?categoriefemme=8&femme=1">blouson</a></li>
                        </ul>
                    </li>
                    <li> <a class = "menu" href="accueilClient.php?remise=1" title="remise">Remise</a></li>
                </div>
            </ul>
        </nav>
        <?php
            echo'<div class="alert success">Vous êtes maintenant connecté.</div>';
        ?>
    
            
         
            <!--button id="panier" onclick="window.location.href='panier.php?action=ajout&amp';"n=NOMPRODUIT&amp;q=QUANTITEPRODUIT&amp;p=PRIXPRODUIT" 
                onclick="window.open(this.href, '', 'toolbar=no, location=no, directories=no, \
                'status=yes, scrollbars=yes, resizable=yes, copyhistory=no, width=600, height=350');
                return false;">Mon panier
            </button-->
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


        
        
            
    <div class="contener">
    <?php
        if(isset($_GET['accueil'])&& $_GET['accueil'] == 1){ ?>
           
		<!-- PRESENTATION -->
		<section id = "presentation">

            <div class="present">

			    <h3 style="padding-bottom: 40px;">Bienvenue</h3> 
			    <!--Description -->
			    <p> <strong>Livraison gratuite pour les membres à partir de 20 € d'achat. </strong> |  
                Livraison standard à domicile en 2-4 jours. 
			    </p>

            </div>

		</section>

		<!-- Nouveauté et Promotion-->
		<section>

            <div class="promotion">

                <h3 style="padding-bottom: 40px; padding-top: 40px;">Nouveauté / Promotions</h3>

                <!-- CONTENEUR -->
                <div id="projets">

                    <!-- Nouveauté -->
                    <div style="margin-bottom: 40px;" class="img-accueil">
                        <a href="#" title="Voir le premier projet" >
                            <div class="picture-accueil">
                                <img src="../img/new-collection-d-hiver.jpg" alt="mon premier projet"/>
                            </div>
                            <span>Nouvelle collection d'hiver</span>
                        </a>
                    </div>
                    
                    <!-- Promotion -->
                    <div style="margin-bottom: 40px;" class="img-accueil">

                        <a href="accueilClient.php?remise=1" title="Voir le premier projet" >
                            <div class="picture-accueil">
                                <img src="../img/promo.jpg" alt="mon premier projet"/>
                            </div>
                            <span>Les vêtements en promotions</span>
                        </a>

                    </div>

                </div>

            </div>

		</section>
        <?php } ?>
        
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

        <!-- CONTACT -->
        <section >
            <?php require("../src/boutiqueFooter.php"); ?>
        </section>


    <script src = "../js/script.js"></script>
    
</body>
</html>
