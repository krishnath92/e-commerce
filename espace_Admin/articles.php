<?php
session_start();
require_once("mesFonctions.php");
require("../src/connect.php");

if(!$_SESSION['mdp']){
    header('location: accueilCommun.php');
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
    <link rel="stylesheet" href="style/miniDesign.css" >
    <link rel="stylesheet" href="style/stylesheet.css" >
    <link rel="icon" type="image/png" href="../img/favicon.png">
    <link href="https://fonts.googleapis.com/css2?family=Barlow:wght@300;400&display=swap" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="../design/accueil.css">

    <title>Afficher les articles</title>
</head>
<body>
    <?php
    //Afficher tous les articles
        $res = $db->query('SELECT count(*) from products');
        $recupArticle = $db->query('SELECT * from products order by nombre_stock asc');

        $nbrArticle = $res->fetchColumn();
        logoAdmin();
        //Mise en place du menu
        initMenuAdmin();?>
        <!-- Bouton ALLER EN BAS DE PAGE -->
        <button style="margin-left:95%;"> 
            <img style ="width:40px;" src="../img/to_down.png" onclick="window.scrollTo(0,document.body.scrollHeight);" title="Aller en bas de page"/> 
        </button> 

        <?php
        ////    AFFICHAGE DU TABLEAU TRIE PAR LA QUANTITE EN ORDRE CROISSANT ///
        echo"<table class='table-products' border = '3' cellspacing ='1'>
            <tr> <!--h1> Les articles </h1--> 
                <div style='text-align:center; margin-bottom:5px;'>
                    <b>Il y a " .  $nbrArticle . " articles trouvés.</b>
                </div>

                <th>ID</th>
                <th>"?> 
                <a id = "titre" href = "Visualisation/marque.php" > Marque</a>
                    <?= "</th>
                <th>"?> 
                <a id = "titre"href = "Visualisation/categorie.php" > Catégorie</a>
                    <?= "</th>
                <th>"?> 
                <a id = "titre"href = "Visualisation/sousCat.php" > Sous - catégorie</a>
                    <?= "</th>
                <th style='text-align: center;'>Photo</th>
                <th>Description</th>
                <th>"?> 
                <a id = "titre"href = "Visualisation/couleur.php" > Couleur</a>
                    <?= "</th>
                <th>Tailles disponibles</th>
                <th>Prix d'achat HT</th>
                <th>Prix de vente HT</th>
                <th>TVA</th>
                <th>Prix TTC</th>
                <th>Poids (en g)</th>
                <th style='text-align: center;'>Référence</th>
                <th>"?>  
                <a id = "titre"href = "Visualisation/stock.php" > Quantité</a>
                    <?= "</th>
                <th>Remise</th>
                <th>Supprimer ?</th>
                <th>Modifier ?</th>
            </tr>";
        while($article = $recupArticle->fetch()){
               echo"<tr>";
                echo "<td>" .$article['id']. "</td>";
                echo  "<td>". $article['marque']. "</td>";
                echo  "<td>". $article['categorie']. "</td>";
                echo  "<td>". $article['sous_categorie']. "</td>";
                echo  "<td>". $article['image']. "</td>";
                echo  "<td>". $article['description']. "</td>";
                echo  "<td>". $article['couleur']. "</td>";
                echo  "<td>". $article['taille']. "</td>";
                echo  "<td>". $article['prix_achat_HT']. "</td>";
                echo  "<td>". $article['prix_vente_HT']. "</td>";
                echo  "<td>". $article['tauxTVA']. "</td>";
                echo  "<td>". $article['priceTTC']. "</td>";
                echo  "<td>". $article['poids']. "</td>";
                echo "<td>". $article['reference']. "</td>";
                echo "<td>". $article['nombre_stock']. "</td>";
                echo "<td>". $article['remise']. "</td>";
                echo"<td>"?> 
                <a href = "supprimer_Article.php?reference=<?= $article['reference']; ?>" style="color:red; text-decoration: none;"> Supprimer l'article</a>
                    <?= "</td>";
                echo"<td>"?> 
                <a href = "modifier_Article.php?reference=<?= $article['reference']; ?>" style="color:red; text-decoration: none;"> Modifier l'article</a>
                    <?= "</td>";
                echo"</tr>";
            
           
        }
        echo "</table>";
    
   ?>

   <!-- Bouton RETOUR EN HAUT DE PAGE -->
   <div id="scroll_to_top">
        <a href="#top"><img style ="width:40px;" src="../img/to_top.png" title="Retourner en haut" /></a>
    </div>
    
    <br>
    <div id="button-listearticle"> 
        <button class="publie-article-button" onclick="window.location.href='publier_Article.php';">Ajouter un article</button>
        <button class="accueil-article" onclick="window.location.href='../espace_commun/accueilCommun.php?accueil=1';">Revenir à l'accueil</button>
    </div>

</body>
</html>
