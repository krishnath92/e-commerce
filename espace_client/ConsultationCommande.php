<?php
session_start();
use Dompdf\Dompdf;
use Dompdf\Options;
require("../src/connect.php");


$num_facture = $_GET["num_facture"];
$requser2 = $db->prepare("SELECT * FROM factures WHERE num_facture = ?");
$requser2->execute(array($num_facture));
$facture = $requser2->fetchAll();






foreach ($_POST as $k => $v) $k = $v;
$requser = $db->prepare("SELECT * FROM membres WHERE email = ?");
$requser->execute(array($_SESSION['user']));
$user = $requser->fetch();

$email = $user["email"];
$civil = $user["civilité"];
$nom = $user["nom"];  
$prixtotal = 0;

?>


<!DOCTYPE html>
<html lang="fr">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.0/jquery.min.js"></script>
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" />
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
        <link rel="stylesheet" type="text/css" href="../design/commande.css">
        <title>PDF</title>
    </head>
    <body>
        <h1>RECAPITULATIF DE LA FACTURE : <?= $num_facture?></h1>
        <p><?= $civil ?> <?= $nom?>, nous vous remercions pour votre commande et espérons que vous serez satisfait de votre livraison.</p><br>
        <p>Vous trouverez ci-dessous les informations essentielles de votre commande. </p><br>

        <strong><p>Information sur votre commande :  </p><br></strong>
        <br><p>Numéro de commande : <?= $num_facture;?><p>
        <br>

        <strong><p>Adresse de livraison :  </p><br></strong>
        <br> <p><?= $user["adresse_livraison"];?><p>
        <br>

        <strong> <p>Information sur votre commande : </p><br></strong>
        <table class="table table-bordered" >
            <tr>
                <th width="15%">Numéro de facture </th>
                <th width="10%">Reference</th>   
                <th width="10%">Prix(HT)</th>
                <th width="10%">Taux de TVA</th>
                <th width="10%">Prix TTC</th>
                <th width="5%">Quantite</th>
                <th width="5%">Date</th>
            </tr>
            <?php foreach($facture as $keys => $values) 
            {
                $requarticle = $db->prepare("SELECT * FROM products WHERE reference = ?");
                $requarticle->execute(array($values["reference"]));
                $article = $requarticle->fetch();
                $prixtotal += $article["priceTTC"];
                ?>
            <tr>
                <td><?= $values["num_facture"];?></td>
                <td><?= $values["reference"];?></td>
                <td><?= $article["prix_vente_HT"];?> €</td>
                <td><?= $article["tauxTVA"];?> %</td>
                <td><?= $article["priceTTC"];?> €</td>
                <td><?= $values["quantite"];?></td>
                <td><?= $values["date"];?> </td>
            </tr>
            <?php } ?>
        </table>

        <strong><p> Le prix total (avec le frais de port ):  <?= $values["prix"];?> € </p><br>

        
    </body>
</html>