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


<form action="commande.php" method="post">
    Code <input type="text" name="Code" placeholder="XXXXXXXXXX" required></input>
    Date <input type="month" name="Date" placeholder="XX/XX" required>
    Cryptograme <input type="text" name="Crypto" placeholder="XXX" required>
    <input type="hidden" name="total" value="<?= $total?>">
    <input type="submit" name= "payer" value="Finaliser le paiement">
</form>

