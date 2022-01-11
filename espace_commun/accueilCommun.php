
<?php
require('../src/connect.php');
//$articles = $db->query('SELECT * FROM articles ORDER BY date_time_publication DESC');

?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="../design/menu.css">
    <link rel="stylesheet" type="text/css" href="../design/boutiqueFooter.css">
    <link rel="stylesheet" type="text/css" href="../design/menu.scss">
	<link rel="icon" type="image/png" href="../img/favicon.png">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Barlow:wght@300;400&display=swap" rel="stylesheet">
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
    <link rel="stylesheet" type="text/css" href="../design/accueil.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.2/font/bootstrap-icons.css">
    <title>Accueil </title>
</head>
<body id = "accueil-body" >
    <header>
        <div id="brand">
            <a  href="accueilCommun.php?accueil=1" ><img src="../img/logo.png" alt="LOGO" /></a>
            <h1 class= "h1 text-gradiant" >Bienvenue sur Stunning Outfit Shop !</h1>
            <div class="search-container">
                <input type="text" placeholder="Search.." name="search">
                <button class="bi bi-search"  type="submit"></button>
            </div>
            <button class="glow-on-hover-connexion" onclick="window.location.href='connexion.php';">Se connecter </button>  
        </div>
        <!-- MENU CENTRALE-->
        <nav >
            <ul>
                <div class="menucontent">
                    <li><a class ="menu" href="accueilCommun.php?accueil=1" title="Aller à l'accueil">ACCUEIL</a></li>

                    <li> <a class = "menu" href="accueilCommun.php?homme=1" title="Homme">HOMME</a>
                        <ul class="submenu">
                            <li><a href = "accueilCommun.php?categoriehomme=1&homme=1">joggings</a></li>
                            <li><a href = "accueilCommun.php?categoriehomme=2&homme=1">shorts</a></li>
                            <li><a href = "accueilCommun.php?categoriehomme=3&homme=1">Sweat</a></li>
                            <li><a href = "accueilCommun.php?categoriehomme=4&homme=1">Polo</a></li>
                            <li><a href = "accueilCommun.php?categoriehomme=5&homme=1">T-shirt</a></li>
                            <li><a href = "accueilCommun.php?categoriehomme=6&homme=1">blouson</a></li>
                        </ul>
                    </li>
                    <li> <a class = "menu" href="accueilCommun.php?femme=1" title="Femme">FEMME</a>
                        <ul class="submenu">
                            <li><a href = "accueilCommun.php?categoriefemme=1&femme=1">leggings</a></li>
                            <li><a href = "accueilCommun.php?categoriefemme=2&femme=1">joggings</a></li>
                            <li><a href = "accueilCommun.php?categoriefemme=3&femme=1">cycliste</a></li>
                            <li><a href = "accueilCommun.php?categoriefemme=4&femme=1">Sweat</a></li>
                            <li><a href = "accueilCommun.php?categoriefemme=5&femme=1">crop-top</a></li>
                            <li><a href = "accueilCommun.php?categoriefemme=6&femme=1">brassière</a></li>
                            <li><a href = "accueilCommun.php?categoriefemme=7&femme=1">T-shirt</a></li>
                            <li><a href = "accueilCommun.php?categoriefemme=8&femme=1">blouson</a></li>                        
                        </ul>
                    </li>
                    <li> <a class = "menu" href="accueilCommun.php?remise=1" title="remise">REMISE</a></li>
                </div>
            </ul>
        </nav>

            
            <!-- image déroulante -->
            <div id = "caroussel">
                <div class="images">
                    <img src="../img/sport_header.jpg">
                    <img src="../img/Nike_header.jpg">
                    <img src="../img/adidas_header.jpg">
                    <img src="../img/northFace_header.jpg">
                </div>
            </div>
            <!--button id="panier" onclick="window.location.href='../espace_client/panier.php?action=ajout&amp';"n=NOMPRODUIT&amp;q=QUANTITEPRODUIT&amp;p=PRIXPRODUIT" 
                onclick="window.open(this.href, '', 'toolbar=no, location=no, directories=no, \
                'status=yes, scrollbars=yes, resizable=yes, copyhistory=no, width=600, height=350');
                return false;">Mon panier
            </button-->
            <?php
                if(isset($_GET['success'])){ ?>
                    <button onclick="window.location.href='../espace_client/checkout/index.php';">Mon panier</button>
            <?php } 
                else { ?>    
            <?php }?> 
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
                        <a href="" title="Voir le premier projet" >
                            <div class="picture-accueil">
                                <img src="../img/new-collection-d-hiver.jpg" alt="mon premier projet"/>
                            </div>
                            <span>Nouvelle collection d'hiver</span>
                        </a>
                    </div>
                    <!-- Promotion -->
                    <div style="margin-bottom: 40px;" class="img-accueil">
                        <a href="accueilCommun.php?remise=1" title="Voir le premier projet" >
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
            <?php include("rechercheMenu.php"); ?>

            <!-- INCLUDE -->
            <?php include("remise.php"); ?>
            
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

    <script src = "js/script.js"></script>
    
</body>
</html>