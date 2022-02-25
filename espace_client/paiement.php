<?php
session_start();
require('../src/connect.php');

$total = $_POST['total'];





if(!isset($_SESSION["user"])){ 
    {
    header('Location: ../espace_commun/connexion.php?error=1&message=Connectez-vous.');
    }
}
?>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <title>Stunning outfit Shop</title>
        <!--meta name="viewport" content="width=device-width"-->
        <link rel="stylesheet" type="text/css" href="../design/formulaires.css">
        <!--link rel="stylesheet" type="text/css" href="../design/boutiqueFooter.css"-->

        <link rel="stylesheet" type="text/css" href="../design/footerFormulaires.css">
        <link rel="icon" type="image/pngn" href="../img/favicon.png">
    </head>
    <body>

        <div id="brand" >
            <a href="../espace_commun/accueilCommun.php?accueil=1" ><img style="height: 55px" src="../img/logo.png" alt=""></a>
        </div>
        <section>
        <div id="login-body">

                <form action="commande.php" method="post">
                    Nom du titulaire <input type="text" name="Nom" placeholder="nom" required></input>
                    Numéro de carte <input type="text" name="Code" placeholder="XXXXXXXXXX" required></input>
                    Date d'expiration<input type="month" name="Date_exp" placeholder="XX/XX" required></input><br><br>
                    Cryptograme <input type="text" name="Crypto" placeholder="XXX" required>
                    <input type="hidden" name="total" value="<?= $total?>">
                    <button <input type="submit" name= "payer" value="Finaliser le paiement"> Finaliser le paiement</button>
                </form>
            </div>
        </section>

        <?php include("../src/boutiqueFooter.php"); ?>
        <script src="../js/script.js"> </script>
    </body>
</html>
