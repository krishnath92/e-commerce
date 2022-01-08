<?php
session_start();
require('../src/connect.php');

if(isset($_GET['reference']) AND !empty($_GET['reference'])){
    $getRef= $_GET['reference'];
    
    $recupArticle = $db->prepare('SELECT *from products where reference = ?');
    $recupArticle->execute(array($getRef));

    if($recupArticle->rowCount() > 0){
        //On récupère les champs de l'article choisi précedemment dans le tableau d'articles
        $article_Infos = $recupArticle->fetch();
        //Chaque champs est ramené avec la variable $article_Infos
        //On stocke ensuite 1 champ pour une variable 
        $marque_Vêtement = $article_Infos['marque'];
        $nbr_Vêtement = $article_Infos['nombre_stock'];
        $categorie_Vêtement = $article_Infos['categorie'];
        $sousCat_Vêtement = $article_Infos['sous_categorie'];
        $prixAchat_Vêtement = $article_Infos['prix_achat_HT'];
        $prixVente_Vêtement = $article_Infos['prix_vente_HT'];
        $tauxTVA = $article_Infos['tauxTVA'];
        $prixTTC_Vêtement = $article_Infos['priceTTC'];
        $remise_Vêtement = $article_Infos['remise'];
        $poids_Vêtement = $article_Infos['poids'];
        $couleur_Vêtement = $article_Infos['couleur'];
        $taille_Vêtement = $article_Infos['taille'];
        $description_Vêtement = $article_Infos['description'];
        $image_Vêtement = $article_Infos['image'];

    }
}
?>
    <html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
     
        <link rel="icon" type="image/png" href="../img/favicon.png">
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        
        
        <link href="https://fonts.googleapis.com/css2?family=Barlow:wght@300;400&display=swap" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css?family=Lato" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" integrity="sha512-Fo3rlrZj/k7ujTnHg4CGR2D7kSs0v4LLanw2qksYuRlEzO+tcaEPQogQ0KaoGN26/zrn20ImR1DfuLWnOo7aBA==" crossorigin="anonymous" referrerpolicy="no-referrer" />

        <link rel="stylesheet" type="text/css" href="../design/menu.css">
        <link rel="stylesheet" type="text/css" href="../design/menu.scss">
        <link rel="stylesheet" type="text/css" href="../design/boutiqueFooter.css">

        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
        <link rel="stylesheet" type="text/css" href="../design/accueil.css">

        <title>Article</title>
        </head>
        <body id = "accueil-body">
            <header>
                <div id="brand">
                    <a> <img src="../img/logo.png" alt="LOGO" /></a>
                    <!--button class="glow-on-hover" onclick="window.location.href='../espace_commun/connexion.php';">Se connecter </button--> 
                </div>
            

                <h1 class= "h1 text-gradiant" >Bienvenue sur Stunning Outfit Shop !</h1> <br>   
                    
                    <!-- image déroulante -->
                    <div id = "caroussel">
                        <div class="images">
                            <img src="../img/sport_header.jpg">
                            <img src="../img/Nike_header.jpg">
                            <img src="../img/adidas_header.jpg">
                            <img src="../img/northFace_header.jpg">
                        </div>
                    </div>
                    <?php
                        if(isset($_GET['success'])){ ?>
                            <button onclick="window.location.href='../espace_client/checkout/index.php';">Mon panier</button>
                    <?php } 
                        else { ?>    
                    <?php }?> 
            </header>

            <div class="cadre">
                <div class="centre">
                    <div class="carousel_texte">
                        <div class="changeHidden">

                            <div class="contenant">
                                <div class="element">"Livraison gratuite pour les membres à partir de 20 € d'achat."</div>
                                <div class="element">"Livraison standard à domicile en 2-4 jours."</div>
                                <div class="element">"Un service impeccable !"</div>
                                <div class="element">"Des produits de qualités"</div>
                            </div>

                        </div>
                    </div>
                </div>
            </div>

            <div class="content-article">      
                <div class="slideDiv">
                    <div class="slider">
                        <div class="sliderRight"><i class="fa-solid fa-angle-right"></i></div>
                        <div class="sliderLeft"><i class="fa-solid fa-angle-left"></i></div>
                        <?php echo "<img src='../img/".$categorie_Vêtement."/".$image_Vêtement."' alt =''/>"?>
                    </div>
                    <div class="miniPics"></div>
                </div>  

                <div class="nbimg">
                    <script type='text/javascript'>
                        let imgNum = -2;
                    </script>
                </div>

                <div class='texte'>
                    <h4>REFERENCE: <b><?= $getRef?> </b></h4>
                    <br>
                    <h4><b>PRIX</b>: <?= $prixTTC_Vêtement?>€ </h4>
                    <br>
                    <h4><b>COULEUR</b>: <?=$couleur_Vêtement?></h4>
                    <br>
                    <h4><b>TAILLE</b>: <input class='box' list='Taille' name='Tailles' placeholder='M'></h4>
                    <br>
                    <h4><b>QUANTITE</b>: <input value=1 min='0' max='9999' type='number' class='quantite'></h4>
                    <br>
                    <h4><b>DISPONIBILITE</b>: <?= $nbr_Vêtement?></h4>
                    <br>
                    <a href='#' class='ajout-panier'>AJOUTER AU PANIER</a>
                    <br>
                    <br>
                    <datalist  id='Taille'>
                        <option value='XS'>
                        <option value='S'>
                        <option value='M'>
                        <option value='L'>
                        <option value='XL'>
                    </datalist>
                </div>
                <div class='description'>
                    <p>
                        <h3><b><u>Description Article</u></b></h3>
                        <br>
                        <h5><?= $description_Vêtement?> </h5>
                    </p>
                </div>
            </div>

            <section>                        
                <?php require("../src/boutiqueFooter.php");?>
            </section>  
        </body>
        </html>


