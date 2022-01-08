<?php
require("../../src/connect.php");
require_once("../mesFonctions.php");
logoVisualisation();
initBoutonAdmin();

echo "<form method='get' action=''>
<fieldset><legend> Choisissez une sous-catégoire </legend>
<table>
	<tr>
		<td> Entrez le nom du Vêtement : </td> 
		<td> <input name='sousCat' type='text' placeholder='ex: Jogging, Brassière...' /> </td>
	</tr>

	<tr>
		<td> <input name='res' type='reset' value='Annuler'/></td> 
		<td> <input name='ok' type='submit' value='Valider'/></td>
	</tr>
</table>
</fieldset>
</form>
";
if (isset($_GET['sousCat']) AND !empty($_GET['sousCat'])) {
    if(isset($_GET['ok'])){
        $sousCat = $_GET['sousCat'];
        $recupArticle = $db->prepare("SELECT * FROM products WHERE sous_categorie = ?");
        $recupArticle->execute(array($sousCat));
        
        $res = $db->prepare('SELECT count(*) from products where sous_categorie = ? ');
        $res->execute(array($sousCat));
        $nbrArticle = $res->fetchColumn();

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
            $poids_Vêtement = $article_Infos['poids'];
            $couleur_Vêtement = $article_Infos['couleur'];
            $taille_Vêtement = $article_Infos['taille'];
            $description_Vêtement = $article_Infos['description'];
            $id_Vêtement = $article_Infos['id'];
            $reference_Vêtement = $article_Infos['reference'];
            $remise_Vêtement = $article_Infos['remise'];
        
            echo"<table border = '1' cellpadding='4' cellspacing ='4'>" ?>
                <!-- Bouton ALLER EN BAS DE PAGE -->
                <button style="margin-left:95%;"> 
                    <img style ="width:40px;" src="../../img/to_down.png" onclick="window.scrollTo(0,document.body.scrollHeight);" title="Aller en bas de page"/> 
                </button>                
                <?= "<tr> 
                    <h1 style='text-align: center;'> Les ".$sousCat."s : ".  $nbrArticle . " articles trouvés.</h1>
                    <th>ID</th>
                    <th>"?> 
                        <a href = "marque.php" > Marque</a>
                    <?= "</th>
                    <th>"?> 
                        <a href = "categorie.php" > Catégorie</a>
                    <?= "</th>
                    <th>Sous-catégorie</th>
                    <th>Description</th>
                    <th>"?> 
                        <a href = "couleur.php" > Couleur</a>
                    <?= "</th>
                    <th>Tailles disponibles</th>
                    <th>prix d'achat HT</th>
                    <th>prix de vente HT</th>
                    <th>TVA</th>
                    <th>prix TTC</th>
                    <th>Poids (en g)</th>
                    <th>Référence</th>
                    <th>Quantité</th>
                    <th>Remise</th>

                    <th>Supprimer ?</th>
                    <th>Modifier ?</th>
                </tr>";
                    echo"<tr>";
                    echo "<td>" .$id_Vêtement. "</td>";
                    echo  "<td>". $marque_Vêtement. "</td>";
                    echo  "<td>". $categorie_Vêtement. "</td>";
                    echo  "<td>". $sousCat_Vêtement. "</td>";
                    echo  "<td>". $description_Vêtement. "</td>";
                    echo  "<td>". $couleur_Vêtement. "</td>";
                    echo  "<td>". $taille_Vêtement. "</td>";
                    echo  "<td>". $prixAchat_Vêtement. "</td>";
                    echo  "<td>". $prixVente_Vêtement. "</td>";
                    echo  "<td>". $tauxTVA. "</td>";
                    echo  "<td>". $prixTTC_Vêtement. "</td>";
                    echo  "<td>". $poids_Vêtement. "</td>";
                    echo "<td>". $reference_Vêtement. "</td>";
                    echo "<td>". $nbr_Vêtement. "</td>";
                    echo "<td>". $remise_Vêtement. "</td>";
                    echo"<td>"?> 
                    <a href = "../supprimer_Article.php?reference=<?= $article_Infos['reference']; ?>" style="color:red; text-decoration: none;"> Supprimer l'article</a>
                        <?= "</td>";
                    echo"<td>"?> 
                    <a href = "../modifier_Article.php?reference=<?= $article_Infos['reference']; ?>" style="color:red; text-decoration: none;"> Modifier l'article</a>
                        <?= "</td>";
                    echo"</tr>";
                while($article = $recupArticle->fetch()){
                    echo"<tr>";
                    echo "<td>" .$article['id']. "</td>";
                    echo  "<td>". $article['marque']. "</td>";
                    echo  "<td>". $article['categorie']. "</td>";
                    echo  "<td>". $article['sous_categorie']. "</td>";
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
                    <a href = "../supprimer_Article.php?reference=<?= $article['reference']; ?>" style="color:red; text-decoration: none;"> Supprimer l'article</a>
                        <?= "</td>";
                    echo"<td>"?> 
                    <a href = "../modifier_Article.php?reference=<?= $article['reference']; ?>" style="color:red; text-decoration: none;"> Modifier l'article</a>
                        <?= "</td>";
                    echo"</tr>";
                }//Fin While 1
            echo "</table>";
            }//END IF1
            else{
                echo"cette sous-catégorie n'existe pas";
            }

    } //END IF 2

}//END IF 1
    
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <link rel="stylesheet" href="../style/miniDesign.css" >
    <link rel="stylesheet" href="../style/stylesheet.css" >
    <title>Document</title>
</head>
<body>
    <!-- Bouton RETOUR EN HAUT DE PAGE -->
    <div id="scroll_to_top">
        <a href="#top"><img style ="width:40px;" src="../../img/to_top.png" title="Retourner en haut" /></a>
    </div>
</body>
</html>


<?php include("boutons.php");?>